--!nolint LocalShadow
-- A Luau port of the physics engine bonk.io runs: Box2DWeb 2.1a (Erin Catto's Box2D, ported to
-- JavaScript), with bonk's own changes ("Box2DModuleGJMod"):
--   * bounces happen at any speed (b2_velocityThreshold is 0.0001 instead of 1)
--   * friction against a player (friction 0.001337) is 0, or half the other side's friction when
--     that is negative ("friction players"); otherwise the usual sqrt(a * b) of the sizes
--   * a negative restitution adds to the other instead of the higher one winning
--   * the time-of-impact loop gives up after 100 rounds
-- Only what bonk uses is here: circles and polygons, revolute, prismatic, distance and gear
-- joints, contact listeners, ray casts and continuous collision for bullets. Sleeping, the
-- dynamic tree and the other joint types are left out (bonk never lets bodies sleep, and the
-- tree only finds pairs, which a plain search does too).
--
-- The math follows the JavaScript closely, names included, so it can be checked line by line.
-- Vectors are kept as x/y number pairs rather than objects, for speed.
--
-- Box2D is released under the zlib licence: Copyright (c) 2006-2007 Erin Catto
-- http://www.gphysics.com. This port is an altered version and is not the original software.

local Box2D = {}

-- Settings -----------------------------------------------------------------------------------

local MIN_VALUE = 4.9406564584124654e-324 -- JavaScript's Number.MIN_VALUE
local MAX_VALUE = 1.7976931348623157e308
local linearSlop = 0.005
local angularSlop = 2 / 180 * math.pi
local velocityThreshold = 0.0001 -- bonk's change (Box2D's is 1)
local maxLinearCorrection = 0.2
local maxAngularCorrection = 8 / 180 * math.pi
local maxTranslation = 2
local maxTranslationSquared = maxTranslation * maxTranslation
local maxRotation = 0.5 * math.pi
local maxRotationSquared = maxRotation * maxRotation
local contactBaumgarte = 0.2
local aabbExtension = 0.1
local aabbMultiplier = 2
local maxTOIContactsPerIsland = 32
local maxTOIJointsPerIsland = 32

Box2D.STATIC, Box2D.KINEMATIC, Box2D.DYNAMIC = 0, 1, 2
local STATIC, KINEMATIC, DYNAMIC = 0, 1, 2
local CIRCLE, POLYGON = 0, 1
Box2D.CIRCLE, Box2D.POLYGON = CIRCLE, POLYGON
local CIRCLES, FACE_A, FACE_B = 0, 1, 2

-- Contact flags
local C_SENSOR, C_CONTINUOUS, C_ISLAND, C_TOI, C_TOUCHING, C_ENABLED, C_FILTER = 0x01, 0x02, 0x04, 0x08, 0x10, 0x20, 0x40

local function clamp(a: number, lo: number, hi: number): number
	return a < lo and lo or (a > hi and hi or a)
end

function Box2D.mixFriction(f1: number, f2: number): number
	if f1 == 0.001337 then
		if f2 < 0 then
			return math.abs(f2 / 2)
		end
		return 0
	elseif f2 == 0.001337 then
		if f1 < 0 then
			return math.abs(f1 / 2)
		end
		return 0
	end
	return math.sqrt(math.abs(f1) * math.abs(f2))
end

function Box2D.mixRestitution(r1: number, r2: number): number
	if r1 < 0 or r2 < 0 then
		return math.max(0, r2 + r1)
	end
	return r1 > r2 and r1 or r2
end
local mixFriction, mixRestitution = Box2D.mixFriction, Box2D.mixRestitution

-- Shapes -------------------------------------------------------------------------------------

function Box2D.circle(radius: number, x: number?, y: number?)
	return { type = CIRCLE, radius = radius, px = x or 0, py = y or 0 }
end

-- points: { {x, y}, ... } in the body's frame, used as given (bonk does not check them)
function Box2D.polygon(points)
	local count = #points
	local s = { type = POLYGON, radius = linearSlop, count = count, vx = {}, vy = {}, nx = {}, ny = {}, cenX = 0, cenY = 0 }
	for i = 1, count do
		s.vx[i], s.vy[i] = points[i][1], points[i][2]
	end
	for i = 1, count do
		local j = i < count and i + 1 or 1
		local ex, ey = s.vx[j] - s.vx[i], s.vy[j] - s.vy[i]
		-- CrossVF(edge, 1) = (edge.y, -edge.x), normalised
		local nx, ny = ey, -ex
		local len = math.sqrt(nx * nx + ny * ny)
		if len >= MIN_VALUE then
			nx, ny = nx / len, ny / len
		end
		s.nx[i], s.ny[i] = nx, ny
	end
	-- Centroid
	local area, cx, cy = 0, 0, 0
	local inv3 = 1 / 3
	for i = 1, count do
		local j = i < count and i + 1 or 1
		local e1x, e1y = s.vx[i], s.vy[i]
		local e2x, e2y = s.vx[j], s.vy[j]
		local d = e1x * e2y - e1y * e2x
		local tri = 0.5 * d
		area += tri
		cx += tri * inv3 * (s.vx[i] + s.vx[j])
		cy += tri * inv3 * (s.vy[i] + s.vy[j])
	end
	s.cenX, s.cenY = cx * (1 / area), cy * (1 / area)
	return s
end

-- A box of half sizes hx, hy around (cx, cy), turned by angle (SetAsOrientedBox)
function Box2D.box(hx: number, hy: number, cx: number?, cy: number?, angle: number?)
	local c, s = math.cos(angle or 0), math.sin(angle or 0)
	cx, cy = cx or 0, cy or 0
	local function at(x, y)
		return { cx + c * x - s * y, cy + s * x + c * y }
	end
	return Box2D.polygon({ at(-hx, -hy), at(hx, -hy), at(hx, hy), at(-hx, hy) })
end

local function computeAABB(shape, px, py, c, s)
	if shape.type == CIRCLE then
		local x = px + c * shape.px - s * shape.py
		local y = py + s * shape.px + c * shape.py
		local r = shape.radius
		return x - r, y - r, x + r, y + r
	end
	local vx, vy = shape.vx, shape.vy
	local lx = px + c * vx[1] - s * vy[1]
	local ly = py + s * vx[1] + c * vy[1]
	local ux, uy = lx, ly
	for i = 2, shape.count do
		local x = px + c * vx[i] - s * vy[i]
		local y = py + s * vx[i] + c * vy[i]
		lx = lx < x and lx or x
		ly = ly < y and ly or y
		ux = ux > x and ux or x
		uy = uy > y and uy or y
	end
	local r = shape.radius
	return lx - r, ly - r, ux + r, uy + r
end

-- Returns mass, centre x, centre y, rotational inertia about the body origin
local function computeMass(shape, density: number)
	if shape.type == CIRCLE then
		local m = density * math.pi * shape.radius * shape.radius
		return m, shape.px, shape.py, m * (0.5 * shape.radius * shape.radius + (shape.px * shape.px + shape.py * shape.py))
	end
	local count = shape.count
	if count == 2 then
		return 0, 0.5 * (shape.vx[1] + shape.vx[2]), 0.5 * (shape.vy[1] + shape.vy[2]), 0
	end
	local centerX, centerY, area, I = 0, 0, 0, 0
	local k_inv3 = 1 / 3
	for i = 1, count do
		local j = i < count and i + 1 or 1
		local p2x, p2y = shape.vx[i], shape.vy[i]
		local p3x, p3y = shape.vx[j], shape.vy[j]
		local e1x, e1y, e2x, e2y = p2x, p2y, p3x, p3y
		local D = e1x * e2y - e1y * e2x
		local tri = 0.5 * D
		area += tri
		centerX += tri * k_inv3 * (p2x + p3x)
		centerY += tri * k_inv3 * (p2y + p3y)
		local intx2 = k_inv3 * (0.25 * (e1x * e1x + e2x * e1x + e2x * e2x))
		local inty2 = k_inv3 * (0.25 * (e1y * e1y + e2y * e1y + e2y * e2y))
		I += D * (intx2 + inty2)
	end
	centerX *= 1 / area
	centerY *= 1 / area
	return density * area, centerX, centerY, density * I
end

-- Ray cast against one shape; returns fraction, normal x, normal y or nil
local function rayCastShape(shape, p1x, p1y, p2x, p2y, maxFraction, px, py, c, s)
	if shape.type == CIRCLE then
		local posX = px + c * shape.px - s * shape.py
		local posY = py + s * shape.px + c * shape.py
		local sX, sY = p1x - posX, p1y - posY
		local b = (sX * sX + sY * sY) - shape.radius * shape.radius
		local rX, rY = p2x - p1x, p2y - p1y
		local cc = sX * rX + sY * rY
		local rr = rX * rX + rY * rY
		local sigma = cc * cc - rr * b
		if sigma < 0 or rr < MIN_VALUE then
			return nil
		end
		local a = -(cc + math.sqrt(sigma))
		if 0 <= a and a <= maxFraction * rr then
			a /= rr
			local nx, ny = sX + a * rX, sY + a * rY
			local len = math.sqrt(nx * nx + ny * ny)
			if len >= MIN_VALUE then
				nx, ny = nx / len, ny / len
			end
			return a, nx, ny
		end
		return nil
	end
	local lower, upper = 0, maxFraction
	local tX, tY = p1x - px, p1y - py
	local l1x, l1y = tX * c + tY * s, -tX * s + tY * c
	tX, tY = p2x - px, p2y - py
	local l2x, l2y = tX * c + tY * s, -tX * s + tY * c
	local dX, dY = l2x - l1x, l2y - l1y
	local index = -1
	for i = 1, shape.count do
		local numerator = shape.nx[i] * (shape.vx[i] - l1x) + shape.ny[i] * (shape.vy[i] - l1y)
		local denominator = shape.nx[i] * dX + shape.ny[i] * dY
		if denominator == 0 then
			if numerator < 0 then
				return nil
			end
		elseif denominator < 0 and numerator < lower * denominator then
			lower = numerator / denominator
			index = i
		elseif denominator > 0 and numerator < upper * denominator then
			upper = numerator / denominator
		end
		if upper < lower - MIN_VALUE then
			return nil
		end
	end
	if index >= 1 then
		local nx, ny = shape.nx[index], shape.ny[index]
		return lower, c * nx - s * ny, s * nx + c * ny
	end
	return nil
end

-- Manifolds ----------------------------------------------------------------------------------

local function newManifold()
	return {
		type = CIRCLES, count = 0, lpnX = 0, lpnY = 0, lpX = 0, lpY = 0,
		points = {
			{ lpX = 0, lpY = 0, normalImpulse = 0, tangentImpulse = 0, key = 0 },
			{ lpX = 0, lpY = 0, normalImpulse = 0, tangentImpulse = 0, key = 0 },
		},
	}
end

local function collideCircles(m, cA, xA, yA, cosA, sinA, cB, xB, yB, cosB, sinB)
	m.count = 0
	local p1x = xA + cosA * cA.px - sinA * cA.py
	local p1y = yA + sinA * cA.px + cosA * cA.py
	local p2x = xB + cosB * cB.px - sinB * cB.py
	local p2y = yB + sinB * cB.px + cosB * cB.py
	local dX, dY = p2x - p1x, p2y - p1y
	local radius = cA.radius + cB.radius
	if dX * dX + dY * dY > radius * radius then
		return
	end
	m.type = CIRCLES
	m.lpX, m.lpY = cA.px, cA.py
	m.lpnX, m.lpnY = 0, 0
	m.count = 1
	m.points[1].lpX, m.points[1].lpY = cB.px, cB.py
	m.points[1].key = 0
end

local function collidePolygonAndCircle(m, poly, xA, yA, cosA, sinA, circle, xB, yB, cosB, sinB)
	m.count = 0
	local cX = xB + cosB * circle.px - sinB * circle.py
	local cY = yB + sinB * circle.px + cosB * circle.py
	local dX, dY = cX - xA, cY - yA
	local cLocalX = dX * cosA + dY * sinA
	local cLocalY = -dX * sinA + dY * cosA
	local normalIndex = 1
	local separation = -MAX_VALUE
	local radius = poly.radius + circle.radius
	local count = poly.count
	local vx, vy, nx, ny = poly.vx, poly.vy, poly.nx, poly.ny
	for i = 1, count do
		local sep = nx[i] * (cLocalX - vx[i]) + ny[i] * (cLocalY - vy[i])
		if sep > radius then
			return
		end
		if sep > separation then
			separation = sep
			normalIndex = i
		end
	end
	local i1 = normalIndex
	local i2 = i1 < count and i1 + 1 or 1
	local v1x, v1y, v2x, v2y = vx[i1], vy[i1], vx[i2], vy[i2]
	local p = m.points[1]
	if separation < MIN_VALUE then
		m.count = 1
		m.type = FACE_A
		m.lpnX, m.lpnY = nx[normalIndex], ny[normalIndex]
		m.lpX, m.lpY = 0.5 * (v1x + v2x), 0.5 * (v1y + v2y)
		p.lpX, p.lpY, p.key = circle.px, circle.py, 0
		return
	end
	local u1 = (cLocalX - v1x) * (v2x - v1x) + (cLocalY - v1y) * (v2y - v1y)
	local u2 = (cLocalX - v2x) * (v1x - v2x) + (cLocalY - v2y) * (v1y - v2y)
	local function setNormal(x, y)
		local len = math.sqrt(x * x + y * y)
		if len >= MIN_VALUE then
			x, y = x / len, y / len
		end
		m.lpnX, m.lpnY = x, y
	end
	if u1 <= 0 then
		if (cLocalX - v1x) * (cLocalX - v1x) + (cLocalY - v1y) * (cLocalY - v1y) > radius * radius then
			return
		end
		m.count = 1
		m.type = FACE_A
		setNormal(cLocalX - v1x, cLocalY - v1y)
		m.lpX, m.lpY = v1x, v1y
	elseif u2 <= 0 then
		if (cLocalX - v2x) * (cLocalX - v2x) + (cLocalY - v2y) * (cLocalY - v2y) > radius * radius then
			return
		end
		m.count = 1
		m.type = FACE_A
		setNormal(cLocalX - v2x, cLocalY - v2y)
		m.lpX, m.lpY = v2x, v2y
	else
		local fcX, fcY = 0.5 * (v1x + v2x), 0.5 * (v1y + v2y)
		separation = (cLocalX - fcX) * nx[i1] + (cLocalY - fcY) * ny[i1]
		if separation > radius then
			return
		end
		m.count = 1
		m.type = FACE_A
		setNormal(nx[i1], ny[i1])
		m.lpX, m.lpY = fcX, fcY
	end
	p.lpX, p.lpY, p.key = circle.px, circle.py, 0
end

-- Polygon against polygon (b2Collision.CollidePolygons and its helpers)
local function edgeSeparation(p1, x1, y1, c1, s1, edge1, p2, x2, y2, c2, s2)
	local nwX = c1 * p1.nx[edge1] - s1 * p1.ny[edge1]
	local nwY = s1 * p1.nx[edge1] + c1 * p1.ny[edge1]
	local n1X = c2 * nwX + s2 * nwY
	local n1Y = -s2 * nwX + c2 * nwY
	local index, minDot = 1, MAX_VALUE
	for i = 1, p2.count do
		local dot = p2.vx[i] * n1X + p2.vy[i] * n1Y
		if dot < minDot then
			minDot = dot
			index = i
		end
	end
	local v1X = x1 + c1 * p1.vx[edge1] - s1 * p1.vy[edge1]
	local v1Y = y1 + s1 * p1.vx[edge1] + c1 * p1.vy[edge1]
	local v2X = x2 + c2 * p2.vx[index] - s2 * p2.vy[index]
	local v2Y = y2 + s2 * p2.vx[index] + c2 * p2.vy[index]
	return (v2X - v1X) * nwX + (v2Y - v1Y) * nwY
end

local function findMaxSeparation(p1, x1, y1, c1, s1, p2, x2, y2, c2, s2)
	local count1 = p1.count
	local dX = x2 + c2 * p2.cenX - s2 * p2.cenY
	local dY = y2 + s2 * p2.cenX + c2 * p2.cenY
	dX -= x1 + c1 * p1.cenX - s1 * p1.cenY
	dY -= y1 + s1 * p1.cenX + c1 * p1.cenY
	local dLX = dX * c1 + dY * s1
	local dLY = -dX * s1 + dY * c1
	local edge, maxDot = 1, -MAX_VALUE
	for i = 1, count1 do
		local dot = p1.nx[i] * dLX + p1.ny[i] * dLY
		if dot > maxDot then
			maxDot = dot
			edge = i
		end
	end
	local s = edgeSeparation(p1, x1, y1, c1, s1, edge, p2, x2, y2, c2, s2)
	local prevEdge = edge - 1 >= 1 and edge - 1 or count1
	local sPrev = edgeSeparation(p1, x1, y1, c1, s1, prevEdge, p2, x2, y2, c2, s2)
	local nextEdge = edge + 1 <= count1 and edge + 1 or 1
	local sNext = edgeSeparation(p1, x1, y1, c1, s1, nextEdge, p2, x2, y2, c2, s2)
	local bestEdge, bestSeparation, increment
	if sPrev > s and sPrev > sNext then
		increment, bestEdge, bestSeparation = -1, prevEdge, sPrev
	elseif sNext > s then
		increment, bestEdge, bestSeparation = 1, nextEdge, sNext
	else
		return edge, s
	end
	while true do
		if increment == -1 then
			edge = bestEdge - 1 >= 1 and bestEdge - 1 or count1
		else
			edge = bestEdge + 1 <= count1 and bestEdge + 1 or 1
		end
		s = edgeSeparation(p1, x1, y1, c1, s1, edge, p2, x2, y2, c2, s2)
		if s > bestSeparation then
			bestEdge, bestSeparation = edge, s
		else
			break
		end
	end
	return bestEdge, bestSeparation
end

-- Clip vertices: { x, y, key }
local function clipSegmentToLine(vOut, vIn, nX, nY, offset)
	local numOut = 0
	local in1, in2 = vIn[1], vIn[2]
	local d0 = nX * in1.x + nY * in1.y - offset
	local d1 = nX * in2.x + nY * in2.y - offset
	if d0 <= 0 then
		numOut += 1
		vOut[numOut].x, vOut[numOut].y, vOut[numOut].key = in1.x, in1.y, in1.key
	end
	if d1 <= 0 then
		numOut += 1
		vOut[numOut].x, vOut[numOut].y, vOut[numOut].key = in2.x, in2.y, in2.key
	end
	if d0 * d1 < 0 then
		local interp = d0 / (d0 - d1)
		local cv = vOut[numOut + 1]
		cv.x = in1.x + interp * (in2.x - in1.x)
		cv.y = in1.y + interp * (in2.y - in1.y)
		cv.key = d0 > 0 and in1.key or in2.key
		numOut += 1
	end
	return numOut
end

local function makeKey(referenceEdge, incidentEdge, incidentVertex, flip)
	return referenceEdge + incidentEdge * 256 + incidentVertex * 65536 + flip * 16777216
end

local incidentEdge = { { x = 0, y = 0, key = 0 }, { x = 0, y = 0, key = 0 } }
local clip1 = { { x = 0, y = 0, key = 0 }, { x = 0, y = 0, key = 0 } }
local clip2 = { { x = 0, y = 0, key = 0 }, { x = 0, y = 0, key = 0 } }

local function collidePolygons(m, pA, xA, yA, cA, sA, pB, xB, yB, cB, sB)
	m.count = 0
	local totalRadius = pA.radius + pB.radius
	local edgeA, separationA = findMaxSeparation(pA, xA, yA, cA, sA, pB, xB, yB, cB, sB)
	if separationA > totalRadius then
		return
	end
	local edgeB, separationB = findMaxSeparation(pB, xB, yB, cB, sB, pA, xA, yA, cA, sA)
	if separationB > totalRadius then
		return
	end
	local p1, x1, y1, c1, s1, p2, x2, y2, c2, s2, edge1, flip
	if separationB > 0.98 * separationA + 0.001 then
		p1, x1, y1, c1, s1 = pB, xB, yB, cB, sB
		p2, x2, y2, c2, s2 = pA, xA, yA, cA, sA
		edge1 = edgeB
		m.type = FACE_B
		flip = 1
	else
		p1, x1, y1, c1, s1 = pA, xA, yA, cA, sA
		p2, x2, y2, c2, s2 = pB, xB, yB, cB, sB
		edge1 = edgeA
		m.type = FACE_A
		flip = 0
	end
	-- Incident edge on poly2
	do
		local n1X = c1 * p1.nx[edge1] - s1 * p1.ny[edge1]
		local n1Y = s1 * p1.nx[edge1] + c1 * p1.ny[edge1]
		local tX = c2 * n1X + s2 * n1Y
		n1Y = -s2 * n1X + c2 * n1Y
		n1X = tX
		local index, minDot = 1, MAX_VALUE
		for i = 1, p2.count do
			local dot = n1X * p2.nx[i] + n1Y * p2.ny[i]
			if dot < minDot then
				minDot = dot
				index = i
			end
		end
		local i1 = index
		local i2 = i1 < p2.count and i1 + 1 or 1
		local e1, e2 = incidentEdge[1], incidentEdge[2]
		e1.x = x2 + c2 * p2.vx[i1] - s2 * p2.vy[i1]
		e1.y = y2 + s2 * p2.vx[i1] + c2 * p2.vy[i1]
		e1.key = makeKey(edge1, i1, 0, 0)
		e2.x = x2 + c2 * p2.vx[i2] - s2 * p2.vy[i2]
		e2.y = y2 + s2 * p2.vx[i2] + c2 * p2.vy[i2]
		e2.key = makeKey(edge1, i2, 1, 0)
	end
	local count1 = p1.count
	local lv11x, lv11y = p1.vx[edge1], p1.vy[edge1]
	local e2i = edge1 < count1 and edge1 + 1 or 1
	local lv12x, lv12y = p1.vx[e2i], p1.vy[e2i]
	local ltX, ltY = lv12x - lv11x, lv12y - lv11y
	local len = math.sqrt(ltX * ltX + ltY * ltY)
	if len >= MIN_VALUE then
		ltX, ltY = ltX / len, ltY / len
	end
	local lnX, lnY = ltY, -ltX
	local ppX, ppY = 0.5 * (lv11x + lv12x), 0.5 * (lv11y + lv12y)
	local tanX = c1 * ltX - s1 * ltY
	local tanY = s1 * ltX + c1 * ltY
	local nX, nY = tanY, -tanX
	local v11x = x1 + c1 * lv11x - s1 * lv11y
	local v11y = y1 + s1 * lv11x + c1 * lv11y
	local v12x = x1 + c1 * lv12x - s1 * lv12y
	local v12y = y1 + s1 * lv12x + c1 * lv12y
	local frontOffset = nX * v11x + nY * v11y
	local sideOffset1 = -tanX * v11x - tanY * v11y + totalRadius
	local sideOffset2 = tanX * v12x + tanY * v12y + totalRadius
	local np = clipSegmentToLine(clip1, incidentEdge, -tanX, -tanY, sideOffset1)
	if np < 2 then
		return
	end
	np = clipSegmentToLine(clip2, clip1, tanX, tanY, sideOffset2)
	if np < 2 then
		return
	end
	m.lpnX, m.lpnY = lnX, lnY
	m.lpX, m.lpY = ppX, ppY
	local pointCount = 0
	for i = 1, 2 do
		local cv = clip2[i]
		local separation = nX * cv.x + nY * cv.y - frontOffset
		if separation <= totalRadius then
			pointCount += 1
			local cp = m.points[pointCount]
			local tX, tY = cv.x - x2, cv.y - y2
			cp.lpX = tX * c2 + tY * s2
			cp.lpY = -tX * s2 + tY * c2
			-- Same key, with the flip bit set as in m_id.features.flip = flip
			cp.key = cv.key % 16777216 + flip * 16777216
		end
	end
	m.count = pointCount
end

-- World manifold: normal and the contact points in world space
local wmPoints = { { x = 0, y = 0 }, { x = 0, y = 0 } }
local function worldManifold(m, xA, yA, cA, sA, rA, xB, yB, cB, sB, rB)
	if m.count == 0 then
		return 0, 0, wmPoints
	end
	local nX, nY = 0, 0
	if m.type == CIRCLES then
		local pAx = xA + cA * m.lpX - sA * m.lpY
		local pAy = yA + sA * m.lpX + cA * m.lpY
		local lp = m.points[1]
		local pBx = xB + cB * lp.lpX - sB * lp.lpY
		local pBy = yB + sB * lp.lpX + cB * lp.lpY
		local dX, dY = pBx - pAx, pBy - pAy
		local d2 = dX * dX + dY * dY
		if d2 > MIN_VALUE * MIN_VALUE then
			local d = math.sqrt(d2)
			nX, nY = dX / d, dY / d
		else
			nX, nY = 1, 0
		end
		local cAX, cAY = pAx + rA * nX, pAy + rA * nY
		local cBX, cBY = pBx - rB * nX, pBy - rB * nY
		wmPoints[1].x, wmPoints[1].y = 0.5 * (cAX + cBX), 0.5 * (cAY + cBY)
	elseif m.type == FACE_A then
		nX = cA * m.lpnX - sA * m.lpnY
		nY = sA * m.lpnX + cA * m.lpnY
		local ppX = xA + cA * m.lpX - sA * m.lpY
		local ppY = yA + sA * m.lpX + cA * m.lpY
		for i = 1, m.count do
			local lp = m.points[i]
			local cpX = xB + cB * lp.lpX - sB * lp.lpY
			local cpY = yB + sB * lp.lpX + cB * lp.lpY
			local k = 0.5 * (rA - (cpX - ppX) * nX - (cpY - ppY) * nY - rB)
			wmPoints[i].x, wmPoints[i].y = cpX + k * nX, cpY + k * nY
		end
	else
		local bnX = cB * m.lpnX - sB * m.lpnY
		local bnY = sB * m.lpnX + cB * m.lpnY
		local ppX = xB + cB * m.lpX - sB * m.lpY
		local ppY = yB + sB * m.lpX + cB * m.lpY
		nX, nY = -bnX, -bnY
		for i = 1, m.count do
			local lp = m.points[i]
			local cpX = xA + cA * lp.lpX - sA * lp.lpY
			local cpY = yA + sA * lp.lpX + cA * lp.lpY
			local k = 0.5 * (rB - (cpX - ppX) * bnX - (cpY - ppY) * bnY - rA)
			wmPoints[i].x, wmPoints[i].y = cpX + k * bnX, cpY + k * bnY
		end
	end
	return nX, nY, wmPoints
end
Box2D.worldManifold = worldManifold

-- Distance (GJK) and time of impact ---------------------------------------------------------

-- A distance proxy is the shape's vertices and radius: circles are one point
local function proxyOf(shape)
	if shape.type == CIRCLE then
		return { count = 1, vx = { shape.px }, vy = { shape.py }, radius = shape.radius }
	end
	return { count = shape.count, vx = shape.vx, vy = shape.vy, radius = shape.radius }
end

local function getSupport(proxy, dX, dY)
	local best, bestValue = 1, proxy.vx[1] * dX + proxy.vy[1] * dY
	for i = 2, proxy.count do
		local value = proxy.vx[i] * dX + proxy.vy[i] * dY
		if value > bestValue then
			best, bestValue = i, value
		end
	end
	return best
end

-- A transform here is { x, y, c, s }
local function newSimplexVertex()
	return { wAx = 0, wAy = 0, wBx = 0, wBy = 0, wx = 0, wy = 0, a = 0, indexA = 1, indexB = 1 }
end
local sv1, sv2, sv3 = newSimplexVertex(), newSimplexVertex(), newSimplexVertex()
local simplexVerts = { sv1, sv2, sv3 }
local simplexCount = 0

local function svSet(dst, src)
	dst.wAx, dst.wAy, dst.wBx, dst.wBy, dst.wx, dst.wy = src.wAx, src.wAy, src.wBx, src.wBy, src.wx, src.wy
	dst.a, dst.indexA, dst.indexB = src.a, src.indexA, src.indexB
end

local function svFill(v, proxyA, tA, proxyB, tB)
	local ax, ay = proxyA.vx[v.indexA], proxyA.vy[v.indexA]
	v.wAx = tA.x + tA.c * ax - tA.s * ay
	v.wAy = tA.y + tA.s * ax + tA.c * ay
	local bx, by = proxyB.vx[v.indexB], proxyB.vy[v.indexB]
	v.wBx = tB.x + tB.c * bx - tB.s * by
	v.wBy = tB.y + tB.s * bx + tB.c * by
	v.wx, v.wy = v.wBx - v.wAx, v.wBy - v.wAy
end

local function simplexMetric()
	if simplexCount == 2 then
		local dx, dy = sv1.wx - sv2.wx, sv1.wy - sv2.wy
		return math.sqrt(dx * dx + dy * dy)
	elseif simplexCount == 3 then
		return (sv2.wx - sv1.wx) * (sv3.wy - sv1.wy) - (sv2.wy - sv1.wy) * (sv3.wx - sv1.wx)
	end
	return 0
end

local function readCache(cache, proxyA, tA, proxyB, tB)
	simplexCount = cache.count
	for i = 1, simplexCount do
		local v = simplexVerts[i]
		v.indexA, v.indexB = cache.indexA[i], cache.indexB[i]
		svFill(v, proxyA, tA, proxyB, tB)
		v.a = 0
	end
	if simplexCount > 1 then
		local metric1, metric2 = cache.metric, simplexMetric()
		if metric2 < 0.5 * metric1 or 2 * metric1 < metric2 or metric2 < MIN_VALUE then
			simplexCount = 0
		end
	end
	if simplexCount == 0 then
		sv1.indexA, sv1.indexB = 1, 1
		svFill(sv1, proxyA, tA, proxyB, tB)
		simplexCount = 1
	end
end

local function writeCache(cache)
	cache.metric = simplexMetric()
	cache.count = simplexCount
	for i = 1, simplexCount do
		cache.indexA[i], cache.indexB[i] = simplexVerts[i].indexA, simplexVerts[i].indexB
	end
end

local function solve2()
	local w1x, w1y, w2x, w2y = sv1.wx, sv1.wy, sv2.wx, sv2.wy
	local e12x, e12y = w2x - w1x, w2y - w1y
	local d12_2 = -(w1x * e12x + w1y * e12y)
	if d12_2 <= 0 then
		sv1.a = 1
		simplexCount = 1
		return
	end
	local d12_1 = w2x * e12x + w2y * e12y
	if d12_1 <= 0 then
		sv2.a = 1
		simplexCount = 1
		svSet(sv1, sv2)
		return
	end
	local inv = 1 / (d12_1 + d12_2)
	sv1.a = d12_1 * inv
	sv2.a = d12_2 * inv
	simplexCount = 2
end

local function cross(ax, ay, bx, by)
	return ax * by - ay * bx
end

local function solve3()
	local w1x, w1y, w2x, w2y, w3x, w3y = sv1.wx, sv1.wy, sv2.wx, sv2.wy, sv3.wx, sv3.wy
	local e12x, e12y = w2x - w1x, w2y - w1y
	local d12_1 = w2x * e12x + w2y * e12y
	local d12_2 = -(w1x * e12x + w1y * e12y)
	local e13x, e13y = w3x - w1x, w3y - w1y
	local d13_1 = w3x * e13x + w3y * e13y
	local d13_2 = -(w1x * e13x + w1y * e13y)
	local e23x, e23y = w3x - w2x, w3y - w2y
	local d23_1 = w3x * e23x + w3y * e23y
	local d23_2 = -(w2x * e23x + w2y * e23y)
	local n123 = cross(e12x, e12y, e13x, e13y)
	local d123_1 = n123 * cross(w2x, w2y, w3x, w3y)
	local d123_2 = n123 * cross(w3x, w3y, w1x, w1y)
	local d123_3 = n123 * cross(w1x, w1y, w2x, w2y)
	if d12_2 <= 0 and d13_2 <= 0 then
		sv1.a = 1
		simplexCount = 1
		return
	end
	if d12_1 > 0 and d12_2 > 0 and d123_3 <= 0 then
		local inv = 1 / (d12_1 + d12_2)
		sv1.a, sv2.a = d12_1 * inv, d12_2 * inv
		simplexCount = 2
		return
	end
	if d13_1 > 0 and d13_2 > 0 and d123_2 <= 0 then
		local inv = 1 / (d13_1 + d13_2)
		sv1.a, sv3.a = d13_1 * inv, d13_2 * inv
		simplexCount = 2
		svSet(sv2, sv3)
		return
	end
	if d12_1 <= 0 and d23_2 <= 0 then
		sv2.a = 1
		simplexCount = 1
		svSet(sv1, sv2)
		return
	end
	if d13_1 <= 0 and d23_1 <= 0 then
		sv3.a = 1
		simplexCount = 1
		svSet(sv1, sv3)
		return
	end
	if d23_1 > 0 and d23_2 > 0 and d123_1 <= 0 then
		local inv = 1 / (d23_1 + d23_2)
		sv2.a, sv3.a = d23_1 * inv, d23_2 * inv
		simplexCount = 2
		svSet(sv1, sv3)
		return
	end
	local inv = 1 / (d123_1 + d123_2 + d123_3)
	sv1.a, sv2.a, sv3.a = d123_1 * inv, d123_2 * inv, d123_3 * inv
	simplexCount = 3
end

local saveA, saveB = { 0, 0, 0 }, { 0, 0, 0 }

-- Returns the distance between the two shapes (without radii: useRadii is always false here,
-- as in TimeOfImpact)
local function distance(cache, proxyA, tA, proxyB, tB)
	readCache(cache, proxyA, tA, proxyB, tB)
	local iter = 0
	while iter < 20 do
		local saveCount = simplexCount
		for i = 1, saveCount do
			saveA[i], saveB[i] = simplexVerts[i].indexA, simplexVerts[i].indexB
		end
		if simplexCount == 2 then
			solve2()
		elseif simplexCount == 3 then
			solve3()
		end
		if simplexCount == 3 then
			break
		end
		-- Search direction
		local dX, dY
		if simplexCount == 1 then
			dX, dY = -sv1.wx, -sv1.wy
		else
			local e12x, e12y = sv2.wx - sv1.wx, sv2.wy - sv1.wy
			local sgn = cross(e12x, e12y, -sv1.wx, -sv1.wy)
			if sgn > 0 then
				dX, dY = -e12y, e12x -- CrossFV(1, e12)
			else
				dX, dY = e12y, -e12x -- CrossVF(e12, 1)
			end
		end
		if dX * dX + dY * dY < MIN_VALUE * MIN_VALUE then
			break
		end
		local v = simplexVerts[simplexCount + 1]
		v.indexA = getSupport(proxyA, tA.c * -dX + tA.s * -dY, -tA.s * -dX + tA.c * -dY)
		v.indexB = getSupport(proxyB, tB.c * dX + tB.s * dY, -tB.s * dX + tB.c * dY)
		svFill(v, proxyA, tA, proxyB, tB)
		iter += 1
		local duplicate = false
		for i = 1, saveCount do
			if v.indexA == saveA[i] and v.indexB == saveB[i] then
				duplicate = true
				break
			end
		end
		if duplicate then
			break
		end
		simplexCount += 1
	end
	-- Witness points
	local pAx, pAy, pBx, pBy
	if simplexCount == 1 then
		pAx, pAy, pBx, pBy = sv1.wAx, sv1.wAy, sv1.wBx, sv1.wBy
	elseif simplexCount == 2 then
		pAx = sv1.a * sv1.wAx + sv2.a * sv2.wAx
		pAy = sv1.a * sv1.wAy + sv2.a * sv2.wAy
		pBx = sv1.a * sv1.wBx + sv2.a * sv2.wBx
		pBy = sv1.a * sv1.wBy + sv2.a * sv2.wBy
	else
		pAx = sv1.a * sv1.wAx + sv2.a * sv2.wAx + sv3.a * sv3.wAx
		pAy = sv1.a * sv1.wAy + sv2.a * sv2.wAy + sv3.a * sv3.wAy
		pBx, pBy = pAx, pAy
	end
	writeCache(cache)
	local dx, dy = pAx - pBx, pAy - pBy
	return math.sqrt(dx * dx + dy * dy)
end

-- Separation function
local E_POINTS, E_FACEA, E_FACEB = 1, 2, 4
local sep = { type = E_POINTS, lpX = 0, lpY = 0, axX = 0, axY = 0, proxyA = nil :: any, proxyB = nil :: any }

local function normalize(x, y)
	local len = math.sqrt(x * x + y * y)
	if len < MIN_VALUE then
		return x, y
	end
	return x / len, y / len
end

local function sepInitialize(cache, proxyA, tA, proxyB, tB)
	sep.proxyA, sep.proxyB = proxyA, proxyB
	if cache.count == 1 then
		sep.type = E_POINTS
		local ax, ay = proxyA.vx[cache.indexA[1]], proxyA.vy[cache.indexA[1]]
		local bx, by = proxyB.vx[cache.indexB[1]], proxyB.vy[cache.indexB[1]]
		local pAx = tA.x + tA.c * ax - tA.s * ay
		local pAy = tA.y + tA.s * ax + tA.c * ay
		local pBx = tB.x + tB.c * bx - tB.s * by
		local pBy = tB.y + tB.s * bx + tB.c * by
		sep.axX, sep.axY = normalize(pBx - pAx, pBy - pAy)
	elseif cache.indexB[1] == cache.indexB[2] then
		sep.type = E_FACEA
		local a1x, a1y = proxyA.vx[cache.indexA[1]], proxyA.vy[cache.indexA[1]]
		local a2x, a2y = proxyA.vx[cache.indexA[2]], proxyA.vy[cache.indexA[2]]
		local bx, by = proxyB.vx[cache.indexB[1]], proxyB.vy[cache.indexB[1]]
		sep.lpX, sep.lpY = 0.5 * (a1x + a2x), 0.5 * (a1y + a2y)
		sep.axX, sep.axY = normalize(a2y - a1y, -(a2x - a1x))
		local nX = tA.c * sep.axX - tA.s * sep.axY
		local nY = tA.s * sep.axX + tA.c * sep.axY
		local pAx = tA.x + tA.c * sep.lpX - tA.s * sep.lpY
		local pAy = tA.y + tA.s * sep.lpX + tA.c * sep.lpY
		local pBx = tB.x + tB.c * bx - tB.s * by
		local pBy = tB.y + tB.s * bx + tB.c * by
		if (pBx - pAx) * nX + (pBy - pAy) * nY < 0 then
			sep.axX, sep.axY = -sep.axX, -sep.axY
		end
	else
		-- Box2DWeb tests indexA[0] == indexA[0] here, which is always true
		sep.type = E_FACEB
		local b1x, b1y = proxyB.vx[cache.indexB[1]], proxyB.vy[cache.indexB[1]]
		local b2x, b2y = proxyB.vx[cache.indexB[2]], proxyB.vy[cache.indexB[2]]
		local ax, ay = proxyA.vx[cache.indexA[1]], proxyA.vy[cache.indexA[1]]
		sep.lpX, sep.lpY = 0.5 * (b1x + b2x), 0.5 * (b1y + b2y)
		sep.axX, sep.axY = normalize(b2y - b1y, -(b2x - b1x))
		local nX = tB.c * sep.axX - tB.s * sep.axY
		local nY = tB.s * sep.axX + tB.c * sep.axY
		local pBx = tB.x + tB.c * sep.lpX - tB.s * sep.lpY
		local pBy = tB.y + tB.s * sep.lpX + tB.c * sep.lpY
		local pAx = tA.x + tA.c * ax - tA.s * ay
		local pAy = tA.y + tA.s * ax + tA.c * ay
		if (pAx - pBx) * nX + (pAy - pBy) * nY < 0 then
			sep.axX, sep.axY = -sep.axX, -sep.axY
		end
	end
end

local function supportVertex(proxy, dX, dY)
	local i = getSupport(proxy, dX, dY)
	return proxy.vx[i], proxy.vy[i]
end

local function sepEvaluate(tA, tB)
	local proxyA, proxyB = sep.proxyA, sep.proxyB
	if sep.type == E_POINTS then
		local axX, axY = sep.axX, sep.axY
		local lax, lay = supportVertex(proxyA, tA.c * axX + tA.s * axY, -tA.s * axX + tA.c * axY)
		local lbx, lby = supportVertex(proxyB, tB.c * -axX + tB.s * -axY, -tB.s * -axX + tB.c * -axY)
		local pAx = tA.x + tA.c * lax - tA.s * lay
		local pAy = tA.y + tA.s * lax + tA.c * lay
		local pBx = tB.x + tB.c * lbx - tB.s * lby
		local pBy = tB.y + tB.s * lbx + tB.c * lby
		return (pBx - pAx) * axX + (pBy - pAy) * axY
	elseif sep.type == E_FACEA then
		local nX = tA.c * sep.axX - tA.s * sep.axY
		local nY = tA.s * sep.axX + tA.c * sep.axY
		local pAx = tA.x + tA.c * sep.lpX - tA.s * sep.lpY
		local pAy = tA.y + tA.s * sep.lpX + tA.c * sep.lpY
		local lbx, lby = supportVertex(proxyB, tB.c * -nX + tB.s * -nY, -tB.s * -nX + tB.c * -nY)
		local pBx = tB.x + tB.c * lbx - tB.s * lby
		local pBy = tB.y + tB.s * lbx + tB.c * lby
		return (pBx - pAx) * nX + (pBy - pAy) * nY
	else
		local nX = tB.c * sep.axX - tB.s * sep.axY
		local nY = tB.s * sep.axX + tB.c * sep.axY
		local pBx = tB.x + tB.c * sep.lpX - tB.s * sep.lpY
		local pBy = tB.y + tB.s * sep.lpX + tB.c * sep.lpY
		local lax, lay = supportVertex(proxyA, tA.c * -nX + tA.s * -nY, -tA.s * -nX + tA.c * -nY)
		local pAx = tA.x + tA.c * lax - tA.s * lay
		local pAy = tA.y + tA.s * lax + tA.c * lay
		return (pAx - pBx) * nX + (pAy - pBy) * nY
	end
end

local function sweepTransform(body, t, alpha)
	local a = (1 - alpha) * body.a0 + alpha * body.a
	local c, s = math.cos(a), math.sin(a)
	t.c, t.s = c, s
	t.x = (1 - alpha) * body.c0x + alpha * body.cx - (c * body.lcx - s * body.lcy)
	t.y = (1 - alpha) * body.c0y + alpha * body.cy - (s * body.lcx + c * body.lcy)
end

local toiCache = { count = 0, metric = 0, indexA = { 1, 1, 1 }, indexB = { 1, 1, 1 } }
local xfA, xfB = { x = 0, y = 0, c = 1, s = 0 }, { x = 0, y = 0, c = 1, s = 0 }

local function timeOfImpact(proxyA, bodyA, proxyB, bodyB, tolerance)
	local radius = proxyA.radius + proxyB.radius
	local alpha = 0
	local iter = 0
	local target = 0
	toiCache.count = 0
	while true do
		sweepTransform(bodyA, xfA, alpha)
		sweepTransform(bodyB, xfB, alpha)
		local dist = distance(toiCache, proxyA, xfA, proxyB, xfB)
		if dist <= 0 then
			alpha = 1
			break
		end
		sepInitialize(toiCache, proxyA, xfA, proxyB, xfB)
		local separation = sepEvaluate(xfA, xfB)
		if separation <= 0 then
			alpha = 1
			break
		end
		if iter == 0 then
			if separation > radius then
				target = math.max(radius - tolerance, 0.75 * radius)
			else
				target = math.max(separation - tolerance, 0.02 * radius)
			end
		end
		if separation - target < 0.5 * tolerance then
			if iter == 0 then
				alpha = 1
			end
			break
		end
		local newAlpha = alpha
		do
			local x1, x2, f1 = alpha, 1, separation
			sweepTransform(bodyA, xfA, x2)
			sweepTransform(bodyB, xfB, x2)
			local f2 = sepEvaluate(xfA, xfB)
			if f2 >= target then
				alpha = 1
				break
			end
			local rootIterCount = 0
			while true do
				local x
				if rootIterCount % 2 == 1 then
					x = x1 + (target - f1) * (x2 - x1) / (f2 - f1)
				else
					x = 0.5 * (x1 + x2)
				end
				sweepTransform(bodyA, xfA, x)
				sweepTransform(bodyB, xfB, x)
				local f = sepEvaluate(xfA, xfB)
				if math.abs(f - target) < 0.025 * tolerance then
					newAlpha = x
					break
				end
				if f > target then
					x1, f1 = x, f
				else
					x2, f2 = x, f
				end
				rootIterCount += 1
				if rootIterCount == 50 then
					break
				end
			end
		end
		if newAlpha < (1 + 100 * MIN_VALUE) * alpha then
			break
		end
		alpha = newAlpha
		iter += 1
		if iter == 1000 then
			break
		end
	end
	return alpha
end

-- Bodies -------------------------------------------------------------------------------------

local Body = {}
Body.__index = Body

-- def: { type, x, y, angle, vx, vy, w, linearDamping, angularDamping, fixedRotation, bullet,
-- userData }
local function newBody(world, def)
	local angle = def.angle or 0
	local c, s = math.cos(angle), math.sin(angle)
	local body = setmetatable({
		world = world,
		type = def.type or STATIC,
		bullet = def.bullet == true,
		fixedRotation = def.fixedRotation == true,
		userData = def.userData,
		x = def.x or 0, y = def.y or 0, c = c, s = s, -- The transform (m_xf)
		lcx = 0, lcy = 0, c0x = def.x or 0, c0y = def.y or 0, cx = def.x or 0, cy = def.y or 0,
		a0 = angle, a = angle, t0 = 1, -- The sweep
		vx = def.vx or 0, vy = def.vy or 0, w = def.w or 0,
		ld = def.linearDamping or 0, ad = def.angularDamping or 0,
		fx = 0, fy = 0, torque = 0,
		mass = 0, invMass = 0, I = 0, invI = 0,
		fixtures = {},
		contactList = nil, -- Linked contact edges
		jointList = nil,
		islandFlag = false,
	}, Body)
	if body.type == DYNAMIC then
		body.mass, body.invMass = 1, 1
	end
	return body
end

function Body:synchronizeTransform()
	local c, s = math.cos(self.a), math.sin(self.a)
	self.c, self.s = c, s
	self.x = self.cx - (c * self.lcx - s * self.lcy)
	self.y = self.cy - (s * self.lcx + c * self.lcy)
end

function Body:resetMassData()
	self.mass, self.invMass, self.I, self.invI = 0, 0, 0, 0
	self.lcx, self.lcy = 0, 0
	if self.type ~= DYNAMIC then
		return
	end
	local cx, cy = 0, 0
	for _, f in self.fixtures do
		if f.density ~= 0 then
			local m, mx, my, I = computeMass(f.shape, f.density)
			self.mass += m
			cx += mx * m
			cy += my * m
			self.I += I
		end
	end
	if self.mass > 0 then
		self.invMass = 1 / self.mass
		cx *= self.invMass
		cy *= self.invMass
	else
		self.mass, self.invMass = 1, 1
	end
	if self.I > 0 and not self.fixedRotation then
		self.I -= self.mass * (cx * cx + cy * cy)
		self.invI = 1 / self.I
	else
		self.I, self.invI = 0, 0
	end
	local oldX, oldY = self.cx, self.cy
	self.lcx, self.lcy = cx, cy
	self.c0x = self.x + self.c * cx - self.s * cy
	self.c0y = self.y + self.s * cx + self.c * cy
	self.cx, self.cy = self.c0x, self.c0y
	self.vx += self.w * -(self.cy - oldY)
	self.vy += self.w * (self.cx - oldX)
end

-- def: { shape, friction, restitution, density, categoryBits, maskBits, groupIndex, isSensor,
-- userData }
function Body:createFixture(def)
	local f = {
		body = self,
		shape = def.shape,
		friction = def.friction or 0.2,
		restitution = def.restitution or 0,
		density = def.density or 0,
		categoryBits = def.categoryBits or 1,
		maskBits = def.maskBits or 0xFFFF,
		groupIndex = def.groupIndex or 0,
		isSensor = def.isSensor == true,
		userData = def.userData,
	}
	-- The fixture's own box and the broad phase's fattened box
	f.lx, f.ly, f.ux, f.uy = computeAABB(f.shape, self.x, self.y, self.c, self.s)
	f.flx, f.fly, f.fux, f.fuy = f.lx - aabbExtension, f.ly - aabbExtension, f.ux + aabbExtension, f.uy + aabbExtension
	table.insert(self.fixtures, 1, f) -- Box2D keeps the newest first
	local world = self.world
	world.proxyCount += 1
	f.proxyId = world.proxyCount
	table.insert(world.proxies, f)
	if self.type == DYNAMIC then
		table.insert(world.dynamicProxies, f)
	end
	table.insert(world.moveBuffer, f)
	if f.density > 0 then
		self:resetMassData()
	end
	world.newFixture = true
	return f
end

function Body:synchronizeFixtures()
	local c1, s1 = math.cos(self.a0), math.sin(self.a0)
	local x1 = self.c0x - (c1 * self.lcx - s1 * self.lcy)
	local y1 = self.c0y - (s1 * self.lcx + c1 * self.lcy)
	local moveBuffer = self.world.moveBuffer
	for _, f in self.fixtures do
		local al, ab, ar, at = computeAABB(f.shape, x1, y1, c1, s1)
		local bl, bb, br, bt = computeAABB(f.shape, self.x, self.y, self.c, self.s)
		f.lx, f.ly = math.min(al, bl), math.min(ab, bb)
		f.ux, f.uy = math.max(ar, br), math.max(at, bt)
		if not (f.flx <= f.lx and f.fly <= f.ly and f.ux <= f.fux and f.uy <= f.fuy) then
			local dX, dY = self.x - x1, self.y - y1
			local ex = aabbExtension + aabbMultiplier * math.abs(dX)
			local ey = aabbExtension + aabbMultiplier * math.abs(dY)
			f.flx, f.fly, f.fux, f.fuy = f.lx - ex, f.ly - ey, f.ux + ex, f.uy + ey
			table.insert(moveBuffer, f)
		end
	end
end

function Body:advance(t: number)
	if self.t0 < t and 1 - self.t0 > MIN_VALUE then
		local alpha = (t - self.t0) / (1 - self.t0)
		self.c0x = (1 - alpha) * self.c0x + alpha * self.cx
		self.c0y = (1 - alpha) * self.c0y + alpha * self.cy
		self.a0 = (1 - alpha) * self.a0 + alpha * self.a
		self.t0 = t
	end
	self.cx, self.cy = self.c0x, self.c0y
	self.a = self.a0
	self:synchronizeTransform()
end

function Body:shouldCollide(other)
	if self.type ~= DYNAMIC and other.type ~= DYNAMIC then
		return false
	end
	local jn = self.jointList
	while jn do
		if jn.other == other and jn.joint.collideConnected == false then
			return false
		end
		jn = jn.next
	end
	return true
end

function Body:applyForce(fx: number, fy: number, px: number, py: number)
	if self.type ~= DYNAMIC then
		return
	end
	self.fx += fx
	self.fy += fy
	self.torque += (px - self.cx) * fy - (py - self.cy) * fx
end

function Body:applyImpulse(ix: number, iy: number, px: number, py: number)
	if self.type ~= DYNAMIC then
		return
	end
	self.vx += self.invMass * ix
	self.vy += self.invMass * iy
	self.w += self.invI * ((px - self.cx) * iy - (py - self.cy) * ix)
end

function Body:setLinearVelocity(vx: number, vy: number)
	if self.type == STATIC then
		return
	end
	self.vx, self.vy = vx, vy
end

function Body:setAngularVelocity(w: number)
	if self.type == STATIC then
		return
	end
	self.w = w
end

function Body:getWorldPoint(lx: number, ly: number)
	return self.x + self.c * lx - self.s * ly, self.y + self.s * lx + self.c * ly
end

function Body:getWorldVector(lx: number, ly: number)
	return self.c * lx - self.s * ly, self.s * lx + self.c * ly
end

function Body:getWorldCenter()
	return self.cx, self.cy
end

function Body:getAngle()
	return self.a
end

-- Contacts -----------------------------------------------------------------------------------

local function newContact(fixtureA, fixtureB)
	-- Polygons come first against circles, as Box2D's contact factory arranges
	if fixtureA.shape.type == CIRCLE and fixtureB.shape.type == POLYGON then
		fixtureA, fixtureB = fixtureB, fixtureA
	end
	local c = {
		fixtureA = fixtureA, fixtureB = fixtureB,
		flags = C_ENABLED,
		manifold = newManifold(), oldManifold = newManifold(),
		toi = 0,
		prev = nil, next = nil,
	}
	if fixtureA.isSensor or fixtureB.isSensor then
		c.flags = bit32.bor(c.flags, C_SENSOR)
	end
	local bA, bB = fixtureA.body, fixtureB.body
	if bA.type ~= DYNAMIC or bA.bullet or bB.type ~= DYNAMIC or bB.bullet then
		c.flags = bit32.bor(c.flags, C_CONTINUOUS)
	end
	c.nodeA = { contact = c, other = bB, prev = nil, next = nil }
	c.nodeB = { contact = c, other = bA, prev = nil, next = nil }
	return c
end

local function hasFlag(c, flag)
	return bit32.band(c.flags, flag) ~= 0
end

local Contact = {}
Box2D.Contact = Contact

function Contact.setEnabled(c, flag: boolean)
	if flag then
		c.flags = bit32.bor(c.flags, C_ENABLED)
	else
		c.flags = bit32.band(c.flags, bit32.bnot(C_ENABLED))
	end
end

function Contact.isTouching(c)
	return hasFlag(c, C_TOUCHING)
end

function Contact.isEnabled(c)
	return hasFlag(c, C_ENABLED)
end

-- World normal and points for a contact (GetWorldManifold)
function Contact.getWorldManifold(c)
	local fA, fB = c.fixtureA, c.fixtureB
	local bA, bB = fA.body, fB.body
	return worldManifold(c.manifold, bA.x, bA.y, bA.c, bA.s, fA.shape.radius, bB.x, bB.y, bB.c, bB.s, fB.shape.radius)
end

local function evaluate(c)
	local fA, fB = c.fixtureA, c.fixtureB
	local bA, bB = fA.body, fB.body
	local sA, sB = fA.shape, fB.shape
	if sA.type == CIRCLE then
		collideCircles(c.manifold, sA, bA.x, bA.y, bA.c, bA.s, sB, bB.x, bB.y, bB.c, bB.s)
	elseif sB.type == CIRCLE then
		collidePolygonAndCircle(c.manifold, sA, bA.x, bA.y, bA.c, bA.s, sB, bB.x, bB.y, bB.c, bB.s)
	else
		collidePolygons(c.manifold, sA, bA.x, bA.y, bA.c, bA.s, sB, bB.x, bB.y, bB.c, bB.s)
	end
end

local function aabbOverlap(f1, f2)
	return not (f2.lx - f1.ux > 0 or f2.ly - f1.uy > 0 or f1.lx - f2.ux > 0 or f1.ly - f2.uy > 0)
end

local function fatOverlap(f1, f2)
	return not (f2.flx - f1.fux > 0 or f2.fly - f1.fuy > 0 or f1.flx - f2.fux > 0 or f1.fly - f2.fuy > 0)
end

local function contactUpdate(c, listener)
	c.oldManifold, c.manifold = c.manifold, c.oldManifold
	c.flags = bit32.bor(c.flags, C_ENABLED)
	local touching = false
	local wasTouching = hasFlag(c, C_TOUCHING)
	local fA, fB = c.fixtureA, c.fixtureB
	local bA, bB = fA.body, fB.body
	local overlap = aabbOverlap(fA, fB)
	if hasFlag(c, C_SENSOR) then
		-- bonk has no sensors
		c.manifold.count = 0
	else
		if bA.type ~= DYNAMIC or bA.bullet or bB.type ~= DYNAMIC or bB.bullet then
			c.flags = bit32.bor(c.flags, C_CONTINUOUS)
		else
			c.flags = bit32.band(c.flags, bit32.bnot(C_CONTINUOUS))
		end
		if overlap then
			evaluate(c)
			local m, old = c.manifold, c.oldManifold
			touching = m.count > 0
			for i = 1, m.count do
				local mp2 = m.points[i]
				mp2.normalImpulse, mp2.tangentImpulse = 0, 0
				for j = 1, old.count do
					local mp1 = old.points[j]
					if mp1.key == mp2.key then
						mp2.normalImpulse, mp2.tangentImpulse = mp1.normalImpulse, mp1.tangentImpulse
						break
					end
				end
			end
		else
			c.manifold.count = 0
		end
	end
	if touching then
		c.flags = bit32.bor(c.flags, C_TOUCHING)
	else
		c.flags = bit32.band(c.flags, bit32.bnot(C_TOUCHING))
	end
	if listener then
		if not wasTouching and touching and listener.BeginContact then
			listener.BeginContact(c)
		end
		if wasTouching and not touching and listener.EndContact then
			listener.EndContact(c)
		end
		if not hasFlag(c, C_SENSOR) and listener.PreSolve then
			listener.PreSolve(c, c.oldManifold)
		end
	end
end

-- Contact solver -----------------------------------------------------------------------------

local function newConstraint()
	local function point()
		return {
			normalImpulse = 0, tangentImpulse = 0, lpX = 0, lpY = 0,
			rAX = 0, rAY = 0, rBX = 0, rBY = 0,
			normalMass = 0, equalizedMass = 0, tangentMass = 0, velocityBias = 0,
		}
	end
	return {
		points = { point(), point() },
		nX = 0, nY = 0, lpnX = 0, lpnY = 0, lpX = 0, lpY = 0,
		K11 = 0, K12 = 0, K21 = 0, K22 = 0, -- col1 = (K11, K21), col2 = (K12, K22)
		NM11 = 0, NM12 = 0, NM21 = 0, NM22 = 0,
		pointCount = 0, friction = 0, restitution = 0, radius = 0, type = 0,
	}
end

local constraints = {}

local function solverInitialize(contacts, count)
	for i = #constraints + 1, count do
		constraints[i] = newConstraint()
	end
	for i = 1, count do
		local contact = contacts[i]
		local fA, fB = contact.fixtureA, contact.fixtureB
		local radiusA, radiusB = fA.shape.radius, fB.shape.radius
		local bA, bB = fA.body, fB.body
		local m = contact.manifold
		local friction = mixFriction(fA.friction, fB.friction)
		local restitution = mixRestitution(fA.restitution, fB.restitution)
		local vAX, vAY, vBX, vBY, wA, wB = bA.vx, bA.vy, bB.vx, bB.vy, bA.w, bB.w
		local nX, nY, points = worldManifold(m, bA.x, bA.y, bA.c, bA.s, radiusA, bB.x, bB.y, bB.c, bB.s, radiusB)
		local cc = constraints[i]
		cc.bodyA, cc.bodyB, cc.manifold = bA, bB, m
		cc.nX, cc.nY = nX, nY
		cc.pointCount = m.count
		cc.friction, cc.restitution = friction, restitution
		cc.lpnX, cc.lpnY, cc.lpX, cc.lpY = m.lpnX, m.lpnY, m.lpX, m.lpY
		cc.radius = radiusA + radiusB
		cc.type = m.type
		for k = 1, cc.pointCount do
			local cp, ccp = m.points[k], cc.points[k]
			ccp.normalImpulse, ccp.tangentImpulse = cp.normalImpulse, cp.tangentImpulse
			ccp.lpX, ccp.lpY = cp.lpX, cp.lpY
			local rAX, rAY = points[k].x - bA.cx, points[k].y - bA.cy
			local rBX, rBY = points[k].x - bB.cx, points[k].y - bB.cy
			ccp.rAX, ccp.rAY, ccp.rBX, ccp.rBY = rAX, rAY, rBX, rBY
			local rnA = rAX * nY - rAY * nX
			local rnB = rBX * nY - rBY * nX
			rnA *= rnA
			rnB *= rnB
			ccp.normalMass = 1 / (bA.invMass + bB.invMass + bA.invI * rnA + bB.invI * rnB)
			local kEq = bA.mass * bA.invMass + bB.mass * bB.invMass + bA.mass * bA.invI * rnA + bB.mass * bB.invI * rnB
			ccp.equalizedMass = 1 / kEq
			local tX, tY = nY, -nX
			local rtA = rAX * tY - rAY * tX
			local rtB = rBX * tY - rBY * tX
			rtA *= rtA
			rtB *= rtB
			ccp.tangentMass = 1 / (bA.invMass + bB.invMass + bA.invI * rtA + bB.invI * rtB)
			ccp.velocityBias = 0
			local dvx = vBX + (-wB * rBY) - vAX - (-wA * rAY)
			local dvy = vBY + (wB * rBX) - vAY - (wA * rAX)
			local vRel = nX * dvx + nY * dvy
			if vRel < -velocityThreshold then
				ccp.velocityBias += -cc.restitution * vRel
			end
		end
		if cc.pointCount == 2 then
			local p1, p2 = cc.points[1], cc.points[2]
			local invMassA, invIA, invMassB, invIB = bA.invMass, bA.invI, bB.invMass, bB.invI
			local rn1A = p1.rAX * nY - p1.rAY * nX
			local rn1B = p1.rBX * nY - p1.rBY * nX
			local rn2A = p2.rAX * nY - p2.rAY * nX
			local rn2B = p2.rBX * nY - p2.rBY * nX
			local k11 = invMassA + invMassB + invIA * rn1A * rn1A + invIB * rn1B * rn1B
			local k22 = invMassA + invMassB + invIA * rn2A * rn2A + invIB * rn2B * rn2B
			local k12 = invMassA + invMassB + invIA * rn1A * rn2A + invIB * rn1B * rn2B
			if k11 * k11 < 100 * (k11 * k22 - k12 * k12) then
				cc.K11, cc.K21, cc.K12, cc.K22 = k11, k12, k12, k22
				-- GetInverse
				local a, b, c, d = cc.K11, cc.K12, cc.K21, cc.K22
				local det = a * d - b * c
				if det ~= 0 then
					det = 1 / det
				end
				cc.NM11, cc.NM12, cc.NM21, cc.NM22 = det * d, -det * b, -det * c, det * a
			else
				cc.pointCount = 1
			end
		end
	end
end

local function solverInitVelocity(count, warmStarting, dtRatio)
	for i = 1, count do
		local c = constraints[i]
		local bA, bB = c.bodyA, c.bodyB
		if warmStarting then
			local tX, tY = c.nY, -c.nX
			for j = 1, c.pointCount do
				local ccp = c.points[j]
				ccp.normalImpulse *= dtRatio
				ccp.tangentImpulse *= dtRatio
				local PX = ccp.normalImpulse * c.nX + ccp.tangentImpulse * tX
				local PY = ccp.normalImpulse * c.nY + ccp.tangentImpulse * tY
				bA.w -= bA.invI * (ccp.rAX * PY - ccp.rAY * PX)
				bA.vx -= bA.invMass * PX
				bA.vy -= bA.invMass * PY
				bB.w += bB.invI * (ccp.rBX * PY - ccp.rBY * PX)
				bB.vx += bB.invMass * PX
				bB.vy += bB.invMass * PY
			end
		else
			for j = 1, c.pointCount do
				c.points[j].normalImpulse = 0
				c.points[j].tangentImpulse = 0
			end
		end
	end
end

local function solverSolveVelocity(count)
	for i = 1, count do
		local c = constraints[i]
		local bA, bB = c.bodyA, c.bodyB
		local wA, wB = bA.w, bB.w
		local vAx, vAy, vBx, vBy = bA.vx, bA.vy, bB.vx, bB.vy
		local invMassA, invIA, invMassB, invIB = bA.invMass, bA.invI, bB.invMass, bB.invI
		local nX, nY = c.nX, c.nY
		local tX, tY = nY, -nX
		local friction = c.friction
		for j = 1, c.pointCount do
			local ccp = c.points[j]
			local dvX = vBx - wB * ccp.rBY - vAx + wA * ccp.rAY
			local dvY = vBy + wB * ccp.rBX - vAy - wA * ccp.rAX
			local vt = dvX * tX + dvY * tY
			local lambda = ccp.tangentMass * -vt
			local maxFriction = friction * ccp.normalImpulse
			local newImpulse = clamp(ccp.tangentImpulse + lambda, -maxFriction, maxFriction)
			lambda = newImpulse - ccp.tangentImpulse
			local PX, PY = lambda * tX, lambda * tY
			vAx -= invMassA * PX
			vAy -= invMassA * PY
			wA -= invIA * (ccp.rAX * PY - ccp.rAY * PX)
			vBx += invMassB * PX
			vBy += invMassB * PY
			wB += invIB * (ccp.rBX * PY - ccp.rBY * PX)
			ccp.tangentImpulse = newImpulse
		end
		if c.pointCount == 1 then
			local ccp = c.points[1]
			local dvX = vBx + (-wB * ccp.rBY) - vAx - (-wA * ccp.rAY)
			local dvY = vBy + (wB * ccp.rBX) - vAy - (wA * ccp.rAX)
			local vn = dvX * nX + dvY * nY
			local lambda = -ccp.normalMass * (vn - ccp.velocityBias)
			local newImpulse = ccp.normalImpulse + lambda
			newImpulse = newImpulse > 0 and newImpulse or 0
			lambda = newImpulse - ccp.normalImpulse
			local PX, PY = lambda * nX, lambda * nY
			vAx -= invMassA * PX
			vAy -= invMassA * PY
			wA -= invIA * (ccp.rAX * PY - ccp.rAY * PX)
			vBx += invMassB * PX
			vBy += invMassB * PY
			wB += invIB * (ccp.rBX * PY - ccp.rBY * PX)
			ccp.normalImpulse = newImpulse
		else
			local cp1, cp2 = c.points[1], c.points[2]
			local aX, aY = cp1.normalImpulse, cp2.normalImpulse
			local dv1X = vBx - wB * cp1.rBY - vAx + wA * cp1.rAY
			local dv1Y = vBy + wB * cp1.rBX - vAy - wA * cp1.rAX
			local dv2X = vBx - wB * cp2.rBY - vAx + wA * cp2.rAY
			local dv2Y = vBy + wB * cp2.rBX - vAy - wA * cp2.rAX
			local vn1 = dv1X * nX + dv1Y * nY
			local vn2 = dv2X * nX + dv2Y * nY
			local bX = vn1 - cp1.velocityBias
			local bY = vn2 - cp2.velocityBias
			bX -= c.K11 * aX + c.K12 * aY
			bY -= c.K21 * aX + c.K22 * aY
			local function apply(xX, xY)
				local dX, dY = xX - aX, xY - aY
				local P1X, P1Y = dX * nX, dX * nY
				local P2X, P2Y = dY * nX, dY * nY
				vAx -= invMassA * (P1X + P2X)
				vAy -= invMassA * (P1Y + P2Y)
				wA -= invIA * (cp1.rAX * P1Y - cp1.rAY * P1X + cp2.rAX * P2Y - cp2.rAY * P2X)
				vBx += invMassB * (P1X + P2X)
				vBy += invMassB * (P1Y + P2Y)
				wB += invIB * (cp1.rBX * P1Y - cp1.rBY * P1X + cp2.rBX * P2Y - cp2.rBY * P2X)
				cp1.normalImpulse, cp2.normalImpulse = xX, xY
			end
			repeat
				local xX = -(c.NM11 * bX + c.NM12 * bY)
				local xY = -(c.NM21 * bX + c.NM22 * bY)
				if xX >= 0 and xY >= 0 then
					apply(xX, xY)
					break
				end
				xX = -cp1.normalMass * bX
				xY = 0
				vn2 = c.K21 * xX + bY
				if xX >= 0 and vn2 >= 0 then
					apply(xX, xY)
					break
				end
				xX = 0
				xY = -cp2.normalMass * bY
				vn1 = c.K12 * xY + bX
				if xY >= 0 and vn1 >= 0 then
					apply(xX, xY)
					break
				end
				if bX >= 0 and bY >= 0 then
					apply(0, 0)
					break
				end
			until true
		end
		bA.vx, bA.vy, bA.w = vAx, vAy, wA
		bB.vx, bB.vy, bB.w = vBx, vBy, wB
	end
end

local function solverFinalizeVelocity(count)
	for i = 1, count do
		local c = constraints[i]
		local m = c.manifold
		for j = 1, c.pointCount do
			m.points[j].normalImpulse = c.points[j].normalImpulse
			m.points[j].tangentImpulse = c.points[j].tangentImpulse
		end
	end
end

local psmPoints = { { x = 0, y = 0 }, { x = 0, y = 0 } }
local psmSeparations = { 0, 0 }

local function psmInitialize(cc)
	local bA, bB = cc.bodyA, cc.bodyB
	local nX, nY
	if cc.type == CIRCLES then
		local pAx = bA.x + bA.c * cc.lpX - bA.s * cc.lpY
		local pAy = bA.y + bA.s * cc.lpX + bA.c * cc.lpY
		local lp = cc.points[1]
		local pBx = bB.x + bB.c * lp.lpX - bB.s * lp.lpY
		local pBy = bB.y + bB.s * lp.lpX + bB.c * lp.lpY
		local dX, dY = pBx - pAx, pBy - pAy
		local d2 = dX * dX + dY * dY
		if d2 > MIN_VALUE * MIN_VALUE then
			local d = math.sqrt(d2)
			nX, nY = dX / d, dY / d
		else
			nX, nY = 1, 0
		end
		psmPoints[1].x, psmPoints[1].y = 0.5 * (pAx + pBx), 0.5 * (pAy + pBy)
		psmSeparations[1] = dX * nX + dY * nY - cc.radius
	elseif cc.type == FACE_A then
		nX = bA.c * cc.lpnX - bA.s * cc.lpnY
		nY = bA.s * cc.lpnX + bA.c * cc.lpnY
		local ppX = bA.x + bA.c * cc.lpX - bA.s * cc.lpY
		local ppY = bA.y + bA.s * cc.lpX + bA.c * cc.lpY
		for i = 1, cc.pointCount do
			local lp = cc.points[i]
			local cpX = bB.x + bB.c * lp.lpX - bB.s * lp.lpY
			local cpY = bB.y + bB.s * lp.lpX + bB.c * lp.lpY
			psmSeparations[i] = (cpX - ppX) * nX + (cpY - ppY) * nY - cc.radius
			psmPoints[i].x, psmPoints[i].y = cpX, cpY
		end
	else
		nX = bB.c * cc.lpnX - bB.s * cc.lpnY
		nY = bB.s * cc.lpnX + bB.c * cc.lpnY
		local ppX = bB.x + bB.c * cc.lpX - bB.s * cc.lpY
		local ppY = bB.y + bB.s * cc.lpX + bB.c * cc.lpY
		for i = 1, cc.pointCount do
			local lp = cc.points[i]
			local cpX = bA.x + bA.c * lp.lpX - bA.s * lp.lpY
			local cpY = bA.y + bA.s * lp.lpX + bA.c * lp.lpY
			psmSeparations[i] = (cpX - ppX) * nX + (cpY - ppY) * nY - cc.radius
			psmPoints[i].x, psmPoints[i].y = cpX, cpY
		end
		nX, nY = -nX, -nY
	end
	return nX, nY
end

local function solverSolvePosition(count, baumgarte)
	local minSeparation = 0
	for i = 1, count do
		local c = constraints[i]
		local bA, bB = c.bodyA, c.bodyB
		local invMassA = bA.mass * bA.invMass
		local invIA = bA.mass * bA.invI
		local invMassB = bB.mass * bB.invMass
		local invIB = bB.mass * bB.invI
		local nX, nY = psmInitialize(c)
		for j = 1, c.pointCount do
			local ccp = c.points[j]
			local point = psmPoints[j]
			local separation = psmSeparations[j]
			local rAX, rAY = point.x - bA.cx, point.y - bA.cy
			local rBX, rBY = point.x - bB.cx, point.y - bB.cy
			minSeparation = minSeparation < separation and minSeparation or separation
			local C = clamp(baumgarte * (separation + linearSlop), -maxLinearCorrection, 0)
			local impulse = -ccp.equalizedMass * C
			local PX, PY = impulse * nX, impulse * nY
			bA.cx -= invMassA * PX
			bA.cy -= invMassA * PY
			bA.a -= invIA * (rAX * PY - rAY * PX)
			bA:synchronizeTransform()
			bB.cx += invMassB * PX
			bB.cy += invMassB * PY
			bB.a += invIB * (rBX * PY - rBY * PX)
			bB:synchronizeTransform()
		end
	end
	return minSeparation > -1.5 * linearSlop
end

-- Joints -------------------------------------------------------------------------------------

local INACTIVE, AT_LOWER, AT_UPPER, EQUAL = 0, 1, 2, 3

-- Turns a body-local anchor into an offset from the centre of mass, in world axes
local function anchorR(body, lx, ly)
	local rx, ry = lx - body.lcx, ly - body.lcy
	return body.c * rx - body.s * ry, body.s * rx + body.c * ry
end

local Revolute = {}
Revolute.__index = Revolute

local function newRevolute(def)
	return setmetatable({
		kind = "revolute",
		bodyA = def.bodyA, bodyB = def.bodyB, collideConnected = def.collideConnected == true,
		la1x = def.localAnchorA[1], la1y = def.localAnchorA[2],
		la2x = def.localAnchorB[1], la2y = def.localAnchorB[2],
		referenceAngle = def.referenceAngle or 0,
		ix = 0, iy = 0, iz = 0, motorImpulse = 0,
		lowerAngle = def.lowerAngle or 0, upperAngle = def.upperAngle or 0,
		maxMotorTorque = def.maxMotorTorque or 0, motorSpeed = def.motorSpeed or 0,
		enableLimit = def.enableLimit == true, enableMotor = def.enableMotor == true,
		limitState = INACTIVE,
		m11 = 0, m12 = 0, m13 = 0, m21 = 0, m22 = 0, m23 = 0, m31 = 0, m32 = 0, m33 = 0, motorMass = 0,
	}, Revolute)
end

-- Mat33 with col1 = (m11, m21, m31) etc.
local function solve33(j, bX, bY, bZ)
	local a11, a21, a31 = j.m11, j.m21, j.m31
	local a12, a22, a32 = j.m12, j.m22, j.m32
	local a13, a23, a33 = j.m13, j.m23, j.m33
	local det = a11 * (a22 * a33 - a32 * a23) + a21 * (a32 * a13 - a12 * a33) + a31 * (a12 * a23 - a22 * a13)
	if det ~= 0 then
		det = 1 / det
	end
	return det * (bX * (a22 * a33 - a32 * a23) + bY * (a32 * a13 - a12 * a33) + bZ * (a12 * a23 - a22 * a13)),
		det * (a11 * (bY * a33 - bZ * a23) + a21 * (bZ * a13 - bX * a33) + a31 * (bX * a23 - bY * a13)),
		det * (a11 * (a22 * bZ - a32 * bY) + a21 * (a32 * bX - a12 * bZ) + a31 * (a12 * bY - a22 * bX))
end

local function solve22(j, bX, bY)
	local a11, a12, a21, a22 = j.m11, j.m12, j.m21, j.m22
	local det = a11 * a22 - a12 * a21
	if det ~= 0 then
		det = 1 / det
	end
	return det * (a22 * bX - a12 * bY), det * (a11 * bY - a21 * bX)
end

function Revolute:initVelocity(step)
	local bA, bB = self.bodyA, self.bodyB
	local r1X, r1Y = anchorR(bA, self.la1x, self.la1y)
	local r2X, r2Y = anchorR(bB, self.la2x, self.la2y)
	local m1, m2, i1, i2 = bA.invMass, bB.invMass, bA.invI, bB.invI
	self.m11 = m1 + m2 + r1Y * r1Y * i1 + r2Y * r2Y * i2
	self.m12 = -r1Y * r1X * i1 - r2Y * r2X * i2
	self.m13 = -r1Y * i1 - r2Y * i2
	self.m21 = self.m12
	self.m22 = m1 + m2 + r1X * r1X * i1 + r2X * r2X * i2
	self.m23 = r1X * i1 + r2X * i2
	self.m31 = self.m13
	self.m32 = self.m23
	self.m33 = i1 + i2
	self.motorMass = 1 / (i1 + i2)
	if not self.enableMotor then
		self.motorImpulse = 0
	end
	if self.enableLimit then
		local jointAngle = bB.a - bA.a - self.referenceAngle
		if math.abs(self.upperAngle - self.lowerAngle) < 2 * angularSlop then
			self.limitState = EQUAL
		elseif jointAngle <= self.lowerAngle then
			if self.limitState ~= AT_LOWER then
				self.iz = 0
			end
			self.limitState = AT_LOWER
		elseif jointAngle >= self.upperAngle then
			if self.limitState ~= AT_UPPER then
				self.iz = 0
			end
			self.limitState = AT_UPPER
		else
			self.limitState = INACTIVE
			self.iz = 0
		end
	else
		self.limitState = INACTIVE
	end
	if step.warmStarting then
		self.ix *= step.dtRatio
		self.iy *= step.dtRatio
		self.motorImpulse *= step.dtRatio
		local PX, PY = self.ix, self.iy
		bA.vx -= m1 * PX
		bA.vy -= m1 * PY
		bA.w -= i1 * ((r1X * PY - r1Y * PX) + self.motorImpulse + self.iz)
		bB.vx += m2 * PX
		bB.vy += m2 * PY
		bB.w += i2 * ((r2X * PY - r2Y * PX) + self.motorImpulse + self.iz)
	else
		self.ix, self.iy, self.iz = 0, 0, 0
		self.motorImpulse = 0
	end
end

function Revolute:solveVelocity(step)
	local bA, bB = self.bodyA, self.bodyB
	local v1x, v1y, w1 = bA.vx, bA.vy, bA.w
	local v2x, v2y, w2 = bB.vx, bB.vy, bB.w
	local m1, m2, i1, i2 = bA.invMass, bB.invMass, bA.invI, bB.invI
	if self.enableMotor and self.limitState ~= EQUAL then
		local Cdot = w2 - w1 - self.motorSpeed
		local impulse = self.motorMass * -Cdot
		local oldImpulse = self.motorImpulse
		local maxImpulse = step.dt * self.maxMotorTorque
		self.motorImpulse = clamp(self.motorImpulse + impulse, -maxImpulse, maxImpulse)
		impulse = self.motorImpulse - oldImpulse
		w1 -= i1 * impulse
		w2 += i2 * impulse
	end
	local r1X, r1Y = anchorR(bA, self.la1x, self.la1y)
	local r2X, r2Y = anchorR(bB, self.la2x, self.la2y)
	if self.enableLimit and self.limitState ~= INACTIVE then
		local Cdot1X = v2x + (-w2 * r2Y) - v1x - (-w1 * r1Y)
		local Cdot1Y = v2y + (w2 * r2X) - v1y - (w1 * r1X)
		local Cdot2 = w2 - w1
		local jx, jy, jz = solve33(self, -Cdot1X, -Cdot1Y, -Cdot2)
		if self.limitState == EQUAL then
			self.ix += jx
			self.iy += jy
			self.iz += jz
		elseif self.limitState == AT_LOWER then
			local newImpulse = self.iz + jz
			if newImpulse < 0 then
				local rx, ry = solve22(self, -Cdot1X, -Cdot1Y)
				jx, jy, jz = rx, ry, -self.iz
				self.ix += rx
				self.iy += ry
				self.iz = 0
			end
		elseif self.limitState == AT_UPPER then
			local newImpulse = self.iz + jz
			if newImpulse > 0 then
				local rx, ry = solve22(self, -Cdot1X, -Cdot1Y)
				jx, jy, jz = rx, ry, -self.iz
				self.ix += rx
				self.iy += ry
				self.iz = 0
			end
		end
		v1x -= m1 * jx
		v1y -= m1 * jy
		w1 -= i1 * (r1X * jy - r1Y * jx + jz)
		v2x += m2 * jx
		v2y += m2 * jy
		w2 += i2 * (r2X * jy - r2Y * jx + jz)
	else
		local CdotX = v2x + (-w2 * r2Y) - v1x - (-w1 * r1Y)
		local CdotY = v2y + (w2 * r2X) - v1y - (w1 * r1X)
		local jx, jy = solve22(self, -CdotX, -CdotY)
		self.ix += jx
		self.iy += jy
		v1x -= m1 * jx
		v1y -= m1 * jy
		w1 -= i1 * (r1X * jy - r1Y * jx)
		v2x += m2 * jx
		v2y += m2 * jy
		w2 += i2 * (r2X * jy - r2Y * jx)
	end
	bA.vx, bA.vy, bA.w = v1x, v1y, w1
	bB.vx, bB.vy, bB.w = v2x, v2y, w2
end

function Revolute:finalizeVelocity() end

function Revolute:solvePosition(baumgarte)
	local bA, bB = self.bodyA, self.bodyB
	local angularError, positionError = 0, 0
	if self.enableLimit and self.limitState ~= INACTIVE then
		local angle = bB.a - bA.a - self.referenceAngle
		local limitImpulse = 0
		local C
		if self.limitState == EQUAL then
			C = clamp(angle - self.lowerAngle, -maxAngularCorrection, maxAngularCorrection)
			limitImpulse = -self.motorMass * C
			angularError = math.abs(C)
		elseif self.limitState == AT_LOWER then
			C = angle - self.lowerAngle
			angularError = -C
			C = clamp(C + angularSlop, -maxAngularCorrection, 0)
			limitImpulse = -self.motorMass * C
		elseif self.limitState == AT_UPPER then
			C = angle - self.upperAngle
			angularError = C
			C = clamp(C - angularSlop, 0, maxAngularCorrection)
			limitImpulse = -self.motorMass * C
		end
		bA.a -= bA.invI * limitImpulse
		bB.a += bB.invI * limitImpulse
		bA:synchronizeTransform()
		bB:synchronizeTransform()
	end
	do
		local r1X, r1Y = anchorR(bA, self.la1x, self.la1y)
		local r2X, r2Y = anchorR(bB, self.la2x, self.la2y)
		local CX = bB.cx + r2X - bA.cx - r1X
		local CY = bB.cy + r2Y - bA.cy - r1Y
		local CLengthSquared = CX * CX + CY * CY
		positionError = math.sqrt(CLengthSquared)
		local invMass1, invMass2, invI1, invI2 = bA.invMass, bB.invMass, bA.invI, bB.invI
		local k_allowedStretch = 10 * linearSlop
		if CLengthSquared > k_allowedStretch * k_allowedStretch then
			local m = 1 / (invMass1 + invMass2)
			local impulseX, impulseY = m * -CX, m * -CY
			local k_beta = 0.5
			bA.cx -= k_beta * invMass1 * impulseX
			bA.cy -= k_beta * invMass1 * impulseY
			bB.cx += k_beta * invMass2 * impulseX
			bB.cy += k_beta * invMass2 * impulseY
			CX = bB.cx + r2X - bA.cx - r1X
			CY = bB.cy + r2Y - bA.cy - r1Y
		end
		local K11 = invMass1 + invMass2 + invI1 * r1Y * r1Y + invI2 * r2Y * r2Y
		local K12 = -invI1 * r1X * r1Y - invI2 * r2X * r2Y
		local K21 = K12
		local K22 = invMass1 + invMass2 + invI1 * r1X * r1X + invI2 * r2X * r2X
		local det = K11 * K22 - K12 * K21
		if det ~= 0 then
			det = 1 / det
		end
		local impulseX = det * (K22 * -CX - K12 * -CY)
		local impulseY = det * (K11 * -CY - K21 * -CX)
		bA.cx -= bA.invMass * impulseX
		bA.cy -= bA.invMass * impulseY
		bA.a -= bA.invI * (r1X * impulseY - r1Y * impulseX)
		bB.cx += bB.invMass * impulseX
		bB.cy += bB.invMass * impulseY
		bB.a += bB.invI * (r2X * impulseY - r2Y * impulseX)
		bA:synchronizeTransform()
		bB:synchronizeTransform()
	end
	return positionError <= linearSlop and angularError <= angularSlop
end

function Revolute:getReactionForce(inv_dt)
	return inv_dt * self.ix, inv_dt * self.iy
end

function Revolute:getJointAngleInverse()
	return self.bodyA.a - self.bodyB.a - self.referenceAngle
end

local Prismatic = {}
Prismatic.__index = Prismatic

local function newPrismatic(def)
	local ax, ay = def.localAxisA[1], def.localAxisA[2]
	return setmetatable({
		kind = "prismatic",
		bodyA = def.bodyA, bodyB = def.bodyB, collideConnected = def.collideConnected == true,
		la1x = def.localAnchorA[1], la1y = def.localAnchorA[2],
		la2x = def.localAnchorB[1], la2y = def.localAnchorB[2],
		lxax = ax, lxay = ay, lyax = -ay, lyay = ax,
		refAngle = def.referenceAngle or 0,
		ix = 0, iy = 0, iz = 0, motorMass = 0, motorImpulse = 0,
		lowerTranslation = def.lowerTranslation or 0, upperTranslation = def.upperTranslation or 0,
		maxMotorForce = def.maxMotorForce or 0, motorSpeed = def.motorSpeed or 0,
		enableLimit = def.enableLimit == true, enableMotor = def.enableMotor == true,
		limitState = INACTIVE,
		axisX = 0, axisY = 0, perpX = 0, perpY = 0,
		lcAx = 0, lcAy = 0, lcBx = 0, lcBy = 0,
		a1 = 0, a2 = 0, s1 = 0, s2 = 0,
		m11 = 0, m12 = 0, m13 = 0, m21 = 0, m22 = 0, m23 = 0, m31 = 0, m32 = 0, m33 = 0,
		invMassA = 0, invMassB = 0, invIA = 0, invIB = 0,
	}, Prismatic)
end

function Prismatic:setK(m1, m2, i1, i2)
	self.m11 = m1 + m2 + i1 * self.s1 * self.s1 + i2 * self.s2 * self.s2
	self.m21 = i1 * self.s1 + i2 * self.s2
	self.m31 = i1 * self.s1 * self.a1 + i2 * self.s2 * self.a2
	self.m12 = self.m21
	self.m22 = i1 + i2
	self.m32 = i1 * self.a1 + i2 * self.a2
	self.m13 = self.m31
	self.m23 = self.m32
	self.m33 = m1 + m2 + i1 * self.a1 * self.a1 + i2 * self.a2 * self.a2
end

function Prismatic:initVelocity(step)
	local bA, bB = self.bodyA, self.bodyB
	self.lcAx, self.lcAy = bA.lcx, bA.lcy
	self.lcBx, self.lcBy = bB.lcx, bB.lcy
	local r1X, r1Y = anchorR(bA, self.la1x, self.la1y)
	local r2X, r2Y = anchorR(bB, self.la2x, self.la2y)
	local dX = bB.cx + r2X - bA.cx - r1X
	local dY = bB.cy + r2Y - bA.cy - r1Y
	self.invMassA, self.invMassB, self.invIA, self.invIB = bA.invMass, bB.invMass, bA.invI, bB.invI
	do
		self.axisX = bA.c * self.lxax - bA.s * self.lxay
		self.axisY = bA.s * self.lxax + bA.c * self.lxay
		self.a1 = (dX + r1X) * self.axisY - (dY + r1Y) * self.axisX
		self.a2 = r2X * self.axisY - r2Y * self.axisX
		self.motorMass = self.invMassA + self.invMassB + self.invIA * self.a1 * self.a1 + self.invIB * self.a2 * self.a2
		if self.motorMass > MIN_VALUE then
			self.motorMass = 1 / self.motorMass
		end
	end
	do
		self.perpX = bA.c * self.lyax - bA.s * self.lyay
		self.perpY = bA.s * self.lyax + bA.c * self.lyay
		self.s1 = (dX + r1X) * self.perpY - (dY + r1Y) * self.perpX
		self.s2 = r2X * self.perpY - r2Y * self.perpX
		self:setK(self.invMassA, self.invMassB, self.invIA, self.invIB)
	end
	if self.enableLimit then
		local jointTranslation = self.axisX * dX + self.axisY * dY
		if math.abs(self.upperTranslation - self.lowerTranslation) < 2 * linearSlop then
			self.limitState = EQUAL
		elseif jointTranslation <= self.lowerTranslation then
			if self.limitState ~= AT_LOWER then
				self.limitState = AT_LOWER
				self.iz = 0
			end
		elseif jointTranslation >= self.upperTranslation then
			if self.limitState ~= AT_UPPER then
				self.limitState = AT_UPPER
				self.iz = 0
			end
		else
			self.limitState = INACTIVE
			self.iz = 0
		end
	else
		self.limitState = INACTIVE
	end
	if not self.enableMotor then
		self.motorImpulse = 0
	end
	if step.warmStarting then
		self.ix *= step.dtRatio
		self.iy *= step.dtRatio
		self.motorImpulse *= step.dtRatio
		local PX = self.ix * self.perpX + (self.motorImpulse + self.iz) * self.axisX
		local PY = self.ix * self.perpY + (self.motorImpulse + self.iz) * self.axisY
		local L1 = self.ix * self.s1 + self.iy + (self.motorImpulse + self.iz) * self.a1
		local L2 = self.ix * self.s2 + self.iy + (self.motorImpulse + self.iz) * self.a2
		bA.vx -= self.invMassA * PX
		bA.vy -= self.invMassA * PY
		bA.w -= self.invIA * L1
		bB.vx += self.invMassB * PX
		bB.vy += self.invMassB * PY
		bB.w += self.invIB * L2
	else
		self.ix, self.iy, self.iz = 0, 0, 0
		self.motorImpulse = 0
	end
end

function Prismatic:solveVelocity(step)
	local bA, bB = self.bodyA, self.bodyB
	local v1x, v1y, w1 = bA.vx, bA.vy, bA.w
	local v2x, v2y, w2 = bB.vx, bB.vy, bB.w
	if self.enableMotor and self.limitState ~= EQUAL then
		local Cdot = self.axisX * (v2x - v1x) + self.axisY * (v2y - v1y) + self.a2 * w2 - self.a1 * w1
		local impulse = self.motorMass * (self.motorSpeed - Cdot)
		local oldImpulse = self.motorImpulse
		local maxImpulse = step.dt * self.maxMotorForce
		self.motorImpulse = clamp(self.motorImpulse + impulse, -maxImpulse, maxImpulse)
		impulse = self.motorImpulse - oldImpulse
		local PX, PY = impulse * self.axisX, impulse * self.axisY
		local L1, L2 = impulse * self.a1, impulse * self.a2
		v1x -= self.invMassA * PX
		v1y -= self.invMassA * PY
		w1 -= self.invIA * L1
		v2x += self.invMassB * PX
		v2y += self.invMassB * PY
		w2 += self.invIB * L2
	end
	local Cdot1X = self.perpX * (v2x - v1x) + self.perpY * (v2y - v1y) + self.s2 * w2 - self.s1 * w1
	local Cdot1Y = w2 - w1
	if self.enableLimit and self.limitState ~= INACTIVE then
		local Cdot2 = self.axisX * (v2x - v1x) + self.axisY * (v2y - v1y) + self.a2 * w2 - self.a1 * w1
		local f1x, f1y, f1z = self.ix, self.iy, self.iz
		local dfx, dfy, dfz = solve33(self, -Cdot1X, -Cdot1Y, -Cdot2)
		self.ix += dfx
		self.iy += dfy
		self.iz += dfz
		if self.limitState == AT_LOWER then
			self.iz = math.max(self.iz, 0)
		elseif self.limitState == AT_UPPER then
			self.iz = math.min(self.iz, 0)
		end
		local bX = -Cdot1X - (self.iz - f1z) * self.m13
		local bY = -Cdot1Y - (self.iz - f1z) * self.m23
		local rx, ry = solve22(self, bX, bY)
		rx += f1x
		ry += f1y
		self.ix, self.iy = rx, ry
		dfx, dfy, dfz = self.ix - f1x, self.iy - f1y, self.iz - f1z
		local PX = dfx * self.perpX + dfz * self.axisX
		local PY = dfx * self.perpY + dfz * self.axisY
		local L1 = dfx * self.s1 + dfy + dfz * self.a1
		local L2 = dfx * self.s2 + dfy + dfz * self.a2
		v1x -= self.invMassA * PX
		v1y -= self.invMassA * PY
		w1 -= self.invIA * L1
		v2x += self.invMassB * PX
		v2y += self.invMassB * PY
		w2 += self.invIB * L2
	else
		local dfx, dfy = solve22(self, -Cdot1X, -Cdot1Y)
		self.ix += dfx
		self.iy += dfy
		local PX, PY = dfx * self.perpX, dfx * self.perpY
		local L1 = dfx * self.s1 + dfy
		local L2 = dfx * self.s2 + dfy
		v1x -= self.invMassA * PX
		v1y -= self.invMassA * PY
		w1 -= self.invIA * L1
		v2x += self.invMassB * PX
		v2y += self.invMassB * PY
		w2 += self.invIB * L2
	end
	bA.vx, bA.vy, bA.w = v1x, v1y, w1
	bB.vx, bB.vy, bB.w = v2x, v2y, w2
end

function Prismatic:finalizeVelocity() end

function Prismatic:solvePosition(baumgarte)
	local bA, bB = self.bodyA, self.bodyB
	local a1, a2 = bA.a, bB.a
	local linearError, angularError = 0, 0
	local active = false
	local C2 = 0
	local c1, s1 = math.cos(a1), math.sin(a1)
	local c2, s2 = math.cos(a2), math.sin(a2)
	local rx, ry = self.la1x - self.lcAx, self.la1y - self.lcAy
	local r1X, r1Y = c1 * rx - s1 * ry, s1 * rx + c1 * ry
	rx, ry = self.la2x - self.lcBx, self.la2y - self.lcBy
	local r2X, r2Y = c2 * rx - s2 * ry, s2 * rx + c2 * ry
	local dX = bB.cx + r2X - bA.cx - r1X
	local dY = bB.cy + r2Y - bA.cy - r1Y
	if self.enableLimit then
		self.axisX = c1 * self.lxax - s1 * self.lxay
		self.axisY = s1 * self.lxax + c1 * self.lxay
		self.a1 = (dX + r1X) * self.axisY - (dY + r1Y) * self.axisX
		self.a2 = r2X * self.axisY - r2Y * self.axisX
		local translation = self.axisX * dX + self.axisY * dY
		if math.abs(self.upperTranslation - self.lowerTranslation) < 2 * linearSlop then
			C2 = clamp(translation, -maxLinearCorrection, maxLinearCorrection)
			linearError = math.abs(translation)
			active = true
		elseif translation <= self.lowerTranslation then
			C2 = clamp(translation - self.lowerTranslation + linearSlop, -maxLinearCorrection, 0)
			linearError = self.lowerTranslation - translation
			active = true
		elseif translation >= self.upperTranslation then
			C2 = clamp(translation - self.upperTranslation + linearSlop, 0, maxLinearCorrection)
			linearError = translation - self.upperTranslation
			active = true
		end
	end
	self.perpX = c1 * self.lyax - s1 * self.lyay
	self.perpY = s1 * self.lyax + c1 * self.lyay
	self.s1 = (dX + r1X) * self.perpY - (dY + r1Y) * self.perpX
	self.s2 = r2X * self.perpY - r2Y * self.perpX
	local C1X = self.perpX * dX + self.perpY * dY
	local C1Y = a2 - a1 - self.refAngle
	linearError = math.max(linearError, math.abs(C1X))
	angularError = math.abs(C1Y)
	local ix, iy, iz
	if active then
		self:setK(self.invMassA, self.invMassB, self.invIA, self.invIB)
		ix, iy, iz = solve33(self, -C1X, -C1Y, -C2)
	else
		local m1, m2, i1, i2 = self.invMassA, self.invMassB, self.invIA, self.invIB
		local k11 = m1 + m2 + i1 * self.s1 * self.s1 + i2 * self.s2 * self.s2
		local k12 = i1 * self.s1 + i2 * self.s2
		local k22 = i1 + i2
		self.m11, self.m21, self.m31 = k11, k12, 0
		self.m12, self.m22, self.m32 = k12, k22, 0
		ix, iy = solve22(self, -C1X, -C1Y)
		iz = 0
	end
	local PX = ix * self.perpX + iz * self.axisX
	local PY = ix * self.perpY + iz * self.axisY
	local L1 = ix * self.s1 + iy + iz * self.a1
	local L2 = ix * self.s2 + iy + iz * self.a2
	bA.cx -= self.invMassA * PX
	bA.cy -= self.invMassA * PY
	a1 -= self.invIA * L1
	bB.cx += self.invMassB * PX
	bB.cy += self.invMassB * PY
	a2 += self.invIB * L2
	bA.a = a1
	bB.a = a2
	bA:synchronizeTransform()
	bB:synchronizeTransform()
	return linearError <= linearSlop and angularError <= angularSlop
end

function Prismatic:getReactionForce(inv_dt)
	return inv_dt * (self.ix * self.perpX + (self.motorImpulse + self.iz) * self.axisX),
		inv_dt * (self.ix * self.perpY + (self.motorImpulse + self.iz) * self.axisY)
end

function Prismatic:getJointTranslation()
	local bA, bB = self.bodyA, self.bodyB
	local p1x, p1y = bA:getWorldPoint(self.la1x, self.la1y)
	local p2x, p2y = bB:getWorldPoint(self.la2x, self.la2y)
	local axX, axY = bA:getWorldVector(self.lxax, self.lxay)
	return axX * (p2x - p1x) + axY * (p2y - p1y)
end

function Prismatic:getJointTranslationInverse()
	local bA, bB = self.bodyB, self.bodyA
	local p1x, p1y = bA:getWorldPoint(self.la1x, self.la1y)
	local p2x, p2y = bB:getWorldPoint(self.la2x, self.la2y)
	local axX, axY = bA:getWorldVector(self.lxax, self.lxay)
	return axX * (p2x - p1x) + axY * (p2y - p1y)
end

function Prismatic:setMotorSpeed(speed)
	self.motorSpeed = speed
end

function Prismatic:getMotorSpeed()
	return self.motorSpeed
end

local Distance = {}
Distance.__index = Distance

local function newDistance(def)
	return setmetatable({
		kind = "distance",
		bodyA = def.bodyA, bodyB = def.bodyB, collideConnected = def.collideConnected == true,
		la1x = def.localAnchorA[1], la1y = def.localAnchorA[2],
		la2x = def.localAnchorB[1], la2y = def.localAnchorB[2],
		length = def.length or 1, frequencyHz = def.frequencyHz or 0, dampingRatio = def.dampingRatio or 0,
		impulse = 0, gamma = 0, bias = 0, mass = 0, ux = 0, uy = 0,
	}, Distance)
end

function Distance:initVelocity(step)
	local bA, bB = self.bodyA, self.bodyB
	local r1X, r1Y = anchorR(bA, self.la1x, self.la1y)
	local r2X, r2Y = anchorR(bB, self.la2x, self.la2y)
	self.ux = bB.cx + r2X - bA.cx - r1X
	self.uy = bB.cy + r2Y - bA.cy - r1Y
	local length = math.sqrt(self.ux * self.ux + self.uy * self.uy)
	if length > linearSlop then
		self.ux *= 1 / length
		self.uy *= 1 / length
	else
		self.ux, self.uy = 0, 0
	end
	local cr1u = r1X * self.uy - r1Y * self.ux
	local cr2u = r2X * self.uy - r2Y * self.ux
	local invMass = bA.invMass + bA.invI * cr1u * cr1u + bB.invMass + bB.invI * cr2u * cr2u
	self.mass = invMass ~= 0 and 1 / invMass or 0
	if self.frequencyHz > 0 then
		local C = length - self.length
		local omega = 2 * math.pi * self.frequencyHz
		local d = 2 * self.mass * self.dampingRatio * omega
		local k = self.mass * omega * omega
		self.gamma = step.dt * (d + step.dt * k)
		self.gamma = self.gamma ~= 0 and 1 / self.gamma or 0
		self.bias = C * step.dt * k * self.gamma
		self.mass = invMass + self.gamma
		self.mass = self.mass ~= 0 and 1 / self.mass or 0
	end
	if step.warmStarting then
		self.impulse *= step.dtRatio
		local PX, PY = self.impulse * self.ux, self.impulse * self.uy
		bA.vx -= bA.invMass * PX
		bA.vy -= bA.invMass * PY
		bA.w -= bA.invI * (r1X * PY - r1Y * PX)
		bB.vx += bB.invMass * PX
		bB.vy += bB.invMass * PY
		bB.w += bB.invI * (r2X * PY - r2Y * PX)
	else
		self.impulse = 0
	end
end

function Distance:solveVelocity(step)
	local bA, bB = self.bodyA, self.bodyB
	local r1X, r1Y = anchorR(bA, self.la1x, self.la1y)
	local r2X, r2Y = anchorR(bB, self.la2x, self.la2y)
	local v1X = bA.vx + (-bA.w * r1Y)
	local v1Y = bA.vy + (bA.w * r1X)
	local v2X = bB.vx + (-bB.w * r2Y)
	local v2Y = bB.vy + (bB.w * r2X)
	local Cdot = self.ux * (v2X - v1X) + self.uy * (v2Y - v1Y)
	local impulse = -self.mass * (Cdot + self.bias + self.gamma * self.impulse)
	self.impulse += impulse
	local PX, PY = impulse * self.ux, impulse * self.uy
	bA.vx -= bA.invMass * PX
	bA.vy -= bA.invMass * PY
	bA.w -= bA.invI * (r1X * PY - r1Y * PX)
	bB.vx += bB.invMass * PX
	bB.vy += bB.invMass * PY
	bB.w += bB.invI * (r2X * PY - r2Y * PX)
end

function Distance:finalizeVelocity() end

function Distance:solvePosition(baumgarte)
	if self.frequencyHz > 0 then
		return true
	end
	local bA, bB = self.bodyA, self.bodyB
	local r1X, r1Y = anchorR(bA, self.la1x, self.la1y)
	local r2X, r2Y = anchorR(bB, self.la2x, self.la2y)
	local dX = bB.cx + r2X - bA.cx - r1X
	local dY = bB.cy + r2Y - bA.cy - r1Y
	local length = math.sqrt(dX * dX + dY * dY)
	dX /= length
	dY /= length
	local C = length - self.length
	C = clamp(C, -maxLinearCorrection, maxLinearCorrection)
	local impulse = -self.mass * C
	self.ux, self.uy = dX, dY
	local PX, PY = impulse * self.ux, impulse * self.uy
	bA.cx -= bA.invMass * PX
	bA.cy -= bA.invMass * PY
	bA.a -= bA.invI * (r1X * PY - r1Y * PX)
	bB.cx += bB.invMass * PX
	bB.cy += bB.invMass * PY
	bB.a += bB.invI * (r2X * PY - r2Y * PX)
	bA:synchronizeTransform()
	bB:synchronizeTransform()
	return math.abs(C) < linearSlop
end

function Distance:getReactionForce(inv_dt)
	return inv_dt * self.impulse * self.ux, inv_dt * self.impulse * self.uy
end

local Gear = {}
Gear.__index = Gear

local function newGear(def)
	local j1, j2 = def.joint1, def.joint2
	local self = setmetatable({
		kind = "gear",
		collideConnected = def.collideConnected == true,
		ratio = def.ratio or 1, impulse = 0, mass = 0,
		JlAx = 0, JlAy = 0, JaA = 0, JlBx = 0, JlBy = 0, JaB = 0,
	}, Gear)
	local coordinate1, coordinate2
	self.ground1 = j1.bodyB
	self.bodyA = j1.bodyA
	if j1.kind == "revolute" then
		self.revolute1 = j1
		self.ga1x, self.ga1y = j1.la2x, j1.la2y
		self.la1x, self.la1y = j1.la1x, j1.la1y
		coordinate1 = j1:getJointAngleInverse()
	else
		self.prismatic1 = j1
		self.ga1x, self.ga1y = j1.la2x, j1.la2y
		self.la1x, self.la1y = j1.la1x, j1.la1y
		coordinate1 = j1:getJointTranslationInverse()
	end
	self.ground2 = j2.bodyB
	self.bodyB = j2.bodyA
	if j2.kind == "revolute" then
		self.revolute2 = j2
		self.ga2x, self.ga2y = j2.la2x, j2.la2y
		self.la2x, self.la2y = j2.la1x, j2.la1y
		coordinate2 = j2:getJointAngleInverse()
	else
		self.prismatic2 = j2
		self.ga2x, self.ga2y = j2.la2x, j2.la2y
		self.la2x, self.la2y = j2.la1x, j2.la1y
		coordinate2 = j2:getJointTranslationInverse()
	end
	self.constant = coordinate1 + self.ratio * coordinate2
	return self
end

function Gear:initVelocity(step)
	local g1, g2, bA, bB = self.ground1, self.ground2, self.bodyA, self.bodyB
	local K = 0
	self.JlAx, self.JlAy, self.JaA, self.JlBx, self.JlBy, self.JaB = 0, 0, 0, 0, 0, 0
	if self.revolute1 then
		self.JaA = -1
		K += bA.invI
	else
		local ugX, ugY = g1:getWorldVector(self.prismatic1.lxax, self.prismatic1.lxay)
		local rX, rY = anchorR(bA, self.la1x, self.la1y)
		local crug = rX * ugY - rY * ugX
		self.JlAx, self.JlAy = -ugX, -ugY
		self.JaA = -crug
		K += bA.invMass + bA.invI * crug * crug
	end
	if self.revolute2 then
		self.JaB = -self.ratio
		K += self.ratio * self.ratio * bB.invI
	else
		local ugX, ugY = g2:getWorldVector(self.prismatic2.lxax, self.prismatic2.lxay)
		local rX, rY = anchorR(bB, self.la2x, self.la2y)
		local crug = rX * ugY - rY * ugX
		self.JlBx, self.JlBy = -self.ratio * ugX, -self.ratio * ugY
		self.JaB = -self.ratio * crug
		K += self.ratio * self.ratio * (bB.invMass + bB.invI * crug * crug)
	end
	self.mass = K > 0 and 1 / K or 0
	if step.warmStarting then
		bA.vx += bA.invMass * self.impulse * self.JlAx
		bA.vy += bA.invMass * self.impulse * self.JlAy
		bA.w += bA.invI * self.impulse * self.JaA
		bB.vx += bB.invMass * self.impulse * self.JlBx
		bB.vy += bB.invMass * self.impulse * self.JlBy
		bB.w += bB.invI * self.impulse * self.JaB
	else
		self.impulse = 0
	end
end

function Gear:solveVelocity(step)
	local bA, bB = self.bodyA, self.bodyB
	local Cdot = (self.JlAx * bA.vx + self.JlAy * bA.vy) + self.JaA * bA.w + (self.JlBx * bB.vx + self.JlBy * bB.vy) + self.JaB * bB.w
	local impulse = -self.mass * Cdot
	self.impulse += impulse
	bA.vx += bA.invMass * impulse * self.JlAx
	bA.vy += bA.invMass * impulse * self.JlAy
	bA.w += bA.invI * impulse * self.JaA
	bB.vx += bB.invMass * impulse * self.JlBx
	bB.vy += bB.invMass * impulse * self.JlBy
	bB.w += bB.invI * impulse * self.JaB
end

function Gear:finalizeVelocity() end

function Gear:solvePosition(baumgarte)
	local bA, bB = self.bodyA, self.bodyB
	local coordinate1 = self.revolute1 and self.revolute1:getJointAngleInverse() or self.prismatic1:getJointTranslationInverse()
	local coordinate2 = self.revolute2 and self.revolute2:getJointAngleInverse() or self.prismatic2:getJointTranslationInverse()
	local C = self.constant - (coordinate1 + self.ratio * coordinate2)
	local impulse = -self.mass * C
	bA.cx += bA.invMass * impulse * self.JlAx
	bA.cy += bA.invMass * impulse * self.JlAy
	bA.a += bA.invI * impulse * self.JaA
	bB.cx += bB.invMass * impulse * self.JlBx
	bB.cy += bB.invMass * impulse * self.JlBy
	bB.a += bB.invI * impulse * self.JaB
	bA:synchronizeTransform()
	bB:synchronizeTransform()
	return true -- linearError (always 0) < linearSlop
end

function Gear:getReactionForce(inv_dt)
	return inv_dt * self.impulse * self.JlBx, inv_dt * self.impulse * self.JlBy
end

-- World --------------------------------------------------------------------------------------

local World = {}
World.__index = World
Box2D.World = World

function Box2D.newWorld(gx: number, gy: number)
	local self = setmetatable({
		gx = gx, gy = gy,
		bodyList = nil, bodyCount = 0,
		contactList = nil, contactCount = 0,
		jointList = nil, jointCount = 0,
		proxies = {}, dynamicProxies = {}, proxyCount = 0, moveBuffer = {},
		newFixture = false,
		warmStarting = true,
		continuousPhysics = true,
		inv_dt0 = 0,
		listener = nil,
	}, World)
	self.groundBody = self:createBody({ type = STATIC })
	return self
end

function World:setWarmStarting(flag: boolean)
	self.warmStarting = flag
end

function World:setContactListener(listener)
	self.listener = listener
end

function World:createBody(def)
	local b = newBody(self, def)
	b.prev = nil
	b.next = self.bodyList
	if self.bodyList then
		self.bodyList.prev = b
	end
	self.bodyList = b
	self.bodyCount += 1
	return b
end

-- Puts a static body made for an earlier world into this one, as if made afresh. A static body
-- never moves, so this gives the same result as building it again, for much less work.
function World:adoptBody(b)
	assert(b.type == STATIC)
	b.world = self
	b.contactList, b.jointList = nil, nil
	b.islandFlag = false
	b.t0 = 1
	b.prev = nil
	b.next = self.bodyList
	if self.bodyList then
		self.bodyList.prev = b
	end
	self.bodyList = b
	self.bodyCount += 1
	for i = #b.fixtures, 1, -1 do -- In the order they were made
		local f = b.fixtures[i]
		self.proxyCount += 1
		f.proxyId = self.proxyCount
		table.insert(self.proxies, f)
		table.insert(self.moveBuffer, f)
	end
	self.newFixture = true
	return b
end

-- def.type: "revolute", "prismatic", "distance" or "gear"
function World:createJoint(def)
	local j
	if def.type == "revolute" then
		j = newRevolute(def)
	elseif def.type == "prismatic" then
		j = newPrismatic(def)
	elseif def.type == "distance" then
		j = newDistance(def)
	elseif def.type == "gear" then
		j = newGear(def)
	else
		error("unknown joint " .. tostring(def.type))
	end
	j.userData = def.userData
	j.islandFlag = false
	j.prev = nil
	j.next = self.jointList
	if self.jointList then
		self.jointList.prev = j
	end
	self.jointList = j
	self.jointCount += 1
	local bA, bB = j.bodyA, j.bodyB
	j.edgeA = { joint = j, other = bB, prev = nil, next = bA.jointList }
	if bA.jointList then
		bA.jointList.prev = j.edgeA
	end
	bA.jointList = j.edgeA
	j.edgeB = { joint = j, other = bA, prev = nil, next = bB.jointList }
	if bB.jointList then
		bB.jointList.prev = j.edgeB
	end
	bB.jointList = j.edgeB
	if not def.collideConnected then
		local edge = def.bodyB.contactList
		while edge do
			if edge.other == def.bodyA then
				edge.contact.flags = bit32.bor(edge.contact.flags, C_FILTER)
			end
			edge = edge.next
		end
	end
	return j
end

local function shouldCollideFilter(fA, fB)
	if fA.groupIndex == fB.groupIndex and fA.groupIndex ~= 0 then
		return fA.groupIndex > 0
	end
	return bit32.band(fA.maskBits, fB.categoryBits) ~= 0 and bit32.band(fA.categoryBits, fB.maskBits) ~= 0
end

function World:addPair(fixtureA, fixtureB)
	local bodyA, bodyB = fixtureA.body, fixtureB.body
	if bodyA == bodyB then
		return
	end
	local edge = bodyB.contactList
	while edge do
		if edge.other == bodyA then
			local fA, fB = edge.contact.fixtureA, edge.contact.fixtureB
			if (fA == fixtureA and fB == fixtureB) or (fA == fixtureB and fB == fixtureA) then
				return
			end
		end
		edge = edge.next
	end
	if not bodyB:shouldCollide(bodyA) then
		return
	end
	if not shouldCollideFilter(fixtureA, fixtureB) then
		return
	end
	local c = newContact(fixtureA, fixtureB)
	bodyA, bodyB = c.fixtureA.body, c.fixtureB.body
	c.prev = nil
	c.next = self.contactList
	if self.contactList then
		self.contactList.prev = c
	end
	self.contactList = c
	local nA = c.nodeA
	nA.prev = nil
	nA.next = bodyA.contactList
	if bodyA.contactList then
		bodyA.contactList.prev = nA
	end
	bodyA.contactList = nA
	local nB = c.nodeB
	nB.prev = nil
	nB.next = bodyB.contactList
	if bodyB.contactList then
		bodyB.contactList.prev = nB
	end
	bodyB.contactList = nB
	self.contactCount += 1
end

-- The broad phase: every moved box against every box it overlaps. Two boxes that both belong
-- to bodies that never move can never make a contact, so those pairs are skipped.
function World:findNewContacts()
	local buffer = self.moveBuffer
	if #buffer == 0 then
		return
	end
	self.moveBuffer = {}
	local proxies, dynamicProxies = self.proxies, self.dynamicProxies
	for _, q in buffer do
		-- Only a free-moving body can touch anything, so others need only check those
		for _, other in (q.body.type == DYNAMIC and proxies or dynamicProxies) do
			if other ~= q and fatOverlap(q, other) then
				self:addPair(q, other)
			end
		end
	end
end

function World:destroyContact(c)
	local bodyA, bodyB = c.fixtureA.body, c.fixtureB.body
	if hasFlag(c, C_TOUCHING) and self.listener and self.listener.EndContact then
		self.listener.EndContact(c)
	end
	if c.prev then
		c.prev.next = c.next
	end
	if c.next then
		c.next.prev = c.prev
	end
	if c == self.contactList then
		self.contactList = c.next
	end
	local nA, nB = c.nodeA, c.nodeB
	if nA.prev then
		nA.prev.next = nA.next
	end
	if nA.next then
		nA.next.prev = nA.prev
	end
	if nA == bodyA.contactList then
		bodyA.contactList = nA.next
	end
	if nB.prev then
		nB.prev.next = nB.next
	end
	if nB.next then
		nB.next.prev = nB.prev
	end
	if nB == bodyB.contactList then
		bodyB.contactList = nB.next
	end
	self.contactCount -= 1
end

function World:collide()
	local c = self.contactList
	while c do
		local fA, fB = c.fixtureA, c.fixtureB
		local bA, bB = fA.body, fB.body
		local nextC = c.next
		local destroy = false
		if hasFlag(c, C_FILTER) then
			if not bB:shouldCollide(bA) or not shouldCollideFilter(fA, fB) then
				destroy = true
			else
				c.flags = bit32.band(c.flags, bit32.bnot(C_FILTER))
			end
		end
		if not destroy and not fatOverlap(fA, fB) then
			destroy = true
		end
		if destroy then
			self:destroyContact(c)
		else
			contactUpdate(c, self.listener)
		end
		c = nextC
	end
end

-- Islands
local islandBodies, islandContacts, islandJoints = {}, {}, {}
local islandBodyCount, islandContactCount, islandJointCount = 0, 0, 0

local function islandClear()
	islandBodyCount, islandContactCount, islandJointCount = 0, 0, 0
end

local function islandReport(listener)
	if not listener or not listener.PostSolve then
		return
	end
	for i = 1, islandContactCount do
		local cc = constraints[i]
		local impulse = { normalImpulses = {}, tangentImpulses = {} }
		for j = 1, cc.pointCount do
			impulse.normalImpulses[j] = cc.points[j].normalImpulse
			impulse.tangentImpulses[j] = cc.points[j].tangentImpulse
		end
		listener.PostSolve(islandContacts[i], impulse)
	end
end

local function integratePositions(dt, inv_dt)
	for i = 1, islandBodyCount do
		local b = islandBodies[i]
		if b.type ~= STATIC then
			local tx, ty = dt * b.vx, dt * b.vy
			if tx * tx + ty * ty > maxTranslationSquared then
				local len = math.sqrt(b.vx * b.vx + b.vy * b.vy)
				b.vx, b.vy = b.vx / len, b.vy / len
				b.vx *= maxTranslation * inv_dt
				b.vy *= maxTranslation * inv_dt
			end
			local rotation = dt * b.w
			if rotation * rotation > maxRotationSquared then
				if b.w < 0 then
					b.w = -maxRotation * inv_dt
				else
					b.w = maxRotation * inv_dt
				end
			end
			b.c0x, b.c0y = b.cx, b.cy
			b.a0 = b.a
			b.cx += dt * b.vx
			b.cy += dt * b.vy
			b.a += dt * b.w
			b:synchronizeTransform()
		end
	end
end

function World:islandSolve(step)
	for i = 1, islandBodyCount do
		local b = islandBodies[i]
		if b.type == DYNAMIC then
			b.vx += step.dt * (self.gx + b.invMass * b.fx)
			b.vy += step.dt * (self.gy + b.invMass * b.fy)
			b.w += step.dt * b.invI * b.torque
			local k = clamp(1 - step.dt * b.ld, 0, 1)
			b.vx *= k
			b.vy *= k
			b.w *= clamp(1 - step.dt * b.ad, 0, 1)
		end
	end
	solverInitialize(islandContacts, islandContactCount)
	solverInitVelocity(islandContactCount, step.warmStarting, step.dtRatio)
	for i = 1, islandJointCount do
		islandJoints[i]:initVelocity(step)
	end
	for _ = 1, step.velocityIterations do
		for j = 1, islandJointCount do
			islandJoints[j]:solveVelocity(step)
		end
		solverSolveVelocity(islandContactCount)
	end
	for i = 1, islandJointCount do
		islandJoints[i]:finalizeVelocity()
	end
	solverFinalizeVelocity(islandContactCount)
	integratePositions(step.dt, step.inv_dt)
	for _ = 1, step.positionIterations do
		local contactsOkay = solverSolvePosition(islandContactCount, contactBaumgarte)
		local jointsOkay = true
		for j = 1, islandJointCount do
			local ok = islandJoints[j]:solvePosition(contactBaumgarte)
			jointsOkay = jointsOkay and ok
		end
		if contactsOkay and jointsOkay then
			break
		end
	end
	islandReport(self.listener)
end

function World:islandSolveTOI(subStep)
	solverInitialize(islandContacts, islandContactCount)
	for i = 1, islandJointCount do
		islandJoints[i]:initVelocity(subStep)
	end
	for _ = 1, subStep.velocityIterations do
		solverSolveVelocity(islandContactCount)
		for j = 1, islandJointCount do
			islandJoints[j]:solveVelocity(subStep)
		end
	end
	integratePositions(subStep.dt, subStep.inv_dt)
	for _ = 1, subStep.positionIterations do
		local contactsOkay = solverSolvePosition(islandContactCount, 0.75)
		local jointsOkay = true
		for j = 1, islandJointCount do
			local ok = islandJoints[j]:solvePosition(contactBaumgarte)
			jointsOkay = jointsOkay and ok
		end
		if contactsOkay and jointsOkay then
			break
		end
	end
	islandReport(self.listener)
end

local function usable(c)
	return not hasFlag(c, C_SENSOR) and hasFlag(c, C_ENABLED) and hasFlag(c, C_TOUCHING)
end

function World:solve(step)
	local b = self.bodyList
	while b do
		b.islandFlag = false
		b = b.next
	end
	local c = self.contactList
	while c do
		c.flags = bit32.band(c.flags, bit32.bnot(C_ISLAND))
		c = c.next
	end
	local j = self.jointList
	while j do
		j.islandFlag = false
		j = j.next
	end
	local stack = {}
	local seed = self.bodyList
	while seed do
		if not seed.islandFlag and seed.type ~= STATIC then
			islandClear()
			local stackCount = 1
			stack[1] = seed
			seed.islandFlag = true
			while stackCount > 0 do
				local body = stack[stackCount]
				stackCount -= 1
				islandBodyCount += 1
				islandBodies[islandBodyCount] = body
				if body.type ~= STATIC then
					local ce = body.contactList
					while ce do
						local contact = ce.contact
						if not hasFlag(contact, C_ISLAND) and usable(contact) then
							islandContactCount += 1
							islandContacts[islandContactCount] = contact
							contact.flags = bit32.bor(contact.flags, C_ISLAND)
							local other = ce.other
							if not other.islandFlag then
								stackCount += 1
								stack[stackCount] = other
								other.islandFlag = true
							end
						end
						ce = ce.next
					end
					local jn = body.jointList
					while jn do
						if not jn.joint.islandFlag then
							islandJointCount += 1
							islandJoints[islandJointCount] = jn.joint
							jn.joint.islandFlag = true
							local other = jn.other
							if not other.islandFlag then
								stackCount += 1
								stack[stackCount] = other
								other.islandFlag = true
							end
						end
						jn = jn.next
					end
				end
			end
			self:islandSolve(step)
			for i = 1, islandBodyCount do
				if islandBodies[i].type == STATIC then
					islandBodies[i].islandFlag = false
				end
			end
		end
		seed = seed.next
	end
	b = self.bodyList
	while b do
		if b.type ~= STATIC then
			b:synchronizeFixtures()
		end
		b = b.next
	end
	self:findNewContacts()
end

function World:solveTOI(step)
	local b = self.bodyList
	while b do
		b.islandFlag = false
		b.t0 = 0
		b = b.next
	end
	local c = self.contactList
	while c do
		c.flags = bit32.band(c.flags, bit32.bnot(bit32.bor(C_TOI, C_ISLAND)))
		c = c.next
	end
	local j = self.jointList
	while j do
		j.islandFlag = false
		j = j.next
	end
	local queue = {}
	local loopCount = 0
	while true do
		loopCount += 1
		if loopCount > 100 then
			break -- bonk's guard
		end
		local minContact, minTOI = nil, 1
		c = self.contactList
		while c do
			if not hasFlag(c, C_SENSOR) and hasFlag(c, C_ENABLED) and hasFlag(c, C_CONTINUOUS) then
				local toi = 1
				local skip = false
				if hasFlag(c, C_TOI) then
					toi = c.toi
				else
					local fA, fB = c.fixtureA, c.fixtureB
					local bA, bB = fA.body, fB.body
					if bA.type ~= DYNAMIC and bB.type ~= DYNAMIC then
						skip = true
					else
						local t0 = bA.t0
						if bA.t0 < bB.t0 then
							t0 = bB.t0
							-- Sweep.Advance only (the body keeps its current pose)
							local alpha = (t0 - bA.t0) / (1 - bA.t0)
							if bA.t0 < t0 and 1 - bA.t0 > MIN_VALUE then
								bA.c0x = (1 - alpha) * bA.c0x + alpha * bA.cx
								bA.c0y = (1 - alpha) * bA.c0y + alpha * bA.cy
								bA.a0 = (1 - alpha) * bA.a0 + alpha * bA.a
								bA.t0 = t0
							end
						elseif bB.t0 < bA.t0 then
							t0 = bA.t0
							local alpha = (t0 - bB.t0) / (1 - bB.t0)
							if bB.t0 < t0 and 1 - bB.t0 > MIN_VALUE then
								bB.c0x = (1 - alpha) * bB.c0x + alpha * bB.cx
								bB.c0y = (1 - alpha) * bB.c0y + alpha * bB.cy
								bB.a0 = (1 - alpha) * bB.a0 + alpha * bB.a
								bB.t0 = t0
							end
						end
						local sA, sB = fA.shape, fB.shape
						sA.proxy = sA.proxy or proxyOf(sA)
						sB.proxy = sB.proxy or proxyOf(sB)
						toi = timeOfImpact(sA.proxy, bA, sB.proxy, bB, linearSlop)
						if toi > 0 and toi < 1 then
							toi = (1 - toi) * t0 + toi
							if toi > 1 then
								toi = 1
							end
						end
						c.toi = toi
						c.flags = bit32.bor(c.flags, C_TOI)
					end
				end
				if not skip and MIN_VALUE < toi and toi < minTOI then
					minContact, minTOI = c, toi
				end
			end
			c = c.next
		end
		if minContact == nil or 1 - 100 * MIN_VALUE < minTOI then
			break
		end
		local fA, fB = minContact.fixtureA, minContact.fixtureB
		local bA, bB = fA.body, fB.body
		local backupA = { bA.lcx, bA.lcy, bA.c0x, bA.c0y, bA.cx, bA.cy, bA.a0, bA.a, bA.t0 }
		local backupB = { bB.lcx, bB.lcy, bB.c0x, bB.c0y, bB.cx, bB.cy, bB.a0, bB.a, bB.t0 }
		bA:advance(minTOI)
		bB:advance(minTOI)
		contactUpdate(minContact, self.listener)
		minContact.flags = bit32.band(minContact.flags, bit32.bnot(C_TOI))
		if hasFlag(minContact, C_SENSOR) or not hasFlag(minContact, C_ENABLED) then
			bA.lcx, bA.lcy, bA.c0x, bA.c0y, bA.cx, bA.cy, bA.a0, bA.a, bA.t0 = table.unpack(backupA)
			bB.lcx, bB.lcy, bB.c0x, bB.c0y, bB.cx, bB.cy, bB.a0, bB.a, bB.t0 = table.unpack(backupB)
			bA:synchronizeTransform()
			bB:synchronizeTransform()
			continue
		end
		if not hasFlag(minContact, C_TOUCHING) then
			continue
		end
		local seed = bA
		if seed.type ~= DYNAMIC then
			seed = bB
		end
		islandClear()
		local queueStart, queueSize = 1, 1
		queue[1] = seed
		seed.islandFlag = true
		while queueSize > 0 do
			local body = queue[queueStart]
			queueStart += 1
			queueSize -= 1
			islandBodyCount += 1
			islandBodies[islandBodyCount] = body
			if body.type == DYNAMIC then
				local ce = body.contactList
				while ce do
					if islandContactCount == maxTOIContactsPerIsland then
						break
					end
					local contact = ce.contact
					if not hasFlag(contact, C_ISLAND) and usable(contact) then
						islandContactCount += 1
						islandContacts[islandContactCount] = contact
						contact.flags = bit32.bor(contact.flags, C_ISLAND)
						local other = ce.other
						if not other.islandFlag then
							if other.type ~= STATIC then
								other:advance(minTOI)
							end
							queue[queueStart + queueSize] = other
							queueSize += 1
							other.islandFlag = true
						end
					end
					ce = ce.next
				end
				local jEdge = body.jointList
				while jEdge do
					if islandJointCount ~= maxTOIJointsPerIsland and not jEdge.joint.islandFlag then
						local other = jEdge.other
						islandJointCount += 1
						islandJoints[islandJointCount] = jEdge.joint
						jEdge.joint.islandFlag = true
						if not other.islandFlag then
							if other.type ~= STATIC then
								other:advance(minTOI)
							end
							queue[queueStart + queueSize] = other
							queueSize += 1
							other.islandFlag = true
						end
					end
					jEdge = jEdge.next
				end
			end
		end
		local subDt = (1 - minTOI) * step.dt
		local subStep = {
			warmStarting = false, dt = subDt, inv_dt = 1 / subDt, dtRatio = 0,
			velocityIterations = step.velocityIterations, positionIterations = step.positionIterations,
		}
		self:islandSolveTOI(subStep)
		for i = 1, islandBodyCount do
			local body = islandBodies[i]
			body.islandFlag = false
			if body.type == DYNAMIC then
				body:synchronizeFixtures()
				local ce = body.contactList
				while ce do
					ce.contact.flags = bit32.band(ce.contact.flags, bit32.bnot(C_TOI))
					ce = ce.next
				end
			end
		end
		for i = 1, islandContactCount do
			local contact = islandContacts[i]
			contact.flags = bit32.band(contact.flags, bit32.bnot(bit32.bor(C_TOI, C_ISLAND)))
		end
		for i = 1, islandJointCount do
			islandJoints[i].islandFlag = false
		end
		self:findNewContacts()
	end
end

function World:step(dt: number, velocityIterations: number, positionIterations: number)
	if self.newFixture then
		self:findNewContacts()
		self.newFixture = false
	end
	local step = {
		dt = dt, velocityIterations = velocityIterations, positionIterations = positionIterations,
		inv_dt = dt > 0 and 1 / dt or 0,
		dtRatio = self.inv_dt0 * dt,
		warmStarting = self.warmStarting,
	}
	self:collide()
	if dt > 0 then
		self:solve(step)
	end
	if self.continuousPhysics and dt > 0 then
		self:solveTOI(step)
	end
	if dt > 0 then
		self.inv_dt0 = step.inv_dt
	end
end

function World:clearForces()
	local b = self.bodyList
	while b do
		b.fx, b.fy, b.torque = 0, 0, 0
		b = b.next
	end
end

-- Calls callback(fixture, px, py, nx, ny, fraction) for each fixture the segment hits; the
-- callback returns 0 to stop, -1 to ignore the fixture, or a fraction (bonk only uses 0 and -1).
function World:rayCast(callback, p1x: number, p1y: number, p2x: number, p2y: number)
	local lx, ly = math.min(p1x, p2x), math.min(p1y, p2y)
	local ux, uy = math.max(p1x, p2x), math.max(p1y, p2y)
	for _, f in self.proxies do
		if not (lx - f.fux > 0 or ly - f.fuy > 0 or f.flx - ux > 0 or f.fly - uy > 0) then
			local b = f.body
			local fraction, nx, ny = rayCastShape(f.shape, p1x, p1y, p2x, p2y, 1, b.x, b.y, b.c, b.s)
			if fraction then
				local px = (1 - fraction) * p1x + fraction * p2x
				local py = (1 - fraction) * p1y + fraction * p2y
				if callback(f, px, py, nx, ny, fraction) == 0 then
					return
				end
			end
		end
	end
end

-- Every contact, newest first, as Box2D lists them
function World:contacts()
	local list = {}
	local c = self.contactList
	while c do
		table.insert(list, c)
		c = c.next
	end
	return list
end

Box2D.shouldCollideFilter = shouldCollideFilter
Box2D.timeOfImpact = timeOfImpact
Box2D.proxyOf = proxyOf

return Box2D
