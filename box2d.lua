-- oak build --lua
-- Magnolia/Oak to Lua transpiled bundle

local __Oak_Modules = {}
local __Oak_Import_Aliases = nil

local function __oak_eq(a, b)
  if type(a) ~= type(b) then return false end
  if type(a) == "table" then
    for k, v in pairs(a) do
      if not __oak_eq(v, b[k]) then return false end
    end
    for k, v in pairs(b) do
      if a[k] == nil then return false end
    end
    return true
  end
  return a == b
end

local function __oak_push(tbl, val)
  tbl[#tbl + 1] = val
  return tbl
end

local function __oak_acc(obj, key)
  if obj == nil then return nil end
  return obj[key]
end

local function __as_oak_string(v)
  if type(v) == "number" then return v end
  if v == nil then return "" end
  return tostring(v)
end

local function __oak_and(a, b)
  if a == false then return false end
  return b
end

local function __oak_or(a, b)
  if a == true then return true end
  return b
end

local function __oak_xor(a, b)
  if type(a) == "boolean" and type(b) == "boolean" then
    return a ~= b
  end
  return a ~ b
end

local function __oak_modularize(name, factory)
  __Oak_Modules[name] = factory
end

local function __oak_module_import(name)
  local m = __Oak_Modules[name]
  if m == nil then
    if __Oak_Import_Aliases and __Oak_Import_Aliases[name] then
      m = __Oak_Modules[__Oak_Import_Aliases[name]]
    end
  end
  if m == nil then return nil end
  if type(m) == "function" then
    local result = m()
    __Oak_Modules[name] = result
    return result
  end
  return m
end

(function()
__oak_modularize('/home/user/box2d-lua/oak/box2d.oak', function()
__Number = {["MAX_VALUE"]=nil, ["MIN_VALUE"]=nil, ["POSITIVE_INFINITY"]=nil, ["NEGATIVE_INFINITY"]=nil, ["NaN"]=0};
__isNaN = function(x)
return false
end;
__isFinite = function(x)
return true
end;
__Error = function(x)
return nil
end;
__throw = function(x)
return nil
end;
__apply = function(f, thisArg, arr)
return nil
end;
__in = function(k, obj)
return false
end;
Box2D = {};
Box2D["Collision"] = {};
Box2D["Collision"]["Shapes"] = {};
Box2D["Common"] = {};
Box2D["Common"]["Math"] = {};
Box2D["Dynamics"] = {};
Box2D["Dynamics"]["Contacts"] = {};
Box2D["Dynamics"]["Controllers"] = {};
Box2D["Dynamics"]["Joints"] = {};
Vector = __Array;
Vector_a2j_Number = __newArray;
__proto_b2CircleShape = {};
__proto_b2CircleShape["Copy"] = function(self)
local __f1_s = b2CircleShape();
__f1_s["Set"](__f1_s, self);
return __f1_s
end;
__proto_b2CircleShape["Set"] = function(self, __f2_other)
self["__super"]["Set"](self, __f2_other);
return (function()
local __oak_cond = __truthy(__instanceof(__f2_other, 'b2CircleShape'))
if __oak_eq(__oak_cond, true) then return (function()
local __f2_other2 = (function()
local __oak_cond = __truthy(__instanceof(__f2_other, 'b2CircleShape'))
if __oak_eq(__oak_cond, true) then return __f2_other
else return nil
end
end)()
;
return self["m_p"]["SetV"](self["m_p"], __f2_other2["m_p"])
end)()

else return __noop()
end
end)()

end;
__proto_b2CircleShape["TestPoint"] = function(self, __f3_transform, __f3_p)
local __f3_tMat = __f3_transform["R"];
local __f3_dX = __add(__f3_transform["position"]["x"], __add((function()
return (__f3_tMat["col1"]["x"] * self["m_p"]["x"])
end)()
, (function()
return (__f3_tMat["col2"]["x"] * self["m_p"]["y"])
end)()
));
local __f3_dY = __add(__f3_transform["position"]["y"], __add((function()
return (__f3_tMat["col1"]["y"] * self["m_p"]["x"])
end)()
, (function()
return (__f3_tMat["col2"]["y"] * self["m_p"]["y"])
end)()
));
__f3_dX = (function()
return (__f3_p["x"] - __f3_dX)
end)()
;
__f3_dY = (function()
return (__f3_p["y"] - __f3_dY)
end)()
;
return (function()
return (__add((function()
return (__f3_dX * __f3_dX)
end)()
, (function()
return (__f3_dY * __f3_dY)
end)()
) <= (function()
return (self["m_radius"] * self["m_radius"])
end)()
)
end)()

end;
__proto_b2CircleShape["RayCast"] = function(self, __f4_output, __f4_input, __f4_transform)
local __f4_tMat = __f4_transform["R"];
local __f4_positionX = __add(__f4_transform["position"]["x"], __add((function()
return (__f4_tMat["col1"]["x"] * self["m_p"]["x"])
end)()
, (function()
return (__f4_tMat["col2"]["x"] * self["m_p"]["y"])
end)()
));
local __f4_positionY = __add(__f4_transform["position"]["y"], __add((function()
return (__f4_tMat["col1"]["y"] * self["m_p"]["x"])
end)()
, (function()
return (__f4_tMat["col2"]["y"] * self["m_p"]["y"])
end)()
));
local __f4_sX = (function()
return (__f4_input["p1"]["x"] - __f4_positionX)
end)()
;
local __f4_sY = (function()
return (__f4_input["p1"]["y"] - __f4_positionY)
end)()
;
local __f4_b = (function()
return (__add((function()
return (__f4_sX * __f4_sX)
end)()
, (function()
return (__f4_sY * __f4_sY)
end)()
) - (function()
return (self["m_radius"] * self["m_radius"])
end)()
)
end)()
;
local __f4_rX = (function()
return (__f4_input["p2"]["x"] - __f4_input["p1"]["x"])
end)()
;
local __f4_rY = (function()
return (__f4_input["p2"]["y"] - __f4_input["p1"]["y"])
end)()
;
local __f4_c = __add((function()
return (__f4_sX * __f4_rX)
end)()
, (function()
return (__f4_sY * __f4_rY)
end)()
);
local __f4_rr = __add((function()
return (__f4_rX * __f4_rX)
end)()
, (function()
return (__f4_rY * __f4_rY)
end)()
);
local __f4_sigma = (function()
return ((function()
return (__f4_c * __f4_c)
end)()
 - (function()
return (__f4_rr * __f4_b)
end)()
)
end)()
;
(function()
local __oak_cond = __truthy(__or((function()
return (__f4_sigma < 0)
end)()
, (function()
return (__f4_rr < __Number["MIN_VALUE"])
end)()
))
if __oak_eq(__oak_cond, true) then return false
else return __noop()
end
end)()
;
local __f4_a = (function()
return (-__add(__f4_c, __Math["sqrt"](__f4_sigma)))
end)()
;
(function()
local __oak_cond = __truthy(__and((function()
return (0 <= __f4_a)
end)()
, (function()
return (__f4_a <= (function()
return (__f4_input["maxFraction"] * __f4_rr)
end)()
)
end)()
))
if __oak_eq(__oak_cond, true) then return (function()
__f4_a = (function()
return (__f4_a / __f4_rr)
end)()
;
__f4_output["fraction"] = __f4_a;
__f4_output["normal"]["x"] = __add(__f4_sX, (function()
return (__f4_a * __f4_rX)
end)()
);
__f4_output["normal"]["y"] = __add(__f4_sY, (function()
return (__f4_a * __f4_rY)
end)()
);
__f4_output["normal"]["Normalize"](__f4_output["normal"]);
return true
end)()

else return __noop()
end
end)()
;
return false
end;
__proto_b2CircleShape["ComputeAABB"] = function(self, __f5_aabb, __f5_transform)
local __f5_tMat = __f5_transform["R"];
local __f5_pX = __add(__f5_transform["position"]["x"], __add((function()
return (__f5_tMat["col1"]["x"] * self["m_p"]["x"])
end)()
, (function()
return (__f5_tMat["col2"]["x"] * self["m_p"]["y"])
end)()
));
local __f5_pY = __add(__f5_transform["position"]["y"], __add((function()
return (__f5_tMat["col1"]["y"] * self["m_p"]["x"])
end)()
, (function()
return (__f5_tMat["col2"]["y"] * self["m_p"]["y"])
end)()
));
__f5_aabb["lowerBound"]["Set"](__f5_aabb["lowerBound"], (function()
return (__f5_pX - self["m_radius"])
end)()
, (function()
return (__f5_pY - self["m_radius"])
end)()
);
return __f5_aabb["upperBound"]["Set"](__f5_aabb["upperBound"], __add(__f5_pX, self["m_radius"]), __add(__f5_pY, self["m_radius"]))
end;
__proto_b2CircleShape["ComputeMass"] = function(self, __f6_massData, __f6_density)
(function()
local __oak_cond = __truthy((function()
return __oak_eq(__f6_density, nil)
end)()
)
if __oak_eq(__oak_cond, true) then __f6_density = 0
return __f6_density
else return __noop()
end
end)()
;
__f6_massData["mass"] = (function()
return ((function()
return ((function()
return (__f6_density * __static_b2Settings["b2_pi"])
end)()
 * self["m_radius"])
end)()
 * self["m_radius"])
end)()
;
__f6_massData["center"]["SetV"](__f6_massData["center"], self["m_p"]);
__f6_massData["I"] = (function()
return (__f6_massData["mass"] * __add((function()
return ((function()
return (0.5 * self["m_radius"])
end)()
 * self["m_radius"])
end)()
, __add((function()
return (self["m_p"]["x"] * self["m_p"]["x"])
end)()
, (function()
return (self["m_p"]["y"] * self["m_p"]["y"])
end)()
)))
end)()

return __f6_massData["I"]
end;
__proto_b2CircleShape["ComputeSubmergedArea"] = function(self, __f7_normal, __f7_offset, __f7_xf, __f7_c)
(function()
local __oak_cond = __truthy((function()
return __oak_eq(__f7_offset, nil)
end)()
)
if __oak_eq(__oak_cond, true) then __f7_offset = 0
return __f7_offset
else return __noop()
end
end)()
;
local __f7_p = __static_b2Math["MulX"](__f7_xf, self["m_p"]);
local __f7_l = (function()
return (-(function()
return (__static_b2Math["Dot"](__f7_normal, __f7_p) - __f7_offset)
end)()
)
end)()
;
(function()
local __oak_cond = __truthy((function()
return (__f7_l < __add((function()
return (-self["m_radius"])
end)()
, __Number["MIN_VALUE"]))
end)()
)
if __oak_eq(__oak_cond, true) then return 0
else return __noop()
end
end)()
;
(function()
local __oak_cond = __truthy((function()
return (__f7_l > self["m_radius"])
end)()
)
if __oak_eq(__oak_cond, true) then return (function()
__f7_c["SetV"](__f7_c, __f7_p);
return (function()
return ((function()
return (__Math["PI"] * self["m_radius"])
end)()
 * self["m_radius"])
end)()

end)()

else return __noop()
end
end)()
;
local __f7_r2 = (function()
return (self["m_radius"] * self["m_radius"])
end)()
;
local __f7_l2 = (function()
return (__f7_l * __f7_l)
end)()
;
local __f7_area = __add((function()
return (__f7_r2 * __add(__Math["asin"]((function()
return (__f7_l / self["m_radius"])
end)()
), (function()
return (__Math["PI"] / 2)
end)()
))
end)()
, (function()
return (__f7_l * __Math["sqrt"]((function()
return (__f7_r2 - __f7_l2)
end)()
))
end)()
);
local __f7_com = (function()
return ((function()
return ((function()
return ((function()
return (-2)
end)()
 / 3)
end)()
 * __Math["pow"]((function()
return (__f7_r2 - __f7_l2)
end)()
, 1.5))
end)()
 / __f7_area)
end)()
;
__f7_c["x"] = __add(__f7_p["x"], (function()
return (__f7_normal["x"] * __f7_com)
end)()
);
__f7_c["y"] = __add(__f7_p["y"], (function()
return (__f7_normal["y"] * __f7_com)
end)()
);
return __f7_area
end;
__proto_b2CircleShape["GetLocalPosition"] = function(self)
return self["m_p"]
end;
__proto_b2CircleShape["SetLocalPosition"] = function(self, __f9_position)
return self["m_p"]["SetV"](self["m_p"], __f9_position)
end;
__proto_b2CircleShape["GetRadius"] = function(self)
return self["m_radius"]
end;
__proto_b2CircleShape["SetRadius"] = function(self, __f11_radius)
(function()
local __oak_cond = __truthy((function()
return __oak_eq(__f11_radius, nil)
end)()
)
if __oak_eq(__oak_cond, true) then __f11_radius = 0
return __f11_radius
else return __noop()
end
end)()
;
self["m_radius"] = __f11_radius
return self["m_radius"]
end;
__static_b2CircleShape = {};
b2CircleShape = function()
local self = b2Shape();
self["__type"] = 'b2CircleShape';
self["__types"] = {'b2CircleShape', 'b2Shape'};
self["__super"] = __proto_b2Shape;
self["Copy"] = __proto_b2CircleShape["Copy"];
self["Set"] = __proto_b2CircleShape["Set"];
self["TestPoint"] = __proto_b2CircleShape["TestPoint"];
self["RayCast"] = __proto_b2CircleShape["RayCast"];
self["ComputeAABB"] = __proto_b2CircleShape["ComputeAABB"];
self["ComputeMass"] = __proto_b2CircleShape["ComputeMass"];
self["ComputeSubmergedArea"] = __proto_b2CircleShape["ComputeSubmergedArea"];
self["GetLocalPosition"] = __proto_b2CircleShape["GetLocalPosition"];
self["SetLocalPosition"] = __proto_b2CircleShape["SetLocalPosition"];
self["GetRadius"] = __proto_b2CircleShape["GetRadius"];
self["SetRadius"] = __proto_b2CircleShape["SetRadius"];
(function()
Box2D["Collision"]["Shapes"]["b2Shape"]["b2Shape"](self);
self["m_p"] = b2Vec2();
(function()
local __oak_cond = __truthy((function()
return __oak_eq(radius, nil)
end)()
)
if __oak_eq(__oak_cond, true) then local __f12_radius = 0
return __f12_radius
else return __noop()
end
end)()
;
self["__super"]["b2Shape"](self);
self["m_type"] = __static_b2Shape["e_circleShape"];
self["m_radius"] = __f12_radius
return self["m_radius"]
end)()
;
return self
end;
Box2D["Collision"]["Shapes"]["b2CircleShape"] = b2CircleShape;
__proto_b2EdgeShape = {};
__proto_b2EdgeShape["TestPoint"] = function(self, __f13_transform, __f13_p)
return false
end;
__proto_b2EdgeShape["RayCast"] = function(self, __f14_output, __f14_input, __f14_transform)
local __f14_tMat = __noop();
local __f14_rX = (function()
return (__f14_input["p2"]["x"] - __f14_input["p1"]["x"])
end)()
;
local __f14_rY = (function()
return (__f14_input["p2"]["y"] - __f14_input["p1"]["y"])
end)()
;
__f14_tMat = __f14_transform["R"];
local __f14_v1X = __add(__f14_transform["position"]["x"], __add((function()
return (__f14_tMat["col1"]["x"] * self["m_v1"]["x"])
end)()
, (function()
return (__f14_tMat["col2"]["x"] * self["m_v1"]["y"])
end)()
));
local __f14_v1Y = __add(__f14_transform["position"]["y"], __add((function()
return (__f14_tMat["col1"]["y"] * self["m_v1"]["x"])
end)()
, (function()
return (__f14_tMat["col2"]["y"] * self["m_v1"]["y"])
end)()
));
local __f14_nX = (function()
return (__add(__f14_transform["position"]["y"], __add((function()
return (__f14_tMat["col1"]["y"] * self["m_v2"]["x"])
end)()
, (function()
return (__f14_tMat["col2"]["y"] * self["m_v2"]["y"])
end)()
)) - __f14_v1Y)
end)()
;
local __f14_nY = (function()
return (-(function()
return (__add(__f14_transform["position"]["x"], __add((function()
return (__f14_tMat["col1"]["x"] * self["m_v2"]["x"])
end)()
, (function()
return (__f14_tMat["col2"]["x"] * self["m_v2"]["y"])
end)()
)) - __f14_v1X)
end)()
)
end)()
;
local __f14_k_slop = (function()
return (100 * __Number["MIN_VALUE"])
end)()
;
local __f14_denom = (function()
return (-__add((function()
return (__f14_rX * __f14_nX)
end)()
, (function()
return (__f14_rY * __f14_nY)
end)()
))
end)()
;
(function()
local __oak_cond = __truthy((function()
return (__f14_denom > __f14_k_slop)
end)()
)
if __oak_eq(__oak_cond, true) then return (function()
local __f14_bX = (function()
return (__f14_input["p1"]["x"] - __f14_v1X)
end)()
;
local __f14_bY = (function()
return (__f14_input["p1"]["y"] - __f14_v1Y)
end)()
;
local __f14_a = __add((function()
return (__f14_bX * __f14_nX)
end)()
, (function()
return (__f14_bY * __f14_nY)
end)()
);
return (function()
local __oak_cond = __truthy(__and((function()
return (0 <= __f14_a)
end)()
, (function()
return (__f14_a <= (function()
return (__f14_input["maxFraction"] * __f14_denom)
end)()
)
end)()
))
if __oak_eq(__oak_cond, true) then return (function()
local __f14_mu2 = __add((function()
return ((function()
return (-__f14_rX)
end)()
 * __f14_bY)
end)()
, (function()
return (__f14_rY * __f14_bX)
end)()
);
return (function()
local __oak_cond = __truthy(__and((function()
return ((function()
return ((function()
return (-__f14_k_slop)
end)()
 * __f14_denom)
end)()
 <= __f14_mu2)
end)()
, (function()
return (__f14_mu2 <= (function()
return (__f14_denom * __add(1, __f14_k_slop))
end)()
)
end)()
))
if __oak_eq(__oak_cond, true) then return (function()
__f14_a = (function()
return (__f14_a / __f14_denom)
end)()
;
__f14_output["fraction"] = __f14_a;
local __f14_nLen = __Math["sqrt"](__add((function()
return (__f14_nX * __f14_nX)
end)()
, (function()
return (__f14_nY * __f14_nY)
end)()
));
__f14_output["normal"]["x"] = (function()
return (__f14_nX / __f14_nLen)
end)()
;
__f14_output["normal"]["y"] = (function()
return (__f14_nY / __f14_nLen)
end)()
;
return true
end)()

else return __noop()
end
end)()

end)()

else return __noop()
end
end)()

end)()

else return __noop()
end
end)()
;
return false
end;
__proto_b2EdgeShape["ComputeAABB"] = function(self, __f15_aabb, __f15_transform)
local __f15_tMat = __f15_transform["R"];
local __f15_v1X = __add(__f15_transform["position"]["x"], __add((function()
return (__f15_tMat["col1"]["x"] * self["m_v1"]["x"])
end)()
, (function()
return (__f15_tMat["col2"]["x"] * self["m_v1"]["y"])
end)()
));
local __f15_v1Y = __add(__f15_transform["position"]["y"], __add((function()
return (__f15_tMat["col1"]["y"] * self["m_v1"]["x"])
end)()
, (function()
return (__f15_tMat["col2"]["y"] * self["m_v1"]["y"])
end)()
));
local __f15_v2X = __add(__f15_transform["position"]["x"], __add((function()
return (__f15_tMat["col1"]["x"] * self["m_v2"]["x"])
end)()
, (function()
return (__f15_tMat["col2"]["x"] * self["m_v2"]["y"])
end)()
));
local __f15_v2Y = __add(__f15_transform["position"]["y"], __add((function()
return (__f15_tMat["col1"]["y"] * self["m_v2"]["x"])
end)()
, (function()
return (__f15_tMat["col2"]["y"] * self["m_v2"]["y"])
end)()
));
(function()
local __oak_cond = __truthy((function()
return (__f15_v1X < __f15_v2X)
end)()
)
if __oak_eq(__oak_cond, true) then return (function()
__f15_aabb["lowerBound"]["x"] = __f15_v1X;
__f15_aabb["upperBound"]["x"] = __f15_v2X
return __f15_aabb["upperBound"]["x"]
end)()

else return (function()
__f15_aabb["lowerBound"]["x"] = __f15_v2X;
__f15_aabb["upperBound"]["x"] = __f15_v1X
return __f15_aabb["upperBound"]["x"]
end)()

end
end)()
;
return (function()
local __oak_cond = __truthy((function()
return (__f15_v1Y < __f15_v2Y)
end)()
)
if __oak_eq(__oak_cond, true) then return (function()
__f15_aabb["lowerBound"]["y"] = __f15_v1Y;
__f15_aabb["upperBound"]["y"] = __f15_v2Y
return __f15_aabb["upperBound"]["y"]
end)()

else return (function()
__f15_aabb["lowerBound"]["y"] = __f15_v2Y;
__f15_aabb["upperBound"]["y"] = __f15_v1Y
return __f15_aabb["upperBound"]["y"]
end)()

end
end)()

end;
__proto_b2EdgeShape["ComputeMass"] = function(self, __f16_massData, __f16_density)
(function()
local __oak_cond = __truthy((function()
return __oak_eq(__f16_density, nil)
end)()
)
if __oak_eq(__oak_cond, true) then __f16_density = 0
return __f16_density
else return __noop()
end
end)()
;
__f16_massData["mass"] = 0;
__f16_massData["center"]["SetV"](__f16_massData["center"], self["m_v1"]);
__f16_massData["I"] = 0
return __f16_massData["I"]
end;
__proto_b2EdgeShape["ComputeSubmergedArea"] = function(self, __f17_normal, __f17_offset, __f17_xf, __f17_c)
(function()
local __oak_cond = __truthy((function()
return __oak_eq(__f17_offset, nil)
end)()
)
if __oak_eq(__oak_cond, true) then __f17_offset = 0
return __f17_offset
else return __noop()
end
end)()
;
local __f17_v0 = b2Vec2((function()
return (__f17_normal["x"] * __f17_offset)
end)()
, (function()
return (__f17_normal["y"] * __f17_offset)
end)()
);
local __f17_v1 = __static_b2Math["MulX"](__f17_xf, self["m_v1"]);
local __f17_v2 = __static_b2Math["MulX"](__f17_xf, self["m_v2"]);
local __f17_d1 = (function()
return (__static_b2Math["Dot"](__f17_normal, __f17_v1) - __f17_offset)
end)()
;
local __f17_d2 = (function()
return (__static_b2Math["Dot"](__f17_normal, __f17_v2) - __f17_offset)
end)()
;
(function()
local __oak_cond = __truthy((function()
return (__f17_d1 > 0)
end)()
)
if __oak_eq(__oak_cond, true) then return (function()
local __oak_cond = __truthy((function()
return (__f17_d2 > 0)
end)()
)
if __oak_eq(__oak_cond, true) then return 0
else return (function()
__f17_v1["x"] = __add((function()
return ((function()
return ((function()
return (-__f17_d2)
end)()
 / (function()
return (__f17_d1 - __f17_d2)
end)()
)
end)()
 * __f17_v1["x"])
end)()
, (function()
return ((function()
return (__f17_d1 / (function()
return (__f17_d1 - __f17_d2)
end)()
)
end)()
 * __f17_v2["x"])
end)()
);
__f17_v1["y"] = __add((function()
return ((function()
return ((function()
return (-__f17_d2)
end)()
 / (function()
return (__f17_d1 - __f17_d2)
end)()
)
end)()
 * __f17_v1["y"])
end)()
, (function()
return ((function()
return (__f17_d1 / (function()
return (__f17_d1 - __f17_d2)
end)()
)
end)()
 * __f17_v2["y"])
end)()
)
return __f17_v1["y"]
end)()

end
end)()

else return (function()
local __oak_cond = __truthy((function()
return (__f17_d2 > 0)
end)()
)
if __oak_eq(__oak_cond, true) then return (function()
__f17_v2["x"] = __add((function()
return ((function()
return ((function()
return (-__f17_d2)
end)()
 / (function()
return (__f17_d1 - __f17_d2)
end)()
)
end)()
 * __f17_v1["x"])
end)()
, (function()
return ((function()
return (__f17_d1 / (function()
return (__f17_d1 - __f17_d2)
end)()
)
end)()
 * __f17_v2["x"])
end)()
);
__f17_v2["y"] = __add((function()
return ((function()
return ((function()
return (-__f17_d2)
end)()
 / (function()
return (__f17_d1 - __f17_d2)
end)()
)
end)()
 * __f17_v1["y"])
end)()
, (function()
return ((function()
return (__f17_d1 / (function()
return (__f17_d1 - __f17_d2)
end)()
)
end)()
 * __f17_v2["y"])
end)()
)
return __f17_v2["y"]
end)()

else return nil
end
end)()

end
end)()
;
__f17_c["x"] = (function()
return (__add(__add(__f17_v0["x"], __f17_v1["x"]), __f17_v2["x"]) / 3)
end)()
;
__f17_c["y"] = (function()
return (__add(__add(__f17_v0["y"], __f17_v1["y"]), __f17_v2["y"]) / 3)
end)()
;
return (function()
return (0.5 * (function()
return ((function()
return ((function()
return (__f17_v1["x"] - __f17_v0["x"])
end)()
 * (function()
return (__f17_v2["y"] - __f17_v0["y"])
end)()
)
end)()
 - (function()
return ((function()
return (__f17_v1["y"] - __f17_v0["y"])
end)()
 * (function()
return (__f17_v2["x"] - __f17_v0["x"])
end)()
)
end)()
)
end)()
)
end)()

end;
__proto_b2EdgeShape["GetLength"] = function(self)
return self["m_length"]
end;
__proto_b2EdgeShape["GetVertex1"] = function(self)
return self["m_v1"]
end;
__proto_b2EdgeShape["GetVertex2"] = function(self)
return self["m_v2"]
end;
__proto_b2EdgeShape["GetCoreVertex1"] = function(self)
return self["m_coreV1"]
end;
__proto_b2EdgeShape["GetCoreVertex2"] = function(self)
return self["m_coreV2"]
end;
__proto_b2EdgeShape["GetNormalVector"] = function(self)
return self["m_normal"]
end;
__proto_b2EdgeShape["GetDirectionVector"] = function(self)
return self["m_direction"]
end;
__proto_b2EdgeShape["GetCorner1Vector"] = function(self)
return self["m_cornerDir1"]
end;
__proto_b2EdgeShape["GetCorner2Vector"] = function(self)
return self["m_cornerDir2"]
end;
__proto_b2EdgeShape["Corner1IsConvex"] = function(self)
return self["m_cornerConvex1"]
end;
__proto_b2EdgeShape["Corner2IsConvex"] = function(self)
return self["m_cornerConvex2"]
end;
__proto_b2EdgeShape["GetFirstVertex"] = function(self, __f29_xf)
local __f29_tMat = __f29_xf["R"];
return b2Vec2(__add(__f29_xf["position"]["x"], __add((function()
return (__f29_tMat["col1"]["x"] * self["m_coreV1"]["x"])
end)()
, (function()
return (__f29_tMat["col2"]["x"] * self["m_coreV1"]["y"])
end)()
)), __add(__f29_xf["position"]["y"], __add((function()
return (__f29_tMat["col1"]["y"] * self["m_coreV1"]["x"])
end)()
, (function()
return (__f29_tMat["col2"]["y"] * self["m_coreV1"]["y"])
end)()
)))
end;
__proto_b2EdgeShape["GetNextEdge"] = function(self)
return self["m_nextEdge"]
end;
__proto_b2EdgeShape["GetPrevEdge"] = function(self)
return self["m_prevEdge"]
end;
__proto_b2EdgeShape["Support"] = function(self, __f32_xf, __f32_dX, __f32_dY)
(function()
local __oak_cond = __truthy((function()
return __oak_eq(__f32_dX, nil)
end)()
)
if __oak_eq(__oak_cond, true) then __f32_dX = 0
return __f32_dX
else return __noop()
end
end)()
;
(function()
local __oak_cond = __truthy((function()
return __oak_eq(__f32_dY, nil)
end)()
)
if __oak_eq(__oak_cond, true) then __f32_dY = 0
return __f32_dY
else return __noop()
end
end)()
;
local __f32_tMat = __f32_xf["R"];
local __f32_v1X = __add(__f32_xf["position"]["x"], __add((function()
return (__f32_tMat["col1"]["x"] * self["m_coreV1"]["x"])
end)()
, (function()
return (__f32_tMat["col2"]["x"] * self["m_coreV1"]["y"])
end)()
));
local __f32_v1Y = __add(__f32_xf["position"]["y"], __add((function()
return (__f32_tMat["col1"]["y"] * self["m_coreV1"]["x"])
end)()
, (function()
return (__f32_tMat["col2"]["y"] * self["m_coreV1"]["y"])
end)()
));
local __f32_v2X = __add(__f32_xf["position"]["x"], __add((function()
return (__f32_tMat["col1"]["x"] * self["m_coreV2"]["x"])
end)()
, (function()
return (__f32_tMat["col2"]["x"] * self["m_coreV2"]["y"])
end)()
));
local __f32_v2Y = __add(__f32_xf["position"]["y"], __add((function()
return (__f32_tMat["col1"]["y"] * self["m_coreV2"]["x"])
end)()
, (function()
return (__f32_tMat["col2"]["y"] * self["m_coreV2"]["y"])
end)()
));
(function()
local __oak_cond = __truthy((function()
return (__add((function()
return (__f32_v1X * __f32_dX)
end)()
, (function()
return (__f32_v1Y * __f32_dY)
end)()
) > __add((function()
return (__f32_v2X * __f32_dX)
end)()
, (function()
return (__f32_v2Y * __f32_dY)
end)()
))
end)()
)
if __oak_eq(__oak_cond, true) then return (function()
self["s_supportVec"]["x"] = __f32_v1X;
self["s_supportVec"]["y"] = __f32_v1Y
return self["s_supportVec"]["y"]
end)()

else return (function()
self["s_supportVec"]["x"] = __f32_v2X;
self["s_supportVec"]["y"] = __f32_v2Y
return self["s_supportVec"]["y"]
end)()

end
end)()
;
return self["s_supportVec"]
end;
__proto_b2EdgeShape["SetPrevEdge"] = function(self, __f33_edge, __f33_core, __f33_cornerDir, __f33_convex)
self["m_prevEdge"] = __f33_edge;
self["m_coreV1"] = __f33_core;
self["m_cornerDir1"] = __f33_cornerDir;
self["m_cornerConvex1"] = __f33_convex
return self["m_cornerConvex1"]
end;
__proto_b2EdgeShape["SetNextEdge"] = function(self, __f34_edge, __f34_core, __f34_cornerDir, __f34_convex)
self["m_nextEdge"] = __f34_edge;
self["m_coreV2"] = __f34_core;
self["m_cornerDir2"] = __f34_cornerDir;
self["m_cornerConvex2"] = __f34_convex
return self["m_cornerConvex2"]
end;
__static_b2EdgeShape = {};
b2EdgeShape = function()
local self = b2Shape();
self["__type"] = 'b2EdgeShape';
self["__types"] = {'b2EdgeShape', 'b2Shape'};
self["__super"] = __proto_b2Shape;
self["TestPoint"] = __proto_b2EdgeShape["TestPoint"];
self["RayCast"] = __proto_b2EdgeShape["RayCast"];
self["ComputeAABB"] = __proto_b2EdgeShape["ComputeAABB"];
self["ComputeMass"] = __proto_b2EdgeShape["ComputeMass"];
self["ComputeSubmergedArea"] = __proto_b2EdgeShape["ComputeSubmergedArea"];
self["GetLength"] = __proto_b2EdgeShape["GetLength"];
self["GetVertex1"] = __proto_b2EdgeShape["GetVertex1"];
self["GetVertex2"] = __proto_b2EdgeShape["GetVertex2"];
self["GetCoreVertex1"] = __proto_b2EdgeShape["GetCoreVertex1"];
self["GetCoreVertex2"] = __proto_b2EdgeShape["GetCoreVertex2"];
self["GetNormalVector"] = __proto_b2EdgeShape["GetNormalVector"];
self["GetDirectionVector"] = __proto_b2EdgeShape["GetDirectionVector"];
self["GetCorner1Vector"] = __proto_b2EdgeShape["GetCorner1Vector"];
self["GetCorner2Vector"] = __proto_b2EdgeShape["GetCorner2Vector"];
self["Corner1IsConvex"] = __proto_b2EdgeShape["Corner1IsConvex"];
self["Corner2IsConvex"] = __proto_b2EdgeShape["Corner2IsConvex"];
self["GetFirstVertex"] = __proto_b2EdgeShape["GetFirstVertex"];
self["GetNextEdge"] = __proto_b2EdgeShape["GetNextEdge"];
self["GetPrevEdge"] = __proto_b2EdgeShape["GetPrevEdge"];
self["Support"] = __proto_b2EdgeShape["Support"];
self["SetPrevEdge"] = __proto_b2EdgeShape["SetPrevEdge"];
self["SetNextEdge"] = __proto_b2EdgeShape["SetNextEdge"];
(function()
Box2D["Collision"]["Shapes"]["b2Shape"]["b2Shape"](self);
self["s_supportVec"] = b2Vec2();
self["m_v1"] = b2Vec2();
self["m_v2"] = b2Vec2();
self["m_coreV1"] = b2Vec2();
self["m_coreV2"] = b2Vec2();
self["m_normal"] = b2Vec2();
self["m_direction"] = b2Vec2();
self["m_cornerDir1"] = b2Vec2();
self["m_cornerDir2"] = b2Vec2();
self["__super"]["b2Shape"](self);
self["m_type"] = __static_b2Shape["e_edgeShape"];
self["m_prevEdge"] = nil;
self["m_nextEdge"] = nil;
self["m_v1"] = v1;
self["m_v2"] = v2;
self["m_direction"]["Set"](self["m_direction"], (function()
return (self["m_v2"]["x"] - self["m_v1"]["x"])
end)()
, (function()
return (self["m_v2"]["y"] - self["m_v1"]["y"])
end)()
);
self["m_length"] = self["m_direction"]["Normalize"](self["m_direction"]);
self["m_normal"]["Set"](self["m_normal"], self["m_direction"]["y"], (function()
return (-self["m_direction"]["x"])
end)()
);
self["m_coreV1"]["Set"](self["m_coreV1"], __add((function()
return ((function()
return (-__static_b2Settings["b2_toiSlop"])
end)()
 * (function()
return (self["m_normal"]["x"] - self["m_direction"]["x"])
end)()
)
end)()
, self["m_v1"]["x"]), __add((function()
return ((function()
return (-__static_b2Settings["b2_toiSlop"])
end)()
 * (function()
return (self["m_normal"]["y"] - self["m_direction"]["y"])
end)()
)
end)()
, self["m_v1"]["y"]));
self["m_coreV2"]["Set"](self["m_coreV2"], __add((function()
return ((function()
return (-__static_b2Settings["b2_toiSlop"])
end)()
 * __add(self["m_normal"]["x"], self["m_direction"]["x"]))
end)()
, self["m_v2"]["x"]), __add((function()
return ((function()
return (-__static_b2Settings["b2_toiSlop"])
end)()
 * __add(self["m_normal"]["y"], self["m_direction"]["y"]))
end)()
, self["m_v2"]["y"]));
self["m_cornerDir1"] = self["m_normal"];
return self["m_cornerDir2"]["Set"](self["m_cornerDir2"], (function()
return (-self["m_normal"]["x"])
end)()
, (function()
return (-self["m_normal"]["y"])
end)()
)
end)()
;
return self
end;
Box2D["Collision"]["Shapes"]["b2EdgeShape"] = b2EdgeShape;
__proto_b2PolygonShape = {};
__proto_b2PolygonShape["Copy"] = function(self)
local __f36_s = b2PolygonShape();
__f36_s["Set"](__f36_s, self);
return __f36_s
end;
__proto_b2PolygonShape["Set"] = function(self, __f37_other)
self["__super"]["Set"](self, __f37_other);
return (function()
local __oak_cond = __truthy(__instanceof(__f37_other, 'b2PolygonShape'))
if __oak_eq(__oak_cond, true) then return (function()
local __f37_other2 = (function()
local __oak_cond = __truthy(__instanceof(__f37_other, 'b2PolygonShape'))
if __oak_eq(__oak_cond, true) then return __f37_other
else return nil
end
end)()
;
self["m_centroid"]["SetV"](self["m_centroid"], __f37_other2["m_centroid"]);
self["m_vertexCount"] = __f37_other2["m_vertexCount"];
self["Reserve"](self, self["m_vertexCount"]);
return (function()
local __f37_i = 0;
local function __loop0()
return (function()
local __oak_cond = (function()
return (__f37_i < self["m_vertexCount"])
end)()

if __oak_eq(__oak_cond, true) then return (function()
local __r = (function()
return (function()
__oak_acc(self["m_vertices"], (function()
return __f37_i
end)()
)["SetV"](__oak_acc(self["m_vertices"], (function()
return __f37_i
end)()
), __oak_acc(__f37_other2["m_vertices"], (function()
return __f37_i
end)()
));
return __oak_acc(self["m_normals"], (function()
return __f37_i
end)()
)["SetV"](__oak_acc(self["m_normals"], (function()
return __f37_i
end)()
), __oak_acc(__f37_other2["m_normals"], (function()
return __f37_i
end)()
))
end)()

end)()
;
return (function()
local __oak_cond = __r
if __oak_eq(__oak_cond, 'break') then return nil
else return (function()
(function()
local __tmp37_1 = __f37_i;
__f37_i = __as_oak_string(__f37_i + 1);
return __tmp37_1
end)()
;
return __loop0()
end)()

end
end)()

end)()

else return nil
end
end)()

end;
return __loop0()
end)()

end)()

else return __noop()
end
end)()

end;
__proto_b2PolygonShape["SetAsArray"] = function(self, __f38_vertices, __f38_vertexCount)
(function()
local __oak_cond = __truthy((function()
return __oak_eq(__f38_vertexCount, nil)
end)()
)
if __oak_eq(__oak_cond, true) then __f38_vertexCount = 0
return __f38_vertexCount
else return __noop()
end
end)()
;
local __f38_v = __newArray();
(function()
local __f38_i = 0;
local __f38_tVec = __noop()
return __f38_tVec
end)()
;
(function()
__f38_i = 0;
local function __loop2()
return (function()
local __oak_cond = (function()
return (__f38_i < len(__f38_vertices))
end)()

if __oak_eq(__oak_cond, true) then return (function()
local __r = (function()
return (function()
__f38_tVec = __oak_acc(__f38_vertices, (function()
return __f38_i
end)()
);
return __oak_push(__f38_v, __f38_tVec)
end)()

end)()
;
return (function()
local __oak_cond = __r
if __oak_eq(__oak_cond, 'break') then return nil
else return (function()
(function()
__f38_i = __as_oak_string(__f38_i + 1)
return __f38_i
end)()
;
return __loop2()
end)()

end
end)()

end)()

else return nil
end
end)()

end;
return __loop2()
end)()
;
return self["SetAsVector"](self, __f38_v, __f38_vertexCount)
end;
__proto_b2PolygonShape["SetAsVector"] = function(self, __f39_vertices, __f39_vertexCount)
(function()
local __oak_cond = __truthy((function()
return __oak_eq(__f39_vertexCount, nil)
end)()
)
if __oak_eq(__oak_cond, true) then __f39_vertexCount = 0
return __f39_vertexCount
else return __noop()
end
end)()
;
(function()
local __oak_cond = __truthy((function()
return __oak_eq(__f39_vertexCount, 0)
end)()
)
if __oak_eq(__oak_cond, true) then __f39_vertexCount = len(__f39_vertices)
return __f39_vertexCount
else return __noop()
end
end)()
;
__static_b2Settings["b2Assert"]((function()
return (2 <= __f39_vertexCount)
end)()
);
self["m_vertexCount"] = __f39_vertexCount;
self["Reserve"](self, __f39_vertexCount);
local __f39_i = 0;
(function()
__f39_i = 0;
local function __loop4()
return (function()
local __oak_cond = (function()
return (__f39_i < self["m_vertexCount"])
end)()

if __oak_eq(__oak_cond, true) then return (function()
local __r = (function()
return __oak_acc(self["m_vertices"], (function()
return __f39_i
end)()
)["SetV"](__oak_acc(self["m_vertices"], (function()
return __f39_i
end)()
), __oak_acc(__f39_vertices, (function()
return __f39_i
end)()
))
end)()
;
return (function()
local __oak_cond = __r
if __oak_eq(__oak_cond, 'break') then return nil
else return (function()
(function()
local __tmp39_5 = __f39_i;
__f39_i = __as_oak_string(__f39_i + 1);
return __tmp39_5
end)()
;
return __loop4()
end)()

end
end)()

end)()

else return nil
end
end)()

end;
return __loop4()
end)()
;
(function()
__f39_i = 0;
local function __loop6()
return (function()
local __oak_cond = (function()
return (__f39_i < self["m_vertexCount"])
end)()

if __oak_eq(__oak_cond, true) then return (function()
local __r = (function()
return (function()
local __f39_i1 = __parseInt(__f39_i);
local __f39_i2 = __parseInt((function()
local __oak_cond = __truthy((function()
return (__add(__f39_i, 1) < self["m_vertexCount"])
end)()
)
if __oak_eq(__oak_cond, true) then return __add(__f39_i, 1)
else return 0
end
end)()
);
local __f39_edge = __static_b2Math["SubtractVV"](__oak_acc(self["m_vertices"], (function()
return __f39_i2
end)()
), __oak_acc(self["m_vertices"], (function()
return __f39_i1
end)()
));
__static_b2Settings["b2Assert"]((function()
return (__f39_edge["LengthSquared"](__f39_edge) > __Number["MIN_VALUE"])
end)()
);
__oak_acc(self["m_normals"], (function()
return __f39_i
end)()
)["SetV"](__oak_acc(self["m_normals"], (function()
return __f39_i
end)()
), __static_b2Math["CrossVF"](__f39_edge, 1));
return __oak_acc(self["m_normals"], (function()
return __f39_i
end)()
)["Normalize"](__oak_acc(self["m_normals"], (function()
return __f39_i
end)()
))
end)()

end)()
;
return (function()
local __oak_cond = __r
if __oak_eq(__oak_cond, 'break') then return nil
else return (function()
(function()
__f39_i = __as_oak_string(__f39_i + 1)
return __f39_i
end)()
;
return __loop6()
end)()

end
end)()

end)()

else return nil
end
end)()

end;
return __loop6()
end)()
;
self["m_centroid"] = __static_b2PolygonShape["ComputeCentroid"](self["m_vertices"], self["m_vertexCount"])
return self["m_centroid"]
end;
__proto_b2PolygonShape["SetAsBox"] = function(self, __f40_hx, __f40_hy)
(function()
local __oak_cond = __truthy((function()
return __oak_eq(__f40_hx, nil)
end)()
)
if __oak_eq(__oak_cond, true) then __f40_hx = 0
return __f40_hx
else return __noop()
end
end)()
;
(function()
local __oak_cond = __truthy((function()
return __oak_eq(__f40_hy, nil)
end)()
)
if __oak_eq(__oak_cond, true) then __f40_hy = 0
return __f40_hy
else return __noop()
end
end)()
;
self["m_vertexCount"] = 4;
self["Reserve"](self, 4);
__oak_acc(self["m_vertices"], (function()
return 0
end)()
)["Set"](__oak_acc(self["m_vertices"], (function()
return 0
end)()
), (function()
return (-__f40_hx)
end)()
, (function()
return (-__f40_hy)
end)()
);
__oak_acc(self["m_vertices"], (function()
return 1
end)()
)["Set"](__oak_acc(self["m_vertices"], (function()
return 1
end)()
), __f40_hx, (function()
return (-__f40_hy)
end)()
);
__oak_acc(self["m_vertices"], (function()
return 2
end)()
)["Set"](__oak_acc(self["m_vertices"], (function()
return 2
end)()
), __f40_hx, __f40_hy);
__oak_acc(self["m_vertices"], (function()
return 3
end)()
)["Set"](__oak_acc(self["m_vertices"], (function()
return 3
end)()
), (function()
return (-__f40_hx)
end)()
, __f40_hy);
__oak_acc(self["m_normals"], (function()
return 0
end)()
)["Set"](__oak_acc(self["m_normals"], (function()
return 0
end)()
), 0, (function()
return (-1)
end)()
);
__oak_acc(self["m_normals"], (function()
return 1
end)()
)["Set"](__oak_acc(self["m_normals"], (function()
return 1
end)()
), 1, 0);
__oak_acc(self["m_normals"], (function()
return 2
end)()
)["Set"](__oak_acc(self["m_normals"], (function()
return 2
end)()
), 0, 1);
__oak_acc(self["m_normals"], (function()
return 3
end)()
)["Set"](__oak_acc(self["m_normals"], (function()
return 3
end)()
), (function()
return (-1)
end)()
, 0);
return self["m_centroid"]["SetZero"](self["m_centroid"])
end;
__proto_b2PolygonShape["SetAsOrientedBox"] = function(self, __f41_hx, __f41_hy, __f41_center, __f41_angle)
(function()
local __oak_cond = __truthy((function()
return __oak_eq(__f41_hx, nil)
end)()
)
if __oak_eq(__oak_cond, true) then __f41_hx = 0
return __f41_hx
else return __noop()
end
end)()
;
(function()
local __oak_cond = __truthy((function()
return __oak_eq(__f41_hy, nil)
end)()
)
if __oak_eq(__oak_cond, true) then __f41_hy = 0
return __f41_hy
else return __noop()
end
end)()
;
(function()
local __oak_cond = __truthy((function()
return __oak_eq(__f41_center, nil)
end)()
)
if __oak_eq(__oak_cond, true) then __f41_center = nil
return __f41_center
else return __noop()
end
end)()
;
(function()
local __oak_cond = __truthy((function()
return __oak_eq(__f41_angle, nil)
end)()
)
if __oak_eq(__oak_cond, true) then __f41_angle = 0
return __f41_angle
else return __noop()
end
end)()
;
self["m_vertexCount"] = 4;
self["Reserve"](self, 4);
__oak_acc(self["m_vertices"], (function()
return 0
end)()
)["Set"](__oak_acc(self["m_vertices"], (function()
return 0
end)()
), (function()
return (-__f41_hx)
end)()
, (function()
return (-__f41_hy)
end)()
);
__oak_acc(self["m_vertices"], (function()
return 1
end)()
)["Set"](__oak_acc(self["m_vertices"], (function()
return 1
end)()
), __f41_hx, (function()
return (-__f41_hy)
end)()
);
__oak_acc(self["m_vertices"], (function()
return 2
end)()
)["Set"](__oak_acc(self["m_vertices"], (function()
return 2
end)()
), __f41_hx, __f41_hy);
__oak_acc(self["m_vertices"], (function()
return 3
end)()
)["Set"](__oak_acc(self["m_vertices"], (function()
return 3
end)()
), (function()
return (-__f41_hx)
end)()
, __f41_hy);
__oak_acc(self["m_normals"], (function()
return 0
end)()
)["Set"](__oak_acc(self["m_normals"], (function()
return 0
end)()
), 0, (function()
return (-1)
end)()
);
__oak_acc(self["m_normals"], (function()
return 1
end)()
)["Set"](__oak_acc(self["m_normals"], (function()
return 1
end)()
), 1, 0);
__oak_acc(self["m_normals"], (function()
return 2
end)()
)["Set"](__oak_acc(self["m_normals"], (function()
return 2
end)()
), 0, 1);
__oak_acc(self["m_normals"], (function()
return 3
end)()
)["Set"](__oak_acc(self["m_normals"], (function()
return 3
end)()
), (function()
return (-1)
end)()
, 0);
self["m_centroid"] = __f41_center;
local __f41_xf = b2Transform();
__f41_xf["position"] = __f41_center;
__f41_xf["R"]["Set"](__f41_xf["R"], __f41_angle);
return (function()
local __f41_i = 0;
local function __loop8()
return (function()
local __oak_cond = (function()
return (__f41_i < self["m_vertexCount"])
end)()

if __oak_eq(__oak_cond, true) then return (function()
local __r = (function()
return (function()
self["m_vertices"][__add(__f41_i, 1)] = __static_b2Math["MulX"](__f41_xf, __oak_acc(self["m_vertices"], (function()
return __f41_i
end)()
));
self["m_normals"][__add(__f41_i, 1)] = __static_b2Math["MulMV"](__f41_xf["R"], __oak_acc(self["m_normals"], (function()
return __f41_i
end)()
))
return __oak_acc(self["m_normals"], (function()
return __add(__f41_i, 1)
end)()
)
end)()

end)()
;
return (function()
local __oak_cond = __r
if __oak_eq(__oak_cond, 'break') then return nil
else return (function()
(function()
__f41_i = __as_oak_string(__f41_i + 1)
return __f41_i
end)()
;
return __loop8()
end)()

end
end)()

end)()

else return nil
end
end)()

end;
return __loop8()
end)()

end;
__proto_b2PolygonShape["SetAsEdge"] = function(self, __f42_v1, __f42_v2)
self["m_vertexCount"] = 2;
self["Reserve"](self, 2);
__oak_acc(self["m_vertices"], (function()
return 0
end)()
)["SetV"](__oak_acc(self["m_vertices"], (function()
return 0
end)()
), __f42_v1);
__oak_acc(self["m_vertices"], (function()
return 1
end)()
)["SetV"](__oak_acc(self["m_vertices"], (function()
return 1
end)()
), __f42_v2);
self["m_centroid"]["x"] = (function()
return (0.5 * __add(__f42_v1["x"], __f42_v2["x"]))
end)()
;
self["m_centroid"]["y"] = (function()
return (0.5 * __add(__f42_v1["y"], __f42_v2["y"]))
end)()
;
self["m_normals"][__add(0, 1)] = __static_b2Math["CrossVF"](__static_b2Math["SubtractVV"](__f42_v2, __f42_v1), 1);
__oak_acc(self["m_normals"], (function()
return 0
end)()
)["Normalize"](__oak_acc(self["m_normals"], (function()
return 0
end)()
));
__oak_acc(self["m_normals"], (function()
return 1
end)()
)["x"] = (function()
return (-__oak_acc(self["m_normals"], (function()
return 0
end)()
)["x"])
end)()
;
__oak_acc(self["m_normals"], (function()
return 1
end)()
)["y"] = (function()
return (-__oak_acc(self["m_normals"], (function()
return 0
end)()
)["y"])
end)()

return __oak_acc(self["m_normals"], (function()
return 1
end)()
)["y"]
end;
__proto_b2PolygonShape["TestPoint"] = function(self, __f43_xf, __f43_p)
local __f43_tVec = __noop();
local __f43_tMat = __f43_xf["R"];
local __f43_tX = (function()
return (__f43_p["x"] - __f43_xf["position"]["x"])
end)()
;
local __f43_tY = (function()
return (__f43_p["y"] - __f43_xf["position"]["y"])
end)()
;
local __f43_pLocalX = __add((function()
return (__f43_tX * __f43_tMat["col1"]["x"])
end)()
, (function()
return (__f43_tY * __f43_tMat["col1"]["y"])
end)()
);
local __f43_pLocalY = __add((function()
return (__f43_tX * __f43_tMat["col2"]["x"])
end)()
, (function()
return (__f43_tY * __f43_tMat["col2"]["y"])
end)()
);
(function()
local __f43_i = 0;
local function __loop10()
return (function()
local __oak_cond = (function()
return (__f43_i < self["m_vertexCount"])
end)()

if __oak_eq(__oak_cond, true) then return (function()
local __r = (function()
return (function()
__f43_tVec = __oak_acc(self["m_vertices"], (function()
return __f43_i
end)()
);
__f43_tX = (function()
return (__f43_pLocalX - __f43_tVec["x"])
end)()
;
__f43_tY = (function()
return (__f43_pLocalY - __f43_tVec["y"])
end)()
;
__f43_tVec = __oak_acc(self["m_normals"], (function()
return __f43_i
end)()
);
local __f43_dot = __add((function()
return (__f43_tVec["x"] * __f43_tX)
end)()
, (function()
return (__f43_tVec["y"] * __f43_tY)
end)()
);
return (function()
local __oak_cond = __truthy((function()
return (__f43_dot > 0)
end)()
)
if __oak_eq(__oak_cond, true) then return false
else return __noop()
end
end)()

end)()

end)()
;
return (function()
local __oak_cond = __r
if __oak_eq(__oak_cond, 'break') then return nil
else return (function()
(function()
__f43_i = __as_oak_string(__f43_i + 1)
return __f43_i
end)()
;
return __loop10()
end)()

end
end)()

end)()

else return nil
end
end)()

end;
return __loop10()
end)()
;
return true
end;
__proto_b2PolygonShape["RayCast"] = function(self, __f44_output, __f44_input, __f44_transform)
local __f44_lower = 0;
local __f44_upper = __f44_input["maxFraction"];
local __f44_tX = 0;
local __f44_tY = 0;
local __f44_tMat = __noop();
local __f44_tVec = __noop();
__f44_tX = (function()
return (__f44_input["p1"]["x"] - __f44_transform["position"]["x"])
end)()
;
__f44_tY = (function()
return (__f44_input["p1"]["y"] - __f44_transform["position"]["y"])
end)()
;
__f44_tMat = __f44_transform["R"];
local __f44_p1X = __add((function()
return (__f44_tX * __f44_tMat["col1"]["x"])
end)()
, (function()
return (__f44_tY * __f44_tMat["col1"]["y"])
end)()
);
local __f44_p1Y = __add((function()
return (__f44_tX * __f44_tMat["col2"]["x"])
end)()
, (function()
return (__f44_tY * __f44_tMat["col2"]["y"])
end)()
);
__f44_tX = (function()
return (__f44_input["p2"]["x"] - __f44_transform["position"]["x"])
end)()
;
__f44_tY = (function()
return (__f44_input["p2"]["y"] - __f44_transform["position"]["y"])
end)()
;
__f44_tMat = __f44_transform["R"];
local __f44_p2X = __add((function()
return (__f44_tX * __f44_tMat["col1"]["x"])
end)()
, (function()
return (__f44_tY * __f44_tMat["col1"]["y"])
end)()
);
local __f44_p2Y = __add((function()
return (__f44_tX * __f44_tMat["col2"]["x"])
end)()
, (function()
return (__f44_tY * __f44_tMat["col2"]["y"])
end)()
);
local __f44_dX = (function()
return (__f44_p2X - __f44_p1X)
end)()
;
local __f44_dY = (function()
return (__f44_p2Y - __f44_p1Y)
end)()
;
local __f44_index = __parseInt((function()
return (-1)
end)()
);
(function()
local __f44_i = 0;
local function __loop12()
return (function()
local __oak_cond = (function()
return (__f44_i < self["m_vertexCount"])
end)()

if __oak_eq(__oak_cond, true) then return (function()
local __r = (function()
return (function()
__f44_tVec = __oak_acc(self["m_vertices"], (function()
return __f44_i
end)()
);
__f44_tX = (function()
return (__f44_tVec["x"] - __f44_p1X)
end)()
;
__f44_tY = (function()
return (__f44_tVec["y"] - __f44_p1Y)
end)()
;
__f44_tVec = __oak_acc(self["m_normals"], (function()
return __f44_i
end)()
);
local __f44_numerator = __add((function()
return (__f44_tVec["x"] * __f44_tX)
end)()
, (function()
return (__f44_tVec["y"] * __f44_tY)
end)()
);
local __f44_denominator = __add((function()
return (__f44_tVec["x"] * __f44_dX)
end)()
, (function()
return (__f44_tVec["y"] * __f44_dY)
end)()
);
return (function()
(function()
local __oak_cond = __truthy((function()
return __oak_eq(__f44_denominator, 0)
end)()
)
if __oak_eq(__oak_cond, true) then return (function()
local __oak_cond = __truthy((function()
return (__f44_numerator < 0)
end)()
)
if __oak_eq(__oak_cond, true) then return false
else return __noop()
end
end)()

else return (function()
local __oak_cond = __truthy(__and((function()
return (__f44_denominator < 0)
end)()
, (function()
return (__f44_numerator < (function()
return (__f44_lower * __f44_denominator)
end)()
)
end)()
))
if __oak_eq(__oak_cond, true) then return (function()
__f44_lower = (function()
return (__f44_numerator / __f44_denominator)
end)()
;
__f44_index = __f44_i
return __f44_index
end)()

else return (function()
local __oak_cond = __truthy(__and((function()
return (__f44_denominator > 0)
end)()
, (function()
return (__f44_numerator < (function()
return (__f44_upper * __f44_denominator)
end)()
)
end)()
))
if __oak_eq(__oak_cond, true) then __f44_upper = (function()
return (__f44_numerator / __f44_denominator)
end)()

return __f44_upper
else return __noop()
end
end)()

end
end)()

end
end)()
;
return (function()
local __oak_cond = __truthy((function()
return (__f44_upper < (function()
return (__f44_lower - __Number["MIN_VALUE"])
end)()
)
end)()
)
if __oak_eq(__oak_cond, true) then return false
else return __noop()
end
end)()

end)()

end)()

end)()
;
return (function()
local __oak_cond = __r
if __oak_eq(__oak_cond, 'break') then return nil
else return (function()
(function()
__f44_i = __as_oak_string(__f44_i + 1)
return __f44_i
end)()
;
return __loop12()
end)()

end
end)()

end)()

else return nil
end
end)()

end;
return __loop12()
end)()
;
(function()
local __oak_cond = __truthy((function()
return (__f44_index >= 0)
end)()
)
if __oak_eq(__oak_cond, true) then return (function()
__f44_output["fraction"] = __f44_lower;
__f44_tMat = __f44_transform["R"];
__f44_tVec = __oak_acc(self["m_normals"], (function()
return __f44_index
end)()
);
__f44_output["normal"]["x"] = __add((function()
return (__f44_tMat["col1"]["x"] * __f44_tVec["x"])
end)()
, (function()
return (__f44_tMat["col2"]["x"] * __f44_tVec["y"])
end)()
);
__f44_output["normal"]["y"] = __add((function()
return (__f44_tMat["col1"]["y"] * __f44_tVec["x"])
end)()
, (function()
return (__f44_tMat["col2"]["y"] * __f44_tVec["y"])
end)()
);
return true
end)()

else return __noop()
end
end)()
;
return false
end;
__proto_b2PolygonShape["ComputeAABB"] = function(self, __f45_aabb, __f45_xf)
local __f45_tMat = __f45_xf["R"];
local __f45_tVec = __oak_acc(self["m_vertices"], (function()
return 0
end)()
);
local __f45_lowerX = __add(__f45_xf["position"]["x"], __add((function()
return (__f45_tMat["col1"]["x"] * __f45_tVec["x"])
end)()
, (function()
return (__f45_tMat["col2"]["x"] * __f45_tVec["y"])
end)()
));
local __f45_lowerY = __add(__f45_xf["position"]["y"], __add((function()
return (__f45_tMat["col1"]["y"] * __f45_tVec["x"])
end)()
, (function()
return (__f45_tMat["col2"]["y"] * __f45_tVec["y"])
end)()
));
local __f45_upperX = __f45_lowerX;
local __f45_upperY = __f45_lowerY;
(function()
local __f45_i = 1;
local function __loop14()
return (function()
local __oak_cond = (function()
return (__f45_i < self["m_vertexCount"])
end)()

if __oak_eq(__oak_cond, true) then return (function()
local __r = (function()
return (function()
__f45_tVec = __oak_acc(self["m_vertices"], (function()
return __f45_i
end)()
);
local __f45_vX = __add(__f45_xf["position"]["x"], __add((function()
return (__f45_tMat["col1"]["x"] * __f45_tVec["x"])
end)()
, (function()
return (__f45_tMat["col2"]["x"] * __f45_tVec["y"])
end)()
));
local __f45_vY = __add(__f45_xf["position"]["y"], __add((function()
return (__f45_tMat["col1"]["y"] * __f45_tVec["x"])
end)()
, (function()
return (__f45_tMat["col2"]["y"] * __f45_tVec["y"])
end)()
));
__f45_lowerX = (function()
local __oak_cond = __truthy((function()
return (__f45_lowerX < __f45_vX)
end)()
)
if __oak_eq(__oak_cond, true) then return __f45_lowerX
else return __f45_vX
end
end)()
;
__f45_lowerY = (function()
local __oak_cond = __truthy((function()
return (__f45_lowerY < __f45_vY)
end)()
)
if __oak_eq(__oak_cond, true) then return __f45_lowerY
else return __f45_vY
end
end)()
;
__f45_upperX = (function()
local __oak_cond = __truthy((function()
return (__f45_upperX > __f45_vX)
end)()
)
if __oak_eq(__oak_cond, true) then return __f45_upperX
else return __f45_vX
end
end)()
;
__f45_upperY = (function()
local __oak_cond = __truthy((function()
return (__f45_upperY > __f45_vY)
end)()
)
if __oak_eq(__oak_cond, true) then return __f45_upperY
else return __f45_vY
end
end)()

return __f45_upperY
end)()

end)()
;
return (function()
local __oak_cond = __r
if __oak_eq(__oak_cond, 'break') then return nil
else return (function()
(function()
__f45_i = __as_oak_string(__f45_i + 1)
return __f45_i
end)()
;
return __loop14()
end)()

end
end)()

end)()

else return nil
end
end)()

end;
return __loop14()
end)()
;
__f45_aabb["lowerBound"]["x"] = (function()
return (__f45_lowerX - self["m_radius"])
end)()
;
__f45_aabb["lowerBound"]["y"] = (function()
return (__f45_lowerY - self["m_radius"])
end)()
;
__f45_aabb["upperBound"]["x"] = __add(__f45_upperX, self["m_radius"]);
__f45_aabb["upperBound"]["y"] = __add(__f45_upperY, self["m_radius"])
return __f45_aabb["upperBound"]["y"]
end;
__proto_b2PolygonShape["ComputeMass"] = function(self, __f46_massData, __f46_density)
(function()
local __oak_cond = __truthy((function()
return __oak_eq(__f46_density, nil)
end)()
)
if __oak_eq(__oak_cond, true) then __f46_density = 0
return __f46_density
else return __noop()
end
end)()
;
return (function()
local __oak_cond = __truthy((function()
return __oak_eq(self["m_vertexCount"], 2)
end)()
)
if __oak_eq(__oak_cond, true) then return (function()
__f46_massData["center"]["x"] = (function()
return (0.5 * __add(__oak_acc(self["m_vertices"], (function()
return 0
end)()
)["x"], __oak_acc(self["m_vertices"], (function()
return 1
end)()
)["x"]))
end)()
;
__f46_massData["center"]["y"] = (function()
return (0.5 * __add(__oak_acc(self["m_vertices"], (function()
return 0
end)()
)["y"], __oak_acc(self["m_vertices"], (function()
return 1
end)()
)["y"]))
end)()
;
__f46_massData["mass"] = 0;
__f46_massData["I"] = 0;
return __noop()
end)()

else return (function()
local __f46_centerX = 0;
local __f46_centerY = 0;
local __f46_area = 0;
local __f46_I = 0;
local __f46_p1X = 0;
local __f46_p1Y = 0;
local __f46_k_inv3 = (function()
return (1 / 3)
end)()
;
(function()
local __f46_i = 0;
local function __loop16()
return (function()
local __oak_cond = (function()
return (__f46_i < self["m_vertexCount"])
end)()

if __oak_eq(__oak_cond, true) then return (function()
local __r = (function()
return (function()
local __f46_p2 = __oak_acc(self["m_vertices"], (function()
return __f46_i
end)()
);
local __f46_p3 = (function()
local __oak_cond = __truthy((function()
return (__add(__f46_i, 1) < self["m_vertexCount"])
end)()
)
if __oak_eq(__oak_cond, true) then return __oak_acc(self["m_vertices"], (function()
return __parseInt(__add(__f46_i, 1))
end)()
)
else return __oak_acc(self["m_vertices"], (function()
return 0
end)()
)
end
end)()
;
local __f46_e1X = (function()
return (__f46_p2["x"] - __f46_p1X)
end)()
;
local __f46_e1Y = (function()
return (__f46_p2["y"] - __f46_p1Y)
end)()
;
local __f46_e2X = (function()
return (__f46_p3["x"] - __f46_p1X)
end)()
;
local __f46_e2Y = (function()
return (__f46_p3["y"] - __f46_p1Y)
end)()
;
local __f46_D = (function()
return ((function()
return (__f46_e1X * __f46_e2Y)
end)()
 - (function()
return (__f46_e1Y * __f46_e2X)
end)()
)
end)()
;
local __f46_triangleArea = (function()
return (0.5 * __f46_D)
end)()
;
__f46_area = __add(__f46_area, __f46_triangleArea);
__f46_centerX = __add(__f46_centerX, (function()
return ((function()
return (__f46_triangleArea * __f46_k_inv3)
end)()
 * __add(__add(__f46_p1X, __f46_p2["x"]), __f46_p3["x"]))
end)()
);
__f46_centerY = __add(__f46_centerY, (function()
return ((function()
return (__f46_triangleArea * __f46_k_inv3)
end)()
 * __add(__add(__f46_p1Y, __f46_p2["y"]), __f46_p3["y"]))
end)()
);
local __f46_px = __f46_p1X;
local __f46_py = __f46_p1Y;
local __f46_ex1 = __f46_e1X;
local __f46_ey1 = __f46_e1Y;
local __f46_ex2 = __f46_e2X;
local __f46_ey2 = __f46_e2Y;
local __f46_intx2 = __add((function()
return (__f46_k_inv3 * __add((function()
return (0.25 * __add(__add((function()
return (__f46_ex1 * __f46_ex1)
end)()
, (function()
return (__f46_ex2 * __f46_ex1)
end)()
), (function()
return (__f46_ex2 * __f46_ex2)
end)()
))
end)()
, __add((function()
return (__f46_px * __f46_ex1)
end)()
, (function()
return (__f46_px * __f46_ex2)
end)()
)))
end)()
, (function()
return ((function()
return (0.5 * __f46_px)
end)()
 * __f46_px)
end)()
);
local __f46_inty2 = __add((function()
return (__f46_k_inv3 * __add((function()
return (0.25 * __add(__add((function()
return (__f46_ey1 * __f46_ey1)
end)()
, (function()
return (__f46_ey2 * __f46_ey1)
end)()
), (function()
return (__f46_ey2 * __f46_ey2)
end)()
))
end)()
, __add((function()
return (__f46_py * __f46_ey1)
end)()
, (function()
return (__f46_py * __f46_ey2)
end)()
)))
end)()
, (function()
return ((function()
return (0.5 * __f46_py)
end)()
 * __f46_py)
end)()
);
__f46_I = __add(__f46_I, (function()
return (__f46_D * __add(__f46_intx2, __f46_inty2))
end)()
)
return __f46_I
end)()

end)()
;
return (function()
local __oak_cond = __r
if __oak_eq(__oak_cond, 'break') then return nil
else return (function()
(function()
__f46_i = __as_oak_string(__f46_i + 1)
return __f46_i
end)()
;
return __loop16()
end)()

end
end)()

end)()

else return nil
end
end)()

end;
return __loop16()
end)()
;
__f46_massData["mass"] = (function()
return (__f46_density * __f46_area)
end)()
;
__f46_centerX = (function()
return (__f46_centerX * (function()
return (1 / __f46_area)
end)()
)
end)()
;
__f46_centerY = (function()
return (__f46_centerY * (function()
return (1 / __f46_area)
end)()
)
end)()
;
__f46_massData["center"]["Set"](__f46_massData["center"], __f46_centerX, __f46_centerY);
__f46_massData["I"] = (function()
return (__f46_density * __f46_I)
end)()

return __f46_massData["I"]
end)()

end
end)()

end;
__proto_b2PolygonShape["ComputeSubmergedArea"] = function(self, __f47_normal, __f47_offset, __f47_xf, __f47_c)
(function()
local __oak_cond = __truthy((function()
return __oak_eq(__f47_offset, nil)
end)()
)
if __oak_eq(__oak_cond, true) then __f47_offset = 0
return __f47_offset
else return __noop()
end
end)()
;
local __f47_normalL = __static_b2Math["MulTMV"](__f47_xf["R"], __f47_normal);
local __f47_offsetL = (function()
return (__f47_offset - __static_b2Math["Dot"](__f47_normal, __f47_xf["position"]))
end)()
;
local __f47_depths = Vector_a2j_Number();
local __f47_diveCount = 0;
local __f47_intoIndex = __parseInt((function()
return (-1)
end)()
);
local __f47_outoIndex = __parseInt((function()
return (-1)
end)()
);
local __f47_lastSubmerged = false;
local __f47_i = 0;
(function()
__f47_i = 0;
local function __loop18()
return (function()
local __oak_cond = (function()
return (__f47_i < self["m_vertexCount"])
end)()

if __oak_eq(__oak_cond, true) then return (function()
local __r = (function()
return (function()
__f47_depths[__add(__f47_i, 1)] = (function()
return (__static_b2Math["Dot"](__f47_normalL, __oak_acc(self["m_vertices"], (function()
return __f47_i
end)()
)) - __f47_offsetL)
end)()
;
local __f47_isSubmerged = (function()
return (__oak_acc(__f47_depths, (function()
return __f47_i
end)()
) < (function()
return (-__Number["MIN_VALUE"])
end)()
)
end)()
;
(function()
local __oak_cond = __truthy((function()
return (__f47_i > 0)
end)()
)
if __oak_eq(__oak_cond, true) then return (function()
local __oak_cond = __truthy(__f47_isSubmerged)
if __oak_eq(__oak_cond, true) then return (function()
local __oak_cond = __truthy(__not(__f47_lastSubmerged))
if __oak_eq(__oak_cond, true) then return (function()
__f47_intoIndex = (function()
return (__f47_i - 1)
end)()
;
return (function()
local __tmp47_20 = __f47_diveCount;
__f47_diveCount = __as_oak_string(__f47_diveCount + 1);
return __tmp47_20
end)()

end)()

else return __noop()
end
end)()

else return (function()
local __oak_cond = __truthy(__f47_lastSubmerged)
if __oak_eq(__oak_cond, true) then return (function()
__f47_outoIndex = (function()
return (__f47_i - 1)
end)()
;
return (function()
local __tmp47_21 = __f47_diveCount;
__f47_diveCount = __as_oak_string(__f47_diveCount + 1);
return __tmp47_21
end)()

end)()

else return __noop()
end
end)()

end
end)()

else return __noop()
end
end)()
;
__f47_lastSubmerged = __f47_isSubmerged
return __f47_lastSubmerged
end)()

end)()
;
return (function()
local __oak_cond = __r
if __oak_eq(__oak_cond, 'break') then return nil
else return (function()
(function()
__f47_i = __as_oak_string(__f47_i + 1)
return __f47_i
end)()
;
return __loop18()
end)()

end
end)()

end)()

else return nil
end
end)()

end;
return __loop18()
end)()
;
(function()
local __oak_cond = __f47_diveCount
if __oak_eq(__oak_cond, 0) then return (function()
local __oak_cond = __truthy(__f47_lastSubmerged)
if __oak_eq(__oak_cond, true) then return (function()
local __f47_md = b2MassData();
self["ComputeMass"](self, __f47_md, 1);
__f47_c["SetV"](__f47_c, __static_b2Math["MulX"](__f47_xf, __f47_md["center"]));
return __f47_md["mass"]
end)()

else return 0
end
end)()

elseif __oak_eq(__oak_cond, 1) then return (function()
local __oak_cond = __truthy((function()
return __oak_eq(__f47_intoIndex, (function()
return (-1)
end)()
)
end)()
)
if __oak_eq(__oak_cond, true) then __f47_intoIndex = (function()
return (self["m_vertexCount"] - 1)
end)()

return __f47_intoIndex
else __f47_outoIndex = (function()
return (self["m_vertexCount"] - 1)
end)()

return __f47_outoIndex
end
end)()

else return nil
end
end)()
;
local __f47_intoIndex2 = __parseInt((function()
return (__add(__f47_intoIndex, 1) % self["m_vertexCount"])
end)()
);
local __f47_outoIndex2 = __parseInt((function()
return (__add(__f47_outoIndex, 1) % self["m_vertexCount"])
end)()
);
local __f47_intoLamdda = (function()
return ((function()
return (0 - __oak_acc(__f47_depths, (function()
return __f47_intoIndex
end)()
))
end)()
 / (function()
return (__oak_acc(__f47_depths, (function()
return __f47_intoIndex2
end)()
) - __oak_acc(__f47_depths, (function()
return __f47_intoIndex
end)()
))
end)()
)
end)()
;
local __f47_outoLamdda = (function()
return ((function()
return (0 - __oak_acc(__f47_depths, (function()
return __f47_outoIndex
end)()
))
end)()
 / (function()
return (__oak_acc(__f47_depths, (function()
return __f47_outoIndex2
end)()
) - __oak_acc(__f47_depths, (function()
return __f47_outoIndex
end)()
))
end)()
)
end)()
;
local __f47_intoVec = b2Vec2(__add((function()
return (__oak_acc(self["m_vertices"], (function()
return __f47_intoIndex
end)()
)["x"] * (function()
return (1 - __f47_intoLamdda)
end)()
)
end)()
, (function()
return (__oak_acc(self["m_vertices"], (function()
return __f47_intoIndex2
end)()
)["x"] * __f47_intoLamdda)
end)()
), __add((function()
return (__oak_acc(self["m_vertices"], (function()
return __f47_intoIndex
end)()
)["y"] * (function()
return (1 - __f47_intoLamdda)
end)()
)
end)()
, (function()
return (__oak_acc(self["m_vertices"], (function()
return __f47_intoIndex2
end)()
)["y"] * __f47_intoLamdda)
end)()
));
local __f47_outoVec = b2Vec2(__add((function()
return (__oak_acc(self["m_vertices"], (function()
return __f47_outoIndex
end)()
)["x"] * (function()
return (1 - __f47_outoLamdda)
end)()
)
end)()
, (function()
return (__oak_acc(self["m_vertices"], (function()
return __f47_outoIndex2
end)()
)["x"] * __f47_outoLamdda)
end)()
), __add((function()
return (__oak_acc(self["m_vertices"], (function()
return __f47_outoIndex
end)()
)["y"] * (function()
return (1 - __f47_outoLamdda)
end)()
)
end)()
, (function()
return (__oak_acc(self["m_vertices"], (function()
return __f47_outoIndex2
end)()
)["y"] * __f47_outoLamdda)
end)()
));
local __f47_area = 0;
local __f47_center = b2Vec2();
local __f47_p2 = __oak_acc(self["m_vertices"], (function()
return __f47_intoIndex2
end)()
);
local __f47_p3 = __noop();
__f47_i = __f47_intoIndex2;
(function()
local function __loop22()
return (function()
local __oak_cond = (function()
return (not __oak_eq(__f47_i, __f47_outoIndex2))
end)()

if __oak_eq(__oak_cond, true) then return (function()
local __r = (function()
return (function()
__f47_i = (function()
return (__add(__f47_i, 1) % self["m_vertexCount"])
end)()
;
(function()
local __oak_cond = __truthy((function()
return __oak_eq(__f47_i, __f47_outoIndex2)
end)()
)
if __oak_eq(__oak_cond, true) then __f47_p3 = __f47_outoVec
return __f47_p3
else __f47_p3 = __oak_acc(self["m_vertices"], (function()
return __f47_i
end)()
)
return __f47_p3
end
end)()
;
local __f47_triangleArea = (function()
return (0.5 * (function()
return ((function()
return ((function()
return (__f47_p2["x"] - __f47_intoVec["x"])
end)()
 * (function()
return (__f47_p3["y"] - __f47_intoVec["y"])
end)()
)
end)()
 - (function()
return ((function()
return (__f47_p2["y"] - __f47_intoVec["y"])
end)()
 * (function()
return (__f47_p3["x"] - __f47_intoVec["x"])
end)()
)
end)()
)
end)()
)
end)()
;
__f47_area = __add(__f47_area, __f47_triangleArea);
__f47_center["x"] = __add(__f47_center["x"], (function()
return ((function()
return (__f47_triangleArea * __add(__add(__f47_intoVec["x"], __f47_p2["x"]), __f47_p3["x"]))
end)()
 / 3)
end)()
);
__f47_center["y"] = __add(__f47_center["y"], (function()
return ((function()
return (__f47_triangleArea * __add(__add(__f47_intoVec["y"], __f47_p2["y"]), __f47_p3["y"]))
end)()
 / 3)
end)()
);
__f47_p2 = __f47_p3
return __f47_p2
end)()

end)()
;
return (function()
local __oak_cond = __r
if __oak_eq(__oak_cond, 'break') then return nil
else return __loop22()
end
end)()

end)()

else return nil
end
end)()

end;
return __loop22()
end)()
;
__f47_center["Multiply"](__f47_center, (function()
return (1 / __f47_area)
end)()
);
__f47_c["SetV"](__f47_c, __static_b2Math["MulX"](__f47_xf, __f47_center));
return __f47_area
end;
__proto_b2PolygonShape["GetVertexCount"] = function(self)
return self["m_vertexCount"]
end;
__proto_b2PolygonShape["GetVertices"] = function(self)
return self["m_vertices"]
end;
__proto_b2PolygonShape["GetNormals"] = function(self)
return self["m_normals"]
end;
__proto_b2PolygonShape["GetSupport"] = function(self, __f51_d)
local __f51_bestIndex = 0;
local __f51_bestValue = __add((function()
return (__oak_acc(self["m_vertices"], (function()
return 0
end)()
)["x"] * __f51_d["x"])
end)()
, (function()
return (__oak_acc(self["m_vertices"], (function()
return 0
end)()
)["y"] * __f51_d["y"])
end)()
);
(function()
local __f51_i = 1;
local function __loop23()
return (function()
local __oak_cond = (function()
return (__f51_i < self["m_vertexCount"])
end)()

if __oak_eq(__oak_cond, true) then return (function()
local __r = (function()
return (function()
local __f51_value = __add((function()
return (__oak_acc(self["m_vertices"], (function()
return __f51_i
end)()
)["x"] * __f51_d["x"])
end)()
, (function()
return (__oak_acc(self["m_vertices"], (function()
return __f51_i
end)()
)["y"] * __f51_d["y"])
end)()
);
return (function()
local __oak_cond = __truthy((function()
return (__f51_value > __f51_bestValue)
end)()
)
if __oak_eq(__oak_cond, true) then return (function()
__f51_bestIndex = __f51_i;
__f51_bestValue = __f51_value
return __f51_bestValue
end)()

else return __noop()
end
end)()

end)()

end)()
;
return (function()
local __oak_cond = __r
if __oak_eq(__oak_cond, 'break') then return nil
else return (function()
(function()
__f51_i = __as_oak_string(__f51_i + 1)
return __f51_i
end)()
;
return __loop23()
end)()

end
end)()

end)()

else return nil
end
end)()

end;
return __loop23()
end)()
;
return __f51_bestIndex
end;
__proto_b2PolygonShape["GetSupportVertex"] = function(self, __f52_d)
local __f52_bestIndex = 0;
local __f52_bestValue = __add((function()
return (__oak_acc(self["m_vertices"], (function()
return 0
end)()
)["x"] * __f52_d["x"])
end)()
, (function()
return (__oak_acc(self["m_vertices"], (function()
return 0
end)()
)["y"] * __f52_d["y"])
end)()
);
(function()
local __f52_i = 1;
local function __loop25()
return (function()
local __oak_cond = (function()
return (__f52_i < self["m_vertexCount"])
end)()

if __oak_eq(__oak_cond, true) then return (function()
local __r = (function()
return (function()
local __f52_value = __add((function()
return (__oak_acc(self["m_vertices"], (function()
return __f52_i
end)()
)["x"] * __f52_d["x"])
end)()
, (function()
return (__oak_acc(self["m_vertices"], (function()
return __f52_i
end)()
)["y"] * __f52_d["y"])
end)()
);
return (function()
local __oak_cond = __truthy((function()
return (__f52_value > __f52_bestValue)
end)()
)
if __oak_eq(__oak_cond, true) then return (function()
__f52_bestIndex = __f52_i;
__f52_bestValue = __f52_value
return __f52_bestValue
end)()

else return __noop()
end
end)()

end)()

end)()
;
return (function()
local __oak_cond = __r
if __oak_eq(__oak_cond, 'break') then return nil
else return (function()
(function()
__f52_i = __as_oak_string(__f52_i + 1)
return __f52_i
end)()
;
return __loop25()
end)()

end
end)()

end)()

else return nil
end
end)()

end;
return __loop25()
end)()
;
return __oak_acc(self["m_vertices"], (function()
return __f52_bestIndex
end)()
)
end;
__proto_b2PolygonShape["Validate"] = function(self)
return false
end;
__proto_b2PolygonShape["Reserve"] = function(self, __f54_count)
(function()
local __oak_cond = __truthy((function()
return __oak_eq(__f54_count, nil)
end)()
)
if __oak_eq(__oak_cond, true) then __f54_count = 0
return __f54_count
else return __noop()
end
end)()
;
return (function()
local __f54_i = __parseInt(len(self["m_vertices"]));
local function __loop27()
return (function()
local __oak_cond = (function()
return (__f54_i < __f54_count)
end)()

if __oak_eq(__oak_cond, true) then return (function()
local __r = (function()
return (function()
self["m_vertices"][__add(__f54_i, 1)] = b2Vec2();
self["m_normals"][__add(__f54_i, 1)] = b2Vec2()
return __oak_acc(self["m_normals"], (function()
return __add(__f54_i, 1)
end)()
)
end)()

end)()
;
return (function()
local __oak_cond = __r
if __oak_eq(__oak_cond, 'break') then return nil
else return (function()
(function()
local __tmp54_28 = __f54_i;
__f54_i = __as_oak_string(__f54_i + 1);
return __tmp54_28
end)()
;
return __loop27()
end)()

end
end)()

end)()

else return nil
end
end)()

end;
return __loop27()
end)()

end;
__static_b2PolygonShape = {};
__static_b2PolygonShape["AsArray"] = function(__f55_vertices, __f55_vertexCount)
(function()
local __oak_cond = __truthy((function()
return __oak_eq(__f55_vertexCount, nil)
end)()
)
if __oak_eq(__oak_cond, true) then __f55_vertexCount = 0
return __f55_vertexCount
else return __noop()
end
end)()
;
local __f55_polygonShape = b2PolygonShape();
__f55_polygonShape["SetAsArray"](__f55_polygonShape, __f55_vertices, __f55_vertexCount);
return __f55_polygonShape
end;
__static_b2PolygonShape["AsVector"] = function(__f56_vertices, __f56_vertexCount)
(function()
local __oak_cond = __truthy((function()
return __oak_eq(__f56_vertexCount, nil)
end)()
)
if __oak_eq(__oak_cond, true) then __f56_vertexCount = 0
return __f56_vertexCount
else return __noop()
end
end)()
;
local __f56_polygonShape = b2PolygonShape();
__f56_polygonShape["SetAsVector"](__f56_polygonShape, __f56_vertices, __f56_vertexCount);
return __f56_polygonShape
end;
__static_b2PolygonShape["AsBox"] = function(__f57_hx, __f57_hy)
(function()
local __oak_cond = __truthy((function()
return __oak_eq(__f57_hx, nil)
end)()
)
if __oak_eq(__oak_cond, true) then __f57_hx = 0
return __f57_hx
else return __noop()
end
end)()
;
(function()
local __oak_cond = __truthy((function()
return __oak_eq(__f57_hy, nil)
end)()
)
if __oak_eq(__oak_cond, true) then __f57_hy = 0
return __f57_hy
else return __noop()
end
end)()
;
local __f57_polygonShape = b2PolygonShape();
__f57_polygonShape["SetAsBox"](__f57_polygonShape, __f57_hx, __f57_hy);
return __f57_polygonShape
end;
__static_b2PolygonShape["AsOrientedBox"] = function(__f58_hx, __f58_hy, __f58_center, __f58_angle)
(function()
local __oak_cond = __truthy((function()
return __oak_eq(__f58_hx, nil)
end)()
)
if __oak_eq(__oak_cond, true) then __f58_hx = 0
return __f58_hx
else return __noop()
end
end)()
;
(function()
local __oak_cond = __truthy((function()
return __oak_eq(__f58_hy, nil)
end)()
)
if __oak_eq(__oak_cond, true) then __f58_hy = 0
return __f58_hy
else return __noop()
end
end)()
;
(function()
local __oak_cond = __truthy((function()
return __oak_eq(__f58_center, nil)
end)()
)
if __oak_eq(__oak_cond, true) then __f58_center = nil
return __f58_center
else return __noop()
end
end)()
;
(function()
local __oak_cond = __truthy((function()
return __oak_eq(__f58_angle, nil)
end)()
)
if __oak_eq(__oak_cond, true) then __f58_angle = 0
return __f58_angle
else return __noop()
end
end)()
;
local __f58_polygonShape = b2PolygonShape();
__f58_polygonShape["SetAsOrientedBox"](__f58_polygonShape, __f58_hx, __f58_hy, __f58_center, __f58_angle);
return __f58_polygonShape
end;
__static_b2PolygonShape["AsEdge"] = function(__f59_v1, __f59_v2)
local __f59_polygonShape = b2PolygonShape();
__f59_polygonShape["SetAsEdge"](__f59_polygonShape, __f59_v1, __f59_v2);
return __f59_polygonShape
end;
__static_b2PolygonShape["ComputeCentroid"] = function(__f60_vs, __f60_count)
(function()
local __oak_cond = __truthy((function()
return __oak_eq(__f60_count, nil)
end)()
)
if __oak_eq(__oak_cond, true) then __f60_count = 0
return __f60_count
else return __noop()
end
end)()
;
local __f60_c = b2Vec2();
local __f60_area = 0;
local __f60_p1X = 0;
local __f60_p1Y = 0;
local __f60_inv3 = (function()
return (1 / 3)
end)()
;
(function()
local __f60_i = 0;
local function __loop29()
return (function()
local __oak_cond = (function()
return (__f60_i < __f60_count)
end)()

if __oak_eq(__oak_cond, true) then return (function()
local __r = (function()
return (function()
local __f60_p2 = __oak_acc(__f60_vs, (function()
return __f60_i
end)()
);
local __f60_p3 = (function()
local __oak_cond = __truthy((function()
return (__add(__f60_i, 1) < __f60_count)
end)()
)
if __oak_eq(__oak_cond, true) then return __oak_acc(__f60_vs, (function()
return __parseInt(__add(__f60_i, 1))
end)()
)
else return __oak_acc(__f60_vs, (function()
return 0
end)()
)
end
end)()
;
local __f60_e1X = (function()
return (__f60_p2["x"] - __f60_p1X)
end)()
;
local __f60_e1Y = (function()
return (__f60_p2["y"] - __f60_p1Y)
end)()
;
local __f60_e2X = (function()
return (__f60_p3["x"] - __f60_p1X)
end)()
;
local __f60_e2Y = (function()
return (__f60_p3["y"] - __f60_p1Y)
end)()
;
local __f60_D = (function()
return ((function()
return (__f60_e1X * __f60_e2Y)
end)()
 - (function()
return (__f60_e1Y * __f60_e2X)
end)()
)
end)()
;
local __f60_triangleArea = (function()
return (0.5 * __f60_D)
end)()
;
__f60_area = __add(__f60_area, __f60_triangleArea);
__f60_c["x"] = __add(__f60_c["x"], (function()
return ((function()
return (__f60_triangleArea * __f60_inv3)
end)()
 * __add(__add(__f60_p1X, __f60_p2["x"]), __f60_p3["x"]))
end)()
);
__f60_c["y"] = __add(__f60_c["y"], (function()
return ((function()
return (__f60_triangleArea * __f60_inv3)
end)()
 * __add(__add(__f60_p1Y, __f60_p2["y"]), __f60_p3["y"]))
end)()
)
return __f60_c["y"]
end)()

end)()
;
return (function()
local __oak_cond = __r
if __oak_eq(__oak_cond, 'break') then return nil
else return (function()
(function()
__f60_i = __as_oak_string(__f60_i + 1)
return __f60_i
end)()
;
return __loop29()
end)()

end
end)()

end)()

else return nil
end
end)()

end;
return __loop29()
end)()
;
__f60_c["x"] = (function()
return (__f60_c["x"] * (function()
return (1 / __f60_area)
end)()
)
end)()
;
__f60_c["y"] = (function()
return (__f60_c["y"] * (function()
return (1 / __f60_area)
end)()
)
end)()
;
return __f60_c
end;
__static_b2PolygonShape["ComputeOBB"] = function(__f61_obb, __f61_vs, __f61_count)
(function()
local __oak_cond = __truthy((function()
return __oak_eq(__f61_count, nil)
end)()
)
if __oak_eq(__oak_cond, true) then __f61_count = 0
return __f61_count
else return __noop()
end
end)()
;
local __f61_i = 0;
local __f61_p = __newArray(__add(__f61_count, 1));
(function()
__f61_i = 0;
local function __loop31()
return (function()
local __oak_cond = (function()
return (__f61_i < __f61_count)
end)()

if __oak_eq(__oak_cond, true) then return (function()
local __r = (function()
__f61_p[__add(__f61_i, 1)] = __oak_acc(__f61_vs, (function()
return __f61_i
end)()
)
return __oak_acc(__f61_p, (function()
return __add(__f61_i, 1)
end)()
)
end)()
;
return (function()
local __oak_cond = __r
if __oak_eq(__oak_cond, 'break') then return nil
else return (function()
(function()
__f61_i = __as_oak_string(__f61_i + 1)
return __f61_i
end)()
;
return __loop31()
end)()

end
end)()

end)()

else return nil
end
end)()

end;
return __loop31()
end)()
;
__f61_p[__add(__f61_count, 1)] = __oak_acc(__f61_p, (function()
return 0
end)()
);
local __f61_minArea = __Number["MAX_VALUE"];
return (function()
__f61_i = 1;
local function __loop33()
return (function()
local __oak_cond = (function()
return (__f61_i <= __f61_count)
end)()

if __oak_eq(__oak_cond, true) then return (function()
local __r = (function()
return (function()
local __f61_root = __oak_acc(__f61_p, (function()
return __parseInt((function()
return (__f61_i - 1)
end)()
)
end)()
);
local __f61_uxX = (function()
return (__oak_acc(__f61_p, (function()
return __f61_i
end)()
)["x"] - __f61_root["x"])
end)()
;
local __f61_uxY = (function()
return (__oak_acc(__f61_p, (function()
return __f61_i
end)()
)["y"] - __f61_root["y"])
end)()
;
local __f61_length = __Math["sqrt"](__add((function()
return (__f61_uxX * __f61_uxX)
end)()
, (function()
return (__f61_uxY * __f61_uxY)
end)()
));
__f61_uxX = (function()
return (__f61_uxX / __f61_length)
end)()
;
__f61_uxY = (function()
return (__f61_uxY / __f61_length)
end)()
;
local __f61_uyX = (function()
return (-__f61_uxY)
end)()
;
local __f61_uyY = __f61_uxX;
local __f61_lowerX = __Number["MAX_VALUE"];
local __f61_lowerY = __Number["MAX_VALUE"];
local __f61_upperX = (function()
return (-__Number["MAX_VALUE"])
end)()
;
local __f61_upperY = (function()
return (-__Number["MAX_VALUE"])
end)()
;
(function()
local __f61_j = 0;
local function __loop35()
return (function()
local __oak_cond = (function()
return (__f61_j < __f61_count)
end)()

if __oak_eq(__oak_cond, true) then return (function()
local __r = (function()
return (function()
local __f61_dX = (function()
return (__oak_acc(__f61_p, (function()
return __f61_j
end)()
)["x"] - __f61_root["x"])
end)()
;
local __f61_dY = (function()
return (__oak_acc(__f61_p, (function()
return __f61_j
end)()
)["y"] - __f61_root["y"])
end)()
;
local __f61_rX = __add((function()
return (__f61_uxX * __f61_dX)
end)()
, (function()
return (__f61_uxY * __f61_dY)
end)()
);
local __f61_rY = __add((function()
return (__f61_uyX * __f61_dX)
end)()
, (function()
return (__f61_uyY * __f61_dY)
end)()
);
(function()
local __oak_cond = __truthy((function()
return (__f61_rX < __f61_lowerX)
end)()
)
if __oak_eq(__oak_cond, true) then __f61_lowerX = __f61_rX
return __f61_lowerX
else return __noop()
end
end)()
;
(function()
local __oak_cond = __truthy((function()
return (__f61_rY < __f61_lowerY)
end)()
)
if __oak_eq(__oak_cond, true) then __f61_lowerY = __f61_rY
return __f61_lowerY
else return __noop()
end
end)()
;
(function()
local __oak_cond = __truthy((function()
return (__f61_rX > __f61_upperX)
end)()
)
if __oak_eq(__oak_cond, true) then __f61_upperX = __f61_rX
return __f61_upperX
else return __noop()
end
end)()
;
return (function()
local __oak_cond = __truthy((function()
return (__f61_rY > __f61_upperY)
end)()
)
if __oak_eq(__oak_cond, true) then __f61_upperY = __f61_rY
return __f61_upperY
else return __noop()
end
end)()

end)()

end)()
;
return (function()
local __oak_cond = __r
if __oak_eq(__oak_cond, 'break') then return nil
else return (function()
(function()
__f61_j = __as_oak_string(__f61_j + 1)
return __f61_j
end)()
;
return __loop35()
end)()

end
end)()

end)()

else return nil
end
end)()

end;
return __loop35()
end)()
;
local __f61_area = (function()
return ((function()
return (__f61_upperX - __f61_lowerX)
end)()
 * (function()
return (__f61_upperY - __f61_lowerY)
end)()
)
end)()
;
return (function()
local __oak_cond = __truthy((function()
return (__f61_area < (function()
return (0.95 * __f61_minArea)
end)()
)
end)()
)
if __oak_eq(__oak_cond, true) then return (function()
__f61_minArea = __f61_area;
__f61_obb["R"]["col1"]["x"] = __f61_uxX;
__f61_obb["R"]["col1"]["y"] = __f61_uxY;
__f61_obb["R"]["col2"]["x"] = __f61_uyX;
__f61_obb["R"]["col2"]["y"] = __f61_uyY;
local __f61_centerX = (function()
return (0.5 * __add(__f61_lowerX, __f61_upperX))
end)()
;
local __f61_centerY = (function()
return (0.5 * __add(__f61_lowerY, __f61_upperY))
end)()
;
local __f61_tMat = __f61_obb["R"];
__f61_obb["center"]["x"] = __add(__f61_root["x"], __add((function()
return (__f61_tMat["col1"]["x"] * __f61_centerX)
end)()
, (function()
return (__f61_tMat["col2"]["x"] * __f61_centerY)
end)()
));
__f61_obb["center"]["y"] = __add(__f61_root["y"], __add((function()
return (__f61_tMat["col1"]["y"] * __f61_centerX)
end)()
, (function()
return (__f61_tMat["col2"]["y"] * __f61_centerY)
end)()
));
__f61_obb["extents"]["x"] = (function()
return (0.5 * (function()
return (__f61_upperX - __f61_lowerX)
end)()
)
end)()
;
__f61_obb["extents"]["y"] = (function()
return (0.5 * (function()
return (__f61_upperY - __f61_lowerY)
end)()
)
end)()

return __f61_obb["extents"]["y"]
end)()

else return __noop()
end
end)()

end)()

end)()
;
return (function()
local __oak_cond = __r
if __oak_eq(__oak_cond, 'break') then return nil
else return (function()
(function()
__f61_i = __as_oak_string(__f61_i + 1)
return __f61_i
end)()
;
return __loop33()
end)()

end
end)()

end)()

else return nil
end
end)()

end;
return __loop33()
end)()

end;
b2PolygonShape = function()
local self = b2Shape();
self["__type"] = 'b2PolygonShape';
self["__types"] = {'b2PolygonShape', 'b2Shape'};
self["__super"] = __proto_b2Shape;
self["Copy"] = __proto_b2PolygonShape["Copy"];
self["Set"] = __proto_b2PolygonShape["Set"];
self["SetAsArray"] = __proto_b2PolygonShape["SetAsArray"];
self["SetAsVector"] = __proto_b2PolygonShape["SetAsVector"];
self["SetAsBox"] = __proto_b2PolygonShape["SetAsBox"];
self["SetAsOrientedBox"] = __proto_b2PolygonShape["SetAsOrientedBox"];
self["SetAsEdge"] = __proto_b2PolygonShape["SetAsEdge"];
self["TestPoint"] = __proto_b2PolygonShape["TestPoint"];
self["RayCast"] = __proto_b2PolygonShape["RayCast"];
self["ComputeAABB"] = __proto_b2PolygonShape["ComputeAABB"];
self["ComputeMass"] = __proto_b2PolygonShape["ComputeMass"];
self["ComputeSubmergedArea"] = __proto_b2PolygonShape["ComputeSubmergedArea"];
self["GetVertexCount"] = __proto_b2PolygonShape["GetVertexCount"];
self["GetVertices"] = __proto_b2PolygonShape["GetVertices"];
self["GetNormals"] = __proto_b2PolygonShape["GetNormals"];
self["GetSupport"] = __proto_b2PolygonShape["GetSupport"];
self["GetSupportVertex"] = __proto_b2PolygonShape["GetSupportVertex"];
self["Validate"] = __proto_b2PolygonShape["Validate"];
self["Reserve"] = __proto_b2PolygonShape["Reserve"];
(function()
Box2D["Collision"]["Shapes"]["b2Shape"]["b2Shape"](self);
self["__super"]["b2Shape"](self);
self["m_type"] = __static_b2Shape["e_polygonShape"];
self["m_centroid"] = b2Vec2();
self["m_vertices"] = __newArray();
self["m_normals"] = __newArray()
return self["m_normals"]
end)()
;
return self
end;
Box2D["Collision"]["Shapes"]["b2PolygonShape"] = b2PolygonShape;
__proto_b2CircleContact = {};
__proto_b2CircleContact["Reset"] = function(self, __f63_fixtureA, __f63_fixtureB)
return self["__super"]["Reset"](self, __f63_fixtureA, __f63_fixtureB)
end;
__proto_b2CircleContact["Evaluate"] = function(self)
local __f64_bA = self["m_fixtureA"]["GetBody"](self["m_fixtureA"]);
local __f64_bB = self["m_fixtureB"]["GetBody"](self["m_fixtureB"]);
return __static_b2Collision["CollideCircles"](self["m_manifold"], (function()
local __oak_cond = __truthy(__instanceof(self["m_fixtureA"]["GetShape"](self["m_fixtureA"]), 'b2CircleShape'))
if __oak_eq(__oak_cond, true) then return self["m_fixtureA"]["GetShape"](self["m_fixtureA"])
else return nil
end
end)()
, __f64_bA["m_xf"], (function()
local __oak_cond = __truthy(__instanceof(self["m_fixtureB"]["GetShape"](self["m_fixtureB"]), 'b2CircleShape'))
if __oak_eq(__oak_cond, true) then return self["m_fixtureB"]["GetShape"](self["m_fixtureB"])
else return nil
end
end)()
, __f64_bB["m_xf"])
end;
__static_b2CircleContact = {};
__static_b2CircleContact["Create"] = function(__f65_allocator)
return b2CircleContact()
end;
__static_b2CircleContact["Destroy"] = function(__f66_contact, __f66_allocator)
return nil
end;
b2CircleContact = function()
local self = b2Contact();
self["__type"] = 'b2CircleContact';
self["__types"] = {'b2CircleContact', 'b2Contact'};
self["__super"] = __proto_b2Contact;
self["Reset"] = __proto_b2CircleContact["Reset"];
self["Evaluate"] = __proto_b2CircleContact["Evaluate"];
Box2D["Dynamics"]["Contacts"]["b2Contact"]["b2Contact"](self);
return self
end;
Box2D["Dynamics"]["Contacts"]["b2CircleContact"] = b2CircleContact;
__proto_b2EdgeAndCircleContact = {};
__proto_b2EdgeAndCircleContact["Reset"] = function(self, __f68_fixtureA, __f68_fixtureB)
return self["__super"]["Reset"](self, __f68_fixtureA, __f68_fixtureB)
end;
__proto_b2EdgeAndCircleContact["Evaluate"] = function(self)
local __f69_bA = self["m_fixtureA"]["GetBody"](self["m_fixtureA"]);
local __f69_bB = self["m_fixtureB"]["GetBody"](self["m_fixtureB"]);
return self["b2CollideEdgeAndCircle"](self, self["m_manifold"], (function()
local __oak_cond = __truthy(__instanceof(self["m_fixtureA"]["GetShape"](self["m_fixtureA"]), 'b2EdgeShape'))
if __oak_eq(__oak_cond, true) then return self["m_fixtureA"]["GetShape"](self["m_fixtureA"])
else return nil
end
end)()
, __f69_bA["m_xf"], (function()
local __oak_cond = __truthy(__instanceof(self["m_fixtureB"]["GetShape"](self["m_fixtureB"]), 'b2CircleShape'))
if __oak_eq(__oak_cond, true) then return self["m_fixtureB"]["GetShape"](self["m_fixtureB"])
else return nil
end
end)()
, __f69_bB["m_xf"])
end;
__proto_b2EdgeAndCircleContact["b2CollideEdgeAndCircle"] = function(self, __f70_manifold, __f70_edge, __f70_xf1, __f70_circle, __f70_xf2)
return nil
end;
__static_b2EdgeAndCircleContact = {};
__static_b2EdgeAndCircleContact["Create"] = function(__f71_allocator)
return b2EdgeAndCircleContact()
end;
__static_b2EdgeAndCircleContact["Destroy"] = function(__f72_contact, __f72_allocator)
return nil
end;
b2EdgeAndCircleContact = function()
local self = b2Contact();
self["__type"] = 'b2EdgeAndCircleContact';
self["__types"] = {'b2EdgeAndCircleContact', 'b2Contact'};
self["__super"] = __proto_b2Contact;
self["Reset"] = __proto_b2EdgeAndCircleContact["Reset"];
self["Evaluate"] = __proto_b2EdgeAndCircleContact["Evaluate"];
self["b2CollideEdgeAndCircle"] = __proto_b2EdgeAndCircleContact["b2CollideEdgeAndCircle"];
Box2D["Dynamics"]["Contacts"]["b2Contact"]["b2Contact"](self);
return self
end;
Box2D["Dynamics"]["Contacts"]["b2EdgeAndCircleContact"] = b2EdgeAndCircleContact;
__proto_b2NullContact = {};
__proto_b2NullContact["Evaluate"] = function(self)
return nil
end;
__static_b2NullContact = {};
b2NullContact = function()
local self = b2Contact();
self["__type"] = 'b2NullContact';
self["__types"] = {'b2NullContact', 'b2Contact'};
self["__super"] = __proto_b2Contact;
self["Evaluate"] = __proto_b2NullContact["Evaluate"];
(function()
Box2D["Dynamics"]["Contacts"]["b2Contact"]["b2Contact"](self);
return self["__super"]["b2Contact"](self)
end)()
;
return self
end;
Box2D["Dynamics"]["Contacts"]["b2NullContact"] = b2NullContact;
__proto_b2PolyAndCircleContact = {};
__proto_b2PolyAndCircleContact["Reset"] = function(self, __f76_fixtureA, __f76_fixtureB)
self["__super"]["Reset"](self, __f76_fixtureA, __f76_fixtureB);
__static_b2Settings["b2Assert"]((function()
return __oak_eq(__f76_fixtureA["GetType"](__f76_fixtureA), __static_b2Shape["e_polygonShape"])
end)()
);
return __static_b2Settings["b2Assert"]((function()
return __oak_eq(__f76_fixtureB["GetType"](__f76_fixtureB), __static_b2Shape["e_circleShape"])
end)()
)
end;
__proto_b2PolyAndCircleContact["Evaluate"] = function(self)
local __f77_bA = self["m_fixtureA"]["m_body"];
local __f77_bB = self["m_fixtureB"]["m_body"];
return __static_b2Collision["CollidePolygonAndCircle"](self["m_manifold"], (function()
local __oak_cond = __truthy(__instanceof(self["m_fixtureA"]["GetShape"](self["m_fixtureA"]), 'b2PolygonShape'))
if __oak_eq(__oak_cond, true) then return self["m_fixtureA"]["GetShape"](self["m_fixtureA"])
else return nil
end
end)()
, __f77_bA["m_xf"], (function()
local __oak_cond = __truthy(__instanceof(self["m_fixtureB"]["GetShape"](self["m_fixtureB"]), 'b2CircleShape'))
if __oak_eq(__oak_cond, true) then return self["m_fixtureB"]["GetShape"](self["m_fixtureB"])
else return nil
end
end)()
, __f77_bB["m_xf"])
end;
__static_b2PolyAndCircleContact = {};
__static_b2PolyAndCircleContact["Create"] = function(__f78_allocator)
return b2PolyAndCircleContact()
end;
__static_b2PolyAndCircleContact["Destroy"] = function(__f79_contact, __f79_allocator)
return nil
end;
b2PolyAndCircleContact = function()
local self = b2Contact();
self["__type"] = 'b2PolyAndCircleContact';
self["__types"] = {'b2PolyAndCircleContact', 'b2Contact'};
self["__super"] = __proto_b2Contact;
self["Reset"] = __proto_b2PolyAndCircleContact["Reset"];
self["Evaluate"] = __proto_b2PolyAndCircleContact["Evaluate"];
Box2D["Dynamics"]["Contacts"]["b2Contact"]["b2Contact"](self);
return self
end;
Box2D["Dynamics"]["Contacts"]["b2PolyAndCircleContact"] = b2PolyAndCircleContact;
__proto_b2PolyAndEdgeContact = {};
__proto_b2PolyAndEdgeContact["Reset"] = function(self, __f81_fixtureA, __f81_fixtureB)
self["__super"]["Reset"](self, __f81_fixtureA, __f81_fixtureB);
__static_b2Settings["b2Assert"]((function()
return __oak_eq(__f81_fixtureA["GetType"](__f81_fixtureA), __static_b2Shape["e_polygonShape"])
end)()
);
return __static_b2Settings["b2Assert"]((function()
return __oak_eq(__f81_fixtureB["GetType"](__f81_fixtureB), __static_b2Shape["e_edgeShape"])
end)()
)
end;
__proto_b2PolyAndEdgeContact["Evaluate"] = function(self)
local __f82_bA = self["m_fixtureA"]["GetBody"](self["m_fixtureA"]);
local __f82_bB = self["m_fixtureB"]["GetBody"](self["m_fixtureB"]);
return self["b2CollidePolyAndEdge"](self, self["m_manifold"], (function()
local __oak_cond = __truthy(__instanceof(self["m_fixtureA"]["GetShape"](self["m_fixtureA"]), 'b2PolygonShape'))
if __oak_eq(__oak_cond, true) then return self["m_fixtureA"]["GetShape"](self["m_fixtureA"])
else return nil
end
end)()
, __f82_bA["m_xf"], (function()
local __oak_cond = __truthy(__instanceof(self["m_fixtureB"]["GetShape"](self["m_fixtureB"]), 'b2EdgeShape'))
if __oak_eq(__oak_cond, true) then return self["m_fixtureB"]["GetShape"](self["m_fixtureB"])
else return nil
end
end)()
, __f82_bB["m_xf"])
end;
__proto_b2PolyAndEdgeContact["b2CollidePolyAndEdge"] = function(self, __f83_manifold, __f83_polygon, __f83_xf1, __f83_edge, __f83_xf2)
return nil
end;
__static_b2PolyAndEdgeContact = {};
__static_b2PolyAndEdgeContact["Create"] = function(__f84_allocator)
return b2PolyAndEdgeContact()
end;
__static_b2PolyAndEdgeContact["Destroy"] = function(__f85_contact, __f85_allocator)
return nil
end;
b2PolyAndEdgeContact = function()
local self = b2Contact();
self["__type"] = 'b2PolyAndEdgeContact';
self["__types"] = {'b2PolyAndEdgeContact', 'b2Contact'};
self["__super"] = __proto_b2Contact;
self["Reset"] = __proto_b2PolyAndEdgeContact["Reset"];
self["Evaluate"] = __proto_b2PolyAndEdgeContact["Evaluate"];
self["b2CollidePolyAndEdge"] = __proto_b2PolyAndEdgeContact["b2CollidePolyAndEdge"];
Box2D["Dynamics"]["Contacts"]["b2Contact"]["b2Contact"](self);
return self
end;
Box2D["Dynamics"]["Contacts"]["b2PolyAndEdgeContact"] = b2PolyAndEdgeContact;
__proto_b2PolygonContact = {};
__proto_b2PolygonContact["Reset"] = function(self, __f87_fixtureA, __f87_fixtureB)
return self["__super"]["Reset"](self, __f87_fixtureA, __f87_fixtureB)
end;
__proto_b2PolygonContact["Evaluate"] = function(self)
local __f88_bA = self["m_fixtureA"]["GetBody"](self["m_fixtureA"]);
local __f88_bB = self["m_fixtureB"]["GetBody"](self["m_fixtureB"]);
return __static_b2Collision["CollidePolygons"](self["m_manifold"], (function()
local __oak_cond = __truthy(__instanceof(self["m_fixtureA"]["GetShape"](self["m_fixtureA"]), 'b2PolygonShape'))
if __oak_eq(__oak_cond, true) then return self["m_fixtureA"]["GetShape"](self["m_fixtureA"])
else return nil
end
end)()
, __f88_bA["m_xf"], (function()
local __oak_cond = __truthy(__instanceof(self["m_fixtureB"]["GetShape"](self["m_fixtureB"]), 'b2PolygonShape'))
if __oak_eq(__oak_cond, true) then return self["m_fixtureB"]["GetShape"](self["m_fixtureB"])
else return nil
end
end)()
, __f88_bB["m_xf"])
end;
__static_b2PolygonContact = {};
__static_b2PolygonContact["Create"] = function(__f89_allocator)
return b2PolygonContact()
end;
__static_b2PolygonContact["Destroy"] = function(__f90_contact, __f90_allocator)
return nil
end;
b2PolygonContact = function()
local self = b2Contact();
self["__type"] = 'b2PolygonContact';
self["__types"] = {'b2PolygonContact', 'b2Contact'};
self["__super"] = __proto_b2Contact;
self["Reset"] = __proto_b2PolygonContact["Reset"];
self["Evaluate"] = __proto_b2PolygonContact["Evaluate"];
Box2D["Dynamics"]["Contacts"]["b2Contact"]["b2Contact"](self);
return self
end;
Box2D["Dynamics"]["Contacts"]["b2PolygonContact"] = b2PolygonContact;
__proto_b2BuoyancyController = {};
__proto_b2BuoyancyController["Step"] = function(self, __f92_step)
return (function()
local __oak_cond = __truthy(__not(self["m_bodyList"]))
if __oak_eq(__oak_cond, true) then return __noop()
else return (function()
(function()
local __oak_cond = __truthy(self["useWorldGravity"])
if __oak_eq(__oak_cond, true) then self["gravity"] = self["GetWorld"](self)["GetGravity"](self["GetWorld"](self))["Copy"](self["GetWorld"](self)["GetGravity"](self["GetWorld"](self)))
return self["gravity"]
else return __noop()
end
end)()
;
return (function()
local __f92_i = self["m_bodyList"];
local function __loop37()
return (function()
local __oak_cond = __f92_i
if __oak_eq(__oak_cond, true) then return (function()
local __r = (function()
return (function()
local __f92_body = __f92_i["body"];
(function()
local __oak_cond = __truthy((function()
return __oak_eq(__f92_body["IsAwake"](__f92_body), false)
end)()
)
if __oak_eq(__oak_cond, true) then return 'continue'
else return __noop()
end
end)()
;
local __f92_areac = b2Vec2();
local __f92_massc = b2Vec2();
local __f92_area = 0;
local __f92_mass = 0;
(function()
local __f92_fixture = __f92_body["GetFixtureList"](__f92_body);
local function __loop38()
return (function()
local __oak_cond = __f92_fixture
if __oak_eq(__oak_cond, true) then return (function()
local __r = (function()
return (function()
local __f92_sc = b2Vec2();
local __f92_sarea = __f92_fixture["GetShape"](__f92_fixture)["ComputeSubmergedArea"](__f92_fixture["GetShape"](__f92_fixture), self["normal"], self["offset"], __f92_body["GetTransform"](__f92_body), __f92_sc);
__f92_area = __add(__f92_area, __f92_sarea);
__f92_areac["x"] = __add(__f92_areac["x"], (function()
return (__f92_sarea * __f92_sc["x"])
end)()
);
__f92_areac["y"] = __add(__f92_areac["y"], (function()
return (__f92_sarea * __f92_sc["y"])
end)()
);
local __f92_shapeDensity = 0;
(function()
local __oak_cond = __truthy(self["useDensity"])
if __oak_eq(__oak_cond, true) then __f92_shapeDensity = 1
return __f92_shapeDensity
else __f92_shapeDensity = 1
return __f92_shapeDensity
end
end)()
;
__f92_mass = __add(__f92_mass, (function()
return (__f92_sarea * __f92_shapeDensity)
end)()
);
__f92_massc["x"] = __add(__f92_massc["x"], (function()
return ((function()
return (__f92_sarea * __f92_sc["x"])
end)()
 * __f92_shapeDensity)
end)()
);
__f92_massc["y"] = __add(__f92_massc["y"], (function()
return ((function()
return (__f92_sarea * __f92_sc["y"])
end)()
 * __f92_shapeDensity)
end)()
)
return __f92_massc["y"]
end)()

end)()
;
return (function()
local __oak_cond = __r
if __oak_eq(__oak_cond, 'break') then return nil
else return (function()
__f92_fixture = __f92_fixture["GetNext"](__f92_fixture);
return __loop38()
end)()

end
end)()

end)()

else return nil
end
end)()

end;
return __loop38()
end)()
;
__f92_areac["x"] = (function()
return (__f92_areac["x"] / __f92_area)
end)()
;
__f92_areac["y"] = (function()
return (__f92_areac["y"] / __f92_area)
end)()
;
__f92_massc["x"] = (function()
return (__f92_massc["x"] / __f92_mass)
end)()
;
__f92_massc["y"] = (function()
return (__f92_massc["y"] / __f92_mass)
end)()
;
(function()
local __oak_cond = __truthy((function()
return (__f92_area < __Number["MIN_VALUE"])
end)()
)
if __oak_eq(__oak_cond, true) then return 'continue'
else return __noop()
end
end)()
;
local __f92_buoyancyForce = self["gravity"]["GetNegative"](self["gravity"]);
__f92_buoyancyForce["Multiply"](__f92_buoyancyForce, (function()
return (self["density"] * __f92_area)
end)()
);
__f92_body["ApplyForce"](__f92_body, __f92_buoyancyForce, __f92_massc);
local __f92_dragForce = __f92_body["GetLinearVelocityFromWorldPoint"](__f92_body, __f92_areac);
__f92_dragForce["Subtract"](__f92_dragForce, self["velocity"]);
__f92_dragForce["Multiply"](__f92_dragForce, (function()
return ((function()
return (-self["linearDrag"])
end)()
 * __f92_area)
end)()
);
__f92_body["ApplyForce"](__f92_body, __f92_dragForce, __f92_areac);
return __f92_body["ApplyTorque"](__f92_body, (function()
return ((function()
return ((function()
return ((function()
return ((function()
return (-__f92_body["GetInertia"](__f92_body))
end)()
 / __f92_body["GetMass"](__f92_body))
end)()
 * __f92_area)
end)()
 * __f92_body["GetAngularVelocity"](__f92_body))
end)()
 * self["angularDrag"])
end)()
)
end)()

end)()
;
return (function()
local __oak_cond = __r
if __oak_eq(__oak_cond, 'break') then return nil
else return (function()
__f92_i = __f92_i["nextBody"];
return __loop37()
end)()

end
end)()

end)()

else return nil
end
end)()

end;
return __loop37()
end)()

end)()

end
end)()

end;
__proto_b2BuoyancyController["Draw"] = function(self, __f93_debugDraw)
local __f93_r = 1000;
local __f93_p1 = b2Vec2();
local __f93_p2 = b2Vec2();
__f93_p1["x"] = __add((function()
return (self["normal"]["x"] * self["offset"])
end)()
, (function()
return (self["normal"]["y"] * __f93_r)
end)()
);
__f93_p1["y"] = (function()
return ((function()
return (self["normal"]["y"] * self["offset"])
end)()
 - (function()
return (self["normal"]["x"] * __f93_r)
end)()
)
end)()
;
__f93_p2["x"] = (function()
return ((function()
return (self["normal"]["x"] * self["offset"])
end)()
 - (function()
return (self["normal"]["y"] * __f93_r)
end)()
)
end)()
;
__f93_p2["y"] = __add((function()
return (self["normal"]["y"] * self["offset"])
end)()
, (function()
return (self["normal"]["x"] * __f93_r)
end)()
);
local __f93_color = b2Color(0, 0, 1);
return __f93_debugDraw["DrawSegment"](__f93_debugDraw, __f93_p1, __f93_p2, __f93_color)
end;
__static_b2BuoyancyController = {};
b2BuoyancyController = function()
local self = b2Controller();
self["__type"] = 'b2BuoyancyController';
self["__types"] = {'b2BuoyancyController', 'b2Controller'};
self["__super"] = __proto_b2Controller;
self["Step"] = __proto_b2BuoyancyController["Step"];
self["Draw"] = __proto_b2BuoyancyController["Draw"];
(function()
Box2D["Dynamics"]["Controllers"]["b2Controller"]["b2Controller"](self);
self["normal"] = b2Vec2(0, (function()
return (-1)
end)()
);
self["offset"] = 0;
self["density"] = 0;
self["velocity"] = b2Vec2(0, 0);
self["linearDrag"] = 2;
self["angularDrag"] = 1;
self["useDensity"] = false;
self["useWorldGravity"] = true;
self["gravity"] = nil
return self["gravity"]
end)()
;
return self
end;
Box2D["Dynamics"]["Controllers"]["b2BuoyancyController"] = b2BuoyancyController;
__proto_b2ConstantAccelController = {};
__proto_b2ConstantAccelController["Step"] = function(self, __f95_step)
local __f95_smallA = b2Vec2((function()
return (self["A"]["x"] * __f95_step["dt"])
end)()
, (function()
return (self["A"]["y"] * __f95_step["dt"])
end)()
);
return (function()
local __f95_i = self["m_bodyList"];
local function __loop39()
return (function()
local __oak_cond = __f95_i
if __oak_eq(__oak_cond, true) then return (function()
local __r = (function()
return (function()
local __f95_body = __f95_i["body"];
(function()
local __oak_cond = __truthy(__not(__f95_body["IsAwake"](__f95_body)))
if __oak_eq(__oak_cond, true) then return 'continue'
else return __noop()
end
end)()
;
return __f95_body["SetLinearVelocity"](__f95_body, b2Vec2(__add(__f95_body["GetLinearVelocity"](__f95_body)["x"], __f95_smallA["x"]), __add(__f95_body["GetLinearVelocity"](__f95_body)["y"], __f95_smallA["y"])))
end)()

end)()
;
return (function()
local __oak_cond = __r
if __oak_eq(__oak_cond, 'break') then return nil
else return (function()
__f95_i = __f95_i["nextBody"];
return __loop39()
end)()

end
end)()

end)()

else return nil
end
end)()

end;
return __loop39()
end)()

end;
__static_b2ConstantAccelController = {};
b2ConstantAccelController = function()
local self = b2Controller();
self["__type"] = 'b2ConstantAccelController';
self["__types"] = {'b2ConstantAccelController', 'b2Controller'};
self["__super"] = __proto_b2Controller;
self["Step"] = __proto_b2ConstantAccelController["Step"];
(function()
Box2D["Dynamics"]["Controllers"]["b2Controller"]["b2Controller"](self);
self["A"] = b2Vec2(0, 0)
return self["A"]
end)()
;
return self
end;
Box2D["Dynamics"]["Controllers"]["b2ConstantAccelController"] = b2ConstantAccelController;
__proto_b2ConstantForceController = {};
__proto_b2ConstantForceController["Step"] = function(self, __f97_step)
local __f97_i = self["m_bodyList"];
local function __loop40()
return (function()
local __oak_cond = __f97_i
if __oak_eq(__oak_cond, true) then return (function()
local __r = (function()
return (function()
local __f97_body = __f97_i["body"];
(function()
local __oak_cond = __truthy(__not(__f97_body["IsAwake"](__f97_body)))
if __oak_eq(__oak_cond, true) then return 'continue'
else return __noop()
end
end)()
;
return __f97_body["ApplyForce"](__f97_body, self["F"], __f97_body["GetWorldCenter"](__f97_body))
end)()

end)()
;
return (function()
local __oak_cond = __r
if __oak_eq(__oak_cond, 'break') then return nil
else return (function()
__f97_i = __f97_i["nextBody"];
return __loop40()
end)()

end
end)()

end)()

else return nil
end
end)()

end;
return __loop40()
end;
__static_b2ConstantForceController = {};
b2ConstantForceController = function()
local self = b2Controller();
self["__type"] = 'b2ConstantForceController';
self["__types"] = {'b2ConstantForceController', 'b2Controller'};
self["__super"] = __proto_b2Controller;
self["Step"] = __proto_b2ConstantForceController["Step"];
(function()
Box2D["Dynamics"]["Controllers"]["b2Controller"]["b2Controller"](self);
self["F"] = b2Vec2(0, 0)
return self["F"]
end)()
;
return self
end;
Box2D["Dynamics"]["Controllers"]["b2ConstantForceController"] = b2ConstantForceController;
__proto_b2GravityController = {};
__proto_b2GravityController["Step"] = function(self, __f99_step)
local __f99_i = nil;
local __f99_body1 = nil;
local __f99_p1 = nil;
local __f99_mass1 = 0;
local __f99_j = nil;
local __f99_body2 = nil;
local __f99_p2 = nil;
local __f99_dx = 0;
local __f99_dy = 0;
local __f99_r2 = 0;
local __f99_f = nil;
return (function()
local __oak_cond = __truthy(self["invSqr"])
if __oak_eq(__oak_cond, true) then return (function()
__f99_i = self["m_bodyList"];
local function __loop41()
return (function()
local __oak_cond = __f99_i
if __oak_eq(__oak_cond, true) then return (function()
local __r = (function()
return (function()
__f99_body1 = __f99_i["body"];
__f99_p1 = __f99_body1["GetWorldCenter"](__f99_body1);
__f99_mass1 = __f99_body1["GetMass"](__f99_body1);
return (function()
__f99_j = self["m_bodyList"];
local function __loop42()
return (function()
local __oak_cond = (function()
return (not __oak_eq(__f99_j, __f99_i))
end)()

if __oak_eq(__oak_cond, true) then return (function()
local __r = (function()
return (function()
__f99_body2 = __f99_j["body"];
__f99_p2 = __f99_body2["GetWorldCenter"](__f99_body2);
__f99_dx = (function()
return (__f99_p2["x"] - __f99_p1["x"])
end)()
;
__f99_dy = (function()
return (__f99_p2["y"] - __f99_p1["y"])
end)()
;
__f99_r2 = __add((function()
return (__f99_dx * __f99_dx)
end)()
, (function()
return (__f99_dy * __f99_dy)
end)()
);
(function()
local __oak_cond = __truthy((function()
return (__f99_r2 < __Number["MIN_VALUE"])
end)()
)
if __oak_eq(__oak_cond, true) then return 'continue'
else return __noop()
end
end)()
;
__f99_f = b2Vec2(__f99_dx, __f99_dy);
__f99_f["Multiply"](__f99_f, (function()
return ((function()
return ((function()
return ((function()
return (self["G"] / __f99_r2)
end)()
 / __Math["sqrt"](__f99_r2))
end)()
 * __f99_mass1)
end)()
 * __f99_body2["GetMass"](__f99_body2))
end)()
);
(function()
local __oak_cond = __truthy(__f99_body1["IsAwake"](__f99_body1))
if __oak_eq(__oak_cond, true) then return __f99_body1["ApplyForce"](__f99_body1, __f99_f, __f99_p1)
else return __noop()
end
end)()
;
__f99_f["Multiply"](__f99_f, (function()
return (-1)
end)()
);
return (function()
local __oak_cond = __truthy(__f99_body2["IsAwake"](__f99_body2))
if __oak_eq(__oak_cond, true) then return __f99_body2["ApplyForce"](__f99_body2, __f99_f, __f99_p2)
else return __noop()
end
end)()

end)()

end)()
;
return (function()
local __oak_cond = __r
if __oak_eq(__oak_cond, 'break') then return nil
else return (function()
__f99_j = __f99_j["nextBody"];
return __loop42()
end)()

end
end)()

end)()

else return nil
end
end)()

end;
return __loop42()
end)()

end)()

end)()
;
return (function()
local __oak_cond = __r
if __oak_eq(__oak_cond, 'break') then return nil
else return (function()
__f99_i = __f99_i["nextBody"];
return __loop41()
end)()

end
end)()

end)()

else return nil
end
end)()

end;
return __loop41()
end)()

else return (function()
__f99_i = self["m_bodyList"];
local function __loop43()
return (function()
local __oak_cond = __f99_i
if __oak_eq(__oak_cond, true) then return (function()
local __r = (function()
return (function()
__f99_body1 = __f99_i["body"];
__f99_p1 = __f99_body1["GetWorldCenter"](__f99_body1);
__f99_mass1 = __f99_body1["GetMass"](__f99_body1);
return (function()
__f99_j = self["m_bodyList"];
local function __loop44()
return (function()
local __oak_cond = (function()
return (not __oak_eq(__f99_j, __f99_i))
end)()

if __oak_eq(__oak_cond, true) then return (function()
local __r = (function()
return (function()
__f99_body2 = __f99_j["body"];
__f99_p2 = __f99_body2["GetWorldCenter"](__f99_body2);
__f99_dx = (function()
return (__f99_p2["x"] - __f99_p1["x"])
end)()
;
__f99_dy = (function()
return (__f99_p2["y"] - __f99_p1["y"])
end)()
;
__f99_r2 = __add((function()
return (__f99_dx * __f99_dx)
end)()
, (function()
return (__f99_dy * __f99_dy)
end)()
);
(function()
local __oak_cond = __truthy((function()
return (__f99_r2 < __Number["MIN_VALUE"])
end)()
)
if __oak_eq(__oak_cond, true) then return 'continue'
else return __noop()
end
end)()
;
__f99_f = b2Vec2(__f99_dx, __f99_dy);
__f99_f["Multiply"](__f99_f, (function()
return ((function()
return ((function()
return (self["G"] / __f99_r2)
end)()
 * __f99_mass1)
end)()
 * __f99_body2["GetMass"](__f99_body2))
end)()
);
(function()
local __oak_cond = __truthy(__f99_body1["IsAwake"](__f99_body1))
if __oak_eq(__oak_cond, true) then return __f99_body1["ApplyForce"](__f99_body1, __f99_f, __f99_p1)
else return __noop()
end
end)()
;
__f99_f["Multiply"](__f99_f, (function()
return (-1)
end)()
);
return (function()
local __oak_cond = __truthy(__f99_body2["IsAwake"](__f99_body2))
if __oak_eq(__oak_cond, true) then return __f99_body2["ApplyForce"](__f99_body2, __f99_f, __f99_p2)
else return __noop()
end
end)()

end)()

end)()
;
return (function()
local __oak_cond = __r
if __oak_eq(__oak_cond, 'break') then return nil
else return (function()
__f99_j = __f99_j["nextBody"];
return __loop44()
end)()

end
end)()

end)()

else return nil
end
end)()

end;
return __loop44()
end)()

end)()

end)()
;
return (function()
local __oak_cond = __r
if __oak_eq(__oak_cond, 'break') then return nil
else return (function()
__f99_i = __f99_i["nextBody"];
return __loop43()
end)()

end
end)()

end)()

else return nil
end
end)()

end;
return __loop43()
end)()

end
end)()

end;
__static_b2GravityController = {};
b2GravityController = function()
local self = b2Controller();
self["__type"] = 'b2GravityController';
self["__types"] = {'b2GravityController', 'b2Controller'};
self["__super"] = __proto_b2Controller;
self["Step"] = __proto_b2GravityController["Step"];
(function()
Box2D["Dynamics"]["Controllers"]["b2Controller"]["b2Controller"](self);
self["G"] = 1;
self["invSqr"] = true
return self["invSqr"]
end)()
;
return self
end;
Box2D["Dynamics"]["Controllers"]["b2GravityController"] = b2GravityController;
__proto_b2TensorDampingController = {};
__proto_b2TensorDampingController["SetAxisAligned"] = function(self, __f101_xDamping, __f101_yDamping)
(function()
local __oak_cond = __truthy((function()
return __oak_eq(__f101_xDamping, nil)
end)()
)
if __oak_eq(__oak_cond, true) then __f101_xDamping = 0
return __f101_xDamping
else return __noop()
end
end)()
;
(function()
local __oak_cond = __truthy((function()
return __oak_eq(__f101_yDamping, nil)
end)()
)
if __oak_eq(__oak_cond, true) then __f101_yDamping = 0
return __f101_yDamping
else return __noop()
end
end)()
;
self["T"]["col1"]["x"] = (function()
return (-__f101_xDamping)
end)()
;
self["T"]["col1"]["y"] = 0;
self["T"]["col2"]["x"] = 0;
self["T"]["col2"]["y"] = (function()
return (-__f101_yDamping)
end)()
;
return (function()
local __oak_cond = __truthy(__or((function()
return (__f101_xDamping > 0)
end)()
, (function()
return (__f101_yDamping > 0)
end)()
))
if __oak_eq(__oak_cond, true) then self["maxTimestep"] = (function()
return (1 / __Math["max"](__f101_xDamping, __f101_yDamping))
end)()

return self["maxTimestep"]
else self["maxTimestep"] = 0
return self["maxTimestep"]
end
end)()

end;
__proto_b2TensorDampingController["Step"] = function(self, __f102_step)
local __f102_timestep = __f102_step["dt"];
return (function()
local __oak_cond = __truthy((function()
return (__f102_timestep <= __Number["MIN_VALUE"])
end)()
)
if __oak_eq(__oak_cond, true) then return __noop()
else return (function()
(function()
local __oak_cond = __truthy(__and((function()
return (__f102_timestep > self["maxTimestep"])
end)()
, (function()
return (self["maxTimestep"] > 0)
end)()
))
if __oak_eq(__oak_cond, true) then __f102_timestep = self["maxTimestep"]
return __f102_timestep
else return __noop()
end
end)()
;
return (function()
local __f102_i = self["m_bodyList"];
local function __loop45()
return (function()
local __oak_cond = __f102_i
if __oak_eq(__oak_cond, true) then return (function()
local __r = (function()
return (function()
local __f102_body = __f102_i["body"];
(function()
local __oak_cond = __truthy(__not(__f102_body["IsAwake"](__f102_body)))
if __oak_eq(__oak_cond, true) then return 'continue'
else return __noop()
end
end)()
;
local __f102_damping = __f102_body["GetWorldVector"](__f102_body, __static_b2Math["MulMV"](self["T"], __f102_body["GetLocalVector"](__f102_body, __f102_body["GetLinearVelocity"](__f102_body))));
return __f102_body["SetLinearVelocity"](__f102_body, b2Vec2(__add(__f102_body["GetLinearVelocity"](__f102_body)["x"], (function()
return (__f102_damping["x"] * __f102_timestep)
end)()
), __add(__f102_body["GetLinearVelocity"](__f102_body)["y"], (function()
return (__f102_damping["y"] * __f102_timestep)
end)()
)))
end)()

end)()
;
return (function()
local __oak_cond = __r
if __oak_eq(__oak_cond, 'break') then return nil
else return (function()
__f102_i = __f102_i["nextBody"];
return __loop45()
end)()

end
end)()

end)()

else return nil
end
end)()

end;
return __loop45()
end)()

end)()

end
end)()

end;
__static_b2TensorDampingController = {};
b2TensorDampingController = function()
local self = b2Controller();
self["__type"] = 'b2TensorDampingController';
self["__types"] = {'b2TensorDampingController', 'b2Controller'};
self["__super"] = __proto_b2Controller;
self["SetAxisAligned"] = __proto_b2TensorDampingController["SetAxisAligned"];
self["Step"] = __proto_b2TensorDampingController["Step"];
(function()
Box2D["Dynamics"]["Controllers"]["b2Controller"]["b2Controller"](self);
self["T"] = b2Mat22();
self["maxTimestep"] = 0
return self["maxTimestep"]
end)()
;
return self
end;
Box2D["Dynamics"]["Controllers"]["b2TensorDampingController"] = b2TensorDampingController;
__proto_b2DistanceJoint = {};
__proto_b2DistanceJoint["GetAnchorA"] = function(self)
return self["m_bodyA"]["GetWorldPoint"](self["m_bodyA"], self["m_localAnchor1"])
end;
__proto_b2DistanceJoint["GetAnchorB"] = function(self)
return self["m_bodyB"]["GetWorldPoint"](self["m_bodyB"], self["m_localAnchor2"])
end;
__proto_b2DistanceJoint["GetReactionForce"] = function(self, __f106_inv_dt)
(function()
local __oak_cond = __truthy((function()
return __oak_eq(__f106_inv_dt, nil)
end)()
)
if __oak_eq(__oak_cond, true) then __f106_inv_dt = 0
return __f106_inv_dt
else return __noop()
end
end)()
;
return b2Vec2((function()
return ((function()
return (__f106_inv_dt * self["m_impulse"])
end)()
 * self["m_u"]["x"])
end)()
, (function()
return ((function()
return (__f106_inv_dt * self["m_impulse"])
end)()
 * self["m_u"]["y"])
end)()
)
end;
__proto_b2DistanceJoint["GetReactionTorque"] = function(self, __f107_inv_dt)
(function()
local __oak_cond = __truthy((function()
return __oak_eq(__f107_inv_dt, nil)
end)()
)
if __oak_eq(__oak_cond, true) then __f107_inv_dt = 0
return __f107_inv_dt
else return __noop()
end
end)()
;
return 0
end;
__proto_b2DistanceJoint["GetLength"] = function(self)
return self["m_length"]
end;
__proto_b2DistanceJoint["SetLength"] = function(self, __f109_length)
(function()
local __oak_cond = __truthy((function()
return __oak_eq(__f109_length, nil)
end)()
)
if __oak_eq(__oak_cond, true) then __f109_length = 0
return __f109_length
else return __noop()
end
end)()
;
self["m_length"] = __f109_length
return self["m_length"]
end;
__proto_b2DistanceJoint["GetFrequency"] = function(self)
return self["m_frequencyHz"]
end;
__proto_b2DistanceJoint["SetFrequency"] = function(self, __f111_hz)
(function()
local __oak_cond = __truthy((function()
return __oak_eq(__f111_hz, nil)
end)()
)
if __oak_eq(__oak_cond, true) then __f111_hz = 0
return __f111_hz
else return __noop()
end
end)()
;
self["m_frequencyHz"] = __f111_hz
return self["m_frequencyHz"]
end;
__proto_b2DistanceJoint["GetDampingRatio"] = function(self)
return self["m_dampingRatio"]
end;
__proto_b2DistanceJoint["SetDampingRatio"] = function(self, __f113_ratio)
(function()
local __oak_cond = __truthy((function()
return __oak_eq(__f113_ratio, nil)
end)()
)
if __oak_eq(__oak_cond, true) then __f113_ratio = 0
return __f113_ratio
else return __noop()
end
end)()
;
self["m_dampingRatio"] = __f113_ratio
return self["m_dampingRatio"]
end;
__proto_b2DistanceJoint["InitVelocityConstraints"] = function(self, __f114_step)
local __f114_tMat = __noop();
local __f114_tX = 0;
local __f114_bA = self["m_bodyA"];
local __f114_bB = self["m_bodyB"];
__f114_tMat = __f114_bA["m_xf"]["R"];
local __f114_r1X = (function()
return (self["m_localAnchor1"]["x"] - __f114_bA["m_sweep"]["localCenter"]["x"])
end)()
;
local __f114_r1Y = (function()
return (self["m_localAnchor1"]["y"] - __f114_bA["m_sweep"]["localCenter"]["y"])
end)()
;
__f114_tX = __add((function()
return (__f114_tMat["col1"]["x"] * __f114_r1X)
end)()
, (function()
return (__f114_tMat["col2"]["x"] * __f114_r1Y)
end)()
);
__f114_r1Y = __add((function()
return (__f114_tMat["col1"]["y"] * __f114_r1X)
end)()
, (function()
return (__f114_tMat["col2"]["y"] * __f114_r1Y)
end)()
);
__f114_r1X = __f114_tX;
__f114_tMat = __f114_bB["m_xf"]["R"];
local __f114_r2X = (function()
return (self["m_localAnchor2"]["x"] - __f114_bB["m_sweep"]["localCenter"]["x"])
end)()
;
local __f114_r2Y = (function()
return (self["m_localAnchor2"]["y"] - __f114_bB["m_sweep"]["localCenter"]["y"])
end)()
;
__f114_tX = __add((function()
return (__f114_tMat["col1"]["x"] * __f114_r2X)
end)()
, (function()
return (__f114_tMat["col2"]["x"] * __f114_r2Y)
end)()
);
__f114_r2Y = __add((function()
return (__f114_tMat["col1"]["y"] * __f114_r2X)
end)()
, (function()
return (__f114_tMat["col2"]["y"] * __f114_r2Y)
end)()
);
__f114_r2X = __f114_tX;
self["m_u"]["x"] = (function()
return ((function()
return (__add(__f114_bB["m_sweep"]["c"]["x"], __f114_r2X) - __f114_bA["m_sweep"]["c"]["x"])
end)()
 - __f114_r1X)
end)()
;
self["m_u"]["y"] = (function()
return ((function()
return (__add(__f114_bB["m_sweep"]["c"]["y"], __f114_r2Y) - __f114_bA["m_sweep"]["c"]["y"])
end)()
 - __f114_r1Y)
end)()
;
local __f114_length = __Math["sqrt"](__add((function()
return (self["m_u"]["x"] * self["m_u"]["x"])
end)()
, (function()
return (self["m_u"]["y"] * self["m_u"]["y"])
end)()
));
(function()
local __oak_cond = __truthy((function()
return (__f114_length > __static_b2Settings["b2_linearSlop"])
end)()
)
if __oak_eq(__oak_cond, true) then return self["m_u"]["Multiply"](self["m_u"], (function()
return (1 / __f114_length)
end)()
)
else return self["m_u"]["SetZero"](self["m_u"])
end
end)()
;
local __f114_cr1u = (function()
return ((function()
return (__f114_r1X * self["m_u"]["y"])
end)()
 - (function()
return (__f114_r1Y * self["m_u"]["x"])
end)()
)
end)()
;
local __f114_cr2u = (function()
return ((function()
return (__f114_r2X * self["m_u"]["y"])
end)()
 - (function()
return (__f114_r2Y * self["m_u"]["x"])
end)()
)
end)()
;
local __f114_invMass = __add(__add(__add(__f114_bA["m_invMass"], (function()
return ((function()
return (__f114_bA["m_invI"] * __f114_cr1u)
end)()
 * __f114_cr1u)
end)()
), __f114_bB["m_invMass"]), (function()
return ((function()
return (__f114_bB["m_invI"] * __f114_cr2u)
end)()
 * __f114_cr2u)
end)()
);
self["m_mass"] = (function()
local __oak_cond = __truthy((function()
return (not __oak_eq(__f114_invMass, 0))
end)()
)
if __oak_eq(__oak_cond, true) then return (function()
return (1 / __f114_invMass)
end)()

else return 0
end
end)()
;
(function()
local __oak_cond = __truthy((function()
return (self["m_frequencyHz"] > 0)
end)()
)
if __oak_eq(__oak_cond, true) then return (function()
local __f114_C = (function()
return (__f114_length - self["m_length"])
end)()
;
local __f114_omega = (function()
return ((function()
return (2 * __Math["PI"])
end)()
 * self["m_frequencyHz"])
end)()
;
local __f114_d = (function()
return ((function()
return ((function()
return (2 * self["m_mass"])
end)()
 * self["m_dampingRatio"])
end)()
 * __f114_omega)
end)()
;
local __f114_k = (function()
return ((function()
return (self["m_mass"] * __f114_omega)
end)()
 * __f114_omega)
end)()
;
self["m_gamma"] = (function()
return (__f114_step["dt"] * __add(__f114_d, (function()
return (__f114_step["dt"] * __f114_k)
end)()
))
end)()
;
self["m_gamma"] = (function()
local __oak_cond = __truthy((function()
return (not __oak_eq(self["m_gamma"], 0))
end)()
)
if __oak_eq(__oak_cond, true) then return (function()
return (1 / self["m_gamma"])
end)()

else return 0
end
end)()
;
self["m_bias"] = (function()
return ((function()
return ((function()
return (__f114_C * __f114_step["dt"])
end)()
 * __f114_k)
end)()
 * self["m_gamma"])
end)()
;
self["m_mass"] = __add(__f114_invMass, self["m_gamma"]);
self["m_mass"] = (function()
local __oak_cond = __truthy((function()
return (not __oak_eq(self["m_mass"], 0))
end)()
)
if __oak_eq(__oak_cond, true) then return (function()
return (1 / self["m_mass"])
end)()

else return 0
end
end)()

return self["m_mass"]
end)()

else return __noop()
end
end)()
;
return (function()
local __oak_cond = __truthy(__f114_step["warmStarting"])
if __oak_eq(__oak_cond, true) then return (function()
self["m_impulse"] = (function()
return (self["m_impulse"] * __f114_step["dtRatio"])
end)()
;
local __f114_PX = (function()
return (self["m_impulse"] * self["m_u"]["x"])
end)()
;
local __f114_PY = (function()
return (self["m_impulse"] * self["m_u"]["y"])
end)()
;
__f114_bA["m_linearVelocity"]["x"] = (function()
return (__f114_bA["m_linearVelocity"]["x"] - (function()
return (__f114_bA["m_invMass"] * __f114_PX)
end)()
)
end)()
;
__f114_bA["m_linearVelocity"]["y"] = (function()
return (__f114_bA["m_linearVelocity"]["y"] - (function()
return (__f114_bA["m_invMass"] * __f114_PY)
end)()
)
end)()
;
__f114_bA["m_angularVelocity"] = (function()
return (__f114_bA["m_angularVelocity"] - (function()
return (__f114_bA["m_invI"] * (function()
return ((function()
return (__f114_r1X * __f114_PY)
end)()
 - (function()
return (__f114_r1Y * __f114_PX)
end)()
)
end)()
)
end)()
)
end)()
;
__f114_bB["m_linearVelocity"]["x"] = __add(__f114_bB["m_linearVelocity"]["x"], (function()
return (__f114_bB["m_invMass"] * __f114_PX)
end)()
);
__f114_bB["m_linearVelocity"]["y"] = __add(__f114_bB["m_linearVelocity"]["y"], (function()
return (__f114_bB["m_invMass"] * __f114_PY)
end)()
);
__f114_bB["m_angularVelocity"] = __add(__f114_bB["m_angularVelocity"], (function()
return (__f114_bB["m_invI"] * (function()
return ((function()
return (__f114_r2X * __f114_PY)
end)()
 - (function()
return (__f114_r2Y * __f114_PX)
end)()
)
end)()
)
end)()
)
return __f114_bB["m_angularVelocity"]
end)()

else self["m_impulse"] = 0
return self["m_impulse"]
end
end)()

end;
__proto_b2DistanceJoint["SolveVelocityConstraints"] = function(self, __f115_step)
local __f115_tMat = __noop();
local __f115_bA = self["m_bodyA"];
local __f115_bB = self["m_bodyB"];
__f115_tMat = __f115_bA["m_xf"]["R"];
local __f115_r1X = (function()
return (self["m_localAnchor1"]["x"] - __f115_bA["m_sweep"]["localCenter"]["x"])
end)()
;
local __f115_r1Y = (function()
return (self["m_localAnchor1"]["y"] - __f115_bA["m_sweep"]["localCenter"]["y"])
end)()
;
local __f115_tX = __add((function()
return (__f115_tMat["col1"]["x"] * __f115_r1X)
end)()
, (function()
return (__f115_tMat["col2"]["x"] * __f115_r1Y)
end)()
);
__f115_r1Y = __add((function()
return (__f115_tMat["col1"]["y"] * __f115_r1X)
end)()
, (function()
return (__f115_tMat["col2"]["y"] * __f115_r1Y)
end)()
);
__f115_r1X = __f115_tX;
__f115_tMat = __f115_bB["m_xf"]["R"];
local __f115_r2X = (function()
return (self["m_localAnchor2"]["x"] - __f115_bB["m_sweep"]["localCenter"]["x"])
end)()
;
local __f115_r2Y = (function()
return (self["m_localAnchor2"]["y"] - __f115_bB["m_sweep"]["localCenter"]["y"])
end)()
;
__f115_tX = __add((function()
return (__f115_tMat["col1"]["x"] * __f115_r2X)
end)()
, (function()
return (__f115_tMat["col2"]["x"] * __f115_r2Y)
end)()
);
__f115_r2Y = __add((function()
return (__f115_tMat["col1"]["y"] * __f115_r2X)
end)()
, (function()
return (__f115_tMat["col2"]["y"] * __f115_r2Y)
end)()
);
__f115_r2X = __f115_tX;
local __f115_v1X = __add(__f115_bA["m_linearVelocity"]["x"], (function()
return ((function()
return (-__f115_bA["m_angularVelocity"])
end)()
 * __f115_r1Y)
end)()
);
local __f115_v1Y = __add(__f115_bA["m_linearVelocity"]["y"], (function()
return (__f115_bA["m_angularVelocity"] * __f115_r1X)
end)()
);
local __f115_v2X = __add(__f115_bB["m_linearVelocity"]["x"], (function()
return ((function()
return (-__f115_bB["m_angularVelocity"])
end)()
 * __f115_r2Y)
end)()
);
local __f115_v2Y = __add(__f115_bB["m_linearVelocity"]["y"], (function()
return (__f115_bB["m_angularVelocity"] * __f115_r2X)
end)()
);
local __f115_Cdot = __add((function()
return (self["m_u"]["x"] * (function()
return (__f115_v2X - __f115_v1X)
end)()
)
end)()
, (function()
return (self["m_u"]["y"] * (function()
return (__f115_v2Y - __f115_v1Y)
end)()
)
end)()
);
local __f115_impulse = (function()
return ((function()
return (-self["m_mass"])
end)()
 * __add(__add(__f115_Cdot, self["m_bias"]), (function()
return (self["m_gamma"] * self["m_impulse"])
end)()
))
end)()
;
self["m_impulse"] = __add(self["m_impulse"], __f115_impulse);
local __f115_PX = (function()
return (__f115_impulse * self["m_u"]["x"])
end)()
;
local __f115_PY = (function()
return (__f115_impulse * self["m_u"]["y"])
end)()
;
__f115_bA["m_linearVelocity"]["x"] = (function()
return (__f115_bA["m_linearVelocity"]["x"] - (function()
return (__f115_bA["m_invMass"] * __f115_PX)
end)()
)
end)()
;
__f115_bA["m_linearVelocity"]["y"] = (function()
return (__f115_bA["m_linearVelocity"]["y"] - (function()
return (__f115_bA["m_invMass"] * __f115_PY)
end)()
)
end)()
;
__f115_bA["m_angularVelocity"] = (function()
return (__f115_bA["m_angularVelocity"] - (function()
return (__f115_bA["m_invI"] * (function()
return ((function()
return (__f115_r1X * __f115_PY)
end)()
 - (function()
return (__f115_r1Y * __f115_PX)
end)()
)
end)()
)
end)()
)
end)()
;
__f115_bB["m_linearVelocity"]["x"] = __add(__f115_bB["m_linearVelocity"]["x"], (function()
return (__f115_bB["m_invMass"] * __f115_PX)
end)()
);
__f115_bB["m_linearVelocity"]["y"] = __add(__f115_bB["m_linearVelocity"]["y"], (function()
return (__f115_bB["m_invMass"] * __f115_PY)
end)()
);
__f115_bB["m_angularVelocity"] = __add(__f115_bB["m_angularVelocity"], (function()
return (__f115_bB["m_invI"] * (function()
return ((function()
return (__f115_r2X * __f115_PY)
end)()
 - (function()
return (__f115_r2Y * __f115_PX)
end)()
)
end)()
)
end)()
)
return __f115_bB["m_angularVelocity"]
end;
__proto_b2DistanceJoint["SolvePositionConstraints"] = function(self, __f116_baumgarte)
(function()
local __oak_cond = __truthy((function()
return __oak_eq(__f116_baumgarte, nil)
end)()
)
if __oak_eq(__oak_cond, true) then __f116_baumgarte = 0
return __f116_baumgarte
else return __noop()
end
end)()
;
local __f116_tMat = __noop();
(function()
local __oak_cond = __truthy((function()
return (self["m_frequencyHz"] > 0)
end)()
)
if __oak_eq(__oak_cond, true) then return true
else return __noop()
end
end)()
;
local __f116_bA = self["m_bodyA"];
local __f116_bB = self["m_bodyB"];
__f116_tMat = __f116_bA["m_xf"]["R"];
local __f116_r1X = (function()
return (self["m_localAnchor1"]["x"] - __f116_bA["m_sweep"]["localCenter"]["x"])
end)()
;
local __f116_r1Y = (function()
return (self["m_localAnchor1"]["y"] - __f116_bA["m_sweep"]["localCenter"]["y"])
end)()
;
local __f116_tX = __add((function()
return (__f116_tMat["col1"]["x"] * __f116_r1X)
end)()
, (function()
return (__f116_tMat["col2"]["x"] * __f116_r1Y)
end)()
);
__f116_r1Y = __add((function()
return (__f116_tMat["col1"]["y"] * __f116_r1X)
end)()
, (function()
return (__f116_tMat["col2"]["y"] * __f116_r1Y)
end)()
);
__f116_r1X = __f116_tX;
__f116_tMat = __f116_bB["m_xf"]["R"];
local __f116_r2X = (function()
return (self["m_localAnchor2"]["x"] - __f116_bB["m_sweep"]["localCenter"]["x"])
end)()
;
local __f116_r2Y = (function()
return (self["m_localAnchor2"]["y"] - __f116_bB["m_sweep"]["localCenter"]["y"])
end)()
;
__f116_tX = __add((function()
return (__f116_tMat["col1"]["x"] * __f116_r2X)
end)()
, (function()
return (__f116_tMat["col2"]["x"] * __f116_r2Y)
end)()
);
__f116_r2Y = __add((function()
return (__f116_tMat["col1"]["y"] * __f116_r2X)
end)()
, (function()
return (__f116_tMat["col2"]["y"] * __f116_r2Y)
end)()
);
__f116_r2X = __f116_tX;
local __f116_dX = (function()
return ((function()
return (__add(__f116_bB["m_sweep"]["c"]["x"], __f116_r2X) - __f116_bA["m_sweep"]["c"]["x"])
end)()
 - __f116_r1X)
end)()
;
local __f116_dY = (function()
return ((function()
return (__add(__f116_bB["m_sweep"]["c"]["y"], __f116_r2Y) - __f116_bA["m_sweep"]["c"]["y"])
end)()
 - __f116_r1Y)
end)()
;
local __f116_length = __Math["sqrt"](__add((function()
return (__f116_dX * __f116_dX)
end)()
, (function()
return (__f116_dY * __f116_dY)
end)()
));
__f116_dX = (function()
return (__f116_dX / __f116_length)
end)()
;
__f116_dY = (function()
return (__f116_dY / __f116_length)
end)()
;
local __f116_C = (function()
return (__f116_length - self["m_length"])
end)()
;
__f116_C = __static_b2Math["Clamp"](__f116_C, (function()
return (-__static_b2Settings["b2_maxLinearCorrection"])
end)()
, __static_b2Settings["b2_maxLinearCorrection"]);
local __f116_impulse = (function()
return ((function()
return (-self["m_mass"])
end)()
 * __f116_C)
end)()
;
self["m_u"]["Set"](self["m_u"], __f116_dX, __f116_dY);
local __f116_PX = (function()
return (__f116_impulse * self["m_u"]["x"])
end)()
;
local __f116_PY = (function()
return (__f116_impulse * self["m_u"]["y"])
end)()
;
__f116_bA["m_sweep"]["c"]["x"] = (function()
return (__f116_bA["m_sweep"]["c"]["x"] - (function()
return (__f116_bA["m_invMass"] * __f116_PX)
end)()
)
end)()
;
__f116_bA["m_sweep"]["c"]["y"] = (function()
return (__f116_bA["m_sweep"]["c"]["y"] - (function()
return (__f116_bA["m_invMass"] * __f116_PY)
end)()
)
end)()
;
__f116_bA["m_sweep"]["a"] = (function()
return (__f116_bA["m_sweep"]["a"] - (function()
return (__f116_bA["m_invI"] * (function()
return ((function()
return (__f116_r1X * __f116_PY)
end)()
 - (function()
return (__f116_r1Y * __f116_PX)
end)()
)
end)()
)
end)()
)
end)()
;
__f116_bB["m_sweep"]["c"]["x"] = __add(__f116_bB["m_sweep"]["c"]["x"], (function()
return (__f116_bB["m_invMass"] * __f116_PX)
end)()
);
__f116_bB["m_sweep"]["c"]["y"] = __add(__f116_bB["m_sweep"]["c"]["y"], (function()
return (__f116_bB["m_invMass"] * __f116_PY)
end)()
);
__f116_bB["m_sweep"]["a"] = __add(__f116_bB["m_sweep"]["a"], (function()
return (__f116_bB["m_invI"] * (function()
return ((function()
return (__f116_r2X * __f116_PY)
end)()
 - (function()
return (__f116_r2Y * __f116_PX)
end)()
)
end)()
)
end)()
);
__f116_bA["SynchronizeTransform"](__f116_bA);
__f116_bB["SynchronizeTransform"](__f116_bB);
return (function()
return (__static_b2Math["Abs"](__f116_C) < __static_b2Settings["b2_linearSlop"])
end)()

end;
__static_b2DistanceJoint = {};
b2DistanceJoint = function()
local self = b2Joint();
self["__type"] = 'b2DistanceJoint';
self["__types"] = {'b2DistanceJoint', 'b2Joint'};
self["__super"] = __proto_b2Joint;
self["GetAnchorA"] = __proto_b2DistanceJoint["GetAnchorA"];
self["GetAnchorB"] = __proto_b2DistanceJoint["GetAnchorB"];
self["GetReactionForce"] = __proto_b2DistanceJoint["GetReactionForce"];
self["GetReactionTorque"] = __proto_b2DistanceJoint["GetReactionTorque"];
self["GetLength"] = __proto_b2DistanceJoint["GetLength"];
self["SetLength"] = __proto_b2DistanceJoint["SetLength"];
self["GetFrequency"] = __proto_b2DistanceJoint["GetFrequency"];
self["SetFrequency"] = __proto_b2DistanceJoint["SetFrequency"];
self["GetDampingRatio"] = __proto_b2DistanceJoint["GetDampingRatio"];
self["SetDampingRatio"] = __proto_b2DistanceJoint["SetDampingRatio"];
self["InitVelocityConstraints"] = __proto_b2DistanceJoint["InitVelocityConstraints"];
self["SolveVelocityConstraints"] = __proto_b2DistanceJoint["SolveVelocityConstraints"];
self["SolvePositionConstraints"] = __proto_b2DistanceJoint["SolvePositionConstraints"];
(function()
Box2D["Dynamics"]["Joints"]["b2Joint"]["b2Joint"](self);
self["m_localAnchor1"] = b2Vec2();
self["m_localAnchor2"] = b2Vec2();
self["m_u"] = b2Vec2();
self["__super"]["b2Joint"](self, def);
local __f117_tMat = __noop();
local __f117_tX = 0;
local __f117_tY = 0;
self["m_localAnchor1"]["SetV"](self["m_localAnchor1"], def["localAnchorA"]);
self["m_localAnchor2"]["SetV"](self["m_localAnchor2"], def["localAnchorB"]);
self["m_length"] = len(def);
self["m_frequencyHz"] = def["frequencyHz"];
self["m_dampingRatio"] = def["dampingRatio"];
self["m_impulse"] = 0;
self["m_gamma"] = 0;
self["m_bias"] = 0
return self["m_bias"]
end)()
;
return self
end;
Box2D["Dynamics"]["Joints"]["b2DistanceJoint"] = b2DistanceJoint;
__proto_b2DistanceJointDef = {};
__proto_b2DistanceJointDef["Initialize"] = function(self, __f118_bA, __f118_bB, __f118_anchorA, __f118_anchorB)
self["bodyA"] = __f118_bA;
self["bodyB"] = __f118_bB;
self["localAnchorA"]["SetV"](self["localAnchorA"], self["bodyA"]["GetLocalPoint"](self["bodyA"], __f118_anchorA));
self["localAnchorB"]["SetV"](self["localAnchorB"], self["bodyB"]["GetLocalPoint"](self["bodyB"], __f118_anchorB));
local __f118_dX = (function()
return (__f118_anchorB["x"] - __f118_anchorA["x"])
end)()
;
local __f118_dY = (function()
return (__f118_anchorB["y"] - __f118_anchorA["y"])
end)()
;
self["length"] = __Math["sqrt"](__add((function()
return (__f118_dX * __f118_dX)
end)()
, (function()
return (__f118_dY * __f118_dY)
end)()
));
self["frequencyHz"] = 0;
self["dampingRatio"] = 0
return self["dampingRatio"]
end;
__static_b2DistanceJointDef = {};
b2DistanceJointDef = function()
local self = b2JointDef();
self["__type"] = 'b2DistanceJointDef';
self["__types"] = {'b2DistanceJointDef', 'b2JointDef'};
self["__super"] = __proto_b2JointDef;
self["Initialize"] = __proto_b2DistanceJointDef["Initialize"];
(function()
Box2D["Dynamics"]["Joints"]["b2JointDef"]["b2JointDef"](self);
self["localAnchorA"] = b2Vec2();
self["localAnchorB"] = b2Vec2();
self["__super"]["b2JointDef"](self);
self["type"] = __static_b2Joint["e_distanceJoint"];
self["length"] = 1;
self["frequencyHz"] = 0;
self["dampingRatio"] = 0
return self["dampingRatio"]
end)()
;
return self
end;
Box2D["Dynamics"]["Joints"]["b2DistanceJointDef"] = b2DistanceJointDef;
__proto_b2FrictionJoint = {};
__proto_b2FrictionJoint["GetAnchorA"] = function(self)
return self["m_bodyA"]["GetWorldPoint"](self["m_bodyA"], self["m_localAnchorA"])
end;
__proto_b2FrictionJoint["GetAnchorB"] = function(self)
return self["m_bodyB"]["GetWorldPoint"](self["m_bodyB"], self["m_localAnchorB"])
end;
__proto_b2FrictionJoint["GetReactionForce"] = function(self, __f122_inv_dt)
(function()
local __oak_cond = __truthy((function()
return __oak_eq(__f122_inv_dt, nil)
end)()
)
if __oak_eq(__oak_cond, true) then __f122_inv_dt = 0
return __f122_inv_dt
else return __noop()
end
end)()
;
return b2Vec2((function()
return (__f122_inv_dt * self["m_linearImpulse"]["x"])
end)()
, (function()
return (__f122_inv_dt * self["m_linearImpulse"]["y"])
end)()
)
end;
__proto_b2FrictionJoint["GetReactionTorque"] = function(self, __f123_inv_dt)
(function()
local __oak_cond = __truthy((function()
return __oak_eq(__f123_inv_dt, nil)
end)()
)
if __oak_eq(__oak_cond, true) then __f123_inv_dt = 0
return __f123_inv_dt
else return __noop()
end
end)()
;
return (function()
return (__f123_inv_dt * self["m_angularImpulse"])
end)()

end;
__proto_b2FrictionJoint["SetMaxForce"] = function(self, __f124_force)
(function()
local __oak_cond = __truthy((function()
return __oak_eq(__f124_force, nil)
end)()
)
if __oak_eq(__oak_cond, true) then __f124_force = 0
return __f124_force
else return __noop()
end
end)()
;
self["m_maxForce"] = __f124_force
return self["m_maxForce"]
end;
__proto_b2FrictionJoint["GetMaxForce"] = function(self)
return self["m_maxForce"]
end;
__proto_b2FrictionJoint["SetMaxTorque"] = function(self, __f126_torque)
(function()
local __oak_cond = __truthy((function()
return __oak_eq(__f126_torque, nil)
end)()
)
if __oak_eq(__oak_cond, true) then __f126_torque = 0
return __f126_torque
else return __noop()
end
end)()
;
self["m_maxTorque"] = __f126_torque
return self["m_maxTorque"]
end;
__proto_b2FrictionJoint["GetMaxTorque"] = function(self)
return self["m_maxTorque"]
end;
__proto_b2FrictionJoint["InitVelocityConstraints"] = function(self, __f128_step)
local __f128_tMat = __noop();
local __f128_tX = 0;
local __f128_bA = self["m_bodyA"];
local __f128_bB = self["m_bodyB"];
__f128_tMat = __f128_bA["m_xf"]["R"];
local __f128_rAX = (function()
return (self["m_localAnchorA"]["x"] - __f128_bA["m_sweep"]["localCenter"]["x"])
end)()
;
local __f128_rAY = (function()
return (self["m_localAnchorA"]["y"] - __f128_bA["m_sweep"]["localCenter"]["y"])
end)()
;
__f128_tX = __add((function()
return (__f128_tMat["col1"]["x"] * __f128_rAX)
end)()
, (function()
return (__f128_tMat["col2"]["x"] * __f128_rAY)
end)()
);
__f128_rAY = __add((function()
return (__f128_tMat["col1"]["y"] * __f128_rAX)
end)()
, (function()
return (__f128_tMat["col2"]["y"] * __f128_rAY)
end)()
);
__f128_rAX = __f128_tX;
__f128_tMat = __f128_bB["m_xf"]["R"];
local __f128_rBX = (function()
return (self["m_localAnchorB"]["x"] - __f128_bB["m_sweep"]["localCenter"]["x"])
end)()
;
local __f128_rBY = (function()
return (self["m_localAnchorB"]["y"] - __f128_bB["m_sweep"]["localCenter"]["y"])
end)()
;
__f128_tX = __add((function()
return (__f128_tMat["col1"]["x"] * __f128_rBX)
end)()
, (function()
return (__f128_tMat["col2"]["x"] * __f128_rBY)
end)()
);
__f128_rBY = __add((function()
return (__f128_tMat["col1"]["y"] * __f128_rBX)
end)()
, (function()
return (__f128_tMat["col2"]["y"] * __f128_rBY)
end)()
);
__f128_rBX = __f128_tX;
local __f128_mA = __f128_bA["m_invMass"];
local __f128_mB = __f128_bB["m_invMass"];
local __f128_iA = __f128_bA["m_invI"];
local __f128_iB = __f128_bB["m_invI"];
local __f128_K = b2Mat22();
__f128_K["col1"]["x"] = __add(__f128_mA, __f128_mB);
__f128_K["col2"]["x"] = 0;
__f128_K["col1"]["y"] = 0;
__f128_K["col2"]["y"] = __add(__f128_mA, __f128_mB);
__f128_K["col1"]["x"] = __add(__f128_K["col1"]["x"], (function()
return ((function()
return (__f128_iA * __f128_rAY)
end)()
 * __f128_rAY)
end)()
);
__f128_K["col2"]["x"] = __add(__f128_K["col2"]["x"], (function()
return ((function()
return ((function()
return (-__f128_iA)
end)()
 * __f128_rAX)
end)()
 * __f128_rAY)
end)()
);
__f128_K["col1"]["y"] = __add(__f128_K["col1"]["y"], (function()
return ((function()
return ((function()
return (-__f128_iA)
end)()
 * __f128_rAX)
end)()
 * __f128_rAY)
end)()
);
__f128_K["col2"]["y"] = __add(__f128_K["col2"]["y"], (function()
return ((function()
return (__f128_iA * __f128_rAX)
end)()
 * __f128_rAX)
end)()
);
__f128_K["col1"]["x"] = __add(__f128_K["col1"]["x"], (function()
return ((function()
return (__f128_iB * __f128_rBY)
end)()
 * __f128_rBY)
end)()
);
__f128_K["col2"]["x"] = __add(__f128_K["col2"]["x"], (function()
return ((function()
return ((function()
return (-__f128_iB)
end)()
 * __f128_rBX)
end)()
 * __f128_rBY)
end)()
);
__f128_K["col1"]["y"] = __add(__f128_K["col1"]["y"], (function()
return ((function()
return ((function()
return (-__f128_iB)
end)()
 * __f128_rBX)
end)()
 * __f128_rBY)
end)()
);
__f128_K["col2"]["y"] = __add(__f128_K["col2"]["y"], (function()
return ((function()
return (__f128_iB * __f128_rBX)
end)()
 * __f128_rBX)
end)()
);
__f128_K["GetInverse"](__f128_K, self["m_linearMass"]);
self["m_angularMass"] = __add(__f128_iA, __f128_iB);
(function()
local __oak_cond = __truthy((function()
return (self["m_angularMass"] > 0)
end)()
)
if __oak_eq(__oak_cond, true) then self["m_angularMass"] = (function()
return (1 / self["m_angularMass"])
end)()

return self["m_angularMass"]
else return __noop()
end
end)()
;
return (function()
local __oak_cond = __truthy(__f128_step["warmStarting"])
if __oak_eq(__oak_cond, true) then return (function()
self["m_linearImpulse"]["x"] = (function()
return (self["m_linearImpulse"]["x"] * __f128_step["dtRatio"])
end)()
;
self["m_linearImpulse"]["y"] = (function()
return (self["m_linearImpulse"]["y"] * __f128_step["dtRatio"])
end)()
;
self["m_angularImpulse"] = (function()
return (self["m_angularImpulse"] * __f128_step["dtRatio"])
end)()
;
local __f128_P = self["m_linearImpulse"];
__f128_bA["m_linearVelocity"]["x"] = (function()
return (__f128_bA["m_linearVelocity"]["x"] - (function()
return (__f128_mA * __f128_P["x"])
end)()
)
end)()
;
__f128_bA["m_linearVelocity"]["y"] = (function()
return (__f128_bA["m_linearVelocity"]["y"] - (function()
return (__f128_mA * __f128_P["y"])
end)()
)
end)()
;
__f128_bA["m_angularVelocity"] = (function()
return (__f128_bA["m_angularVelocity"] - (function()
return (__f128_iA * __add((function()
return ((function()
return (__f128_rAX * __f128_P["y"])
end)()
 - (function()
return (__f128_rAY * __f128_P["x"])
end)()
)
end)()
, self["m_angularImpulse"]))
end)()
)
end)()
;
__f128_bB["m_linearVelocity"]["x"] = __add(__f128_bB["m_linearVelocity"]["x"], (function()
return (__f128_mB * __f128_P["x"])
end)()
);
__f128_bB["m_linearVelocity"]["y"] = __add(__f128_bB["m_linearVelocity"]["y"], (function()
return (__f128_mB * __f128_P["y"])
end)()
);
__f128_bB["m_angularVelocity"] = __add(__f128_bB["m_angularVelocity"], (function()
return (__f128_iB * __add((function()
return ((function()
return (__f128_rBX * __f128_P["y"])
end)()
 - (function()
return (__f128_rBY * __f128_P["x"])
end)()
)
end)()
, self["m_angularImpulse"]))
end)()
)
return __f128_bB["m_angularVelocity"]
end)()

else return (function()
self["m_linearImpulse"]["SetZero"](self["m_linearImpulse"]);
self["m_angularImpulse"] = 0
return self["m_angularImpulse"]
end)()

end
end)()

end;
__proto_b2FrictionJoint["SolveVelocityConstraints"] = function(self, __f129_step)
local __f129_tMat = __noop();
local __f129_tX = 0;
local __f129_bA = self["m_bodyA"];
local __f129_bB = self["m_bodyB"];
local __f129_vA = __f129_bA["m_linearVelocity"];
local __f129_wA = __f129_bA["m_angularVelocity"];
local __f129_vB = __f129_bB["m_linearVelocity"];
local __f129_wB = __f129_bB["m_angularVelocity"];
local __f129_mA = __f129_bA["m_invMass"];
local __f129_mB = __f129_bB["m_invMass"];
local __f129_iA = __f129_bA["m_invI"];
local __f129_iB = __f129_bB["m_invI"];
__f129_tMat = __f129_bA["m_xf"]["R"];
local __f129_rAX = (function()
return (self["m_localAnchorA"]["x"] - __f129_bA["m_sweep"]["localCenter"]["x"])
end)()
;
local __f129_rAY = (function()
return (self["m_localAnchorA"]["y"] - __f129_bA["m_sweep"]["localCenter"]["y"])
end)()
;
__f129_tX = __add((function()
return (__f129_tMat["col1"]["x"] * __f129_rAX)
end)()
, (function()
return (__f129_tMat["col2"]["x"] * __f129_rAY)
end)()
);
__f129_rAY = __add((function()
return (__f129_tMat["col1"]["y"] * __f129_rAX)
end)()
, (function()
return (__f129_tMat["col2"]["y"] * __f129_rAY)
end)()
);
__f129_rAX = __f129_tX;
__f129_tMat = __f129_bB["m_xf"]["R"];
local __f129_rBX = (function()
return (self["m_localAnchorB"]["x"] - __f129_bB["m_sweep"]["localCenter"]["x"])
end)()
;
local __f129_rBY = (function()
return (self["m_localAnchorB"]["y"] - __f129_bB["m_sweep"]["localCenter"]["y"])
end)()
;
__f129_tX = __add((function()
return (__f129_tMat["col1"]["x"] * __f129_rBX)
end)()
, (function()
return (__f129_tMat["col2"]["x"] * __f129_rBY)
end)()
);
__f129_rBY = __add((function()
return (__f129_tMat["col1"]["y"] * __f129_rBX)
end)()
, (function()
return (__f129_tMat["col2"]["y"] * __f129_rBY)
end)()
);
__f129_rBX = __f129_tX;
local __f129_maxImpulse = 0;
(function()
local __f129_Cdot = (function()
return (__f129_wB - __f129_wA)
end)()
;
local __f129_impulse = (function()
return ((function()
return (-self["m_angularMass"])
end)()
 * __f129_Cdot)
end)()
;
local __f129_oldImpulse = self["m_angularImpulse"];
__f129_maxImpulse = (function()
return (__f129_step["dt"] * self["m_maxTorque"])
end)()
;
self["m_angularImpulse"] = __static_b2Math["Clamp"](__add(self["m_angularImpulse"], __f129_impulse), (function()
return (-__f129_maxImpulse)
end)()
, __f129_maxImpulse);
__f129_impulse = (function()
return (self["m_angularImpulse"] - __f129_oldImpulse)
end)()
;
__f129_wA = (function()
return (__f129_wA - (function()
return (__f129_iA * __f129_impulse)
end)()
)
end)()
;
__f129_wB = __add(__f129_wB, (function()
return (__f129_iB * __f129_impulse)
end)()
)
return __f129_wB
end)()
;
(function()
local __f129_CdotX = __add((function()
return ((function()
return (__f129_vB["x"] - (function()
return (__f129_wB * __f129_rBY)
end)()
)
end)()
 - __f129_vA["x"])
end)()
, (function()
return (__f129_wA * __f129_rAY)
end)()
);
local __f129_CdotY = (function()
return ((function()
return (__add(__f129_vB["y"], (function()
return (__f129_wB * __f129_rBX)
end)()
) - __f129_vA["y"])
end)()
 - (function()
return (__f129_wA * __f129_rAX)
end)()
)
end)()
;
local __f129_impulseV = __static_b2Math["MulMV"](self["m_linearMass"], b2Vec2((function()
return (-__f129_CdotX)
end)()
, (function()
return (-__f129_CdotY)
end)()
));
local __f129_oldImpulseV = self["m_linearImpulse"]["Copy"](self["m_linearImpulse"]);
self["m_linearImpulse"]["Add"](self["m_linearImpulse"], __f129_impulseV);
__f129_maxImpulse = (function()
return (__f129_step["dt"] * self["m_maxForce"])
end)()
;
(function()
local __oak_cond = __truthy((function()
return (self["m_linearImpulse"]["LengthSquared"](self["m_linearImpulse"]) > (function()
return (__f129_maxImpulse * __f129_maxImpulse)
end)()
)
end)()
)
if __oak_eq(__oak_cond, true) then return (function()
self["m_linearImpulse"]["Normalize"](self["m_linearImpulse"]);
return self["m_linearImpulse"]["Multiply"](self["m_linearImpulse"], __f129_maxImpulse)
end)()

else return __noop()
end
end)()
;
__f129_impulseV = __static_b2Math["SubtractVV"](self["m_linearImpulse"], __f129_oldImpulseV);
__f129_vA["x"] = (function()
return (__f129_vA["x"] - (function()
return (__f129_mA * __f129_impulseV["x"])
end)()
)
end)()
;
__f129_vA["y"] = (function()
return (__f129_vA["y"] - (function()
return (__f129_mA * __f129_impulseV["y"])
end)()
)
end)()
;
__f129_wA = (function()
return (__f129_wA - (function()
return (__f129_iA * (function()
return ((function()
return (__f129_rAX * __f129_impulseV["y"])
end)()
 - (function()
return (__f129_rAY * __f129_impulseV["x"])
end)()
)
end)()
)
end)()
)
end)()
;
__f129_vB["x"] = __add(__f129_vB["x"], (function()
return (__f129_mB * __f129_impulseV["x"])
end)()
);
__f129_vB["y"] = __add(__f129_vB["y"], (function()
return (__f129_mB * __f129_impulseV["y"])
end)()
);
__f129_wB = __add(__f129_wB, (function()
return (__f129_iB * (function()
return ((function()
return (__f129_rBX * __f129_impulseV["y"])
end)()
 - (function()
return (__f129_rBY * __f129_impulseV["x"])
end)()
)
end)()
)
end)()
)
return __f129_wB
end)()
;
__f129_bA["m_angularVelocity"] = __f129_wA;
__f129_bB["m_angularVelocity"] = __f129_wB
return __f129_bB["m_angularVelocity"]
end;
__proto_b2FrictionJoint["SolvePositionConstraints"] = function(self, __f130_baumgarte)
(function()
local __oak_cond = __truthy((function()
return __oak_eq(__f130_baumgarte, nil)
end)()
)
if __oak_eq(__oak_cond, true) then __f130_baumgarte = 0
return __f130_baumgarte
else return __noop()
end
end)()
;
return true
end;
__static_b2FrictionJoint = {};
b2FrictionJoint = function()
local self = b2Joint();
self["__type"] = 'b2FrictionJoint';
self["__types"] = {'b2FrictionJoint', 'b2Joint'};
self["__super"] = __proto_b2Joint;
self["GetAnchorA"] = __proto_b2FrictionJoint["GetAnchorA"];
self["GetAnchorB"] = __proto_b2FrictionJoint["GetAnchorB"];
self["GetReactionForce"] = __proto_b2FrictionJoint["GetReactionForce"];
self["GetReactionTorque"] = __proto_b2FrictionJoint["GetReactionTorque"];
self["SetMaxForce"] = __proto_b2FrictionJoint["SetMaxForce"];
self["GetMaxForce"] = __proto_b2FrictionJoint["GetMaxForce"];
self["SetMaxTorque"] = __proto_b2FrictionJoint["SetMaxTorque"];
self["GetMaxTorque"] = __proto_b2FrictionJoint["GetMaxTorque"];
self["InitVelocityConstraints"] = __proto_b2FrictionJoint["InitVelocityConstraints"];
self["SolveVelocityConstraints"] = __proto_b2FrictionJoint["SolveVelocityConstraints"];
self["SolvePositionConstraints"] = __proto_b2FrictionJoint["SolvePositionConstraints"];
(function()
Box2D["Dynamics"]["Joints"]["b2Joint"]["b2Joint"](self);
self["m_localAnchorA"] = b2Vec2();
self["m_localAnchorB"] = b2Vec2();
self["m_linearMass"] = b2Mat22();
self["m_linearImpulse"] = b2Vec2();
self["__super"]["b2Joint"](self, def);
self["m_localAnchorA"]["SetV"](self["m_localAnchorA"], def["localAnchorA"]);
self["m_localAnchorB"]["SetV"](self["m_localAnchorB"], def["localAnchorB"]);
self["m_linearMass"]["SetZero"](self["m_linearMass"]);
self["m_angularMass"] = 0;
self["m_linearImpulse"]["SetZero"](self["m_linearImpulse"]);
self["m_angularImpulse"] = 0;
self["m_maxForce"] = def["maxForce"];
self["m_maxTorque"] = def["maxTorque"]
return self["m_maxTorque"]
end)()
;
return self
end;
Box2D["Dynamics"]["Joints"]["b2FrictionJoint"] = b2FrictionJoint;
__proto_b2FrictionJointDef = {};
__proto_b2FrictionJointDef["Initialize"] = function(self, __f132_bA, __f132_bB, __f132_anchor)
self["bodyA"] = __f132_bA;
self["bodyB"] = __f132_bB;
self["localAnchorA"]["SetV"](self["localAnchorA"], self["bodyA"]["GetLocalPoint"](self["bodyA"], __f132_anchor));
return self["localAnchorB"]["SetV"](self["localAnchorB"], self["bodyB"]["GetLocalPoint"](self["bodyB"], __f132_anchor))
end;
__static_b2FrictionJointDef = {};
b2FrictionJointDef = function()
local self = b2JointDef();
self["__type"] = 'b2FrictionJointDef';
self["__types"] = {'b2FrictionJointDef', 'b2JointDef'};
self["__super"] = __proto_b2JointDef;
self["Initialize"] = __proto_b2FrictionJointDef["Initialize"];
(function()
Box2D["Dynamics"]["Joints"]["b2JointDef"]["b2JointDef"](self);
self["localAnchorA"] = b2Vec2();
self["localAnchorB"] = b2Vec2();
self["__super"]["b2JointDef"](self);
self["type"] = __static_b2Joint["e_frictionJoint"];
self["maxForce"] = 0;
self["maxTorque"] = 0
return self["maxTorque"]
end)()
;
return self
end;
Box2D["Dynamics"]["Joints"]["b2FrictionJointDef"] = b2FrictionJointDef;
__proto_b2GearJoint = {};
__proto_b2GearJoint["GetAnchorA"] = function(self)
return self["m_bodyA"]["GetWorldPoint"](self["m_bodyA"], self["m_localAnchor1"])
end;
__proto_b2GearJoint["GetAnchorB"] = function(self)
return self["m_bodyB"]["GetWorldPoint"](self["m_bodyB"], self["m_localAnchor2"])
end;
__proto_b2GearJoint["GetReactionForce"] = function(self, __f136_inv_dt)
(function()
local __oak_cond = __truthy((function()
return __oak_eq(__f136_inv_dt, nil)
end)()
)
if __oak_eq(__oak_cond, true) then __f136_inv_dt = 0
return __f136_inv_dt
else return __noop()
end
end)()
;
return b2Vec2((function()
return ((function()
return (__f136_inv_dt * self["m_impulse"])
end)()
 * self["m_J"]["linearB"]["x"])
end)()
, (function()
return ((function()
return (__f136_inv_dt * self["m_impulse"])
end)()
 * self["m_J"]["linearB"]["y"])
end)()
)
end;
__proto_b2GearJoint["GetReactionTorque"] = function(self, __f137_inv_dt)
(function()
local __oak_cond = __truthy((function()
return __oak_eq(__f137_inv_dt, nil)
end)()
)
if __oak_eq(__oak_cond, true) then __f137_inv_dt = 0
return __f137_inv_dt
else return __noop()
end
end)()
;
local __f137_tMat = self["m_bodyB"]["m_xf"]["R"];
local __f137_rX = (function()
return (self["m_localAnchor1"]["x"] - self["m_bodyB"]["m_sweep"]["localCenter"]["x"])
end)()
;
local __f137_rY = (function()
return (self["m_localAnchor1"]["y"] - self["m_bodyB"]["m_sweep"]["localCenter"]["y"])
end)()
;
local __f137_tX = __add((function()
return (__f137_tMat["col1"]["x"] * __f137_rX)
end)()
, (function()
return (__f137_tMat["col2"]["x"] * __f137_rY)
end)()
);
__f137_rY = __add((function()
return (__f137_tMat["col1"]["y"] * __f137_rX)
end)()
, (function()
return (__f137_tMat["col2"]["y"] * __f137_rY)
end)()
);
__f137_rX = __f137_tX;
local __f137_PX = (function()
return (self["m_impulse"] * self["m_J"]["linearB"]["x"])
end)()
;
local __f137_PY = (function()
return (self["m_impulse"] * self["m_J"]["linearB"]["y"])
end)()
;
return (function()
return (__f137_inv_dt * __add((function()
return ((function()
return (self["m_impulse"] * self["m_J"]["angularB"])
end)()
 - (function()
return (__f137_rX * __f137_PY)
end)()
)
end)()
, (function()
return (__f137_rY * __f137_PX)
end)()
))
end)()

end;
__proto_b2GearJoint["GetRatio"] = function(self)
return self["m_ratio"]
end;
__proto_b2GearJoint["SetRatio"] = function(self, __f139_ratio)
(function()
local __oak_cond = __truthy((function()
return __oak_eq(__f139_ratio, nil)
end)()
)
if __oak_eq(__oak_cond, true) then __f139_ratio = 0
return __f139_ratio
else return __noop()
end
end)()
;
self["m_ratio"] = __f139_ratio
return self["m_ratio"]
end;
__proto_b2GearJoint["InitVelocityConstraints"] = function(self, __f140_step)
local __f140_g1 = self["m_ground1"];
local __f140_g2 = self["m_ground2"];
local __f140_bA = self["m_bodyA"];
local __f140_bB = self["m_bodyB"];
local __f140_ugX = 0;
local __f140_ugY = 0;
local __f140_rX = 0;
local __f140_rY = 0;
local __f140_tMat = __noop();
local __f140_tVec = __noop();
local __f140_crug = 0;
local __f140_tX = 0;
local __f140_K = 0;
self["m_J"]["SetZero"](self["m_J"]);
(function()
local __oak_cond = __truthy(self["m_revolute1"])
if __oak_eq(__oak_cond, true) then return (function()
self["m_J"]["angularA"] = (function()
return (-1)
end)()
;
__f140_K = __add(__f140_K, __f140_bA["m_invI"])
return __f140_K
end)()

else return (function()
__f140_tMat = __f140_g1["m_xf"]["R"];
__f140_tVec = self["m_prismatic1"]["m_localXAxis1"];
__f140_ugX = __add((function()
return (__f140_tMat["col1"]["x"] * __f140_tVec["x"])
end)()
, (function()
return (__f140_tMat["col2"]["x"] * __f140_tVec["y"])
end)()
);
__f140_ugY = __add((function()
return (__f140_tMat["col1"]["y"] * __f140_tVec["x"])
end)()
, (function()
return (__f140_tMat["col2"]["y"] * __f140_tVec["y"])
end)()
);
__f140_tMat = __f140_bA["m_xf"]["R"];
__f140_rX = (function()
return (self["m_localAnchor1"]["x"] - __f140_bA["m_sweep"]["localCenter"]["x"])
end)()
;
__f140_rY = (function()
return (self["m_localAnchor1"]["y"] - __f140_bA["m_sweep"]["localCenter"]["y"])
end)()
;
__f140_tX = __add((function()
return (__f140_tMat["col1"]["x"] * __f140_rX)
end)()
, (function()
return (__f140_tMat["col2"]["x"] * __f140_rY)
end)()
);
__f140_rY = __add((function()
return (__f140_tMat["col1"]["y"] * __f140_rX)
end)()
, (function()
return (__f140_tMat["col2"]["y"] * __f140_rY)
end)()
);
__f140_rX = __f140_tX;
__f140_crug = (function()
return ((function()
return (__f140_rX * __f140_ugY)
end)()
 - (function()
return (__f140_rY * __f140_ugX)
end)()
)
end)()
;
self["m_J"]["linearA"]["Set"](self["m_J"]["linearA"], (function()
return (-__f140_ugX)
end)()
, (function()
return (-__f140_ugY)
end)()
);
self["m_J"]["angularA"] = (function()
return (-__f140_crug)
end)()
;
__f140_K = __add(__f140_K, __add(__f140_bA["m_invMass"], (function()
return ((function()
return (__f140_bA["m_invI"] * __f140_crug)
end)()
 * __f140_crug)
end)()
))
return __f140_K
end)()

end
end)()
;
(function()
local __oak_cond = __truthy(self["m_revolute2"])
if __oak_eq(__oak_cond, true) then return (function()
self["m_J"]["angularB"] = (function()
return (-self["m_ratio"])
end)()
;
__f140_K = __add(__f140_K, (function()
return ((function()
return (self["m_ratio"] * self["m_ratio"])
end)()
 * __f140_bB["m_invI"])
end)()
)
return __f140_K
end)()

else return (function()
__f140_tMat = __f140_g2["m_xf"]["R"];
__f140_tVec = self["m_prismatic2"]["m_localXAxis1"];
__f140_ugX = __add((function()
return (__f140_tMat["col1"]["x"] * __f140_tVec["x"])
end)()
, (function()
return (__f140_tMat["col2"]["x"] * __f140_tVec["y"])
end)()
);
__f140_ugY = __add((function()
return (__f140_tMat["col1"]["y"] * __f140_tVec["x"])
end)()
, (function()
return (__f140_tMat["col2"]["y"] * __f140_tVec["y"])
end)()
);
__f140_tMat = __f140_bB["m_xf"]["R"];
__f140_rX = (function()
return (self["m_localAnchor2"]["x"] - __f140_bB["m_sweep"]["localCenter"]["x"])
end)()
;
__f140_rY = (function()
return (self["m_localAnchor2"]["y"] - __f140_bB["m_sweep"]["localCenter"]["y"])
end)()
;
__f140_tX = __add((function()
return (__f140_tMat["col1"]["x"] * __f140_rX)
end)()
, (function()
return (__f140_tMat["col2"]["x"] * __f140_rY)
end)()
);
__f140_rY = __add((function()
return (__f140_tMat["col1"]["y"] * __f140_rX)
end)()
, (function()
return (__f140_tMat["col2"]["y"] * __f140_rY)
end)()
);
__f140_rX = __f140_tX;
__f140_crug = (function()
return ((function()
return (__f140_rX * __f140_ugY)
end)()
 - (function()
return (__f140_rY * __f140_ugX)
end)()
)
end)()
;
self["m_J"]["linearB"]["Set"](self["m_J"]["linearB"], (function()
return ((function()
return (-self["m_ratio"])
end)()
 * __f140_ugX)
end)()
, (function()
return ((function()
return (-self["m_ratio"])
end)()
 * __f140_ugY)
end)()
);
self["m_J"]["angularB"] = (function()
return ((function()
return (-self["m_ratio"])
end)()
 * __f140_crug)
end)()
;
__f140_K = __add(__f140_K, (function()
return ((function()
return (self["m_ratio"] * self["m_ratio"])
end)()
 * __add(__f140_bB["m_invMass"], (function()
return ((function()
return (__f140_bB["m_invI"] * __f140_crug)
end)()
 * __f140_crug)
end)()
))
end)()
)
return __f140_K
end)()

end
end)()
;
self["m_mass"] = (function()
local __oak_cond = __truthy((function()
return (__f140_K > 0)
end)()
)
if __oak_eq(__oak_cond, true) then return (function()
return (1 / __f140_K)
end)()

else return 0
end
end)()
;
return (function()
local __oak_cond = __truthy(__f140_step["warmStarting"])
if __oak_eq(__oak_cond, true) then return (function()
__f140_bA["m_linearVelocity"]["x"] = __add(__f140_bA["m_linearVelocity"]["x"], (function()
return ((function()
return (__f140_bA["m_invMass"] * self["m_impulse"])
end)()
 * self["m_J"]["linearA"]["x"])
end)()
);
__f140_bA["m_linearVelocity"]["y"] = __add(__f140_bA["m_linearVelocity"]["y"], (function()
return ((function()
return (__f140_bA["m_invMass"] * self["m_impulse"])
end)()
 * self["m_J"]["linearA"]["y"])
end)()
);
__f140_bA["m_angularVelocity"] = __add(__f140_bA["m_angularVelocity"], (function()
return ((function()
return (__f140_bA["m_invI"] * self["m_impulse"])
end)()
 * self["m_J"]["angularA"])
end)()
);
__f140_bB["m_linearVelocity"]["x"] = __add(__f140_bB["m_linearVelocity"]["x"], (function()
return ((function()
return (__f140_bB["m_invMass"] * self["m_impulse"])
end)()
 * self["m_J"]["linearB"]["x"])
end)()
);
__f140_bB["m_linearVelocity"]["y"] = __add(__f140_bB["m_linearVelocity"]["y"], (function()
return ((function()
return (__f140_bB["m_invMass"] * self["m_impulse"])
end)()
 * self["m_J"]["linearB"]["y"])
end)()
);
__f140_bB["m_angularVelocity"] = __add(__f140_bB["m_angularVelocity"], (function()
return ((function()
return (__f140_bB["m_invI"] * self["m_impulse"])
end)()
 * self["m_J"]["angularB"])
end)()
)
return __f140_bB["m_angularVelocity"]
end)()

else self["m_impulse"] = 0
return self["m_impulse"]
end
end)()

end;
__proto_b2GearJoint["SolveVelocityConstraints"] = function(self, __f141_step)
local __f141_bA = self["m_bodyA"];
local __f141_bB = self["m_bodyB"];
local __f141_Cdot = self["m_J"]["Compute"](self["m_J"], __f141_bA["m_linearVelocity"], __f141_bA["m_angularVelocity"], __f141_bB["m_linearVelocity"], __f141_bB["m_angularVelocity"]);
local __f141_impulse = (function()
return ((function()
return (-self["m_mass"])
end)()
 * __f141_Cdot)
end)()
;
self["m_impulse"] = __add(self["m_impulse"], __f141_impulse);
__f141_bA["m_linearVelocity"]["x"] = __add(__f141_bA["m_linearVelocity"]["x"], (function()
return ((function()
return (__f141_bA["m_invMass"] * __f141_impulse)
end)()
 * self["m_J"]["linearA"]["x"])
end)()
);
__f141_bA["m_linearVelocity"]["y"] = __add(__f141_bA["m_linearVelocity"]["y"], (function()
return ((function()
return (__f141_bA["m_invMass"] * __f141_impulse)
end)()
 * self["m_J"]["linearA"]["y"])
end)()
);
__f141_bA["m_angularVelocity"] = __add(__f141_bA["m_angularVelocity"], (function()
return ((function()
return (__f141_bA["m_invI"] * __f141_impulse)
end)()
 * self["m_J"]["angularA"])
end)()
);
__f141_bB["m_linearVelocity"]["x"] = __add(__f141_bB["m_linearVelocity"]["x"], (function()
return ((function()
return (__f141_bB["m_invMass"] * __f141_impulse)
end)()
 * self["m_J"]["linearB"]["x"])
end)()
);
__f141_bB["m_linearVelocity"]["y"] = __add(__f141_bB["m_linearVelocity"]["y"], (function()
return ((function()
return (__f141_bB["m_invMass"] * __f141_impulse)
end)()
 * self["m_J"]["linearB"]["y"])
end)()
);
__f141_bB["m_angularVelocity"] = __add(__f141_bB["m_angularVelocity"], (function()
return ((function()
return (__f141_bB["m_invI"] * __f141_impulse)
end)()
 * self["m_J"]["angularB"])
end)()
)
return __f141_bB["m_angularVelocity"]
end;
__proto_b2GearJoint["SolvePositionConstraints"] = function(self, __f142_baumgarte)
(function()
local __oak_cond = __truthy((function()
return __oak_eq(__f142_baumgarte, nil)
end)()
)
if __oak_eq(__oak_cond, true) then __f142_baumgarte = 0
return __f142_baumgarte
else return __noop()
end
end)()
;
local __f142_linearError = 0;
local __f142_bA = self["m_bodyA"];
local __f142_bB = self["m_bodyB"];
local __f142_coordinate1 = 0;
local __f142_coordinate2 = 0;
(function()
local __oak_cond = __truthy(self["m_revolute1"])
if __oak_eq(__oak_cond, true) then __f142_coordinate1 = self["m_revolute1"]["GetJointAngle"](self["m_revolute1"])
return __f142_coordinate1
else __f142_coordinate1 = self["m_prismatic1"]["GetJointTranslation"](self["m_prismatic1"])
return __f142_coordinate1
end
end)()
;
(function()
local __oak_cond = __truthy(self["m_revolute2"])
if __oak_eq(__oak_cond, true) then __f142_coordinate2 = self["m_revolute2"]["GetJointAngle"](self["m_revolute2"])
return __f142_coordinate2
else __f142_coordinate2 = self["m_prismatic2"]["GetJointTranslation"](self["m_prismatic2"])
return __f142_coordinate2
end
end)()
;
local __f142_C = (function()
return (self["m_constant"] - __add(__f142_coordinate1, (function()
return (self["m_ratio"] * __f142_coordinate2)
end)()
))
end)()
;
local __f142_impulse = (function()
return ((function()
return (-self["m_mass"])
end)()
 * __f142_C)
end)()
;
__f142_bA["m_sweep"]["c"]["x"] = __add(__f142_bA["m_sweep"]["c"]["x"], (function()
return ((function()
return (__f142_bA["m_invMass"] * __f142_impulse)
end)()
 * self["m_J"]["linearA"]["x"])
end)()
);
__f142_bA["m_sweep"]["c"]["y"] = __add(__f142_bA["m_sweep"]["c"]["y"], (function()
return ((function()
return (__f142_bA["m_invMass"] * __f142_impulse)
end)()
 * self["m_J"]["linearA"]["y"])
end)()
);
__f142_bA["m_sweep"]["a"] = __add(__f142_bA["m_sweep"]["a"], (function()
return ((function()
return (__f142_bA["m_invI"] * __f142_impulse)
end)()
 * self["m_J"]["angularA"])
end)()
);
__f142_bB["m_sweep"]["c"]["x"] = __add(__f142_bB["m_sweep"]["c"]["x"], (function()
return ((function()
return (__f142_bB["m_invMass"] * __f142_impulse)
end)()
 * self["m_J"]["linearB"]["x"])
end)()
);
__f142_bB["m_sweep"]["c"]["y"] = __add(__f142_bB["m_sweep"]["c"]["y"], (function()
return ((function()
return (__f142_bB["m_invMass"] * __f142_impulse)
end)()
 * self["m_J"]["linearB"]["y"])
end)()
);
__f142_bB["m_sweep"]["a"] = __add(__f142_bB["m_sweep"]["a"], (function()
return ((function()
return (__f142_bB["m_invI"] * __f142_impulse)
end)()
 * self["m_J"]["angularB"])
end)()
);
__f142_bA["SynchronizeTransform"](__f142_bA);
__f142_bB["SynchronizeTransform"](__f142_bB);
return (function()
return (__f142_linearError < __static_b2Settings["b2_linearSlop"])
end)()

end;
__static_b2GearJoint = {};
b2GearJoint = function()
local self = b2Joint();
self["__type"] = 'b2GearJoint';
self["__types"] = {'b2GearJoint', 'b2Joint'};
self["__super"] = __proto_b2Joint;
self["GetAnchorA"] = __proto_b2GearJoint["GetAnchorA"];
self["GetAnchorB"] = __proto_b2GearJoint["GetAnchorB"];
self["GetReactionForce"] = __proto_b2GearJoint["GetReactionForce"];
self["GetReactionTorque"] = __proto_b2GearJoint["GetReactionTorque"];
self["GetRatio"] = __proto_b2GearJoint["GetRatio"];
self["SetRatio"] = __proto_b2GearJoint["SetRatio"];
self["InitVelocityConstraints"] = __proto_b2GearJoint["InitVelocityConstraints"];
self["SolveVelocityConstraints"] = __proto_b2GearJoint["SolveVelocityConstraints"];
self["SolvePositionConstraints"] = __proto_b2GearJoint["SolvePositionConstraints"];
(function()
Box2D["Dynamics"]["Joints"]["b2Joint"]["b2Joint"](self);
self["m_groundAnchor1"] = b2Vec2();
self["m_groundAnchor2"] = b2Vec2();
self["m_localAnchor1"] = b2Vec2();
self["m_localAnchor2"] = b2Vec2();
self["m_J"] = b2Jacobian();
self["__super"]["b2Joint"](self, def);
local __f143_type1 = __parseInt(def["joint1"]["m_type"]);
local __f143_type2 = __parseInt(def["joint2"]["m_type"]);
self["m_revolute1"] = nil;
self["m_prismatic1"] = nil;
self["m_revolute2"] = nil;
self["m_prismatic2"] = nil;
local __f143_coordinate1 = 0;
local __f143_coordinate2 = 0;
self["m_ground1"] = def["joint1"]["GetBodyA"](def["joint1"]);
self["m_bodyA"] = def["joint1"]["GetBodyB"](def["joint1"]);
(function()
local __oak_cond = __truthy((function()
return __oak_eq(__f143_type1, __static_b2Joint["e_revoluteJoint"])
end)()
)
if __oak_eq(__oak_cond, true) then return (function()
self["m_revolute1"] = (function()
local __oak_cond = __truthy(__instanceof(def["joint1"], 'b2RevoluteJoint'))
if __oak_eq(__oak_cond, true) then return def["joint1"]
else return nil
end
end)()
;
self["m_groundAnchor1"]["SetV"](self["m_groundAnchor1"], self["m_revolute1"]["m_localAnchor1"]);
self["m_localAnchor1"]["SetV"](self["m_localAnchor1"], self["m_revolute1"]["m_localAnchor2"]);
__f143_coordinate1 = self["m_revolute1"]["GetJointAngle"](self["m_revolute1"])
return __f143_coordinate1
end)()

else return (function()
self["m_prismatic1"] = (function()
local __oak_cond = __truthy(__instanceof(def["joint1"], 'b2PrismaticJoint'))
if __oak_eq(__oak_cond, true) then return def["joint1"]
else return nil
end
end)()
;
self["m_groundAnchor1"]["SetV"](self["m_groundAnchor1"], self["m_prismatic1"]["m_localAnchor1"]);
self["m_localAnchor1"]["SetV"](self["m_localAnchor1"], self["m_prismatic1"]["m_localAnchor2"]);
__f143_coordinate1 = self["m_prismatic1"]["GetJointTranslation"](self["m_prismatic1"])
return __f143_coordinate1
end)()

end
end)()
;
self["m_ground2"] = def["joint2"]["GetBodyA"](def["joint2"]);
self["m_bodyB"] = def["joint2"]["GetBodyB"](def["joint2"]);
(function()
local __oak_cond = __truthy((function()
return __oak_eq(__f143_type2, __static_b2Joint["e_revoluteJoint"])
end)()
)
if __oak_eq(__oak_cond, true) then return (function()
self["m_revolute2"] = (function()
local __oak_cond = __truthy(__instanceof(def["joint2"], 'b2RevoluteJoint'))
if __oak_eq(__oak_cond, true) then return def["joint2"]
else return nil
end
end)()
;
self["m_groundAnchor2"]["SetV"](self["m_groundAnchor2"], self["m_revolute2"]["m_localAnchor1"]);
self["m_localAnchor2"]["SetV"](self["m_localAnchor2"], self["m_revolute2"]["m_localAnchor2"]);
__f143_coordinate2 = self["m_revolute2"]["GetJointAngle"](self["m_revolute2"])
return __f143_coordinate2
end)()

else return (function()
self["m_prismatic2"] = (function()
local __oak_cond = __truthy(__instanceof(def["joint2"], 'b2PrismaticJoint'))
if __oak_eq(__oak_cond, true) then return def["joint2"]
else return nil
end
end)()
;
self["m_groundAnchor2"]["SetV"](self["m_groundAnchor2"], self["m_prismatic2"]["m_localAnchor1"]);
self["m_localAnchor2"]["SetV"](self["m_localAnchor2"], self["m_prismatic2"]["m_localAnchor2"]);
__f143_coordinate2 = self["m_prismatic2"]["GetJointTranslation"](self["m_prismatic2"])
return __f143_coordinate2
end)()

end
end)()
;
self["m_ratio"] = def["ratio"];
self["m_constant"] = __add(__f143_coordinate1, (function()
return (self["m_ratio"] * __f143_coordinate2)
end)()
);
self["m_impulse"] = 0
return self["m_impulse"]
end)()
;
return self
end;
Box2D["Dynamics"]["Joints"]["b2GearJoint"] = b2GearJoint;
__proto_b2GearJointDef = {};
__static_b2GearJointDef = {};
b2GearJointDef = function()
local self = b2JointDef();
self["__type"] = 'b2GearJointDef';
self["__types"] = {'b2GearJointDef', 'b2JointDef'};
self["__super"] = __proto_b2JointDef;
(function()
Box2D["Dynamics"]["Joints"]["b2JointDef"]["b2JointDef"](self);
self["__super"]["b2JointDef"](self);
self["type"] = __static_b2Joint["e_gearJoint"];
self["joint1"] = nil;
self["joint2"] = nil;
self["ratio"] = 1
return self["ratio"]
end)()
;
return self
end;
Box2D["Dynamics"]["Joints"]["b2GearJointDef"] = b2GearJointDef;
__proto_b2LineJoint = {};
__proto_b2LineJoint["GetAnchorA"] = function(self)
return self["m_bodyA"]["GetWorldPoint"](self["m_bodyA"], self["m_localAnchor1"])
end;
__proto_b2LineJoint["GetAnchorB"] = function(self)
return self["m_bodyB"]["GetWorldPoint"](self["m_bodyB"], self["m_localAnchor2"])
end;
__proto_b2LineJoint["GetReactionForce"] = function(self, __f147_inv_dt)
(function()
local __oak_cond = __truthy((function()
return __oak_eq(__f147_inv_dt, nil)
end)()
)
if __oak_eq(__oak_cond, true) then __f147_inv_dt = 0
return __f147_inv_dt
else return __noop()
end
end)()
;
return b2Vec2((function()
return (__f147_inv_dt * __add((function()
return (self["m_impulse"]["x"] * self["m_perp"]["x"])
end)()
, (function()
return (__add(self["m_motorImpulse"], self["m_impulse"]["y"]) * self["m_axis"]["x"])
end)()
))
end)()
, (function()
return (__f147_inv_dt * __add((function()
return (self["m_impulse"]["x"] * self["m_perp"]["y"])
end)()
, (function()
return (__add(self["m_motorImpulse"], self["m_impulse"]["y"]) * self["m_axis"]["y"])
end)()
))
end)()
)
end;
__proto_b2LineJoint["GetReactionTorque"] = function(self, __f148_inv_dt)
(function()
local __oak_cond = __truthy((function()
return __oak_eq(__f148_inv_dt, nil)
end)()
)
if __oak_eq(__oak_cond, true) then __f148_inv_dt = 0
return __f148_inv_dt
else return __noop()
end
end)()
;
return (function()
return (__f148_inv_dt * self["m_impulse"]["y"])
end)()

end;
__proto_b2LineJoint["GetJointTranslation"] = function(self)
local __f149_bA = self["m_bodyA"];
local __f149_bB = self["m_bodyB"];
local __f149_tMat = __noop();
local __f149_p1 = __f149_bA["GetWorldPoint"](__f149_bA, self["m_localAnchor1"]);
local __f149_p2 = __f149_bB["GetWorldPoint"](__f149_bB, self["m_localAnchor2"]);
local __f149_dX = (function()
return (__f149_p2["x"] - __f149_p1["x"])
end)()
;
local __f149_dY = (function()
return (__f149_p2["y"] - __f149_p1["y"])
end)()
;
local __f149_axis = __f149_bA["GetWorldVector"](__f149_bA, self["m_localXAxis1"]);
local __f149_translation = __add((function()
return (__f149_axis["x"] * __f149_dX)
end)()
, (function()
return (__f149_axis["y"] * __f149_dY)
end)()
);
return __f149_translation
end;
__proto_b2LineJoint["GetJointSpeed"] = function(self)
local __f150_bA = self["m_bodyA"];
local __f150_bB = self["m_bodyB"];
local __f150_tMat = __noop();
__f150_tMat = __f150_bA["m_xf"]["R"];
local __f150_r1X = (function()
return (self["m_localAnchor1"]["x"] - __f150_bA["m_sweep"]["localCenter"]["x"])
end)()
;
local __f150_r1Y = (function()
return (self["m_localAnchor1"]["y"] - __f150_bA["m_sweep"]["localCenter"]["y"])
end)()
;
local __f150_tX = __add((function()
return (__f150_tMat["col1"]["x"] * __f150_r1X)
end)()
, (function()
return (__f150_tMat["col2"]["x"] * __f150_r1Y)
end)()
);
__f150_r1Y = __add((function()
return (__f150_tMat["col1"]["y"] * __f150_r1X)
end)()
, (function()
return (__f150_tMat["col2"]["y"] * __f150_r1Y)
end)()
);
__f150_r1X = __f150_tX;
__f150_tMat = __f150_bB["m_xf"]["R"];
local __f150_r2X = (function()
return (self["m_localAnchor2"]["x"] - __f150_bB["m_sweep"]["localCenter"]["x"])
end)()
;
local __f150_r2Y = (function()
return (self["m_localAnchor2"]["y"] - __f150_bB["m_sweep"]["localCenter"]["y"])
end)()
;
__f150_tX = __add((function()
return (__f150_tMat["col1"]["x"] * __f150_r2X)
end)()
, (function()
return (__f150_tMat["col2"]["x"] * __f150_r2Y)
end)()
);
__f150_r2Y = __add((function()
return (__f150_tMat["col1"]["y"] * __f150_r2X)
end)()
, (function()
return (__f150_tMat["col2"]["y"] * __f150_r2Y)
end)()
);
__f150_r2X = __f150_tX;
local __f150_p1X = __add(__f150_bA["m_sweep"]["c"]["x"], __f150_r1X);
local __f150_p1Y = __add(__f150_bA["m_sweep"]["c"]["y"], __f150_r1Y);
local __f150_p2X = __add(__f150_bB["m_sweep"]["c"]["x"], __f150_r2X);
local __f150_p2Y = __add(__f150_bB["m_sweep"]["c"]["y"], __f150_r2Y);
local __f150_dX = (function()
return (__f150_p2X - __f150_p1X)
end)()
;
local __f150_dY = (function()
return (__f150_p2Y - __f150_p1Y)
end)()
;
local __f150_axis = __f150_bA["GetWorldVector"](__f150_bA, self["m_localXAxis1"]);
local __f150_v1 = __f150_bA["m_linearVelocity"];
local __f150_v2 = __f150_bB["m_linearVelocity"];
local __f150_w1 = __f150_bA["m_angularVelocity"];
local __f150_w2 = __f150_bB["m_angularVelocity"];
local __f150_speed = __add(__add((function()
return (__f150_dX * (function()
return ((function()
return (-__f150_w1)
end)()
 * __f150_axis["y"])
end)()
)
end)()
, (function()
return (__f150_dY * (function()
return (__f150_w1 * __f150_axis["x"])
end)()
)
end)()
), __add((function()
return (__f150_axis["x"] * (function()
return ((function()
return (__add(__f150_v2["x"], (function()
return ((function()
return (-__f150_w2)
end)()
 * __f150_r2Y)
end)()
) - __f150_v1["x"])
end)()
 - (function()
return ((function()
return (-__f150_w1)
end)()
 * __f150_r1Y)
end)()
)
end)()
)
end)()
, (function()
return (__f150_axis["y"] * (function()
return ((function()
return (__add(__f150_v2["y"], (function()
return (__f150_w2 * __f150_r2X)
end)()
) - __f150_v1["y"])
end)()
 - (function()
return (__f150_w1 * __f150_r1X)
end)()
)
end)()
)
end)()
));
return __f150_speed
end;
__proto_b2LineJoint["IsLimitEnabled"] = function(self)
return self["m_enableLimit"]
end;
__proto_b2LineJoint["EnableLimit"] = function(self, __f152_flag)
self["m_bodyA"]["SetAwake"](self["m_bodyA"], true);
self["m_bodyB"]["SetAwake"](self["m_bodyB"], true);
self["m_enableLimit"] = __f152_flag
return self["m_enableLimit"]
end;
__proto_b2LineJoint["GetLowerLimit"] = function(self)
return self["m_lowerTranslation"]
end;
__proto_b2LineJoint["GetUpperLimit"] = function(self)
return self["m_upperTranslation"]
end;
__proto_b2LineJoint["SetLimits"] = function(self, __f155_lower, __f155_upper)
(function()
local __oak_cond = __truthy((function()
return __oak_eq(__f155_lower, nil)
end)()
)
if __oak_eq(__oak_cond, true) then __f155_lower = 0
return __f155_lower
else return __noop()
end
end)()
;
(function()
local __oak_cond = __truthy((function()
return __oak_eq(__f155_upper, nil)
end)()
)
if __oak_eq(__oak_cond, true) then __f155_upper = 0
return __f155_upper
else return __noop()
end
end)()
;
self["m_bodyA"]["SetAwake"](self["m_bodyA"], true);
self["m_bodyB"]["SetAwake"](self["m_bodyB"], true);
self["m_lowerTranslation"] = __f155_lower;
self["m_upperTranslation"] = __f155_upper
return self["m_upperTranslation"]
end;
__proto_b2LineJoint["IsMotorEnabled"] = function(self)
return self["m_enableMotor"]
end;
__proto_b2LineJoint["EnableMotor"] = function(self, __f157_flag)
self["m_bodyA"]["SetAwake"](self["m_bodyA"], true);
self["m_bodyB"]["SetAwake"](self["m_bodyB"], true);
self["m_enableMotor"] = __f157_flag
return self["m_enableMotor"]
end;
__proto_b2LineJoint["SetMotorSpeed"] = function(self, __f158_speed)
(function()
local __oak_cond = __truthy((function()
return __oak_eq(__f158_speed, nil)
end)()
)
if __oak_eq(__oak_cond, true) then __f158_speed = 0
return __f158_speed
else return __noop()
end
end)()
;
self["m_bodyA"]["SetAwake"](self["m_bodyA"], true);
self["m_bodyB"]["SetAwake"](self["m_bodyB"], true);
self["m_motorSpeed"] = __f158_speed
return self["m_motorSpeed"]
end;
__proto_b2LineJoint["GetMotorSpeed"] = function(self)
return self["m_motorSpeed"]
end;
__proto_b2LineJoint["SetMaxMotorForce"] = function(self, __f160_force)
(function()
local __oak_cond = __truthy((function()
return __oak_eq(__f160_force, nil)
end)()
)
if __oak_eq(__oak_cond, true) then __f160_force = 0
return __f160_force
else return __noop()
end
end)()
;
self["m_bodyA"]["SetAwake"](self["m_bodyA"], true);
self["m_bodyB"]["SetAwake"](self["m_bodyB"], true);
self["m_maxMotorForce"] = __f160_force
return self["m_maxMotorForce"]
end;
__proto_b2LineJoint["GetMaxMotorForce"] = function(self)
return self["m_maxMotorForce"]
end;
__proto_b2LineJoint["GetMotorForce"] = function(self)
return self["m_motorImpulse"]
end;
__proto_b2LineJoint["InitVelocityConstraints"] = function(self, __f163_step)
local __f163_bA = self["m_bodyA"];
local __f163_bB = self["m_bodyB"];
local __f163_tMat = __noop();
local __f163_tX = 0;
self["m_localCenterA"]["SetV"](self["m_localCenterA"], __f163_bA["GetLocalCenter"](__f163_bA));
self["m_localCenterB"]["SetV"](self["m_localCenterB"], __f163_bB["GetLocalCenter"](__f163_bB));
local __f163_xf1 = __f163_bA["GetTransform"](__f163_bA);
local __f163_xf2 = __f163_bB["GetTransform"](__f163_bB);
__f163_tMat = __f163_bA["m_xf"]["R"];
local __f163_r1X = (function()
return (self["m_localAnchor1"]["x"] - self["m_localCenterA"]["x"])
end)()
;
local __f163_r1Y = (function()
return (self["m_localAnchor1"]["y"] - self["m_localCenterA"]["y"])
end)()
;
__f163_tX = __add((function()
return (__f163_tMat["col1"]["x"] * __f163_r1X)
end)()
, (function()
return (__f163_tMat["col2"]["x"] * __f163_r1Y)
end)()
);
__f163_r1Y = __add((function()
return (__f163_tMat["col1"]["y"] * __f163_r1X)
end)()
, (function()
return (__f163_tMat["col2"]["y"] * __f163_r1Y)
end)()
);
__f163_r1X = __f163_tX;
__f163_tMat = __f163_bB["m_xf"]["R"];
local __f163_r2X = (function()
return (self["m_localAnchor2"]["x"] - self["m_localCenterB"]["x"])
end)()
;
local __f163_r2Y = (function()
return (self["m_localAnchor2"]["y"] - self["m_localCenterB"]["y"])
end)()
;
__f163_tX = __add((function()
return (__f163_tMat["col1"]["x"] * __f163_r2X)
end)()
, (function()
return (__f163_tMat["col2"]["x"] * __f163_r2Y)
end)()
);
__f163_r2Y = __add((function()
return (__f163_tMat["col1"]["y"] * __f163_r2X)
end)()
, (function()
return (__f163_tMat["col2"]["y"] * __f163_r2Y)
end)()
);
__f163_r2X = __f163_tX;
local __f163_dX = (function()
return ((function()
return (__add(__f163_bB["m_sweep"]["c"]["x"], __f163_r2X) - __f163_bA["m_sweep"]["c"]["x"])
end)()
 - __f163_r1X)
end)()
;
local __f163_dY = (function()
return ((function()
return (__add(__f163_bB["m_sweep"]["c"]["y"], __f163_r2Y) - __f163_bA["m_sweep"]["c"]["y"])
end)()
 - __f163_r1Y)
end)()
;
self["m_invMassA"] = __f163_bA["m_invMass"];
self["m_invMassB"] = __f163_bB["m_invMass"];
self["m_invIA"] = __f163_bA["m_invI"];
self["m_invIB"] = __f163_bB["m_invI"];
(function()
self["m_axis"]["SetV"](self["m_axis"], __static_b2Math["MulMV"](__f163_xf1["R"], self["m_localXAxis1"]));
self["m_a1"] = (function()
return ((function()
return (__add(__f163_dX, __f163_r1X) * self["m_axis"]["y"])
end)()
 - (function()
return (__add(__f163_dY, __f163_r1Y) * self["m_axis"]["x"])
end)()
)
end)()
;
self["m_a2"] = (function()
return ((function()
return (__f163_r2X * self["m_axis"]["y"])
end)()
 - (function()
return (__f163_r2Y * self["m_axis"]["x"])
end)()
)
end)()
;
self["m_motorMass"] = __add(__add(__add(self["m_invMassA"], self["m_invMassB"]), (function()
return ((function()
return (self["m_invIA"] * self["m_a1"])
end)()
 * self["m_a1"])
end)()
), (function()
return ((function()
return (self["m_invIB"] * self["m_a2"])
end)()
 * self["m_a2"])
end)()
);
self["m_motorMass"] = (function()
local __oak_cond = __truthy((function()
return (self["m_motorMass"] > __Number["MIN_VALUE"])
end)()
)
if __oak_eq(__oak_cond, true) then return (function()
return (1 / self["m_motorMass"])
end)()

else return 0
end
end)()

return self["m_motorMass"]
end)()
;
(function()
self["m_perp"]["SetV"](self["m_perp"], __static_b2Math["MulMV"](__f163_xf1["R"], self["m_localYAxis1"]));
self["m_s1"] = (function()
return ((function()
return (__add(__f163_dX, __f163_r1X) * self["m_perp"]["y"])
end)()
 - (function()
return (__add(__f163_dY, __f163_r1Y) * self["m_perp"]["x"])
end)()
)
end)()
;
self["m_s2"] = (function()
return ((function()
return (__f163_r2X * self["m_perp"]["y"])
end)()
 - (function()
return (__f163_r2Y * self["m_perp"]["x"])
end)()
)
end)()
;
local __f163_m1 = self["m_invMassA"];
local __f163_m2 = self["m_invMassB"];
local __f163_i1 = self["m_invIA"];
local __f163_i2 = self["m_invIB"];
self["m_K"]["col1"]["x"] = __add(__add(__add(__f163_m1, __f163_m2), (function()
return ((function()
return (__f163_i1 * self["m_s1"])
end)()
 * self["m_s1"])
end)()
), (function()
return ((function()
return (__f163_i2 * self["m_s2"])
end)()
 * self["m_s2"])
end)()
);
self["m_K"]["col1"]["y"] = __add((function()
return ((function()
return (__f163_i1 * self["m_s1"])
end)()
 * self["m_a1"])
end)()
, (function()
return ((function()
return (__f163_i2 * self["m_s2"])
end)()
 * self["m_a2"])
end)()
);
self["m_K"]["col2"]["x"] = self["m_K"]["col1"]["y"];
self["m_K"]["col2"]["y"] = __add(__add(__add(__f163_m1, __f163_m2), (function()
return ((function()
return (__f163_i1 * self["m_a1"])
end)()
 * self["m_a1"])
end)()
), (function()
return ((function()
return (__f163_i2 * self["m_a2"])
end)()
 * self["m_a2"])
end)()
)
return self["m_K"]["col2"]["y"]
end)()
;
(function()
local __oak_cond = __truthy(self["m_enableLimit"])
if __oak_eq(__oak_cond, true) then return (function()
local __f163_jointTransition = __add((function()
return (self["m_axis"]["x"] * __f163_dX)
end)()
, (function()
return (self["m_axis"]["y"] * __f163_dY)
end)()
);
return (function()
local __oak_cond = __truthy((function()
return (__static_b2Math["Abs"]((function()
return (self["m_upperTranslation"] - self["m_lowerTranslation"])
end)()
) < (function()
return (2 * __static_b2Settings["b2_linearSlop"])
end)()
)
end)()
)
if __oak_eq(__oak_cond, true) then self["m_limitState"] = __static_b2Joint["e_equalLimits"]
return self["m_limitState"]
else return (function()
local __oak_cond = __truthy((function()
return (__f163_jointTransition <= self["m_lowerTranslation"])
end)()
)
if __oak_eq(__oak_cond, true) then return (function()
local __oak_cond = __truthy((function()
return (not __oak_eq(self["m_limitState"], __static_b2Joint["e_atLowerLimit"]))
end)()
)
if __oak_eq(__oak_cond, true) then return (function()
self["m_limitState"] = __static_b2Joint["e_atLowerLimit"];
self["m_impulse"]["y"] = 0
return self["m_impulse"]["y"]
end)()

else return __noop()
end
end)()

else return (function()
local __oak_cond = __truthy((function()
return (__f163_jointTransition >= self["m_upperTranslation"])
end)()
)
if __oak_eq(__oak_cond, true) then return (function()
local __oak_cond = __truthy((function()
return (not __oak_eq(self["m_limitState"], __static_b2Joint["e_atUpperLimit"]))
end)()
)
if __oak_eq(__oak_cond, true) then return (function()
self["m_limitState"] = __static_b2Joint["e_atUpperLimit"];
self["m_impulse"]["y"] = 0
return self["m_impulse"]["y"]
end)()

else return __noop()
end
end)()

else return (function()
self["m_limitState"] = __static_b2Joint["e_inactiveLimit"];
self["m_impulse"]["y"] = 0
return self["m_impulse"]["y"]
end)()

end
end)()

end
end)()

end
end)()

end)()

else self["m_limitState"] = __static_b2Joint["e_inactiveLimit"]
return self["m_limitState"]
end
end)()
;
(function()
local __oak_cond = __truthy((function()
return __oak_eq(self["m_enableMotor"], false)
end)()
)
if __oak_eq(__oak_cond, true) then self["m_motorImpulse"] = 0
return self["m_motorImpulse"]
else return __noop()
end
end)()
;
return (function()
local __oak_cond = __truthy(__f163_step["warmStarting"])
if __oak_eq(__oak_cond, true) then return (function()
self["m_impulse"]["x"] = (function()
return (self["m_impulse"]["x"] * __f163_step["dtRatio"])
end)()
;
self["m_impulse"]["y"] = (function()
return (self["m_impulse"]["y"] * __f163_step["dtRatio"])
end)()
;
self["m_motorImpulse"] = (function()
return (self["m_motorImpulse"] * __f163_step["dtRatio"])
end)()
;
local __f163_PX = __add((function()
return (self["m_impulse"]["x"] * self["m_perp"]["x"])
end)()
, (function()
return (__add(self["m_motorImpulse"], self["m_impulse"]["y"]) * self["m_axis"]["x"])
end)()
);
local __f163_PY = __add((function()
return (self["m_impulse"]["x"] * self["m_perp"]["y"])
end)()
, (function()
return (__add(self["m_motorImpulse"], self["m_impulse"]["y"]) * self["m_axis"]["y"])
end)()
);
local __f163_L1 = __add((function()
return (self["m_impulse"]["x"] * self["m_s1"])
end)()
, (function()
return (__add(self["m_motorImpulse"], self["m_impulse"]["y"]) * self["m_a1"])
end)()
);
local __f163_L2 = __add((function()
return (self["m_impulse"]["x"] * self["m_s2"])
end)()
, (function()
return (__add(self["m_motorImpulse"], self["m_impulse"]["y"]) * self["m_a2"])
end)()
);
__f163_bA["m_linearVelocity"]["x"] = (function()
return (__f163_bA["m_linearVelocity"]["x"] - (function()
return (self["m_invMassA"] * __f163_PX)
end)()
)
end)()
;
__f163_bA["m_linearVelocity"]["y"] = (function()
return (__f163_bA["m_linearVelocity"]["y"] - (function()
return (self["m_invMassA"] * __f163_PY)
end)()
)
end)()
;
__f163_bA["m_angularVelocity"] = (function()
return (__f163_bA["m_angularVelocity"] - (function()
return (self["m_invIA"] * __f163_L1)
end)()
)
end)()
;
__f163_bB["m_linearVelocity"]["x"] = __add(__f163_bB["m_linearVelocity"]["x"], (function()
return (self["m_invMassB"] * __f163_PX)
end)()
);
__f163_bB["m_linearVelocity"]["y"] = __add(__f163_bB["m_linearVelocity"]["y"], (function()
return (self["m_invMassB"] * __f163_PY)
end)()
);
__f163_bB["m_angularVelocity"] = __add(__f163_bB["m_angularVelocity"], (function()
return (self["m_invIB"] * __f163_L2)
end)()
)
return __f163_bB["m_angularVelocity"]
end)()

else return (function()
self["m_impulse"]["SetZero"](self["m_impulse"]);
self["m_motorImpulse"] = 0
return self["m_motorImpulse"]
end)()

end
end)()

end;
__proto_b2LineJoint["SolveVelocityConstraints"] = function(self, __f164_step)
local __f164_bA = self["m_bodyA"];
local __f164_bB = self["m_bodyB"];
local __f164_v1 = __f164_bA["m_linearVelocity"];
local __f164_w1 = __f164_bA["m_angularVelocity"];
local __f164_v2 = __f164_bB["m_linearVelocity"];
local __f164_w2 = __f164_bB["m_angularVelocity"];
local __f164_PX = 0;
local __f164_PY = 0;
local __f164_L1 = 0;
local __f164_L2 = 0;
(function()
local __oak_cond = __truthy(__and(self["m_enableMotor"], (function()
return (not __oak_eq(self["m_limitState"], __static_b2Joint["e_equalLimits"]))
end)()
))
if __oak_eq(__oak_cond, true) then return (function()
local __f164_Cdot = (function()
return (__add(__add((function()
return (self["m_axis"]["x"] * (function()
return (__f164_v2["x"] - __f164_v1["x"])
end)()
)
end)()
, (function()
return (self["m_axis"]["y"] * (function()
return (__f164_v2["y"] - __f164_v1["y"])
end)()
)
end)()
), (function()
return (self["m_a2"] * __f164_w2)
end)()
) - (function()
return (self["m_a1"] * __f164_w1)
end)()
)
end)()
;
local __f164_impulse = (function()
return (self["m_motorMass"] * (function()
return (self["m_motorSpeed"] - __f164_Cdot)
end)()
)
end)()
;
local __f164_oldImpulse = self["m_motorImpulse"];
local __f164_maxImpulse = (function()
return (__f164_step["dt"] * self["m_maxMotorForce"])
end)()
;
self["m_motorImpulse"] = __static_b2Math["Clamp"](__add(self["m_motorImpulse"], __f164_impulse), (function()
return (-__f164_maxImpulse)
end)()
, __f164_maxImpulse);
__f164_impulse = (function()
return (self["m_motorImpulse"] - __f164_oldImpulse)
end)()
;
__f164_PX = (function()
return (__f164_impulse * self["m_axis"]["x"])
end)()
;
__f164_PY = (function()
return (__f164_impulse * self["m_axis"]["y"])
end)()
;
__f164_L1 = (function()
return (__f164_impulse * self["m_a1"])
end)()
;
__f164_L2 = (function()
return (__f164_impulse * self["m_a2"])
end)()
;
__f164_v1["x"] = (function()
return (__f164_v1["x"] - (function()
return (self["m_invMassA"] * __f164_PX)
end)()
)
end)()
;
__f164_v1["y"] = (function()
return (__f164_v1["y"] - (function()
return (self["m_invMassA"] * __f164_PY)
end)()
)
end)()
;
__f164_w1 = (function()
return (__f164_w1 - (function()
return (self["m_invIA"] * __f164_L1)
end)()
)
end)()
;
__f164_v2["x"] = __add(__f164_v2["x"], (function()
return (self["m_invMassB"] * __f164_PX)
end)()
);
__f164_v2["y"] = __add(__f164_v2["y"], (function()
return (self["m_invMassB"] * __f164_PY)
end)()
);
__f164_w2 = __add(__f164_w2, (function()
return (self["m_invIB"] * __f164_L2)
end)()
)
return __f164_w2
end)()

else return __noop()
end
end)()
;
local __f164_Cdot1 = (function()
return (__add(__add((function()
return (self["m_perp"]["x"] * (function()
return (__f164_v2["x"] - __f164_v1["x"])
end)()
)
end)()
, (function()
return (self["m_perp"]["y"] * (function()
return (__f164_v2["y"] - __f164_v1["y"])
end)()
)
end)()
), (function()
return (self["m_s2"] * __f164_w2)
end)()
) - (function()
return (self["m_s1"] * __f164_w1)
end)()
)
end)()
;
(function()
local __oak_cond = __truthy(__and(self["m_enableLimit"], (function()
return (not __oak_eq(self["m_limitState"], __static_b2Joint["e_inactiveLimit"]))
end)()
))
if __oak_eq(__oak_cond, true) then return (function()
local __f164_Cdot2 = (function()
return (__add(__add((function()
return (self["m_axis"]["x"] * (function()
return (__f164_v2["x"] - __f164_v1["x"])
end)()
)
end)()
, (function()
return (self["m_axis"]["y"] * (function()
return (__f164_v2["y"] - __f164_v1["y"])
end)()
)
end)()
), (function()
return (self["m_a2"] * __f164_w2)
end)()
) - (function()
return (self["m_a1"] * __f164_w1)
end)()
)
end)()
;
local __f164_f1 = self["m_impulse"]["Copy"](self["m_impulse"]);
local __f164_df = self["m_K"]["Solve"](self["m_K"], b2Vec2(), (function()
return (-__f164_Cdot1)
end)()
, (function()
return (-__f164_Cdot2)
end)()
);
self["m_impulse"]["Add"](self["m_impulse"], __f164_df);
(function()
local __oak_cond = __truthy((function()
return __oak_eq(self["m_limitState"], __static_b2Joint["e_atLowerLimit"])
end)()
)
if __oak_eq(__oak_cond, true) then self["m_impulse"]["y"] = __static_b2Math["Max"](self["m_impulse"]["y"], 0)
return self["m_impulse"]["y"]
else return (function()
local __oak_cond = __truthy((function()
return __oak_eq(self["m_limitState"], __static_b2Joint["e_atUpperLimit"])
end)()
)
if __oak_eq(__oak_cond, true) then self["m_impulse"]["y"] = __static_b2Math["Min"](self["m_impulse"]["y"], 0)
return self["m_impulse"]["y"]
else return __noop()
end
end)()

end
end)()
;
local __f164_b = (function()
return ((function()
return (-__f164_Cdot1)
end)()
 - (function()
return ((function()
return (self["m_impulse"]["y"] - __f164_f1["y"])
end)()
 * self["m_K"]["col2"]["x"])
end)()
)
end)()
;
local __f164_f2r = 0;
(function()
local __oak_cond = __truthy((function()
return (not __oak_eq(self["m_K"]["col1"]["x"], 0))
end)()
)
if __oak_eq(__oak_cond, true) then __f164_f2r = __add((function()
return (__f164_b / self["m_K"]["col1"]["x"])
end)()
, __f164_f1["x"])
return __f164_f2r
else __f164_f2r = __f164_f1["x"]
return __f164_f2r
end
end)()
;
self["m_impulse"]["x"] = __f164_f2r;
__f164_df["x"] = (function()
return (self["m_impulse"]["x"] - __f164_f1["x"])
end)()
;
__f164_df["y"] = (function()
return (self["m_impulse"]["y"] - __f164_f1["y"])
end)()
;
__f164_PX = __add((function()
return (__f164_df["x"] * self["m_perp"]["x"])
end)()
, (function()
return (__f164_df["y"] * self["m_axis"]["x"])
end)()
);
__f164_PY = __add((function()
return (__f164_df["x"] * self["m_perp"]["y"])
end)()
, (function()
return (__f164_df["y"] * self["m_axis"]["y"])
end)()
);
__f164_L1 = __add((function()
return (__f164_df["x"] * self["m_s1"])
end)()
, (function()
return (__f164_df["y"] * self["m_a1"])
end)()
);
__f164_L2 = __add((function()
return (__f164_df["x"] * self["m_s2"])
end)()
, (function()
return (__f164_df["y"] * self["m_a2"])
end)()
);
__f164_v1["x"] = (function()
return (__f164_v1["x"] - (function()
return (self["m_invMassA"] * __f164_PX)
end)()
)
end)()
;
__f164_v1["y"] = (function()
return (__f164_v1["y"] - (function()
return (self["m_invMassA"] * __f164_PY)
end)()
)
end)()
;
__f164_w1 = (function()
return (__f164_w1 - (function()
return (self["m_invIA"] * __f164_L1)
end)()
)
end)()
;
__f164_v2["x"] = __add(__f164_v2["x"], (function()
return (self["m_invMassB"] * __f164_PX)
end)()
);
__f164_v2["y"] = __add(__f164_v2["y"], (function()
return (self["m_invMassB"] * __f164_PY)
end)()
);
__f164_w2 = __add(__f164_w2, (function()
return (self["m_invIB"] * __f164_L2)
end)()
)
return __f164_w2
end)()

else return (function()
local __f164_df2 = 0;
(function()
local __oak_cond = __truthy((function()
return (not __oak_eq(self["m_K"]["col1"]["x"], 0))
end)()
)
if __oak_eq(__oak_cond, true) then __f164_df2 = (function()
return ((function()
return (-__f164_Cdot1)
end)()
 / self["m_K"]["col1"]["x"])
end)()

return __f164_df2
else __f164_df2 = 0
return __f164_df2
end
end)()
;
self["m_impulse"]["x"] = __add(self["m_impulse"]["x"], __f164_df2);
__f164_PX = (function()
return (__f164_df2 * self["m_perp"]["x"])
end)()
;
__f164_PY = (function()
return (__f164_df2 * self["m_perp"]["y"])
end)()
;
__f164_L1 = (function()
return (__f164_df2 * self["m_s1"])
end)()
;
__f164_L2 = (function()
return (__f164_df2 * self["m_s2"])
end)()
;
__f164_v1["x"] = (function()
return (__f164_v1["x"] - (function()
return (self["m_invMassA"] * __f164_PX)
end)()
)
end)()
;
__f164_v1["y"] = (function()
return (__f164_v1["y"] - (function()
return (self["m_invMassA"] * __f164_PY)
end)()
)
end)()
;
__f164_w1 = (function()
return (__f164_w1 - (function()
return (self["m_invIA"] * __f164_L1)
end)()
)
end)()
;
__f164_v2["x"] = __add(__f164_v2["x"], (function()
return (self["m_invMassB"] * __f164_PX)
end)()
);
__f164_v2["y"] = __add(__f164_v2["y"], (function()
return (self["m_invMassB"] * __f164_PY)
end)()
);
__f164_w2 = __add(__f164_w2, (function()
return (self["m_invIB"] * __f164_L2)
end)()
)
return __f164_w2
end)()

end
end)()
;
__f164_bA["m_linearVelocity"]["SetV"](__f164_bA["m_linearVelocity"], __f164_v1);
__f164_bA["m_angularVelocity"] = __f164_w1;
__f164_bB["m_linearVelocity"]["SetV"](__f164_bB["m_linearVelocity"], __f164_v2);
__f164_bB["m_angularVelocity"] = __f164_w2
return __f164_bB["m_angularVelocity"]
end;
__proto_b2LineJoint["SolvePositionConstraints"] = function(self, __f165_baumgarte)
(function()
local __oak_cond = __truthy((function()
return __oak_eq(__f165_baumgarte, nil)
end)()
)
if __oak_eq(__oak_cond, true) then __f165_baumgarte = 0
return __f165_baumgarte
else return __noop()
end
end)()
;
local __f165_limitC = 0;
local __f165_oldLimitImpulse = 0;
local __f165_bA = self["m_bodyA"];
local __f165_bB = self["m_bodyB"];
local __f165_c1 = __f165_bA["m_sweep"]["c"];
local __f165_a1 = __f165_bA["m_sweep"]["a"];
local __f165_c2 = __f165_bB["m_sweep"]["c"];
local __f165_a2 = __f165_bB["m_sweep"]["a"];
local __f165_tMat = __noop();
local __f165_tX = 0;
local __f165_m1 = 0;
local __f165_m2 = 0;
local __f165_i1 = 0;
local __f165_i2 = 0;
local __f165_linearError = 0;
local __f165_angularError = 0;
local __f165_active = false;
local __f165_C2 = 0;
local __f165_R1 = __static_b2Mat22["FromAngle"](__f165_a1);
local __f165_R2 = __static_b2Mat22["FromAngle"](__f165_a2);
__f165_tMat = __f165_R1;
local __f165_r1X = (function()
return (self["m_localAnchor1"]["x"] - self["m_localCenterA"]["x"])
end)()
;
local __f165_r1Y = (function()
return (self["m_localAnchor1"]["y"] - self["m_localCenterA"]["y"])
end)()
;
__f165_tX = __add((function()
return (__f165_tMat["col1"]["x"] * __f165_r1X)
end)()
, (function()
return (__f165_tMat["col2"]["x"] * __f165_r1Y)
end)()
);
__f165_r1Y = __add((function()
return (__f165_tMat["col1"]["y"] * __f165_r1X)
end)()
, (function()
return (__f165_tMat["col2"]["y"] * __f165_r1Y)
end)()
);
__f165_r1X = __f165_tX;
__f165_tMat = __f165_R2;
local __f165_r2X = (function()
return (self["m_localAnchor2"]["x"] - self["m_localCenterB"]["x"])
end)()
;
local __f165_r2Y = (function()
return (self["m_localAnchor2"]["y"] - self["m_localCenterB"]["y"])
end)()
;
__f165_tX = __add((function()
return (__f165_tMat["col1"]["x"] * __f165_r2X)
end)()
, (function()
return (__f165_tMat["col2"]["x"] * __f165_r2Y)
end)()
);
__f165_r2Y = __add((function()
return (__f165_tMat["col1"]["y"] * __f165_r2X)
end)()
, (function()
return (__f165_tMat["col2"]["y"] * __f165_r2Y)
end)()
);
__f165_r2X = __f165_tX;
local __f165_dX = (function()
return ((function()
return (__add(__f165_c2["x"], __f165_r2X) - __f165_c1["x"])
end)()
 - __f165_r1X)
end)()
;
local __f165_dY = (function()
return ((function()
return (__add(__f165_c2["y"], __f165_r2Y) - __f165_c1["y"])
end)()
 - __f165_r1Y)
end)()
;
(function()
local __oak_cond = __truthy(self["m_enableLimit"])
if __oak_eq(__oak_cond, true) then return (function()
self["m_axis"] = __static_b2Math["MulMV"](__f165_R1, self["m_localXAxis1"]);
self["m_a1"] = (function()
return ((function()
return (__add(__f165_dX, __f165_r1X) * self["m_axis"]["y"])
end)()
 - (function()
return (__add(__f165_dY, __f165_r1Y) * self["m_axis"]["x"])
end)()
)
end)()
;
self["m_a2"] = (function()
return ((function()
return (__f165_r2X * self["m_axis"]["y"])
end)()
 - (function()
return (__f165_r2Y * self["m_axis"]["x"])
end)()
)
end)()
;
local __f165_translation = __add((function()
return (self["m_axis"]["x"] * __f165_dX)
end)()
, (function()
return (self["m_axis"]["y"] * __f165_dY)
end)()
);
return (function()
local __oak_cond = __truthy((function()
return (__static_b2Math["Abs"]((function()
return (self["m_upperTranslation"] - self["m_lowerTranslation"])
end)()
) < (function()
return (2 * __static_b2Settings["b2_linearSlop"])
end)()
)
end)()
)
if __oak_eq(__oak_cond, true) then return (function()
__f165_C2 = __static_b2Math["Clamp"](__f165_translation, (function()
return (-__static_b2Settings["b2_maxLinearCorrection"])
end)()
, __static_b2Settings["b2_maxLinearCorrection"]);
__f165_linearError = __static_b2Math["Abs"](__f165_translation);
__f165_active = true
return __f165_active
end)()

else return (function()
local __oak_cond = __truthy((function()
return (__f165_translation <= self["m_lowerTranslation"])
end)()
)
if __oak_eq(__oak_cond, true) then return (function()
__f165_C2 = __static_b2Math["Clamp"](__add((function()
return (__f165_translation - self["m_lowerTranslation"])
end)()
, __static_b2Settings["b2_linearSlop"]), (function()
return (-__static_b2Settings["b2_maxLinearCorrection"])
end)()
, 0);
__f165_linearError = (function()
return (self["m_lowerTranslation"] - __f165_translation)
end)()
;
__f165_active = true
return __f165_active
end)()

else return (function()
local __oak_cond = __truthy((function()
return (__f165_translation >= self["m_upperTranslation"])
end)()
)
if __oak_eq(__oak_cond, true) then return (function()
__f165_C2 = __static_b2Math["Clamp"](__add((function()
return (__f165_translation - self["m_upperTranslation"])
end)()
, __static_b2Settings["b2_linearSlop"]), 0, __static_b2Settings["b2_maxLinearCorrection"]);
__f165_linearError = (function()
return (__f165_translation - self["m_upperTranslation"])
end)()
;
__f165_active = true
return __f165_active
end)()

else return __noop()
end
end)()

end
end)()

end
end)()

end)()

else return __noop()
end
end)()
;
self["m_perp"] = __static_b2Math["MulMV"](__f165_R1, self["m_localYAxis1"]);
self["m_s1"] = (function()
return ((function()
return (__add(__f165_dX, __f165_r1X) * self["m_perp"]["y"])
end)()
 - (function()
return (__add(__f165_dY, __f165_r1Y) * self["m_perp"]["x"])
end)()
)
end)()
;
self["m_s2"] = (function()
return ((function()
return (__f165_r2X * self["m_perp"]["y"])
end)()
 - (function()
return (__f165_r2Y * self["m_perp"]["x"])
end)()
)
end)()
;
local __f165_impulse = b2Vec2();
local __f165_C1 = __add((function()
return (self["m_perp"]["x"] * __f165_dX)
end)()
, (function()
return (self["m_perp"]["y"] * __f165_dY)
end)()
);
__f165_linearError = __static_b2Math["Max"](__f165_linearError, __static_b2Math["Abs"](__f165_C1));
__f165_angularError = 0;
(function()
local __oak_cond = __truthy(__f165_active)
if __oak_eq(__oak_cond, true) then return (function()
__f165_m1 = self["m_invMassA"];
__f165_m2 = self["m_invMassB"];
__f165_i1 = self["m_invIA"];
__f165_i2 = self["m_invIB"];
self["m_K"]["col1"]["x"] = __add(__add(__add(__f165_m1, __f165_m2), (function()
return ((function()
return (__f165_i1 * self["m_s1"])
end)()
 * self["m_s1"])
end)()
), (function()
return ((function()
return (__f165_i2 * self["m_s2"])
end)()
 * self["m_s2"])
end)()
);
self["m_K"]["col1"]["y"] = __add((function()
return ((function()
return (__f165_i1 * self["m_s1"])
end)()
 * self["m_a1"])
end)()
, (function()
return ((function()
return (__f165_i2 * self["m_s2"])
end)()
 * self["m_a2"])
end)()
);
self["m_K"]["col2"]["x"] = self["m_K"]["col1"]["y"];
self["m_K"]["col2"]["y"] = __add(__add(__add(__f165_m1, __f165_m2), (function()
return ((function()
return (__f165_i1 * self["m_a1"])
end)()
 * self["m_a1"])
end)()
), (function()
return ((function()
return (__f165_i2 * self["m_a2"])
end)()
 * self["m_a2"])
end)()
);
return self["m_K"]["Solve"](self["m_K"], __f165_impulse, (function()
return (-__f165_C1)
end)()
, (function()
return (-__f165_C2)
end)()
)
end)()

else return (function()
__f165_m1 = self["m_invMassA"];
__f165_m2 = self["m_invMassB"];
__f165_i1 = self["m_invIA"];
__f165_i2 = self["m_invIB"];
local __f165_k11 = __add(__add(__add(__f165_m1, __f165_m2), (function()
return ((function()
return (__f165_i1 * self["m_s1"])
end)()
 * self["m_s1"])
end)()
), (function()
return ((function()
return (__f165_i2 * self["m_s2"])
end)()
 * self["m_s2"])
end)()
);
local __f165_impulse1 = 0;
(function()
local __oak_cond = __truthy((function()
return (not __oak_eq(__f165_k11, 0))
end)()
)
if __oak_eq(__oak_cond, true) then __f165_impulse1 = (function()
return ((function()
return (-__f165_C1)
end)()
 / __f165_k11)
end)()

return __f165_impulse1
else __f165_impulse1 = 0
return __f165_impulse1
end
end)()
;
__f165_impulse["x"] = __f165_impulse1;
__f165_impulse["y"] = 0
return __f165_impulse["y"]
end)()

end
end)()
;
local __f165_PX = __add((function()
return (__f165_impulse["x"] * self["m_perp"]["x"])
end)()
, (function()
return (__f165_impulse["y"] * self["m_axis"]["x"])
end)()
);
local __f165_PY = __add((function()
return (__f165_impulse["x"] * self["m_perp"]["y"])
end)()
, (function()
return (__f165_impulse["y"] * self["m_axis"]["y"])
end)()
);
local __f165_L1 = __add((function()
return (__f165_impulse["x"] * self["m_s1"])
end)()
, (function()
return (__f165_impulse["y"] * self["m_a1"])
end)()
);
local __f165_L2 = __add((function()
return (__f165_impulse["x"] * self["m_s2"])
end)()
, (function()
return (__f165_impulse["y"] * self["m_a2"])
end)()
);
__f165_c1["x"] = (function()
return (__f165_c1["x"] - (function()
return (self["m_invMassA"] * __f165_PX)
end)()
)
end)()
;
__f165_c1["y"] = (function()
return (__f165_c1["y"] - (function()
return (self["m_invMassA"] * __f165_PY)
end)()
)
end)()
;
__f165_a1 = (function()
return (__f165_a1 - (function()
return (self["m_invIA"] * __f165_L1)
end)()
)
end)()
;
__f165_c2["x"] = __add(__f165_c2["x"], (function()
return (self["m_invMassB"] * __f165_PX)
end)()
);
__f165_c2["y"] = __add(__f165_c2["y"], (function()
return (self["m_invMassB"] * __f165_PY)
end)()
);
__f165_a2 = __add(__f165_a2, (function()
return (self["m_invIB"] * __f165_L2)
end)()
);
__f165_bA["m_sweep"]["a"] = __f165_a1;
__f165_bB["m_sweep"]["a"] = __f165_a2;
__f165_bA["SynchronizeTransform"](__f165_bA);
__f165_bB["SynchronizeTransform"](__f165_bB);
return __and((function()
return (__f165_linearError <= __static_b2Settings["b2_linearSlop"])
end)()
, (function()
return (__f165_angularError <= __static_b2Settings["b2_angularSlop"])
end)()
)
end;
__static_b2LineJoint = {};
b2LineJoint = function()
local self = b2Joint();
self["__type"] = 'b2LineJoint';
self["__types"] = {'b2LineJoint', 'b2Joint'};
self["__super"] = __proto_b2Joint;
self["GetAnchorA"] = __proto_b2LineJoint["GetAnchorA"];
self["GetAnchorB"] = __proto_b2LineJoint["GetAnchorB"];
self["GetReactionForce"] = __proto_b2LineJoint["GetReactionForce"];
self["GetReactionTorque"] = __proto_b2LineJoint["GetReactionTorque"];
self["GetJointTranslation"] = __proto_b2LineJoint["GetJointTranslation"];
self["GetJointSpeed"] = __proto_b2LineJoint["GetJointSpeed"];
self["IsLimitEnabled"] = __proto_b2LineJoint["IsLimitEnabled"];
self["EnableLimit"] = __proto_b2LineJoint["EnableLimit"];
self["GetLowerLimit"] = __proto_b2LineJoint["GetLowerLimit"];
self["GetUpperLimit"] = __proto_b2LineJoint["GetUpperLimit"];
self["SetLimits"] = __proto_b2LineJoint["SetLimits"];
self["IsMotorEnabled"] = __proto_b2LineJoint["IsMotorEnabled"];
self["EnableMotor"] = __proto_b2LineJoint["EnableMotor"];
self["SetMotorSpeed"] = __proto_b2LineJoint["SetMotorSpeed"];
self["GetMotorSpeed"] = __proto_b2LineJoint["GetMotorSpeed"];
self["SetMaxMotorForce"] = __proto_b2LineJoint["SetMaxMotorForce"];
self["GetMaxMotorForce"] = __proto_b2LineJoint["GetMaxMotorForce"];
self["GetMotorForce"] = __proto_b2LineJoint["GetMotorForce"];
self["InitVelocityConstraints"] = __proto_b2LineJoint["InitVelocityConstraints"];
self["SolveVelocityConstraints"] = __proto_b2LineJoint["SolveVelocityConstraints"];
self["SolvePositionConstraints"] = __proto_b2LineJoint["SolvePositionConstraints"];
(function()
Box2D["Dynamics"]["Joints"]["b2Joint"]["b2Joint"](self);
self["m_localAnchor1"] = b2Vec2();
self["m_localAnchor2"] = b2Vec2();
self["m_localXAxis1"] = b2Vec2();
self["m_localYAxis1"] = b2Vec2();
self["m_axis"] = b2Vec2();
self["m_perp"] = b2Vec2();
self["m_K"] = b2Mat22();
self["m_impulse"] = b2Vec2();
self["__super"]["b2Joint"](self, def);
local __f166_tMat = __noop();
local __f166_tX = 0;
local __f166_tY = 0;
self["m_localAnchor1"]["SetV"](self["m_localAnchor1"], def["localAnchorA"]);
self["m_localAnchor2"]["SetV"](self["m_localAnchor2"], def["localAnchorB"]);
self["m_localXAxis1"]["SetV"](self["m_localXAxis1"], def["localAxisA"]);
self["m_localYAxis1"]["x"] = (function()
return (-self["m_localXAxis1"]["y"])
end)()
;
self["m_localYAxis1"]["y"] = self["m_localXAxis1"]["x"];
self["m_impulse"]["SetZero"](self["m_impulse"]);
self["m_motorMass"] = 0;
self["m_motorImpulse"] = 0;
self["m_lowerTranslation"] = def["lowerTranslation"];
self["m_upperTranslation"] = def["upperTranslation"];
self["m_maxMotorForce"] = def["maxMotorForce"];
self["m_motorSpeed"] = def["motorSpeed"];
self["m_enableLimit"] = def["enableLimit"];
self["m_enableMotor"] = def["enableMotor"];
self["m_limitState"] = __static_b2Joint["e_inactiveLimit"];
self["m_axis"]["SetZero"](self["m_axis"]);
return self["m_perp"]["SetZero"](self["m_perp"])
end)()
;
return self
end;
Box2D["Dynamics"]["Joints"]["b2LineJoint"] = b2LineJoint;
__proto_b2LineJointDef = {};
__proto_b2LineJointDef["Initialize"] = function(self, __f167_bA, __f167_bB, __f167_anchor, __f167_axis)
self["bodyA"] = __f167_bA;
self["bodyB"] = __f167_bB;
self["localAnchorA"] = self["bodyA"]["GetLocalPoint"](self["bodyA"], __f167_anchor);
self["localAnchorB"] = self["bodyB"]["GetLocalPoint"](self["bodyB"], __f167_anchor);
self["localAxisA"] = self["bodyA"]["GetLocalVector"](self["bodyA"], __f167_axis)
return self["localAxisA"]
end;
__static_b2LineJointDef = {};
b2LineJointDef = function()
local self = b2JointDef();
self["__type"] = 'b2LineJointDef';
self["__types"] = {'b2LineJointDef', 'b2JointDef'};
self["__super"] = __proto_b2JointDef;
self["Initialize"] = __proto_b2LineJointDef["Initialize"];
(function()
Box2D["Dynamics"]["Joints"]["b2JointDef"]["b2JointDef"](self);
self["localAnchorA"] = b2Vec2();
self["localAnchorB"] = b2Vec2();
self["localAxisA"] = b2Vec2();
self["__super"]["b2JointDef"](self);
self["type"] = __static_b2Joint["e_lineJoint"];
self["localAxisA"]["Set"](self["localAxisA"], 1, 0);
self["enableLimit"] = false;
self["lowerTranslation"] = 0;
self["upperTranslation"] = 0;
self["enableMotor"] = false;
self["maxMotorForce"] = 0;
self["motorSpeed"] = 0
return self["motorSpeed"]
end)()
;
return self
end;
Box2D["Dynamics"]["Joints"]["b2LineJointDef"] = b2LineJointDef;
__proto_b2MouseJoint = {};
__proto_b2MouseJoint["GetAnchorA"] = function(self)
return self["m_target"]
end;
__proto_b2MouseJoint["GetAnchorB"] = function(self)
return self["m_bodyB"]["GetWorldPoint"](self["m_bodyB"], self["m_localAnchor"])
end;
__proto_b2MouseJoint["GetReactionForce"] = function(self, __f171_inv_dt)
(function()
local __oak_cond = __truthy((function()
return __oak_eq(__f171_inv_dt, nil)
end)()
)
if __oak_eq(__oak_cond, true) then __f171_inv_dt = 0
return __f171_inv_dt
else return __noop()
end
end)()
;
return b2Vec2((function()
return (__f171_inv_dt * self["m_impulse"]["x"])
end)()
, (function()
return (__f171_inv_dt * self["m_impulse"]["y"])
end)()
)
end;
__proto_b2MouseJoint["GetReactionTorque"] = function(self, __f172_inv_dt)
(function()
local __oak_cond = __truthy((function()
return __oak_eq(__f172_inv_dt, nil)
end)()
)
if __oak_eq(__oak_cond, true) then __f172_inv_dt = 0
return __f172_inv_dt
else return __noop()
end
end)()
;
return 0
end;
__proto_b2MouseJoint["GetTarget"] = function(self)
return self["m_target"]
end;
__proto_b2MouseJoint["SetTarget"] = function(self, __f174_target)
(function()
local __oak_cond = __truthy((function()
return __oak_eq(self["m_bodyB"]["IsAwake"](self["m_bodyB"]), false)
end)()
)
if __oak_eq(__oak_cond, true) then return self["m_bodyB"]["SetAwake"](self["m_bodyB"], true)
else return __noop()
end
end)()
;
self["m_target"] = __f174_target
return self["m_target"]
end;
__proto_b2MouseJoint["GetMaxForce"] = function(self)
return self["m_maxForce"]
end;
__proto_b2MouseJoint["SetMaxForce"] = function(self, __f176_maxForce)
(function()
local __oak_cond = __truthy((function()
return __oak_eq(__f176_maxForce, nil)
end)()
)
if __oak_eq(__oak_cond, true) then __f176_maxForce = 0
return __f176_maxForce
else return __noop()
end
end)()
;
self["m_maxForce"] = __f176_maxForce
return self["m_maxForce"]
end;
__proto_b2MouseJoint["GetFrequency"] = function(self)
return self["m_frequencyHz"]
end;
__proto_b2MouseJoint["SetFrequency"] = function(self, __f178_hz)
(function()
local __oak_cond = __truthy((function()
return __oak_eq(__f178_hz, nil)
end)()
)
if __oak_eq(__oak_cond, true) then __f178_hz = 0
return __f178_hz
else return __noop()
end
end)()
;
self["m_frequencyHz"] = __f178_hz
return self["m_frequencyHz"]
end;
__proto_b2MouseJoint["GetDampingRatio"] = function(self)
return self["m_dampingRatio"]
end;
__proto_b2MouseJoint["SetDampingRatio"] = function(self, __f180_ratio)
(function()
local __oak_cond = __truthy((function()
return __oak_eq(__f180_ratio, nil)
end)()
)
if __oak_eq(__oak_cond, true) then __f180_ratio = 0
return __f180_ratio
else return __noop()
end
end)()
;
self["m_dampingRatio"] = __f180_ratio
return self["m_dampingRatio"]
end;
__proto_b2MouseJoint["InitVelocityConstraints"] = function(self, __f181_step)
local __f181_b = self["m_bodyB"];
local __f181_mass = __f181_b["GetMass"](__f181_b);
local __f181_omega = (function()
return ((function()
return (2 * __Math["PI"])
end)()
 * self["m_frequencyHz"])
end)()
;
local __f181_d = (function()
return ((function()
return ((function()
return (2 * __f181_mass)
end)()
 * self["m_dampingRatio"])
end)()
 * __f181_omega)
end)()
;
local __f181_k = (function()
return ((function()
return (__f181_mass * __f181_omega)
end)()
 * __f181_omega)
end)()
;
self["m_gamma"] = (function()
return (__f181_step["dt"] * __add(__f181_d, (function()
return (__f181_step["dt"] * __f181_k)
end)()
))
end)()
;
self["m_gamma"] = (function()
local __oak_cond = __truthy((function()
return (not __oak_eq(self["m_gamma"], 0))
end)()
)
if __oak_eq(__oak_cond, true) then return (function()
return (1 / self["m_gamma"])
end)()

else return 0
end
end)()
;
self["m_beta"] = (function()
return ((function()
return (__f181_step["dt"] * __f181_k)
end)()
 * self["m_gamma"])
end)()
;
local __f181_tMat = __noop();
__f181_tMat = __f181_b["m_xf"]["R"];
local __f181_rX = (function()
return (self["m_localAnchor"]["x"] - __f181_b["m_sweep"]["localCenter"]["x"])
end)()
;
local __f181_rY = (function()
return (self["m_localAnchor"]["y"] - __f181_b["m_sweep"]["localCenter"]["y"])
end)()
;
local __f181_tX = __add((function()
return (__f181_tMat["col1"]["x"] * __f181_rX)
end)()
, (function()
return (__f181_tMat["col2"]["x"] * __f181_rY)
end)()
);
__f181_rY = __add((function()
return (__f181_tMat["col1"]["y"] * __f181_rX)
end)()
, (function()
return (__f181_tMat["col2"]["y"] * __f181_rY)
end)()
);
__f181_rX = __f181_tX;
local __f181_invMass = __f181_b["m_invMass"];
local __f181_invI = __f181_b["m_invI"];
self["K1"]["col1"]["x"] = __f181_invMass;
self["K1"]["col2"]["x"] = 0;
self["K1"]["col1"]["y"] = 0;
self["K1"]["col2"]["y"] = __f181_invMass;
self["K2"]["col1"]["x"] = (function()
return ((function()
return (__f181_invI * __f181_rY)
end)()
 * __f181_rY)
end)()
;
self["K2"]["col2"]["x"] = (function()
return ((function()
return ((function()
return (-__f181_invI)
end)()
 * __f181_rX)
end)()
 * __f181_rY)
end)()
;
self["K2"]["col1"]["y"] = (function()
return ((function()
return ((function()
return (-__f181_invI)
end)()
 * __f181_rX)
end)()
 * __f181_rY)
end)()
;
self["K2"]["col2"]["y"] = (function()
return ((function()
return (__f181_invI * __f181_rX)
end)()
 * __f181_rX)
end)()
;
self["K"]["SetM"](self["K"], self["K1"]);
self["K"]["AddM"](self["K"], self["K2"]);
self["K"]["col1"]["x"] = __add(self["K"]["col1"]["x"], self["m_gamma"]);
self["K"]["col2"]["y"] = __add(self["K"]["col2"]["y"], self["m_gamma"]);
self["K"]["GetInverse"](self["K"], self["m_mass"]);
self["m_C"]["x"] = (function()
return (__add(__f181_b["m_sweep"]["c"]["x"], __f181_rX) - self["m_target"]["x"])
end)()
;
self["m_C"]["y"] = (function()
return (__add(__f181_b["m_sweep"]["c"]["y"], __f181_rY) - self["m_target"]["y"])
end)()
;
__f181_b["m_angularVelocity"] = (function()
return (__f181_b["m_angularVelocity"] * 0.98)
end)()
;
self["m_impulse"]["x"] = (function()
return (self["m_impulse"]["x"] * __f181_step["dtRatio"])
end)()
;
self["m_impulse"]["y"] = (function()
return (self["m_impulse"]["y"] * __f181_step["dtRatio"])
end)()
;
__f181_b["m_linearVelocity"]["x"] = __add(__f181_b["m_linearVelocity"]["x"], (function()
return (__f181_invMass * self["m_impulse"]["x"])
end)()
);
__f181_b["m_linearVelocity"]["y"] = __add(__f181_b["m_linearVelocity"]["y"], (function()
return (__f181_invMass * self["m_impulse"]["y"])
end)()
);
__f181_b["m_angularVelocity"] = __add(__f181_b["m_angularVelocity"], (function()
return (__f181_invI * (function()
return ((function()
return (__f181_rX * self["m_impulse"]["y"])
end)()
 - (function()
return (__f181_rY * self["m_impulse"]["x"])
end)()
)
end)()
)
end)()
)
return __f181_b["m_angularVelocity"]
end;
__proto_b2MouseJoint["SolveVelocityConstraints"] = function(self, __f182_step)
local __f182_b = self["m_bodyB"];
local __f182_tMat = __noop();
local __f182_tX = 0;
local __f182_tY = 0;
__f182_tMat = __f182_b["m_xf"]["R"];
local __f182_rX = (function()
return (self["m_localAnchor"]["x"] - __f182_b["m_sweep"]["localCenter"]["x"])
end)()
;
local __f182_rY = (function()
return (self["m_localAnchor"]["y"] - __f182_b["m_sweep"]["localCenter"]["y"])
end)()
;
__f182_tX = __add((function()
return (__f182_tMat["col1"]["x"] * __f182_rX)
end)()
, (function()
return (__f182_tMat["col2"]["x"] * __f182_rY)
end)()
);
__f182_rY = __add((function()
return (__f182_tMat["col1"]["y"] * __f182_rX)
end)()
, (function()
return (__f182_tMat["col2"]["y"] * __f182_rY)
end)()
);
__f182_rX = __f182_tX;
local __f182_CdotX = __add(__f182_b["m_linearVelocity"]["x"], (function()
return ((function()
return (-__f182_b["m_angularVelocity"])
end)()
 * __f182_rY)
end)()
);
local __f182_CdotY = __add(__f182_b["m_linearVelocity"]["y"], (function()
return (__f182_b["m_angularVelocity"] * __f182_rX)
end)()
);
__f182_tMat = self["m_mass"];
__f182_tX = __add(__add(__f182_CdotX, (function()
return (self["m_beta"] * self["m_C"]["x"])
end)()
), (function()
return (self["m_gamma"] * self["m_impulse"]["x"])
end)()
);
__f182_tY = __add(__add(__f182_CdotY, (function()
return (self["m_beta"] * self["m_C"]["y"])
end)()
), (function()
return (self["m_gamma"] * self["m_impulse"]["y"])
end)()
);
local __f182_impulseX = (function()
return (-__add((function()
return (__f182_tMat["col1"]["x"] * __f182_tX)
end)()
, (function()
return (__f182_tMat["col2"]["x"] * __f182_tY)
end)()
))
end)()
;
local __f182_impulseY = (function()
return (-__add((function()
return (__f182_tMat["col1"]["y"] * __f182_tX)
end)()
, (function()
return (__f182_tMat["col2"]["y"] * __f182_tY)
end)()
))
end)()
;
local __f182_oldImpulseX = self["m_impulse"]["x"];
local __f182_oldImpulseY = self["m_impulse"]["y"];
self["m_impulse"]["x"] = __add(self["m_impulse"]["x"], __f182_impulseX);
self["m_impulse"]["y"] = __add(self["m_impulse"]["y"], __f182_impulseY);
local __f182_maxImpulse = (function()
return (__f182_step["dt"] * self["m_maxForce"])
end)()
;
(function()
local __oak_cond = __truthy((function()
return (self["m_impulse"]["LengthSquared"](self["m_impulse"]) > (function()
return (__f182_maxImpulse * __f182_maxImpulse)
end)()
)
end)()
)
if __oak_eq(__oak_cond, true) then return self["m_impulse"]["Multiply"](self["m_impulse"], (function()
return (__f182_maxImpulse / self["m_impulse"]["Length"](self["m_impulse"]))
end)()
)
else return __noop()
end
end)()
;
__f182_impulseX = (function()
return (self["m_impulse"]["x"] - __f182_oldImpulseX)
end)()
;
__f182_impulseY = (function()
return (self["m_impulse"]["y"] - __f182_oldImpulseY)
end)()
;
__f182_b["m_linearVelocity"]["x"] = __add(__f182_b["m_linearVelocity"]["x"], (function()
return (__f182_b["m_invMass"] * __f182_impulseX)
end)()
);
__f182_b["m_linearVelocity"]["y"] = __add(__f182_b["m_linearVelocity"]["y"], (function()
return (__f182_b["m_invMass"] * __f182_impulseY)
end)()
);
__f182_b["m_angularVelocity"] = __add(__f182_b["m_angularVelocity"], (function()
return (__f182_b["m_invI"] * (function()
return ((function()
return (__f182_rX * __f182_impulseY)
end)()
 - (function()
return (__f182_rY * __f182_impulseX)
end)()
)
end)()
)
end)()
)
return __f182_b["m_angularVelocity"]
end;
__proto_b2MouseJoint["SolvePositionConstraints"] = function(self, __f183_baumgarte)
(function()
local __oak_cond = __truthy((function()
return __oak_eq(__f183_baumgarte, nil)
end)()
)
if __oak_eq(__oak_cond, true) then __f183_baumgarte = 0
return __f183_baumgarte
else return __noop()
end
end)()
;
return true
end;
__static_b2MouseJoint = {};
b2MouseJoint = function()
local self = b2Joint();
self["__type"] = 'b2MouseJoint';
self["__types"] = {'b2MouseJoint', 'b2Joint'};
self["__super"] = __proto_b2Joint;
self["GetAnchorA"] = __proto_b2MouseJoint["GetAnchorA"];
self["GetAnchorB"] = __proto_b2MouseJoint["GetAnchorB"];
self["GetReactionForce"] = __proto_b2MouseJoint["GetReactionForce"];
self["GetReactionTorque"] = __proto_b2MouseJoint["GetReactionTorque"];
self["GetTarget"] = __proto_b2MouseJoint["GetTarget"];
self["SetTarget"] = __proto_b2MouseJoint["SetTarget"];
self["GetMaxForce"] = __proto_b2MouseJoint["GetMaxForce"];
self["SetMaxForce"] = __proto_b2MouseJoint["SetMaxForce"];
self["GetFrequency"] = __proto_b2MouseJoint["GetFrequency"];
self["SetFrequency"] = __proto_b2MouseJoint["SetFrequency"];
self["GetDampingRatio"] = __proto_b2MouseJoint["GetDampingRatio"];
self["SetDampingRatio"] = __proto_b2MouseJoint["SetDampingRatio"];
self["InitVelocityConstraints"] = __proto_b2MouseJoint["InitVelocityConstraints"];
self["SolveVelocityConstraints"] = __proto_b2MouseJoint["SolveVelocityConstraints"];
self["SolvePositionConstraints"] = __proto_b2MouseJoint["SolvePositionConstraints"];
(function()
Box2D["Dynamics"]["Joints"]["b2Joint"]["b2Joint"](self);
self["K"] = b2Mat22();
self["K1"] = b2Mat22();
self["K2"] = b2Mat22();
self["m_localAnchor"] = b2Vec2();
self["m_target"] = b2Vec2();
self["m_impulse"] = b2Vec2();
self["m_mass"] = b2Mat22();
self["m_C"] = b2Vec2();
self["__super"]["b2Joint"](self, def);
self["m_target"]["SetV"](self["m_target"], def["target"]);
local __f184_tX = (function()
return (self["m_target"]["x"] - self["m_bodyB"]["m_xf"]["position"]["x"])
end)()
;
local __f184_tY = (function()
return (self["m_target"]["y"] - self["m_bodyB"]["m_xf"]["position"]["y"])
end)()
;
local __f184_tMat = self["m_bodyB"]["m_xf"]["R"];
self["m_localAnchor"]["x"] = __add((function()
return (__f184_tX * __f184_tMat["col1"]["x"])
end)()
, (function()
return (__f184_tY * __f184_tMat["col1"]["y"])
end)()
);
self["m_localAnchor"]["y"] = __add((function()
return (__f184_tX * __f184_tMat["col2"]["x"])
end)()
, (function()
return (__f184_tY * __f184_tMat["col2"]["y"])
end)()
);
self["m_maxForce"] = def["maxForce"];
self["m_impulse"]["SetZero"](self["m_impulse"]);
self["m_frequencyHz"] = def["frequencyHz"];
self["m_dampingRatio"] = def["dampingRatio"];
self["m_beta"] = 0;
self["m_gamma"] = 0
return self["m_gamma"]
end)()
;
return self
end;
Box2D["Dynamics"]["Joints"]["b2MouseJoint"] = b2MouseJoint;
__proto_b2MouseJointDef = {};
__static_b2MouseJointDef = {};
b2MouseJointDef = function()
local self = b2JointDef();
self["__type"] = 'b2MouseJointDef';
self["__types"] = {'b2MouseJointDef', 'b2JointDef'};
self["__super"] = __proto_b2JointDef;
(function()
Box2D["Dynamics"]["Joints"]["b2JointDef"]["b2JointDef"](self);
self["target"] = b2Vec2();
self["__super"]["b2JointDef"](self);
self["type"] = __static_b2Joint["e_mouseJoint"];
self["maxForce"] = 0;
self["frequencyHz"] = 5;
self["dampingRatio"] = 0.7
return self["dampingRatio"]
end)()
;
return self
end;
Box2D["Dynamics"]["Joints"]["b2MouseJointDef"] = b2MouseJointDef;
__proto_b2PrismaticJoint = {};
__proto_b2PrismaticJoint["GetAnchorA"] = function(self)
return self["m_bodyA"]["GetWorldPoint"](self["m_bodyA"], self["m_localAnchor1"])
end;
__proto_b2PrismaticJoint["GetAnchorB"] = function(self)
return self["m_bodyB"]["GetWorldPoint"](self["m_bodyB"], self["m_localAnchor2"])
end;
__proto_b2PrismaticJoint["GetReactionForce"] = function(self, __f188_inv_dt)
(function()
local __oak_cond = __truthy((function()
return __oak_eq(__f188_inv_dt, nil)
end)()
)
if __oak_eq(__oak_cond, true) then __f188_inv_dt = 0
return __f188_inv_dt
else return __noop()
end
end)()
;
return b2Vec2((function()
return (__f188_inv_dt * __add((function()
return (self["m_impulse"]["x"] * self["m_perp"]["x"])
end)()
, (function()
return (__add(self["m_motorImpulse"], self["m_impulse"]["z"]) * self["m_axis"]["x"])
end)()
))
end)()
, (function()
return (__f188_inv_dt * __add((function()
return (self["m_impulse"]["x"] * self["m_perp"]["y"])
end)()
, (function()
return (__add(self["m_motorImpulse"], self["m_impulse"]["z"]) * self["m_axis"]["y"])
end)()
))
end)()
)
end;
__proto_b2PrismaticJoint["GetReactionTorque"] = function(self, __f189_inv_dt)
(function()
local __oak_cond = __truthy((function()
return __oak_eq(__f189_inv_dt, nil)
end)()
)
if __oak_eq(__oak_cond, true) then __f189_inv_dt = 0
return __f189_inv_dt
else return __noop()
end
end)()
;
return (function()
return (__f189_inv_dt * self["m_impulse"]["y"])
end)()

end;
__proto_b2PrismaticJoint["GetJointTranslation"] = function(self)
local __f190_bA = self["m_bodyA"];
local __f190_bB = self["m_bodyB"];
local __f190_tMat = __noop();
local __f190_p1 = __f190_bA["GetWorldPoint"](__f190_bA, self["m_localAnchor1"]);
local __f190_p2 = __f190_bB["GetWorldPoint"](__f190_bB, self["m_localAnchor2"]);
local __f190_dX = (function()
return (__f190_p2["x"] - __f190_p1["x"])
end)()
;
local __f190_dY = (function()
return (__f190_p2["y"] - __f190_p1["y"])
end)()
;
local __f190_axis = __f190_bA["GetWorldVector"](__f190_bA, self["m_localXAxis1"]);
local __f190_translation = __add((function()
return (__f190_axis["x"] * __f190_dX)
end)()
, (function()
return (__f190_axis["y"] * __f190_dY)
end)()
);
return __f190_translation
end;
__proto_b2PrismaticJoint["GetJointSpeed"] = function(self)
local __f191_bA = self["m_bodyA"];
local __f191_bB = self["m_bodyB"];
local __f191_tMat = __noop();
__f191_tMat = __f191_bA["m_xf"]["R"];
local __f191_r1X = (function()
return (self["m_localAnchor1"]["x"] - __f191_bA["m_sweep"]["localCenter"]["x"])
end)()
;
local __f191_r1Y = (function()
return (self["m_localAnchor1"]["y"] - __f191_bA["m_sweep"]["localCenter"]["y"])
end)()
;
local __f191_tX = __add((function()
return (__f191_tMat["col1"]["x"] * __f191_r1X)
end)()
, (function()
return (__f191_tMat["col2"]["x"] * __f191_r1Y)
end)()
);
__f191_r1Y = __add((function()
return (__f191_tMat["col1"]["y"] * __f191_r1X)
end)()
, (function()
return (__f191_tMat["col2"]["y"] * __f191_r1Y)
end)()
);
__f191_r1X = __f191_tX;
__f191_tMat = __f191_bB["m_xf"]["R"];
local __f191_r2X = (function()
return (self["m_localAnchor2"]["x"] - __f191_bB["m_sweep"]["localCenter"]["x"])
end)()
;
local __f191_r2Y = (function()
return (self["m_localAnchor2"]["y"] - __f191_bB["m_sweep"]["localCenter"]["y"])
end)()
;
__f191_tX = __add((function()
return (__f191_tMat["col1"]["x"] * __f191_r2X)
end)()
, (function()
return (__f191_tMat["col2"]["x"] * __f191_r2Y)
end)()
);
__f191_r2Y = __add((function()
return (__f191_tMat["col1"]["y"] * __f191_r2X)
end)()
, (function()
return (__f191_tMat["col2"]["y"] * __f191_r2Y)
end)()
);
__f191_r2X = __f191_tX;
local __f191_p1X = __add(__f191_bA["m_sweep"]["c"]["x"], __f191_r1X);
local __f191_p1Y = __add(__f191_bA["m_sweep"]["c"]["y"], __f191_r1Y);
local __f191_p2X = __add(__f191_bB["m_sweep"]["c"]["x"], __f191_r2X);
local __f191_p2Y = __add(__f191_bB["m_sweep"]["c"]["y"], __f191_r2Y);
local __f191_dX = (function()
return (__f191_p2X - __f191_p1X)
end)()
;
local __f191_dY = (function()
return (__f191_p2Y - __f191_p1Y)
end)()
;
local __f191_axis = __f191_bA["GetWorldVector"](__f191_bA, self["m_localXAxis1"]);
local __f191_v1 = __f191_bA["m_linearVelocity"];
local __f191_v2 = __f191_bB["m_linearVelocity"];
local __f191_w1 = __f191_bA["m_angularVelocity"];
local __f191_w2 = __f191_bB["m_angularVelocity"];
local __f191_speed = __add(__add((function()
return (__f191_dX * (function()
return ((function()
return (-__f191_w1)
end)()
 * __f191_axis["y"])
end)()
)
end)()
, (function()
return (__f191_dY * (function()
return (__f191_w1 * __f191_axis["x"])
end)()
)
end)()
), __add((function()
return (__f191_axis["x"] * (function()
return ((function()
return (__add(__f191_v2["x"], (function()
return ((function()
return (-__f191_w2)
end)()
 * __f191_r2Y)
end)()
) - __f191_v1["x"])
end)()
 - (function()
return ((function()
return (-__f191_w1)
end)()
 * __f191_r1Y)
end)()
)
end)()
)
end)()
, (function()
return (__f191_axis["y"] * (function()
return ((function()
return (__add(__f191_v2["y"], (function()
return (__f191_w2 * __f191_r2X)
end)()
) - __f191_v1["y"])
end)()
 - (function()
return (__f191_w1 * __f191_r1X)
end)()
)
end)()
)
end)()
));
return __f191_speed
end;
__proto_b2PrismaticJoint["IsLimitEnabled"] = function(self)
return self["m_enableLimit"]
end;
__proto_b2PrismaticJoint["EnableLimit"] = function(self, __f193_flag)
self["m_bodyA"]["SetAwake"](self["m_bodyA"], true);
self["m_bodyB"]["SetAwake"](self["m_bodyB"], true);
self["m_enableLimit"] = __f193_flag
return self["m_enableLimit"]
end;
__proto_b2PrismaticJoint["GetLowerLimit"] = function(self)
return self["m_lowerTranslation"]
end;
__proto_b2PrismaticJoint["GetUpperLimit"] = function(self)
return self["m_upperTranslation"]
end;
__proto_b2PrismaticJoint["SetLimits"] = function(self, __f196_lower, __f196_upper)
(function()
local __oak_cond = __truthy((function()
return __oak_eq(__f196_lower, nil)
end)()
)
if __oak_eq(__oak_cond, true) then __f196_lower = 0
return __f196_lower
else return __noop()
end
end)()
;
(function()
local __oak_cond = __truthy((function()
return __oak_eq(__f196_upper, nil)
end)()
)
if __oak_eq(__oak_cond, true) then __f196_upper = 0
return __f196_upper
else return __noop()
end
end)()
;
self["m_bodyA"]["SetAwake"](self["m_bodyA"], true);
self["m_bodyB"]["SetAwake"](self["m_bodyB"], true);
self["m_lowerTranslation"] = __f196_lower;
self["m_upperTranslation"] = __f196_upper
return self["m_upperTranslation"]
end;
__proto_b2PrismaticJoint["IsMotorEnabled"] = function(self)
return self["m_enableMotor"]
end;
__proto_b2PrismaticJoint["EnableMotor"] = function(self, __f198_flag)
self["m_bodyA"]["SetAwake"](self["m_bodyA"], true);
self["m_bodyB"]["SetAwake"](self["m_bodyB"], true);
self["m_enableMotor"] = __f198_flag
return self["m_enableMotor"]
end;
__proto_b2PrismaticJoint["SetMotorSpeed"] = function(self, __f199_speed)
(function()
local __oak_cond = __truthy((function()
return __oak_eq(__f199_speed, nil)
end)()
)
if __oak_eq(__oak_cond, true) then __f199_speed = 0
return __f199_speed
else return __noop()
end
end)()
;
self["m_bodyA"]["SetAwake"](self["m_bodyA"], true);
self["m_bodyB"]["SetAwake"](self["m_bodyB"], true);
self["m_motorSpeed"] = __f199_speed
return self["m_motorSpeed"]
end;
__proto_b2PrismaticJoint["GetMotorSpeed"] = function(self)
return self["m_motorSpeed"]
end;
__proto_b2PrismaticJoint["SetMaxMotorForce"] = function(self, __f201_force)
(function()
local __oak_cond = __truthy((function()
return __oak_eq(__f201_force, nil)
end)()
)
if __oak_eq(__oak_cond, true) then __f201_force = 0
return __f201_force
else return __noop()
end
end)()
;
self["m_bodyA"]["SetAwake"](self["m_bodyA"], true);
self["m_bodyB"]["SetAwake"](self["m_bodyB"], true);
self["m_maxMotorForce"] = __f201_force
return self["m_maxMotorForce"]
end;
__proto_b2PrismaticJoint["GetMotorForce"] = function(self)
return self["m_motorImpulse"]
end;
__proto_b2PrismaticJoint["InitVelocityConstraints"] = function(self, __f203_step)
local __f203_bA = self["m_bodyA"];
local __f203_bB = self["m_bodyB"];
local __f203_tMat = __noop();
local __f203_tX = 0;
self["m_localCenterA"]["SetV"](self["m_localCenterA"], __f203_bA["GetLocalCenter"](__f203_bA));
self["m_localCenterB"]["SetV"](self["m_localCenterB"], __f203_bB["GetLocalCenter"](__f203_bB));
local __f203_xf1 = __f203_bA["GetTransform"](__f203_bA);
local __f203_xf2 = __f203_bB["GetTransform"](__f203_bB);
__f203_tMat = __f203_bA["m_xf"]["R"];
local __f203_r1X = (function()
return (self["m_localAnchor1"]["x"] - self["m_localCenterA"]["x"])
end)()
;
local __f203_r1Y = (function()
return (self["m_localAnchor1"]["y"] - self["m_localCenterA"]["y"])
end)()
;
__f203_tX = __add((function()
return (__f203_tMat["col1"]["x"] * __f203_r1X)
end)()
, (function()
return (__f203_tMat["col2"]["x"] * __f203_r1Y)
end)()
);
__f203_r1Y = __add((function()
return (__f203_tMat["col1"]["y"] * __f203_r1X)
end)()
, (function()
return (__f203_tMat["col2"]["y"] * __f203_r1Y)
end)()
);
__f203_r1X = __f203_tX;
__f203_tMat = __f203_bB["m_xf"]["R"];
local __f203_r2X = (function()
return (self["m_localAnchor2"]["x"] - self["m_localCenterB"]["x"])
end)()
;
local __f203_r2Y = (function()
return (self["m_localAnchor2"]["y"] - self["m_localCenterB"]["y"])
end)()
;
__f203_tX = __add((function()
return (__f203_tMat["col1"]["x"] * __f203_r2X)
end)()
, (function()
return (__f203_tMat["col2"]["x"] * __f203_r2Y)
end)()
);
__f203_r2Y = __add((function()
return (__f203_tMat["col1"]["y"] * __f203_r2X)
end)()
, (function()
return (__f203_tMat["col2"]["y"] * __f203_r2Y)
end)()
);
__f203_r2X = __f203_tX;
local __f203_dX = (function()
return ((function()
return (__add(__f203_bB["m_sweep"]["c"]["x"], __f203_r2X) - __f203_bA["m_sweep"]["c"]["x"])
end)()
 - __f203_r1X)
end)()
;
local __f203_dY = (function()
return ((function()
return (__add(__f203_bB["m_sweep"]["c"]["y"], __f203_r2Y) - __f203_bA["m_sweep"]["c"]["y"])
end)()
 - __f203_r1Y)
end)()
;
self["m_invMassA"] = __f203_bA["m_invMass"];
self["m_invMassB"] = __f203_bB["m_invMass"];
self["m_invIA"] = __f203_bA["m_invI"];
self["m_invIB"] = __f203_bB["m_invI"];
(function()
self["m_axis"]["SetV"](self["m_axis"], __static_b2Math["MulMV"](__f203_xf1["R"], self["m_localXAxis1"]));
self["m_a1"] = (function()
return ((function()
return (__add(__f203_dX, __f203_r1X) * self["m_axis"]["y"])
end)()
 - (function()
return (__add(__f203_dY, __f203_r1Y) * self["m_axis"]["x"])
end)()
)
end)()
;
self["m_a2"] = (function()
return ((function()
return (__f203_r2X * self["m_axis"]["y"])
end)()
 - (function()
return (__f203_r2Y * self["m_axis"]["x"])
end)()
)
end)()
;
self["m_motorMass"] = __add(__add(__add(self["m_invMassA"], self["m_invMassB"]), (function()
return ((function()
return (self["m_invIA"] * self["m_a1"])
end)()
 * self["m_a1"])
end)()
), (function()
return ((function()
return (self["m_invIB"] * self["m_a2"])
end)()
 * self["m_a2"])
end)()
);
return (function()
local __oak_cond = __truthy((function()
return (self["m_motorMass"] > __Number["MIN_VALUE"])
end)()
)
if __oak_eq(__oak_cond, true) then self["m_motorMass"] = (function()
return (1 / self["m_motorMass"])
end)()

return self["m_motorMass"]
else return __noop()
end
end)()

end)()
;
(function()
self["m_perp"]["SetV"](self["m_perp"], __static_b2Math["MulMV"](__f203_xf1["R"], self["m_localYAxis1"]));
self["m_s1"] = (function()
return ((function()
return (__add(__f203_dX, __f203_r1X) * self["m_perp"]["y"])
end)()
 - (function()
return (__add(__f203_dY, __f203_r1Y) * self["m_perp"]["x"])
end)()
)
end)()
;
self["m_s2"] = (function()
return ((function()
return (__f203_r2X * self["m_perp"]["y"])
end)()
 - (function()
return (__f203_r2Y * self["m_perp"]["x"])
end)()
)
end)()
;
local __f203_m1 = self["m_invMassA"];
local __f203_m2 = self["m_invMassB"];
local __f203_i1 = self["m_invIA"];
local __f203_i2 = self["m_invIB"];
self["m_K"]["col1"]["x"] = __add(__add(__add(__f203_m1, __f203_m2), (function()
return ((function()
return (__f203_i1 * self["m_s1"])
end)()
 * self["m_s1"])
end)()
), (function()
return ((function()
return (__f203_i2 * self["m_s2"])
end)()
 * self["m_s2"])
end)()
);
self["m_K"]["col1"]["y"] = __add((function()
return (__f203_i1 * self["m_s1"])
end)()
, (function()
return (__f203_i2 * self["m_s2"])
end)()
);
self["m_K"]["col1"]["z"] = __add((function()
return ((function()
return (__f203_i1 * self["m_s1"])
end)()
 * self["m_a1"])
end)()
, (function()
return ((function()
return (__f203_i2 * self["m_s2"])
end)()
 * self["m_a2"])
end)()
);
self["m_K"]["col2"]["x"] = self["m_K"]["col1"]["y"];
self["m_K"]["col2"]["y"] = __add(__f203_i1, __f203_i2);
self["m_K"]["col2"]["z"] = __add((function()
return (__f203_i1 * self["m_a1"])
end)()
, (function()
return (__f203_i2 * self["m_a2"])
end)()
);
self["m_K"]["col3"]["x"] = self["m_K"]["col1"]["z"];
self["m_K"]["col3"]["y"] = self["m_K"]["col2"]["z"];
self["m_K"]["col3"]["z"] = __add(__add(__add(__f203_m1, __f203_m2), (function()
return ((function()
return (__f203_i1 * self["m_a1"])
end)()
 * self["m_a1"])
end)()
), (function()
return ((function()
return (__f203_i2 * self["m_a2"])
end)()
 * self["m_a2"])
end)()
)
return self["m_K"]["col3"]["z"]
end)()
;
(function()
local __oak_cond = __truthy(self["m_enableLimit"])
if __oak_eq(__oak_cond, true) then return (function()
local __f203_jointTransition = __add((function()
return (self["m_axis"]["x"] * __f203_dX)
end)()
, (function()
return (self["m_axis"]["y"] * __f203_dY)
end)()
);
return (function()
local __oak_cond = __truthy((function()
return (__static_b2Math["Abs"]((function()
return (self["m_upperTranslation"] - self["m_lowerTranslation"])
end)()
) < (function()
return (2 * __static_b2Settings["b2_linearSlop"])
end)()
)
end)()
)
if __oak_eq(__oak_cond, true) then self["m_limitState"] = __static_b2Joint["e_equalLimits"]
return self["m_limitState"]
else return (function()
local __oak_cond = __truthy((function()
return (__f203_jointTransition <= self["m_lowerTranslation"])
end)()
)
if __oak_eq(__oak_cond, true) then return (function()
local __oak_cond = __truthy((function()
return (not __oak_eq(self["m_limitState"], __static_b2Joint["e_atLowerLimit"]))
end)()
)
if __oak_eq(__oak_cond, true) then return (function()
self["m_limitState"] = __static_b2Joint["e_atLowerLimit"];
self["m_impulse"]["z"] = 0
return self["m_impulse"]["z"]
end)()

else return __noop()
end
end)()

else return (function()
local __oak_cond = __truthy((function()
return (__f203_jointTransition >= self["m_upperTranslation"])
end)()
)
if __oak_eq(__oak_cond, true) then return (function()
local __oak_cond = __truthy((function()
return (not __oak_eq(self["m_limitState"], __static_b2Joint["e_atUpperLimit"]))
end)()
)
if __oak_eq(__oak_cond, true) then return (function()
self["m_limitState"] = __static_b2Joint["e_atUpperLimit"];
self["m_impulse"]["z"] = 0
return self["m_impulse"]["z"]
end)()

else return __noop()
end
end)()

else return (function()
self["m_limitState"] = __static_b2Joint["e_inactiveLimit"];
self["m_impulse"]["z"] = 0
return self["m_impulse"]["z"]
end)()

end
end)()

end
end)()

end
end)()

end)()

else self["m_limitState"] = __static_b2Joint["e_inactiveLimit"]
return self["m_limitState"]
end
end)()
;
(function()
local __oak_cond = __truthy((function()
return __oak_eq(self["m_enableMotor"], false)
end)()
)
if __oak_eq(__oak_cond, true) then self["m_motorImpulse"] = 0
return self["m_motorImpulse"]
else return __noop()
end
end)()
;
return (function()
local __oak_cond = __truthy(__f203_step["warmStarting"])
if __oak_eq(__oak_cond, true) then return (function()
self["m_impulse"]["x"] = (function()
return (self["m_impulse"]["x"] * __f203_step["dtRatio"])
end)()
;
self["m_impulse"]["y"] = (function()
return (self["m_impulse"]["y"] * __f203_step["dtRatio"])
end)()
;
self["m_motorImpulse"] = (function()
return (self["m_motorImpulse"] * __f203_step["dtRatio"])
end)()
;
local __f203_PX = __add((function()
return (self["m_impulse"]["x"] * self["m_perp"]["x"])
end)()
, (function()
return (__add(self["m_motorImpulse"], self["m_impulse"]["z"]) * self["m_axis"]["x"])
end)()
);
local __f203_PY = __add((function()
return (self["m_impulse"]["x"] * self["m_perp"]["y"])
end)()
, (function()
return (__add(self["m_motorImpulse"], self["m_impulse"]["z"]) * self["m_axis"]["y"])
end)()
);
local __f203_L1 = __add(__add((function()
return (self["m_impulse"]["x"] * self["m_s1"])
end)()
, self["m_impulse"]["y"]), (function()
return (__add(self["m_motorImpulse"], self["m_impulse"]["z"]) * self["m_a1"])
end)()
);
local __f203_L2 = __add(__add((function()
return (self["m_impulse"]["x"] * self["m_s2"])
end)()
, self["m_impulse"]["y"]), (function()
return (__add(self["m_motorImpulse"], self["m_impulse"]["z"]) * self["m_a2"])
end)()
);
__f203_bA["m_linearVelocity"]["x"] = (function()
return (__f203_bA["m_linearVelocity"]["x"] - (function()
return (self["m_invMassA"] * __f203_PX)
end)()
)
end)()
;
__f203_bA["m_linearVelocity"]["y"] = (function()
return (__f203_bA["m_linearVelocity"]["y"] - (function()
return (self["m_invMassA"] * __f203_PY)
end)()
)
end)()
;
__f203_bA["m_angularVelocity"] = (function()
return (__f203_bA["m_angularVelocity"] - (function()
return (self["m_invIA"] * __f203_L1)
end)()
)
end)()
;
__f203_bB["m_linearVelocity"]["x"] = __add(__f203_bB["m_linearVelocity"]["x"], (function()
return (self["m_invMassB"] * __f203_PX)
end)()
);
__f203_bB["m_linearVelocity"]["y"] = __add(__f203_bB["m_linearVelocity"]["y"], (function()
return (self["m_invMassB"] * __f203_PY)
end)()
);
__f203_bB["m_angularVelocity"] = __add(__f203_bB["m_angularVelocity"], (function()
return (self["m_invIB"] * __f203_L2)
end)()
)
return __f203_bB["m_angularVelocity"]
end)()

else return (function()
self["m_impulse"]["SetZero"](self["m_impulse"]);
self["m_motorImpulse"] = 0
return self["m_motorImpulse"]
end)()

end
end)()

end;
__proto_b2PrismaticJoint["SolveVelocityConstraints"] = function(self, __f204_step)
local __f204_bA = self["m_bodyA"];
local __f204_bB = self["m_bodyB"];
local __f204_v1 = __f204_bA["m_linearVelocity"];
local __f204_w1 = __f204_bA["m_angularVelocity"];
local __f204_v2 = __f204_bB["m_linearVelocity"];
local __f204_w2 = __f204_bB["m_angularVelocity"];
local __f204_PX = 0;
local __f204_PY = 0;
local __f204_L1 = 0;
local __f204_L2 = 0;
(function()
local __oak_cond = __truthy(__and(self["m_enableMotor"], (function()
return (not __oak_eq(self["m_limitState"], __static_b2Joint["e_equalLimits"]))
end)()
))
if __oak_eq(__oak_cond, true) then return (function()
local __f204_Cdot = (function()
return (__add(__add((function()
return (self["m_axis"]["x"] * (function()
return (__f204_v2["x"] - __f204_v1["x"])
end)()
)
end)()
, (function()
return (self["m_axis"]["y"] * (function()
return (__f204_v2["y"] - __f204_v1["y"])
end)()
)
end)()
), (function()
return (self["m_a2"] * __f204_w2)
end)()
) - (function()
return (self["m_a1"] * __f204_w1)
end)()
)
end)()
;
local __f204_impulse = (function()
return (self["m_motorMass"] * (function()
return (self["m_motorSpeed"] - __f204_Cdot)
end)()
)
end)()
;
local __f204_oldImpulse = self["m_motorImpulse"];
local __f204_maxImpulse = (function()
return (__f204_step["dt"] * self["m_maxMotorForce"])
end)()
;
self["m_motorImpulse"] = __static_b2Math["Clamp"](__add(self["m_motorImpulse"], __f204_impulse), (function()
return (-__f204_maxImpulse)
end)()
, __f204_maxImpulse);
__f204_impulse = (function()
return (self["m_motorImpulse"] - __f204_oldImpulse)
end)()
;
__f204_PX = (function()
return (__f204_impulse * self["m_axis"]["x"])
end)()
;
__f204_PY = (function()
return (__f204_impulse * self["m_axis"]["y"])
end)()
;
__f204_L1 = (function()
return (__f204_impulse * self["m_a1"])
end)()
;
__f204_L2 = (function()
return (__f204_impulse * self["m_a2"])
end)()
;
__f204_v1["x"] = (function()
return (__f204_v1["x"] - (function()
return (self["m_invMassA"] * __f204_PX)
end)()
)
end)()
;
__f204_v1["y"] = (function()
return (__f204_v1["y"] - (function()
return (self["m_invMassA"] * __f204_PY)
end)()
)
end)()
;
__f204_w1 = (function()
return (__f204_w1 - (function()
return (self["m_invIA"] * __f204_L1)
end)()
)
end)()
;
__f204_v2["x"] = __add(__f204_v2["x"], (function()
return (self["m_invMassB"] * __f204_PX)
end)()
);
__f204_v2["y"] = __add(__f204_v2["y"], (function()
return (self["m_invMassB"] * __f204_PY)
end)()
);
__f204_w2 = __add(__f204_w2, (function()
return (self["m_invIB"] * __f204_L2)
end)()
)
return __f204_w2
end)()

else return __noop()
end
end)()
;
local __f204_Cdot1X = (function()
return (__add(__add((function()
return (self["m_perp"]["x"] * (function()
return (__f204_v2["x"] - __f204_v1["x"])
end)()
)
end)()
, (function()
return (self["m_perp"]["y"] * (function()
return (__f204_v2["y"] - __f204_v1["y"])
end)()
)
end)()
), (function()
return (self["m_s2"] * __f204_w2)
end)()
) - (function()
return (self["m_s1"] * __f204_w1)
end)()
)
end)()
;
local __f204_Cdot1Y = (function()
return (__f204_w2 - __f204_w1)
end)()
;
(function()
local __oak_cond = __truthy(__and(self["m_enableLimit"], (function()
return (not __oak_eq(self["m_limitState"], __static_b2Joint["e_inactiveLimit"]))
end)()
))
if __oak_eq(__oak_cond, true) then return (function()
local __f204_Cdot2 = (function()
return (__add(__add((function()
return (self["m_axis"]["x"] * (function()
return (__f204_v2["x"] - __f204_v1["x"])
end)()
)
end)()
, (function()
return (self["m_axis"]["y"] * (function()
return (__f204_v2["y"] - __f204_v1["y"])
end)()
)
end)()
), (function()
return (self["m_a2"] * __f204_w2)
end)()
) - (function()
return (self["m_a1"] * __f204_w1)
end)()
)
end)()
;
local __f204_f1 = self["m_impulse"]["Copy"](self["m_impulse"]);
local __f204_df = self["m_K"]["Solve33"](self["m_K"], b2Vec3(), (function()
return (-__f204_Cdot1X)
end)()
, (function()
return (-__f204_Cdot1Y)
end)()
, (function()
return (-__f204_Cdot2)
end)()
);
self["m_impulse"]["Add"](self["m_impulse"], __f204_df);
(function()
local __oak_cond = __truthy((function()
return __oak_eq(self["m_limitState"], __static_b2Joint["e_atLowerLimit"])
end)()
)
if __oak_eq(__oak_cond, true) then self["m_impulse"]["z"] = __static_b2Math["Max"](self["m_impulse"]["z"], 0)
return self["m_impulse"]["z"]
else return (function()
local __oak_cond = __truthy((function()
return __oak_eq(self["m_limitState"], __static_b2Joint["e_atUpperLimit"])
end)()
)
if __oak_eq(__oak_cond, true) then self["m_impulse"]["z"] = __static_b2Math["Min"](self["m_impulse"]["z"], 0)
return self["m_impulse"]["z"]
else return __noop()
end
end)()

end
end)()
;
local __f204_bX = (function()
return ((function()
return (-__f204_Cdot1X)
end)()
 - (function()
return ((function()
return (self["m_impulse"]["z"] - __f204_f1["z"])
end)()
 * self["m_K"]["col3"]["x"])
end)()
)
end)()
;
local __f204_bY = (function()
return ((function()
return (-__f204_Cdot1Y)
end)()
 - (function()
return ((function()
return (self["m_impulse"]["z"] - __f204_f1["z"])
end)()
 * self["m_K"]["col3"]["y"])
end)()
)
end)()
;
local __f204_f2r = self["m_K"]["Solve22"](self["m_K"], b2Vec2(), __f204_bX, __f204_bY);
__f204_f2r["x"] = __add(__f204_f2r["x"], __f204_f1["x"]);
__f204_f2r["y"] = __add(__f204_f2r["y"], __f204_f1["y"]);
self["m_impulse"]["x"] = __f204_f2r["x"];
self["m_impulse"]["y"] = __f204_f2r["y"];
__f204_df["x"] = (function()
return (self["m_impulse"]["x"] - __f204_f1["x"])
end)()
;
__f204_df["y"] = (function()
return (self["m_impulse"]["y"] - __f204_f1["y"])
end)()
;
__f204_df["z"] = (function()
return (self["m_impulse"]["z"] - __f204_f1["z"])
end)()
;
__f204_PX = __add((function()
return (__f204_df["x"] * self["m_perp"]["x"])
end)()
, (function()
return (__f204_df["z"] * self["m_axis"]["x"])
end)()
);
__f204_PY = __add((function()
return (__f204_df["x"] * self["m_perp"]["y"])
end)()
, (function()
return (__f204_df["z"] * self["m_axis"]["y"])
end)()
);
__f204_L1 = __add(__add((function()
return (__f204_df["x"] * self["m_s1"])
end)()
, __f204_df["y"]), (function()
return (__f204_df["z"] * self["m_a1"])
end)()
);
__f204_L2 = __add(__add((function()
return (__f204_df["x"] * self["m_s2"])
end)()
, __f204_df["y"]), (function()
return (__f204_df["z"] * self["m_a2"])
end)()
);
__f204_v1["x"] = (function()
return (__f204_v1["x"] - (function()
return (self["m_invMassA"] * __f204_PX)
end)()
)
end)()
;
__f204_v1["y"] = (function()
return (__f204_v1["y"] - (function()
return (self["m_invMassA"] * __f204_PY)
end)()
)
end)()
;
__f204_w1 = (function()
return (__f204_w1 - (function()
return (self["m_invIA"] * __f204_L1)
end)()
)
end)()
;
__f204_v2["x"] = __add(__f204_v2["x"], (function()
return (self["m_invMassB"] * __f204_PX)
end)()
);
__f204_v2["y"] = __add(__f204_v2["y"], (function()
return (self["m_invMassB"] * __f204_PY)
end)()
);
__f204_w2 = __add(__f204_w2, (function()
return (self["m_invIB"] * __f204_L2)
end)()
)
return __f204_w2
end)()

else return (function()
local __f204_df2 = self["m_K"]["Solve22"](self["m_K"], b2Vec2(), (function()
return (-__f204_Cdot1X)
end)()
, (function()
return (-__f204_Cdot1Y)
end)()
);
self["m_impulse"]["x"] = __add(self["m_impulse"]["x"], __f204_df2["x"]);
self["m_impulse"]["y"] = __add(self["m_impulse"]["y"], __f204_df2["y"]);
__f204_PX = (function()
return (__f204_df2["x"] * self["m_perp"]["x"])
end)()
;
__f204_PY = (function()
return (__f204_df2["x"] * self["m_perp"]["y"])
end)()
;
__f204_L1 = __add((function()
return (__f204_df2["x"] * self["m_s1"])
end)()
, __f204_df2["y"]);
__f204_L2 = __add((function()
return (__f204_df2["x"] * self["m_s2"])
end)()
, __f204_df2["y"]);
__f204_v1["x"] = (function()
return (__f204_v1["x"] - (function()
return (self["m_invMassA"] * __f204_PX)
end)()
)
end)()
;
__f204_v1["y"] = (function()
return (__f204_v1["y"] - (function()
return (self["m_invMassA"] * __f204_PY)
end)()
)
end)()
;
__f204_w1 = (function()
return (__f204_w1 - (function()
return (self["m_invIA"] * __f204_L1)
end)()
)
end)()
;
__f204_v2["x"] = __add(__f204_v2["x"], (function()
return (self["m_invMassB"] * __f204_PX)
end)()
);
__f204_v2["y"] = __add(__f204_v2["y"], (function()
return (self["m_invMassB"] * __f204_PY)
end)()
);
__f204_w2 = __add(__f204_w2, (function()
return (self["m_invIB"] * __f204_L2)
end)()
)
return __f204_w2
end)()

end
end)()
;
__f204_bA["m_linearVelocity"]["SetV"](__f204_bA["m_linearVelocity"], __f204_v1);
__f204_bA["m_angularVelocity"] = __f204_w1;
__f204_bB["m_linearVelocity"]["SetV"](__f204_bB["m_linearVelocity"], __f204_v2);
__f204_bB["m_angularVelocity"] = __f204_w2
return __f204_bB["m_angularVelocity"]
end;
__proto_b2PrismaticJoint["SolvePositionConstraints"] = function(self, __f205_baumgarte)
(function()
local __oak_cond = __truthy((function()
return __oak_eq(__f205_baumgarte, nil)
end)()
)
if __oak_eq(__oak_cond, true) then __f205_baumgarte = 0
return __f205_baumgarte
else return __noop()
end
end)()
;
local __f205_limitC = 0;
local __f205_oldLimitImpulse = 0;
local __f205_bA = self["m_bodyA"];
local __f205_bB = self["m_bodyB"];
local __f205_c1 = __f205_bA["m_sweep"]["c"];
local __f205_a1 = __f205_bA["m_sweep"]["a"];
local __f205_c2 = __f205_bB["m_sweep"]["c"];
local __f205_a2 = __f205_bB["m_sweep"]["a"];
local __f205_tMat = __noop();
local __f205_tX = 0;
local __f205_m1 = 0;
local __f205_m2 = 0;
local __f205_i1 = 0;
local __f205_i2 = 0;
local __f205_linearError = 0;
local __f205_angularError = 0;
local __f205_active = false;
local __f205_C2 = 0;
local __f205_R1 = __static_b2Mat22["FromAngle"](__f205_a1);
local __f205_R2 = __static_b2Mat22["FromAngle"](__f205_a2);
__f205_tMat = __f205_R1;
local __f205_r1X = (function()
return (self["m_localAnchor1"]["x"] - self["m_localCenterA"]["x"])
end)()
;
local __f205_r1Y = (function()
return (self["m_localAnchor1"]["y"] - self["m_localCenterA"]["y"])
end)()
;
__f205_tX = __add((function()
return (__f205_tMat["col1"]["x"] * __f205_r1X)
end)()
, (function()
return (__f205_tMat["col2"]["x"] * __f205_r1Y)
end)()
);
__f205_r1Y = __add((function()
return (__f205_tMat["col1"]["y"] * __f205_r1X)
end)()
, (function()
return (__f205_tMat["col2"]["y"] * __f205_r1Y)
end)()
);
__f205_r1X = __f205_tX;
__f205_tMat = __f205_R2;
local __f205_r2X = (function()
return (self["m_localAnchor2"]["x"] - self["m_localCenterB"]["x"])
end)()
;
local __f205_r2Y = (function()
return (self["m_localAnchor2"]["y"] - self["m_localCenterB"]["y"])
end)()
;
__f205_tX = __add((function()
return (__f205_tMat["col1"]["x"] * __f205_r2X)
end)()
, (function()
return (__f205_tMat["col2"]["x"] * __f205_r2Y)
end)()
);
__f205_r2Y = __add((function()
return (__f205_tMat["col1"]["y"] * __f205_r2X)
end)()
, (function()
return (__f205_tMat["col2"]["y"] * __f205_r2Y)
end)()
);
__f205_r2X = __f205_tX;
local __f205_dX = (function()
return ((function()
return (__add(__f205_c2["x"], __f205_r2X) - __f205_c1["x"])
end)()
 - __f205_r1X)
end)()
;
local __f205_dY = (function()
return ((function()
return (__add(__f205_c2["y"], __f205_r2Y) - __f205_c1["y"])
end)()
 - __f205_r1Y)
end)()
;
(function()
local __oak_cond = __truthy(self["m_enableLimit"])
if __oak_eq(__oak_cond, true) then return (function()
self["m_axis"] = __static_b2Math["MulMV"](__f205_R1, self["m_localXAxis1"]);
self["m_a1"] = (function()
return ((function()
return (__add(__f205_dX, __f205_r1X) * self["m_axis"]["y"])
end)()
 - (function()
return (__add(__f205_dY, __f205_r1Y) * self["m_axis"]["x"])
end)()
)
end)()
;
self["m_a2"] = (function()
return ((function()
return (__f205_r2X * self["m_axis"]["y"])
end)()
 - (function()
return (__f205_r2Y * self["m_axis"]["x"])
end)()
)
end)()
;
local __f205_translation = __add((function()
return (self["m_axis"]["x"] * __f205_dX)
end)()
, (function()
return (self["m_axis"]["y"] * __f205_dY)
end)()
);
return (function()
local __oak_cond = __truthy((function()
return (__static_b2Math["Abs"]((function()
return (self["m_upperTranslation"] - self["m_lowerTranslation"])
end)()
) < (function()
return (2 * __static_b2Settings["b2_linearSlop"])
end)()
)
end)()
)
if __oak_eq(__oak_cond, true) then return (function()
__f205_C2 = __static_b2Math["Clamp"](__f205_translation, (function()
return (-__static_b2Settings["b2_maxLinearCorrection"])
end)()
, __static_b2Settings["b2_maxLinearCorrection"]);
__f205_linearError = __static_b2Math["Abs"](__f205_translation);
__f205_active = true
return __f205_active
end)()

else return (function()
local __oak_cond = __truthy((function()
return (__f205_translation <= self["m_lowerTranslation"])
end)()
)
if __oak_eq(__oak_cond, true) then return (function()
__f205_C2 = __static_b2Math["Clamp"](__add((function()
return (__f205_translation - self["m_lowerTranslation"])
end)()
, __static_b2Settings["b2_linearSlop"]), (function()
return (-__static_b2Settings["b2_maxLinearCorrection"])
end)()
, 0);
__f205_linearError = (function()
return (self["m_lowerTranslation"] - __f205_translation)
end)()
;
__f205_active = true
return __f205_active
end)()

else return (function()
local __oak_cond = __truthy((function()
return (__f205_translation >= self["m_upperTranslation"])
end)()
)
if __oak_eq(__oak_cond, true) then return (function()
__f205_C2 = __static_b2Math["Clamp"](__add((function()
return (__f205_translation - self["m_upperTranslation"])
end)()
, __static_b2Settings["b2_linearSlop"]), 0, __static_b2Settings["b2_maxLinearCorrection"]);
__f205_linearError = (function()
return (__f205_translation - self["m_upperTranslation"])
end)()
;
__f205_active = true
return __f205_active
end)()

else return __noop()
end
end)()

end
end)()

end
end)()

end)()

else return __noop()
end
end)()
;
self["m_perp"] = __static_b2Math["MulMV"](__f205_R1, self["m_localYAxis1"]);
self["m_s1"] = (function()
return ((function()
return (__add(__f205_dX, __f205_r1X) * self["m_perp"]["y"])
end)()
 - (function()
return (__add(__f205_dY, __f205_r1Y) * self["m_perp"]["x"])
end)()
)
end)()
;
self["m_s2"] = (function()
return ((function()
return (__f205_r2X * self["m_perp"]["y"])
end)()
 - (function()
return (__f205_r2Y * self["m_perp"]["x"])
end)()
)
end)()
;
local __f205_impulse = b2Vec3();
local __f205_C1X = __add((function()
return (self["m_perp"]["x"] * __f205_dX)
end)()
, (function()
return (self["m_perp"]["y"] * __f205_dY)
end)()
);
local __f205_C1Y = (function()
return ((function()
return (__f205_a2 - __f205_a1)
end)()
 - self["m_refAngle"])
end)()
;
__f205_linearError = __static_b2Math["Max"](__f205_linearError, __static_b2Math["Abs"](__f205_C1X));
__f205_angularError = __static_b2Math["Abs"](__f205_C1Y);
(function()
local __oak_cond = __truthy(__f205_active)
if __oak_eq(__oak_cond, true) then return (function()
__f205_m1 = self["m_invMassA"];
__f205_m2 = self["m_invMassB"];
__f205_i1 = self["m_invIA"];
__f205_i2 = self["m_invIB"];
self["m_K"]["col1"]["x"] = __add(__add(__add(__f205_m1, __f205_m2), (function()
return ((function()
return (__f205_i1 * self["m_s1"])
end)()
 * self["m_s1"])
end)()
), (function()
return ((function()
return (__f205_i2 * self["m_s2"])
end)()
 * self["m_s2"])
end)()
);
self["m_K"]["col1"]["y"] = __add((function()
return (__f205_i1 * self["m_s1"])
end)()
, (function()
return (__f205_i2 * self["m_s2"])
end)()
);
self["m_K"]["col1"]["z"] = __add((function()
return ((function()
return (__f205_i1 * self["m_s1"])
end)()
 * self["m_a1"])
end)()
, (function()
return ((function()
return (__f205_i2 * self["m_s2"])
end)()
 * self["m_a2"])
end)()
);
self["m_K"]["col2"]["x"] = self["m_K"]["col1"]["y"];
self["m_K"]["col2"]["y"] = __add(__f205_i1, __f205_i2);
self["m_K"]["col2"]["z"] = __add((function()
return (__f205_i1 * self["m_a1"])
end)()
, (function()
return (__f205_i2 * self["m_a2"])
end)()
);
self["m_K"]["col3"]["x"] = self["m_K"]["col1"]["z"];
self["m_K"]["col3"]["y"] = self["m_K"]["col2"]["z"];
self["m_K"]["col3"]["z"] = __add(__add(__add(__f205_m1, __f205_m2), (function()
return ((function()
return (__f205_i1 * self["m_a1"])
end)()
 * self["m_a1"])
end)()
), (function()
return ((function()
return (__f205_i2 * self["m_a2"])
end)()
 * self["m_a2"])
end)()
);
return self["m_K"]["Solve33"](self["m_K"], __f205_impulse, (function()
return (-__f205_C1X)
end)()
, (function()
return (-__f205_C1Y)
end)()
, (function()
return (-__f205_C2)
end)()
)
end)()

else return (function()
__f205_m1 = self["m_invMassA"];
__f205_m2 = self["m_invMassB"];
__f205_i1 = self["m_invIA"];
__f205_i2 = self["m_invIB"];
local __f205_k11 = __add(__add(__add(__f205_m1, __f205_m2), (function()
return ((function()
return (__f205_i1 * self["m_s1"])
end)()
 * self["m_s1"])
end)()
), (function()
return ((function()
return (__f205_i2 * self["m_s2"])
end)()
 * self["m_s2"])
end)()
);
local __f205_k12 = __add((function()
return (__f205_i1 * self["m_s1"])
end)()
, (function()
return (__f205_i2 * self["m_s2"])
end)()
);
local __f205_k22 = __add(__f205_i1, __f205_i2);
self["m_K"]["col1"]["Set"](self["m_K"]["col1"], __f205_k11, __f205_k12, 0);
self["m_K"]["col2"]["Set"](self["m_K"]["col2"], __f205_k12, __f205_k22, 0);
local __f205_impulse1 = self["m_K"]["Solve22"](self["m_K"], b2Vec2(), (function()
return (-__f205_C1X)
end)()
, (function()
return (-__f205_C1Y)
end)()
);
__f205_impulse["x"] = __f205_impulse1["x"];
__f205_impulse["y"] = __f205_impulse1["y"];
__f205_impulse["z"] = 0
return __f205_impulse["z"]
end)()

end
end)()
;
local __f205_PX = __add((function()
return (__f205_impulse["x"] * self["m_perp"]["x"])
end)()
, (function()
return (__f205_impulse["z"] * self["m_axis"]["x"])
end)()
);
local __f205_PY = __add((function()
return (__f205_impulse["x"] * self["m_perp"]["y"])
end)()
, (function()
return (__f205_impulse["z"] * self["m_axis"]["y"])
end)()
);
local __f205_L1 = __add(__add((function()
return (__f205_impulse["x"] * self["m_s1"])
end)()
, __f205_impulse["y"]), (function()
return (__f205_impulse["z"] * self["m_a1"])
end)()
);
local __f205_L2 = __add(__add((function()
return (__f205_impulse["x"] * self["m_s2"])
end)()
, __f205_impulse["y"]), (function()
return (__f205_impulse["z"] * self["m_a2"])
end)()
);
__f205_c1["x"] = (function()
return (__f205_c1["x"] - (function()
return (self["m_invMassA"] * __f205_PX)
end)()
)
end)()
;
__f205_c1["y"] = (function()
return (__f205_c1["y"] - (function()
return (self["m_invMassA"] * __f205_PY)
end)()
)
end)()
;
__f205_a1 = (function()
return (__f205_a1 - (function()
return (self["m_invIA"] * __f205_L1)
end)()
)
end)()
;
__f205_c2["x"] = __add(__f205_c2["x"], (function()
return (self["m_invMassB"] * __f205_PX)
end)()
);
__f205_c2["y"] = __add(__f205_c2["y"], (function()
return (self["m_invMassB"] * __f205_PY)
end)()
);
__f205_a2 = __add(__f205_a2, (function()
return (self["m_invIB"] * __f205_L2)
end)()
);
__f205_bA["m_sweep"]["a"] = __f205_a1;
__f205_bB["m_sweep"]["a"] = __f205_a2;
__f205_bA["SynchronizeTransform"](__f205_bA);
__f205_bB["SynchronizeTransform"](__f205_bB);
return __and((function()
return (__f205_linearError <= __static_b2Settings["b2_linearSlop"])
end)()
, (function()
return (__f205_angularError <= __static_b2Settings["b2_angularSlop"])
end)()
)
end;
__static_b2PrismaticJoint = {};
b2PrismaticJoint = function()
local self = b2Joint();
self["__type"] = 'b2PrismaticJoint';
self["__types"] = {'b2PrismaticJoint', 'b2Joint'};
self["__super"] = __proto_b2Joint;
self["GetAnchorA"] = __proto_b2PrismaticJoint["GetAnchorA"];
self["GetAnchorB"] = __proto_b2PrismaticJoint["GetAnchorB"];
self["GetReactionForce"] = __proto_b2PrismaticJoint["GetReactionForce"];
self["GetReactionTorque"] = __proto_b2PrismaticJoint["GetReactionTorque"];
self["GetJointTranslation"] = __proto_b2PrismaticJoint["GetJointTranslation"];
self["GetJointSpeed"] = __proto_b2PrismaticJoint["GetJointSpeed"];
self["IsLimitEnabled"] = __proto_b2PrismaticJoint["IsLimitEnabled"];
self["EnableLimit"] = __proto_b2PrismaticJoint["EnableLimit"];
self["GetLowerLimit"] = __proto_b2PrismaticJoint["GetLowerLimit"];
self["GetUpperLimit"] = __proto_b2PrismaticJoint["GetUpperLimit"];
self["SetLimits"] = __proto_b2PrismaticJoint["SetLimits"];
self["IsMotorEnabled"] = __proto_b2PrismaticJoint["IsMotorEnabled"];
self["EnableMotor"] = __proto_b2PrismaticJoint["EnableMotor"];
self["SetMotorSpeed"] = __proto_b2PrismaticJoint["SetMotorSpeed"];
self["GetMotorSpeed"] = __proto_b2PrismaticJoint["GetMotorSpeed"];
self["SetMaxMotorForce"] = __proto_b2PrismaticJoint["SetMaxMotorForce"];
self["GetMotorForce"] = __proto_b2PrismaticJoint["GetMotorForce"];
self["InitVelocityConstraints"] = __proto_b2PrismaticJoint["InitVelocityConstraints"];
self["SolveVelocityConstraints"] = __proto_b2PrismaticJoint["SolveVelocityConstraints"];
self["SolvePositionConstraints"] = __proto_b2PrismaticJoint["SolvePositionConstraints"];
(function()
Box2D["Dynamics"]["Joints"]["b2Joint"]["b2Joint"](self);
self["m_localAnchor1"] = b2Vec2();
self["m_localAnchor2"] = b2Vec2();
self["m_localXAxis1"] = b2Vec2();
self["m_localYAxis1"] = b2Vec2();
self["m_axis"] = b2Vec2();
self["m_perp"] = b2Vec2();
self["m_K"] = b2Mat33();
self["m_impulse"] = b2Vec3();
self["__super"]["b2Joint"](self, def);
local __f206_tMat = __noop();
local __f206_tX = 0;
local __f206_tY = 0;
self["m_localAnchor1"]["SetV"](self["m_localAnchor1"], def["localAnchorA"]);
self["m_localAnchor2"]["SetV"](self["m_localAnchor2"], def["localAnchorB"]);
self["m_localXAxis1"]["SetV"](self["m_localXAxis1"], def["localAxisA"]);
self["m_localYAxis1"]["x"] = (function()
return (-self["m_localXAxis1"]["y"])
end)()
;
self["m_localYAxis1"]["y"] = self["m_localXAxis1"]["x"];
self["m_refAngle"] = def["referenceAngle"];
self["m_impulse"]["SetZero"](self["m_impulse"]);
self["m_motorMass"] = 0;
self["m_motorImpulse"] = 0;
self["m_lowerTranslation"] = def["lowerTranslation"];
self["m_upperTranslation"] = def["upperTranslation"];
self["m_maxMotorForce"] = def["maxMotorForce"];
self["m_motorSpeed"] = def["motorSpeed"];
self["m_enableLimit"] = def["enableLimit"];
self["m_enableMotor"] = def["enableMotor"];
self["m_limitState"] = __static_b2Joint["e_inactiveLimit"];
self["m_axis"]["SetZero"](self["m_axis"]);
return self["m_perp"]["SetZero"](self["m_perp"])
end)()
;
return self
end;
Box2D["Dynamics"]["Joints"]["b2PrismaticJoint"] = b2PrismaticJoint;
__proto_b2PrismaticJointDef = {};
__proto_b2PrismaticJointDef["Initialize"] = function(self, __f207_bA, __f207_bB, __f207_anchor, __f207_axis)
self["bodyA"] = __f207_bA;
self["bodyB"] = __f207_bB;
self["localAnchorA"] = self["bodyA"]["GetLocalPoint"](self["bodyA"], __f207_anchor);
self["localAnchorB"] = self["bodyB"]["GetLocalPoint"](self["bodyB"], __f207_anchor);
self["localAxisA"] = self["bodyA"]["GetLocalVector"](self["bodyA"], __f207_axis);
self["referenceAngle"] = (function()
return (self["bodyB"]["GetAngle"](self["bodyB"]) - self["bodyA"]["GetAngle"](self["bodyA"]))
end)()

return self["referenceAngle"]
end;
__static_b2PrismaticJointDef = {};
b2PrismaticJointDef = function()
local self = b2JointDef();
self["__type"] = 'b2PrismaticJointDef';
self["__types"] = {'b2PrismaticJointDef', 'b2JointDef'};
self["__super"] = __proto_b2JointDef;
self["Initialize"] = __proto_b2PrismaticJointDef["Initialize"];
(function()
Box2D["Dynamics"]["Joints"]["b2JointDef"]["b2JointDef"](self);
self["localAnchorA"] = b2Vec2();
self["localAnchorB"] = b2Vec2();
self["localAxisA"] = b2Vec2();
self["__super"]["b2JointDef"](self);
self["type"] = __static_b2Joint["e_prismaticJoint"];
self["localAxisA"]["Set"](self["localAxisA"], 1, 0);
self["referenceAngle"] = 0;
self["enableLimit"] = false;
self["lowerTranslation"] = 0;
self["upperTranslation"] = 0;
self["enableMotor"] = false;
self["maxMotorForce"] = 0;
self["motorSpeed"] = 0
return self["motorSpeed"]
end)()
;
return self
end;
Box2D["Dynamics"]["Joints"]["b2PrismaticJointDef"] = b2PrismaticJointDef;
__proto_b2PulleyJoint = {};
__proto_b2PulleyJoint["GetAnchorA"] = function(self)
return self["m_bodyA"]["GetWorldPoint"](self["m_bodyA"], self["m_localAnchor1"])
end;
__proto_b2PulleyJoint["GetAnchorB"] = function(self)
return self["m_bodyB"]["GetWorldPoint"](self["m_bodyB"], self["m_localAnchor2"])
end;
__proto_b2PulleyJoint["GetReactionForce"] = function(self, __f211_inv_dt)
(function()
local __oak_cond = __truthy((function()
return __oak_eq(__f211_inv_dt, nil)
end)()
)
if __oak_eq(__oak_cond, true) then __f211_inv_dt = 0
return __f211_inv_dt
else return __noop()
end
end)()
;
return b2Vec2((function()
return ((function()
return (__f211_inv_dt * self["m_impulse"])
end)()
 * self["m_u2"]["x"])
end)()
, (function()
return ((function()
return (__f211_inv_dt * self["m_impulse"])
end)()
 * self["m_u2"]["y"])
end)()
)
end;
__proto_b2PulleyJoint["GetReactionTorque"] = function(self, __f212_inv_dt)
(function()
local __oak_cond = __truthy((function()
return __oak_eq(__f212_inv_dt, nil)
end)()
)
if __oak_eq(__oak_cond, true) then __f212_inv_dt = 0
return __f212_inv_dt
else return __noop()
end
end)()
;
return 0
end;
__proto_b2PulleyJoint["GetGroundAnchorA"] = function(self)
local __f213_a = self["m_ground"]["m_xf"]["position"]["Copy"](self["m_ground"]["m_xf"]["position"]);
__f213_a["Add"](__f213_a, self["m_groundAnchor1"]);
return __f213_a
end;
__proto_b2PulleyJoint["GetGroundAnchorB"] = function(self)
local __f214_a = self["m_ground"]["m_xf"]["position"]["Copy"](self["m_ground"]["m_xf"]["position"]);
__f214_a["Add"](__f214_a, self["m_groundAnchor2"]);
return __f214_a
end;
__proto_b2PulleyJoint["GetLength1"] = function(self)
local __f215_p = self["m_bodyA"]["GetWorldPoint"](self["m_bodyA"], self["m_localAnchor1"]);
local __f215_sX = __add(self["m_ground"]["m_xf"]["position"]["x"], self["m_groundAnchor1"]["x"]);
local __f215_sY = __add(self["m_ground"]["m_xf"]["position"]["y"], self["m_groundAnchor1"]["y"]);
local __f215_dX = (function()
return (__f215_p["x"] - __f215_sX)
end)()
;
local __f215_dY = (function()
return (__f215_p["y"] - __f215_sY)
end)()
;
return __Math["sqrt"](__add((function()
return (__f215_dX * __f215_dX)
end)()
, (function()
return (__f215_dY * __f215_dY)
end)()
))
end;
__proto_b2PulleyJoint["GetLength2"] = function(self)
local __f216_p = self["m_bodyB"]["GetWorldPoint"](self["m_bodyB"], self["m_localAnchor2"]);
local __f216_sX = __add(self["m_ground"]["m_xf"]["position"]["x"], self["m_groundAnchor2"]["x"]);
local __f216_sY = __add(self["m_ground"]["m_xf"]["position"]["y"], self["m_groundAnchor2"]["y"]);
local __f216_dX = (function()
return (__f216_p["x"] - __f216_sX)
end)()
;
local __f216_dY = (function()
return (__f216_p["y"] - __f216_sY)
end)()
;
return __Math["sqrt"](__add((function()
return (__f216_dX * __f216_dX)
end)()
, (function()
return (__f216_dY * __f216_dY)
end)()
))
end;
__proto_b2PulleyJoint["GetRatio"] = function(self)
return self["m_ratio"]
end;
__proto_b2PulleyJoint["InitVelocityConstraints"] = function(self, __f218_step)
local __f218_bA = self["m_bodyA"];
local __f218_bB = self["m_bodyB"];
local __f218_tMat = __noop();
__f218_tMat = __f218_bA["m_xf"]["R"];
local __f218_r1X = (function()
return (self["m_localAnchor1"]["x"] - __f218_bA["m_sweep"]["localCenter"]["x"])
end)()
;
local __f218_r1Y = (function()
return (self["m_localAnchor1"]["y"] - __f218_bA["m_sweep"]["localCenter"]["y"])
end)()
;
local __f218_tX = __add((function()
return (__f218_tMat["col1"]["x"] * __f218_r1X)
end)()
, (function()
return (__f218_tMat["col2"]["x"] * __f218_r1Y)
end)()
);
__f218_r1Y = __add((function()
return (__f218_tMat["col1"]["y"] * __f218_r1X)
end)()
, (function()
return (__f218_tMat["col2"]["y"] * __f218_r1Y)
end)()
);
__f218_r1X = __f218_tX;
__f218_tMat = __f218_bB["m_xf"]["R"];
local __f218_r2X = (function()
return (self["m_localAnchor2"]["x"] - __f218_bB["m_sweep"]["localCenter"]["x"])
end)()
;
local __f218_r2Y = (function()
return (self["m_localAnchor2"]["y"] - __f218_bB["m_sweep"]["localCenter"]["y"])
end)()
;
__f218_tX = __add((function()
return (__f218_tMat["col1"]["x"] * __f218_r2X)
end)()
, (function()
return (__f218_tMat["col2"]["x"] * __f218_r2Y)
end)()
);
__f218_r2Y = __add((function()
return (__f218_tMat["col1"]["y"] * __f218_r2X)
end)()
, (function()
return (__f218_tMat["col2"]["y"] * __f218_r2Y)
end)()
);
__f218_r2X = __f218_tX;
local __f218_p1X = __add(__f218_bA["m_sweep"]["c"]["x"], __f218_r1X);
local __f218_p1Y = __add(__f218_bA["m_sweep"]["c"]["y"], __f218_r1Y);
local __f218_p2X = __add(__f218_bB["m_sweep"]["c"]["x"], __f218_r2X);
local __f218_p2Y = __add(__f218_bB["m_sweep"]["c"]["y"], __f218_r2Y);
local __f218_s1X = __add(self["m_ground"]["m_xf"]["position"]["x"], self["m_groundAnchor1"]["x"]);
local __f218_s1Y = __add(self["m_ground"]["m_xf"]["position"]["y"], self["m_groundAnchor1"]["y"]);
local __f218_s2X = __add(self["m_ground"]["m_xf"]["position"]["x"], self["m_groundAnchor2"]["x"]);
local __f218_s2Y = __add(self["m_ground"]["m_xf"]["position"]["y"], self["m_groundAnchor2"]["y"]);
self["m_u1"]["Set"](self["m_u1"], (function()
return (__f218_p1X - __f218_s1X)
end)()
, (function()
return (__f218_p1Y - __f218_s1Y)
end)()
);
self["m_u2"]["Set"](self["m_u2"], (function()
return (__f218_p2X - __f218_s2X)
end)()
, (function()
return (__f218_p2Y - __f218_s2Y)
end)()
);
local __f218_length1 = self["m_u1"]["Length"](self["m_u1"]);
local __f218_length2 = self["m_u2"]["Length"](self["m_u2"]);
(function()
local __oak_cond = __truthy((function()
return (__f218_length1 > __static_b2Settings["b2_linearSlop"])
end)()
)
if __oak_eq(__oak_cond, true) then return self["m_u1"]["Multiply"](self["m_u1"], (function()
return (1 / __f218_length1)
end)()
)
else return self["m_u1"]["SetZero"](self["m_u1"])
end
end)()
;
(function()
local __oak_cond = __truthy((function()
return (__f218_length2 > __static_b2Settings["b2_linearSlop"])
end)()
)
if __oak_eq(__oak_cond, true) then return self["m_u2"]["Multiply"](self["m_u2"], (function()
return (1 / __f218_length2)
end)()
)
else return self["m_u2"]["SetZero"](self["m_u2"])
end
end)()
;
local __f218_C = (function()
return ((function()
return (self["m_constant"] - __f218_length1)
end)()
 - (function()
return (self["m_ratio"] * __f218_length2)
end)()
)
end)()
;
(function()
local __oak_cond = __truthy((function()
return (__f218_C > 0)
end)()
)
if __oak_eq(__oak_cond, true) then return (function()
self["m_state"] = __static_b2Joint["e_inactiveLimit"];
self["m_impulse"] = 0
return self["m_impulse"]
end)()

else self["m_state"] = __static_b2Joint["e_atUpperLimit"]
return self["m_state"]
end
end)()
;
(function()
local __oak_cond = __truthy((function()
return (__f218_length1 < self["m_maxLength1"])
end)()
)
if __oak_eq(__oak_cond, true) then return (function()
self["m_limitState1"] = __static_b2Joint["e_inactiveLimit"];
self["m_limitImpulse1"] = 0
return self["m_limitImpulse1"]
end)()

else self["m_limitState1"] = __static_b2Joint["e_atUpperLimit"]
return self["m_limitState1"]
end
end)()
;
(function()
local __oak_cond = __truthy((function()
return (__f218_length2 < self["m_maxLength2"])
end)()
)
if __oak_eq(__oak_cond, true) then return (function()
self["m_limitState2"] = __static_b2Joint["e_inactiveLimit"];
self["m_limitImpulse2"] = 0
return self["m_limitImpulse2"]
end)()

else self["m_limitState2"] = __static_b2Joint["e_atUpperLimit"]
return self["m_limitState2"]
end
end)()
;
local __f218_cr1u1 = (function()
return ((function()
return (__f218_r1X * self["m_u1"]["y"])
end)()
 - (function()
return (__f218_r1Y * self["m_u1"]["x"])
end)()
)
end)()
;
local __f218_cr2u2 = (function()
return ((function()
return (__f218_r2X * self["m_u2"]["y"])
end)()
 - (function()
return (__f218_r2Y * self["m_u2"]["x"])
end)()
)
end)()
;
self["m_limitMass1"] = __add(__f218_bA["m_invMass"], (function()
return ((function()
return (__f218_bA["m_invI"] * __f218_cr1u1)
end)()
 * __f218_cr1u1)
end)()
);
self["m_limitMass2"] = __add(__f218_bB["m_invMass"], (function()
return ((function()
return (__f218_bB["m_invI"] * __f218_cr2u2)
end)()
 * __f218_cr2u2)
end)()
);
self["m_pulleyMass"] = __add(self["m_limitMass1"], (function()
return ((function()
return (self["m_ratio"] * self["m_ratio"])
end)()
 * self["m_limitMass2"])
end)()
);
self["m_limitMass1"] = (function()
return (1 / self["m_limitMass1"])
end)()
;
self["m_limitMass2"] = (function()
return (1 / self["m_limitMass2"])
end)()
;
self["m_pulleyMass"] = (function()
return (1 / self["m_pulleyMass"])
end)()
;
return (function()
local __oak_cond = __truthy(__f218_step["warmStarting"])
if __oak_eq(__oak_cond, true) then return (function()
self["m_impulse"] = (function()
return (self["m_impulse"] * __f218_step["dtRatio"])
end)()
;
self["m_limitImpulse1"] = (function()
return (self["m_limitImpulse1"] * __f218_step["dtRatio"])
end)()
;
self["m_limitImpulse2"] = (function()
return (self["m_limitImpulse2"] * __f218_step["dtRatio"])
end)()
;
local __f218_P1X = (function()
return ((function()
return ((function()
return (-self["m_impulse"])
end)()
 - self["m_limitImpulse1"])
end)()
 * self["m_u1"]["x"])
end)()
;
local __f218_P1Y = (function()
return ((function()
return ((function()
return (-self["m_impulse"])
end)()
 - self["m_limitImpulse1"])
end)()
 * self["m_u1"]["y"])
end)()
;
local __f218_P2X = (function()
return ((function()
return ((function()
return ((function()
return (-self["m_ratio"])
end)()
 * self["m_impulse"])
end)()
 - self["m_limitImpulse2"])
end)()
 * self["m_u2"]["x"])
end)()
;
local __f218_P2Y = (function()
return ((function()
return ((function()
return ((function()
return (-self["m_ratio"])
end)()
 * self["m_impulse"])
end)()
 - self["m_limitImpulse2"])
end)()
 * self["m_u2"]["y"])
end)()
;
__f218_bA["m_linearVelocity"]["x"] = __add(__f218_bA["m_linearVelocity"]["x"], (function()
return (__f218_bA["m_invMass"] * __f218_P1X)
end)()
);
__f218_bA["m_linearVelocity"]["y"] = __add(__f218_bA["m_linearVelocity"]["y"], (function()
return (__f218_bA["m_invMass"] * __f218_P1Y)
end)()
);
__f218_bA["m_angularVelocity"] = __add(__f218_bA["m_angularVelocity"], (function()
return (__f218_bA["m_invI"] * (function()
return ((function()
return (__f218_r1X * __f218_P1Y)
end)()
 - (function()
return (__f218_r1Y * __f218_P1X)
end)()
)
end)()
)
end)()
);
__f218_bB["m_linearVelocity"]["x"] = __add(__f218_bB["m_linearVelocity"]["x"], (function()
return (__f218_bB["m_invMass"] * __f218_P2X)
end)()
);
__f218_bB["m_linearVelocity"]["y"] = __add(__f218_bB["m_linearVelocity"]["y"], (function()
return (__f218_bB["m_invMass"] * __f218_P2Y)
end)()
);
__f218_bB["m_angularVelocity"] = __add(__f218_bB["m_angularVelocity"], (function()
return (__f218_bB["m_invI"] * (function()
return ((function()
return (__f218_r2X * __f218_P2Y)
end)()
 - (function()
return (__f218_r2Y * __f218_P2X)
end)()
)
end)()
)
end)()
)
return __f218_bB["m_angularVelocity"]
end)()

else return (function()
self["m_impulse"] = 0;
self["m_limitImpulse1"] = 0;
self["m_limitImpulse2"] = 0
return self["m_limitImpulse2"]
end)()

end
end)()

end;
__proto_b2PulleyJoint["SolveVelocityConstraints"] = function(self, __f219_step)
local __f219_bA = self["m_bodyA"];
local __f219_bB = self["m_bodyB"];
local __f219_tMat = __noop();
__f219_tMat = __f219_bA["m_xf"]["R"];
local __f219_r1X = (function()
return (self["m_localAnchor1"]["x"] - __f219_bA["m_sweep"]["localCenter"]["x"])
end)()
;
local __f219_r1Y = (function()
return (self["m_localAnchor1"]["y"] - __f219_bA["m_sweep"]["localCenter"]["y"])
end)()
;
local __f219_tX = __add((function()
return (__f219_tMat["col1"]["x"] * __f219_r1X)
end)()
, (function()
return (__f219_tMat["col2"]["x"] * __f219_r1Y)
end)()
);
__f219_r1Y = __add((function()
return (__f219_tMat["col1"]["y"] * __f219_r1X)
end)()
, (function()
return (__f219_tMat["col2"]["y"] * __f219_r1Y)
end)()
);
__f219_r1X = __f219_tX;
__f219_tMat = __f219_bB["m_xf"]["R"];
local __f219_r2X = (function()
return (self["m_localAnchor2"]["x"] - __f219_bB["m_sweep"]["localCenter"]["x"])
end)()
;
local __f219_r2Y = (function()
return (self["m_localAnchor2"]["y"] - __f219_bB["m_sweep"]["localCenter"]["y"])
end)()
;
__f219_tX = __add((function()
return (__f219_tMat["col1"]["x"] * __f219_r2X)
end)()
, (function()
return (__f219_tMat["col2"]["x"] * __f219_r2Y)
end)()
);
__f219_r2Y = __add((function()
return (__f219_tMat["col1"]["y"] * __f219_r2X)
end)()
, (function()
return (__f219_tMat["col2"]["y"] * __f219_r2Y)
end)()
);
__f219_r2X = __f219_tX;
local __f219_v1X = 0;
local __f219_v1Y = 0;
local __f219_v2X = 0;
local __f219_v2Y = 0;
local __f219_P1X = 0;
local __f219_P1Y = 0;
local __f219_P2X = 0;
local __f219_P2Y = 0;
local __f219_Cdot = 0;
local __f219_impulse = 0;
local __f219_oldImpulse = 0;
(function()
local __oak_cond = __truthy((function()
return __oak_eq(self["m_state"], __static_b2Joint["e_atUpperLimit"])
end)()
)
if __oak_eq(__oak_cond, true) then return (function()
__f219_v1X = __add(__f219_bA["m_linearVelocity"]["x"], (function()
return ((function()
return (-__f219_bA["m_angularVelocity"])
end)()
 * __f219_r1Y)
end)()
);
__f219_v1Y = __add(__f219_bA["m_linearVelocity"]["y"], (function()
return (__f219_bA["m_angularVelocity"] * __f219_r1X)
end)()
);
__f219_v2X = __add(__f219_bB["m_linearVelocity"]["x"], (function()
return ((function()
return (-__f219_bB["m_angularVelocity"])
end)()
 * __f219_r2Y)
end)()
);
__f219_v2Y = __add(__f219_bB["m_linearVelocity"]["y"], (function()
return (__f219_bB["m_angularVelocity"] * __f219_r2X)
end)()
);
__f219_Cdot = (function()
return ((function()
return (-__add((function()
return (self["m_u1"]["x"] * __f219_v1X)
end)()
, (function()
return (self["m_u1"]["y"] * __f219_v1Y)
end)()
))
end)()
 - (function()
return (self["m_ratio"] * __add((function()
return (self["m_u2"]["x"] * __f219_v2X)
end)()
, (function()
return (self["m_u2"]["y"] * __f219_v2Y)
end)()
))
end)()
)
end)()
;
__f219_impulse = (function()
return (self["m_pulleyMass"] * (function()
return (-__f219_Cdot)
end)()
)
end)()
;
__f219_oldImpulse = self["m_impulse"];
self["m_impulse"] = __static_b2Math["Max"](0, __add(self["m_impulse"], __f219_impulse));
__f219_impulse = (function()
return (self["m_impulse"] - __f219_oldImpulse)
end)()
;
__f219_P1X = (function()
return ((function()
return (-__f219_impulse)
end)()
 * self["m_u1"]["x"])
end)()
;
__f219_P1Y = (function()
return ((function()
return (-__f219_impulse)
end)()
 * self["m_u1"]["y"])
end)()
;
__f219_P2X = (function()
return ((function()
return ((function()
return (-self["m_ratio"])
end)()
 * __f219_impulse)
end)()
 * self["m_u2"]["x"])
end)()
;
__f219_P2Y = (function()
return ((function()
return ((function()
return (-self["m_ratio"])
end)()
 * __f219_impulse)
end)()
 * self["m_u2"]["y"])
end)()
;
__f219_bA["m_linearVelocity"]["x"] = __add(__f219_bA["m_linearVelocity"]["x"], (function()
return (__f219_bA["m_invMass"] * __f219_P1X)
end)()
);
__f219_bA["m_linearVelocity"]["y"] = __add(__f219_bA["m_linearVelocity"]["y"], (function()
return (__f219_bA["m_invMass"] * __f219_P1Y)
end)()
);
__f219_bA["m_angularVelocity"] = __add(__f219_bA["m_angularVelocity"], (function()
return (__f219_bA["m_invI"] * (function()
return ((function()
return (__f219_r1X * __f219_P1Y)
end)()
 - (function()
return (__f219_r1Y * __f219_P1X)
end)()
)
end)()
)
end)()
);
__f219_bB["m_linearVelocity"]["x"] = __add(__f219_bB["m_linearVelocity"]["x"], (function()
return (__f219_bB["m_invMass"] * __f219_P2X)
end)()
);
__f219_bB["m_linearVelocity"]["y"] = __add(__f219_bB["m_linearVelocity"]["y"], (function()
return (__f219_bB["m_invMass"] * __f219_P2Y)
end)()
);
__f219_bB["m_angularVelocity"] = __add(__f219_bB["m_angularVelocity"], (function()
return (__f219_bB["m_invI"] * (function()
return ((function()
return (__f219_r2X * __f219_P2Y)
end)()
 - (function()
return (__f219_r2Y * __f219_P2X)
end)()
)
end)()
)
end)()
)
return __f219_bB["m_angularVelocity"]
end)()

else return __noop()
end
end)()
;
(function()
local __oak_cond = __truthy((function()
return __oak_eq(self["m_limitState1"], __static_b2Joint["e_atUpperLimit"])
end)()
)
if __oak_eq(__oak_cond, true) then return (function()
__f219_v1X = __add(__f219_bA["m_linearVelocity"]["x"], (function()
return ((function()
return (-__f219_bA["m_angularVelocity"])
end)()
 * __f219_r1Y)
end)()
);
__f219_v1Y = __add(__f219_bA["m_linearVelocity"]["y"], (function()
return (__f219_bA["m_angularVelocity"] * __f219_r1X)
end)()
);
__f219_Cdot = (function()
return (-__add((function()
return (self["m_u1"]["x"] * __f219_v1X)
end)()
, (function()
return (self["m_u1"]["y"] * __f219_v1Y)
end)()
))
end)()
;
__f219_impulse = (function()
return ((function()
return (-self["m_limitMass1"])
end)()
 * __f219_Cdot)
end)()
;
__f219_oldImpulse = self["m_limitImpulse1"];
self["m_limitImpulse1"] = __static_b2Math["Max"](0, __add(self["m_limitImpulse1"], __f219_impulse));
__f219_impulse = (function()
return (self["m_limitImpulse1"] - __f219_oldImpulse)
end)()
;
__f219_P1X = (function()
return ((function()
return (-__f219_impulse)
end)()
 * self["m_u1"]["x"])
end)()
;
__f219_P1Y = (function()
return ((function()
return (-__f219_impulse)
end)()
 * self["m_u1"]["y"])
end)()
;
__f219_bA["m_linearVelocity"]["x"] = __add(__f219_bA["m_linearVelocity"]["x"], (function()
return (__f219_bA["m_invMass"] * __f219_P1X)
end)()
);
__f219_bA["m_linearVelocity"]["y"] = __add(__f219_bA["m_linearVelocity"]["y"], (function()
return (__f219_bA["m_invMass"] * __f219_P1Y)
end)()
);
__f219_bA["m_angularVelocity"] = __add(__f219_bA["m_angularVelocity"], (function()
return (__f219_bA["m_invI"] * (function()
return ((function()
return (__f219_r1X * __f219_P1Y)
end)()
 - (function()
return (__f219_r1Y * __f219_P1X)
end)()
)
end)()
)
end)()
)
return __f219_bA["m_angularVelocity"]
end)()

else return __noop()
end
end)()
;
return (function()
local __oak_cond = __truthy((function()
return __oak_eq(self["m_limitState2"], __static_b2Joint["e_atUpperLimit"])
end)()
)
if __oak_eq(__oak_cond, true) then return (function()
__f219_v2X = __add(__f219_bB["m_linearVelocity"]["x"], (function()
return ((function()
return (-__f219_bB["m_angularVelocity"])
end)()
 * __f219_r2Y)
end)()
);
__f219_v2Y = __add(__f219_bB["m_linearVelocity"]["y"], (function()
return (__f219_bB["m_angularVelocity"] * __f219_r2X)
end)()
);
__f219_Cdot = (function()
return (-__add((function()
return (self["m_u2"]["x"] * __f219_v2X)
end)()
, (function()
return (self["m_u2"]["y"] * __f219_v2Y)
end)()
))
end)()
;
__f219_impulse = (function()
return ((function()
return (-self["m_limitMass2"])
end)()
 * __f219_Cdot)
end)()
;
__f219_oldImpulse = self["m_limitImpulse2"];
self["m_limitImpulse2"] = __static_b2Math["Max"](0, __add(self["m_limitImpulse2"], __f219_impulse));
__f219_impulse = (function()
return (self["m_limitImpulse2"] - __f219_oldImpulse)
end)()
;
__f219_P2X = (function()
return ((function()
return (-__f219_impulse)
end)()
 * self["m_u2"]["x"])
end)()
;
__f219_P2Y = (function()
return ((function()
return (-__f219_impulse)
end)()
 * self["m_u2"]["y"])
end)()
;
__f219_bB["m_linearVelocity"]["x"] = __add(__f219_bB["m_linearVelocity"]["x"], (function()
return (__f219_bB["m_invMass"] * __f219_P2X)
end)()
);
__f219_bB["m_linearVelocity"]["y"] = __add(__f219_bB["m_linearVelocity"]["y"], (function()
return (__f219_bB["m_invMass"] * __f219_P2Y)
end)()
);
__f219_bB["m_angularVelocity"] = __add(__f219_bB["m_angularVelocity"], (function()
return (__f219_bB["m_invI"] * (function()
return ((function()
return (__f219_r2X * __f219_P2Y)
end)()
 - (function()
return (__f219_r2Y * __f219_P2X)
end)()
)
end)()
)
end)()
)
return __f219_bB["m_angularVelocity"]
end)()

else return __noop()
end
end)()

end;
__proto_b2PulleyJoint["SolvePositionConstraints"] = function(self, __f220_baumgarte)
(function()
local __oak_cond = __truthy((function()
return __oak_eq(__f220_baumgarte, nil)
end)()
)
if __oak_eq(__oak_cond, true) then __f220_baumgarte = 0
return __f220_baumgarte
else return __noop()
end
end)()
;
local __f220_bA = self["m_bodyA"];
local __f220_bB = self["m_bodyB"];
local __f220_tMat = __noop();
local __f220_s1X = __add(self["m_ground"]["m_xf"]["position"]["x"], self["m_groundAnchor1"]["x"]);
local __f220_s1Y = __add(self["m_ground"]["m_xf"]["position"]["y"], self["m_groundAnchor1"]["y"]);
local __f220_s2X = __add(self["m_ground"]["m_xf"]["position"]["x"], self["m_groundAnchor2"]["x"]);
local __f220_s2Y = __add(self["m_ground"]["m_xf"]["position"]["y"], self["m_groundAnchor2"]["y"]);
local __f220_r1X = 0;
local __f220_r1Y = 0;
local __f220_r2X = 0;
local __f220_r2Y = 0;
local __f220_p1X = 0;
local __f220_p1Y = 0;
local __f220_p2X = 0;
local __f220_p2Y = 0;
local __f220_length1 = 0;
local __f220_length2 = 0;
local __f220_C = 0;
local __f220_impulse = 0;
local __f220_oldImpulse = 0;
local __f220_oldLimitPositionImpulse = 0;
local __f220_tX = 0;
local __f220_linearError = 0;
(function()
local __oak_cond = __truthy((function()
return __oak_eq(self["m_state"], __static_b2Joint["e_atUpperLimit"])
end)()
)
if __oak_eq(__oak_cond, true) then return (function()
__f220_tMat = __f220_bA["m_xf"]["R"];
__f220_r1X = (function()
return (self["m_localAnchor1"]["x"] - __f220_bA["m_sweep"]["localCenter"]["x"])
end)()
;
__f220_r1Y = (function()
return (self["m_localAnchor1"]["y"] - __f220_bA["m_sweep"]["localCenter"]["y"])
end)()
;
__f220_tX = __add((function()
return (__f220_tMat["col1"]["x"] * __f220_r1X)
end)()
, (function()
return (__f220_tMat["col2"]["x"] * __f220_r1Y)
end)()
);
__f220_r1Y = __add((function()
return (__f220_tMat["col1"]["y"] * __f220_r1X)
end)()
, (function()
return (__f220_tMat["col2"]["y"] * __f220_r1Y)
end)()
);
__f220_r1X = __f220_tX;
__f220_tMat = __f220_bB["m_xf"]["R"];
__f220_r2X = (function()
return (self["m_localAnchor2"]["x"] - __f220_bB["m_sweep"]["localCenter"]["x"])
end)()
;
__f220_r2Y = (function()
return (self["m_localAnchor2"]["y"] - __f220_bB["m_sweep"]["localCenter"]["y"])
end)()
;
__f220_tX = __add((function()
return (__f220_tMat["col1"]["x"] * __f220_r2X)
end)()
, (function()
return (__f220_tMat["col2"]["x"] * __f220_r2Y)
end)()
);
__f220_r2Y = __add((function()
return (__f220_tMat["col1"]["y"] * __f220_r2X)
end)()
, (function()
return (__f220_tMat["col2"]["y"] * __f220_r2Y)
end)()
);
__f220_r2X = __f220_tX;
__f220_p1X = __add(__f220_bA["m_sweep"]["c"]["x"], __f220_r1X);
__f220_p1Y = __add(__f220_bA["m_sweep"]["c"]["y"], __f220_r1Y);
__f220_p2X = __add(__f220_bB["m_sweep"]["c"]["x"], __f220_r2X);
__f220_p2Y = __add(__f220_bB["m_sweep"]["c"]["y"], __f220_r2Y);
self["m_u1"]["Set"](self["m_u1"], (function()
return (__f220_p1X - __f220_s1X)
end)()
, (function()
return (__f220_p1Y - __f220_s1Y)
end)()
);
self["m_u2"]["Set"](self["m_u2"], (function()
return (__f220_p2X - __f220_s2X)
end)()
, (function()
return (__f220_p2Y - __f220_s2Y)
end)()
);
__f220_length1 = self["m_u1"]["Length"](self["m_u1"]);
__f220_length2 = self["m_u2"]["Length"](self["m_u2"]);
(function()
local __oak_cond = __truthy((function()
return (__f220_length1 > __static_b2Settings["b2_linearSlop"])
end)()
)
if __oak_eq(__oak_cond, true) then return self["m_u1"]["Multiply"](self["m_u1"], (function()
return (1 / __f220_length1)
end)()
)
else return self["m_u1"]["SetZero"](self["m_u1"])
end
end)()
;
(function()
local __oak_cond = __truthy((function()
return (__f220_length2 > __static_b2Settings["b2_linearSlop"])
end)()
)
if __oak_eq(__oak_cond, true) then return self["m_u2"]["Multiply"](self["m_u2"], (function()
return (1 / __f220_length2)
end)()
)
else return self["m_u2"]["SetZero"](self["m_u2"])
end
end)()
;
__f220_C = (function()
return ((function()
return (self["m_constant"] - __f220_length1)
end)()
 - (function()
return (self["m_ratio"] * __f220_length2)
end)()
)
end)()
;
__f220_linearError = __static_b2Math["Max"](__f220_linearError, (function()
return (-__f220_C)
end)()
);
__f220_C = __static_b2Math["Clamp"](__add(__f220_C, __static_b2Settings["b2_linearSlop"]), (function()
return (-__static_b2Settings["b2_maxLinearCorrection"])
end)()
, 0);
__f220_impulse = (function()
return ((function()
return (-self["m_pulleyMass"])
end)()
 * __f220_C)
end)()
;
__f220_p1X = (function()
return ((function()
return (-__f220_impulse)
end)()
 * self["m_u1"]["x"])
end)()
;
__f220_p1Y = (function()
return ((function()
return (-__f220_impulse)
end)()
 * self["m_u1"]["y"])
end)()
;
__f220_p2X = (function()
return ((function()
return ((function()
return (-self["m_ratio"])
end)()
 * __f220_impulse)
end)()
 * self["m_u2"]["x"])
end)()
;
__f220_p2Y = (function()
return ((function()
return ((function()
return (-self["m_ratio"])
end)()
 * __f220_impulse)
end)()
 * self["m_u2"]["y"])
end)()
;
__f220_bA["m_sweep"]["c"]["x"] = __add(__f220_bA["m_sweep"]["c"]["x"], (function()
return (__f220_bA["m_invMass"] * __f220_p1X)
end)()
);
__f220_bA["m_sweep"]["c"]["y"] = __add(__f220_bA["m_sweep"]["c"]["y"], (function()
return (__f220_bA["m_invMass"] * __f220_p1Y)
end)()
);
__f220_bA["m_sweep"]["a"] = __add(__f220_bA["m_sweep"]["a"], (function()
return (__f220_bA["m_invI"] * (function()
return ((function()
return (__f220_r1X * __f220_p1Y)
end)()
 - (function()
return (__f220_r1Y * __f220_p1X)
end)()
)
end)()
)
end)()
);
__f220_bB["m_sweep"]["c"]["x"] = __add(__f220_bB["m_sweep"]["c"]["x"], (function()
return (__f220_bB["m_invMass"] * __f220_p2X)
end)()
);
__f220_bB["m_sweep"]["c"]["y"] = __add(__f220_bB["m_sweep"]["c"]["y"], (function()
return (__f220_bB["m_invMass"] * __f220_p2Y)
end)()
);
__f220_bB["m_sweep"]["a"] = __add(__f220_bB["m_sweep"]["a"], (function()
return (__f220_bB["m_invI"] * (function()
return ((function()
return (__f220_r2X * __f220_p2Y)
end)()
 - (function()
return (__f220_r2Y * __f220_p2X)
end)()
)
end)()
)
end)()
);
__f220_bA["SynchronizeTransform"](__f220_bA);
return __f220_bB["SynchronizeTransform"](__f220_bB)
end)()

else return __noop()
end
end)()
;
(function()
local __oak_cond = __truthy((function()
return __oak_eq(self["m_limitState1"], __static_b2Joint["e_atUpperLimit"])
end)()
)
if __oak_eq(__oak_cond, true) then return (function()
__f220_tMat = __f220_bA["m_xf"]["R"];
__f220_r1X = (function()
return (self["m_localAnchor1"]["x"] - __f220_bA["m_sweep"]["localCenter"]["x"])
end)()
;
__f220_r1Y = (function()
return (self["m_localAnchor1"]["y"] - __f220_bA["m_sweep"]["localCenter"]["y"])
end)()
;
__f220_tX = __add((function()
return (__f220_tMat["col1"]["x"] * __f220_r1X)
end)()
, (function()
return (__f220_tMat["col2"]["x"] * __f220_r1Y)
end)()
);
__f220_r1Y = __add((function()
return (__f220_tMat["col1"]["y"] * __f220_r1X)
end)()
, (function()
return (__f220_tMat["col2"]["y"] * __f220_r1Y)
end)()
);
__f220_r1X = __f220_tX;
__f220_p1X = __add(__f220_bA["m_sweep"]["c"]["x"], __f220_r1X);
__f220_p1Y = __add(__f220_bA["m_sweep"]["c"]["y"], __f220_r1Y);
self["m_u1"]["Set"](self["m_u1"], (function()
return (__f220_p1X - __f220_s1X)
end)()
, (function()
return (__f220_p1Y - __f220_s1Y)
end)()
);
__f220_length1 = self["m_u1"]["Length"](self["m_u1"]);
(function()
local __oak_cond = __truthy((function()
return (__f220_length1 > __static_b2Settings["b2_linearSlop"])
end)()
)
if __oak_eq(__oak_cond, true) then return (function()
self["m_u1"]["x"] = (function()
return (self["m_u1"]["x"] * (function()
return (1 / __f220_length1)
end)()
)
end)()
;
self["m_u1"]["y"] = (function()
return (self["m_u1"]["y"] * (function()
return (1 / __f220_length1)
end)()
)
end)()

return self["m_u1"]["y"]
end)()

else return self["m_u1"]["SetZero"](self["m_u1"])
end
end)()
;
__f220_C = (function()
return (self["m_maxLength1"] - __f220_length1)
end)()
;
__f220_linearError = __static_b2Math["Max"](__f220_linearError, (function()
return (-__f220_C)
end)()
);
__f220_C = __static_b2Math["Clamp"](__add(__f220_C, __static_b2Settings["b2_linearSlop"]), (function()
return (-__static_b2Settings["b2_maxLinearCorrection"])
end)()
, 0);
__f220_impulse = (function()
return ((function()
return (-self["m_limitMass1"])
end)()
 * __f220_C)
end)()
;
__f220_p1X = (function()
return ((function()
return (-__f220_impulse)
end)()
 * self["m_u1"]["x"])
end)()
;
__f220_p1Y = (function()
return ((function()
return (-__f220_impulse)
end)()
 * self["m_u1"]["y"])
end)()
;
__f220_bA["m_sweep"]["c"]["x"] = __add(__f220_bA["m_sweep"]["c"]["x"], (function()
return (__f220_bA["m_invMass"] * __f220_p1X)
end)()
);
__f220_bA["m_sweep"]["c"]["y"] = __add(__f220_bA["m_sweep"]["c"]["y"], (function()
return (__f220_bA["m_invMass"] * __f220_p1Y)
end)()
);
__f220_bA["m_sweep"]["a"] = __add(__f220_bA["m_sweep"]["a"], (function()
return (__f220_bA["m_invI"] * (function()
return ((function()
return (__f220_r1X * __f220_p1Y)
end)()
 - (function()
return (__f220_r1Y * __f220_p1X)
end)()
)
end)()
)
end)()
);
return __f220_bA["SynchronizeTransform"](__f220_bA)
end)()

else return __noop()
end
end)()
;
(function()
local __oak_cond = __truthy((function()
return __oak_eq(self["m_limitState2"], __static_b2Joint["e_atUpperLimit"])
end)()
)
if __oak_eq(__oak_cond, true) then return (function()
__f220_tMat = __f220_bB["m_xf"]["R"];
__f220_r2X = (function()
return (self["m_localAnchor2"]["x"] - __f220_bB["m_sweep"]["localCenter"]["x"])
end)()
;
__f220_r2Y = (function()
return (self["m_localAnchor2"]["y"] - __f220_bB["m_sweep"]["localCenter"]["y"])
end)()
;
__f220_tX = __add((function()
return (__f220_tMat["col1"]["x"] * __f220_r2X)
end)()
, (function()
return (__f220_tMat["col2"]["x"] * __f220_r2Y)
end)()
);
__f220_r2Y = __add((function()
return (__f220_tMat["col1"]["y"] * __f220_r2X)
end)()
, (function()
return (__f220_tMat["col2"]["y"] * __f220_r2Y)
end)()
);
__f220_r2X = __f220_tX;
__f220_p2X = __add(__f220_bB["m_sweep"]["c"]["x"], __f220_r2X);
__f220_p2Y = __add(__f220_bB["m_sweep"]["c"]["y"], __f220_r2Y);
self["m_u2"]["Set"](self["m_u2"], (function()
return (__f220_p2X - __f220_s2X)
end)()
, (function()
return (__f220_p2Y - __f220_s2Y)
end)()
);
__f220_length2 = self["m_u2"]["Length"](self["m_u2"]);
(function()
local __oak_cond = __truthy((function()
return (__f220_length2 > __static_b2Settings["b2_linearSlop"])
end)()
)
if __oak_eq(__oak_cond, true) then return (function()
self["m_u2"]["x"] = (function()
return (self["m_u2"]["x"] * (function()
return (1 / __f220_length2)
end)()
)
end)()
;
self["m_u2"]["y"] = (function()
return (self["m_u2"]["y"] * (function()
return (1 / __f220_length2)
end)()
)
end)()

return self["m_u2"]["y"]
end)()

else return self["m_u2"]["SetZero"](self["m_u2"])
end
end)()
;
__f220_C = (function()
return (self["m_maxLength2"] - __f220_length2)
end)()
;
__f220_linearError = __static_b2Math["Max"](__f220_linearError, (function()
return (-__f220_C)
end)()
);
__f220_C = __static_b2Math["Clamp"](__add(__f220_C, __static_b2Settings["b2_linearSlop"]), (function()
return (-__static_b2Settings["b2_maxLinearCorrection"])
end)()
, 0);
__f220_impulse = (function()
return ((function()
return (-self["m_limitMass2"])
end)()
 * __f220_C)
end)()
;
__f220_p2X = (function()
return ((function()
return (-__f220_impulse)
end)()
 * self["m_u2"]["x"])
end)()
;
__f220_p2Y = (function()
return ((function()
return (-__f220_impulse)
end)()
 * self["m_u2"]["y"])
end)()
;
__f220_bB["m_sweep"]["c"]["x"] = __add(__f220_bB["m_sweep"]["c"]["x"], (function()
return (__f220_bB["m_invMass"] * __f220_p2X)
end)()
);
__f220_bB["m_sweep"]["c"]["y"] = __add(__f220_bB["m_sweep"]["c"]["y"], (function()
return (__f220_bB["m_invMass"] * __f220_p2Y)
end)()
);
__f220_bB["m_sweep"]["a"] = __add(__f220_bB["m_sweep"]["a"], (function()
return (__f220_bB["m_invI"] * (function()
return ((function()
return (__f220_r2X * __f220_p2Y)
end)()
 - (function()
return (__f220_r2Y * __f220_p2X)
end)()
)
end)()
)
end)()
);
return __f220_bB["SynchronizeTransform"](__f220_bB)
end)()

else return __noop()
end
end)()
;
return (function()
return (__f220_linearError < __static_b2Settings["b2_linearSlop"])
end)()

end;
__static_b2PulleyJoint = {};
b2PulleyJoint = function()
local self = b2Joint();
self["__type"] = 'b2PulleyJoint';
self["__types"] = {'b2PulleyJoint', 'b2Joint'};
self["__super"] = __proto_b2Joint;
self["GetAnchorA"] = __proto_b2PulleyJoint["GetAnchorA"];
self["GetAnchorB"] = __proto_b2PulleyJoint["GetAnchorB"];
self["GetReactionForce"] = __proto_b2PulleyJoint["GetReactionForce"];
self["GetReactionTorque"] = __proto_b2PulleyJoint["GetReactionTorque"];
self["GetGroundAnchorA"] = __proto_b2PulleyJoint["GetGroundAnchorA"];
self["GetGroundAnchorB"] = __proto_b2PulleyJoint["GetGroundAnchorB"];
self["GetLength1"] = __proto_b2PulleyJoint["GetLength1"];
self["GetLength2"] = __proto_b2PulleyJoint["GetLength2"];
self["GetRatio"] = __proto_b2PulleyJoint["GetRatio"];
self["InitVelocityConstraints"] = __proto_b2PulleyJoint["InitVelocityConstraints"];
self["SolveVelocityConstraints"] = __proto_b2PulleyJoint["SolveVelocityConstraints"];
self["SolvePositionConstraints"] = __proto_b2PulleyJoint["SolvePositionConstraints"];
(function()
Box2D["Dynamics"]["Joints"]["b2Joint"]["b2Joint"](self);
self["m_groundAnchor1"] = b2Vec2();
self["m_groundAnchor2"] = b2Vec2();
self["m_localAnchor1"] = b2Vec2();
self["m_localAnchor2"] = b2Vec2();
self["m_u1"] = b2Vec2();
self["m_u2"] = b2Vec2();
self["__super"]["b2Joint"](self, def);
local __f221_tMat = __noop();
local __f221_tX = 0;
local __f221_tY = 0;
self["m_ground"] = self["m_bodyA"]["m_world"]["m_groundBody"];
self["m_groundAnchor1"]["x"] = (function()
return (def["groundAnchorA"]["x"] - self["m_ground"]["m_xf"]["position"]["x"])
end)()
;
self["m_groundAnchor1"]["y"] = (function()
return (def["groundAnchorA"]["y"] - self["m_ground"]["m_xf"]["position"]["y"])
end)()
;
self["m_groundAnchor2"]["x"] = (function()
return (def["groundAnchorB"]["x"] - self["m_ground"]["m_xf"]["position"]["x"])
end)()
;
self["m_groundAnchor2"]["y"] = (function()
return (def["groundAnchorB"]["y"] - self["m_ground"]["m_xf"]["position"]["y"])
end)()
;
self["m_localAnchor1"]["SetV"](self["m_localAnchor1"], def["localAnchorA"]);
self["m_localAnchor2"]["SetV"](self["m_localAnchor2"], def["localAnchorB"]);
self["m_ratio"] = def["ratio"];
self["m_constant"] = __add(def["lengthA"], (function()
return (self["m_ratio"] * def["lengthB"])
end)()
);
self["m_maxLength1"] = __static_b2Math["Min"](def["maxLengthA"], (function()
return (self["m_constant"] - (function()
return (self["m_ratio"] * __static_b2PulleyJoint["b2_minPulleyLength"])
end)()
)
end)()
);
self["m_maxLength2"] = __static_b2Math["Min"](def["maxLengthB"], (function()
return ((function()
return (self["m_constant"] - __static_b2PulleyJoint["b2_minPulleyLength"])
end)()
 / self["m_ratio"])
end)()
);
self["m_impulse"] = 0;
self["m_limitImpulse1"] = 0;
self["m_limitImpulse2"] = 0
return self["m_limitImpulse2"]
end)()
;
return self
end;
Box2D["Dynamics"]["Joints"]["b2PulleyJoint"] = b2PulleyJoint;
__proto_b2PulleyJointDef = {};
__proto_b2PulleyJointDef["Initialize"] = function(self, __f222_bA, __f222_bB, __f222_gaA, __f222_gaB, __f222_anchorA, __f222_anchorB, __f222_r)
(function()
local __oak_cond = __truthy((function()
return __oak_eq(__f222_r, nil)
end)()
)
if __oak_eq(__oak_cond, true) then __f222_r = 0
return __f222_r
else return __noop()
end
end)()
;
self["bodyA"] = __f222_bA;
self["bodyB"] = __f222_bB;
self["groundAnchorA"]["SetV"](self["groundAnchorA"], __f222_gaA);
self["groundAnchorB"]["SetV"](self["groundAnchorB"], __f222_gaB);
self["localAnchorA"] = self["bodyA"]["GetLocalPoint"](self["bodyA"], __f222_anchorA);
self["localAnchorB"] = self["bodyB"]["GetLocalPoint"](self["bodyB"], __f222_anchorB);
local __f222_d1X = (function()
return (__f222_anchorA["x"] - __f222_gaA["x"])
end)()
;
local __f222_d1Y = (function()
return (__f222_anchorA["y"] - __f222_gaA["y"])
end)()
;
self["lengthA"] = __Math["sqrt"](__add((function()
return (__f222_d1X * __f222_d1X)
end)()
, (function()
return (__f222_d1Y * __f222_d1Y)
end)()
));
local __f222_d2X = (function()
return (__f222_anchorB["x"] - __f222_gaB["x"])
end)()
;
local __f222_d2Y = (function()
return (__f222_anchorB["y"] - __f222_gaB["y"])
end)()
;
self["lengthB"] = __Math["sqrt"](__add((function()
return (__f222_d2X * __f222_d2X)
end)()
, (function()
return (__f222_d2Y * __f222_d2Y)
end)()
));
self["ratio"] = __f222_r;
local __f222_C = __add(self["lengthA"], (function()
return (self["ratio"] * self["lengthB"])
end)()
);
self["maxLengthA"] = (function()
return (__f222_C - (function()
return (self["ratio"] * __static_b2PulleyJoint["b2_minPulleyLength"])
end)()
)
end)()
;
self["maxLengthB"] = (function()
return ((function()
return (__f222_C - __static_b2PulleyJoint["b2_minPulleyLength"])
end)()
 / self["ratio"])
end)()

return self["maxLengthB"]
end;
__static_b2PulleyJointDef = {};
b2PulleyJointDef = function()
local self = b2JointDef();
self["__type"] = 'b2PulleyJointDef';
self["__types"] = {'b2PulleyJointDef', 'b2JointDef'};
self["__super"] = __proto_b2JointDef;
self["Initialize"] = __proto_b2PulleyJointDef["Initialize"];
(function()
Box2D["Dynamics"]["Joints"]["b2JointDef"]["b2JointDef"](self);
self["groundAnchorA"] = b2Vec2();
self["groundAnchorB"] = b2Vec2();
self["localAnchorA"] = b2Vec2();
self["localAnchorB"] = b2Vec2();
self["__super"]["b2JointDef"](self);
self["type"] = __static_b2Joint["e_pulleyJoint"];
self["groundAnchorA"]["Set"](self["groundAnchorA"], (function()
return (-1)
end)()
, 1);
self["groundAnchorB"]["Set"](self["groundAnchorB"], 1, 1);
self["localAnchorA"]["Set"](self["localAnchorA"], (function()
return (-1)
end)()
, 0);
self["localAnchorB"]["Set"](self["localAnchorB"], 1, 0);
self["lengthA"] = 0;
self["maxLengthA"] = 0;
self["lengthB"] = 0;
self["maxLengthB"] = 0;
self["ratio"] = 1;
self["collideConnected"] = true
return self["collideConnected"]
end)()
;
return self
end;
Box2D["Dynamics"]["Joints"]["b2PulleyJointDef"] = b2PulleyJointDef;
__proto_b2RevoluteJoint = {};
__proto_b2RevoluteJoint["GetAnchorA"] = function(self)
return self["m_bodyA"]["GetWorldPoint"](self["m_bodyA"], self["m_localAnchor1"])
end;
__proto_b2RevoluteJoint["GetAnchorB"] = function(self)
return self["m_bodyB"]["GetWorldPoint"](self["m_bodyB"], self["m_localAnchor2"])
end;
__proto_b2RevoluteJoint["GetReactionForce"] = function(self, __f226_inv_dt)
(function()
local __oak_cond = __truthy((function()
return __oak_eq(__f226_inv_dt, nil)
end)()
)
if __oak_eq(__oak_cond, true) then __f226_inv_dt = 0
return __f226_inv_dt
else return __noop()
end
end)()
;
return b2Vec2((function()
return (__f226_inv_dt * self["m_impulse"]["x"])
end)()
, (function()
return (__f226_inv_dt * self["m_impulse"]["y"])
end)()
)
end;
__proto_b2RevoluteJoint["GetReactionTorque"] = function(self, __f227_inv_dt)
(function()
local __oak_cond = __truthy((function()
return __oak_eq(__f227_inv_dt, nil)
end)()
)
if __oak_eq(__oak_cond, true) then __f227_inv_dt = 0
return __f227_inv_dt
else return __noop()
end
end)()
;
return (function()
return (__f227_inv_dt * self["m_impulse"]["z"])
end)()

end;
__proto_b2RevoluteJoint["GetJointAngle"] = function(self)
return ((function()
return (self["m_bodyB"]["m_sweep"]["a"] - self["m_bodyA"]["m_sweep"]["a"])
end)()
 - self["m_referenceAngle"])
end;
__proto_b2RevoluteJoint["GetJointSpeed"] = function(self)
return (self["m_bodyB"]["m_angularVelocity"] - self["m_bodyA"]["m_angularVelocity"])
end;
__proto_b2RevoluteJoint["IsLimitEnabled"] = function(self)
return self["m_enableLimit"]
end;
__proto_b2RevoluteJoint["EnableLimit"] = function(self, __f231_flag)
self["m_enableLimit"] = __f231_flag
return self["m_enableLimit"]
end;
__proto_b2RevoluteJoint["GetLowerLimit"] = function(self)
return self["m_lowerAngle"]
end;
__proto_b2RevoluteJoint["GetUpperLimit"] = function(self)
return self["m_upperAngle"]
end;
__proto_b2RevoluteJoint["SetLimits"] = function(self, __f234_lower, __f234_upper)
(function()
local __oak_cond = __truthy((function()
return __oak_eq(__f234_lower, nil)
end)()
)
if __oak_eq(__oak_cond, true) then __f234_lower = 0
return __f234_lower
else return __noop()
end
end)()
;
(function()
local __oak_cond = __truthy((function()
return __oak_eq(__f234_upper, nil)
end)()
)
if __oak_eq(__oak_cond, true) then __f234_upper = 0
return __f234_upper
else return __noop()
end
end)()
;
self["m_lowerAngle"] = __f234_lower;
self["m_upperAngle"] = __f234_upper
return self["m_upperAngle"]
end;
__proto_b2RevoluteJoint["IsMotorEnabled"] = function(self)
self["m_bodyA"]["SetAwake"](self["m_bodyA"], true);
self["m_bodyB"]["SetAwake"](self["m_bodyB"], true);
return self["m_enableMotor"]
end;
__proto_b2RevoluteJoint["EnableMotor"] = function(self, __f236_flag)
self["m_enableMotor"] = __f236_flag
return self["m_enableMotor"]
end;
__proto_b2RevoluteJoint["SetMotorSpeed"] = function(self, __f237_speed)
(function()
local __oak_cond = __truthy((function()
return __oak_eq(__f237_speed, nil)
end)()
)
if __oak_eq(__oak_cond, true) then __f237_speed = 0
return __f237_speed
else return __noop()
end
end)()
;
self["m_bodyA"]["SetAwake"](self["m_bodyA"], true);
self["m_bodyB"]["SetAwake"](self["m_bodyB"], true);
self["m_motorSpeed"] = __f237_speed
return self["m_motorSpeed"]
end;
__proto_b2RevoluteJoint["GetMotorSpeed"] = function(self)
return self["m_motorSpeed"]
end;
__proto_b2RevoluteJoint["SetMaxMotorTorque"] = function(self, __f239_torque)
(function()
local __oak_cond = __truthy((function()
return __oak_eq(__f239_torque, nil)
end)()
)
if __oak_eq(__oak_cond, true) then __f239_torque = 0
return __f239_torque
else return __noop()
end
end)()
;
self["m_maxMotorTorque"] = __f239_torque
return self["m_maxMotorTorque"]
end;
__proto_b2RevoluteJoint["GetMotorTorque"] = function(self)
return self["m_maxMotorTorque"]
end;
__proto_b2RevoluteJoint["InitVelocityConstraints"] = function(self, __f241_step)
local __f241_bA = self["m_bodyA"];
local __f241_bB = self["m_bodyB"];
local __f241_tMat = __noop();
local __f241_tX = 0;
(function()
local __oak_cond = __truthy(__or(self["m_enableMotor"], self["m_enableLimit"]))
if __oak_eq(__oak_cond, true) then return nil
else return __noop()
end
end)()
;
__f241_tMat = __f241_bA["m_xf"]["R"];
local __f241_r1X = (function()
return (self["m_localAnchor1"]["x"] - __f241_bA["m_sweep"]["localCenter"]["x"])
end)()
;
local __f241_r1Y = (function()
return (self["m_localAnchor1"]["y"] - __f241_bA["m_sweep"]["localCenter"]["y"])
end)()
;
__f241_tX = __add((function()
return (__f241_tMat["col1"]["x"] * __f241_r1X)
end)()
, (function()
return (__f241_tMat["col2"]["x"] * __f241_r1Y)
end)()
);
__f241_r1Y = __add((function()
return (__f241_tMat["col1"]["y"] * __f241_r1X)
end)()
, (function()
return (__f241_tMat["col2"]["y"] * __f241_r1Y)
end)()
);
__f241_r1X = __f241_tX;
__f241_tMat = __f241_bB["m_xf"]["R"];
local __f241_r2X = (function()
return (self["m_localAnchor2"]["x"] - __f241_bB["m_sweep"]["localCenter"]["x"])
end)()
;
local __f241_r2Y = (function()
return (self["m_localAnchor2"]["y"] - __f241_bB["m_sweep"]["localCenter"]["y"])
end)()
;
__f241_tX = __add((function()
return (__f241_tMat["col1"]["x"] * __f241_r2X)
end)()
, (function()
return (__f241_tMat["col2"]["x"] * __f241_r2Y)
end)()
);
__f241_r2Y = __add((function()
return (__f241_tMat["col1"]["y"] * __f241_r2X)
end)()
, (function()
return (__f241_tMat["col2"]["y"] * __f241_r2Y)
end)()
);
__f241_r2X = __f241_tX;
local __f241_m1 = __f241_bA["m_invMass"];
local __f241_m2 = __f241_bB["m_invMass"];
local __f241_i1 = __f241_bA["m_invI"];
local __f241_i2 = __f241_bB["m_invI"];
self["m_mass"]["col1"]["x"] = __add(__add(__add(__f241_m1, __f241_m2), (function()
return ((function()
return (__f241_r1Y * __f241_r1Y)
end)()
 * __f241_i1)
end)()
), (function()
return ((function()
return (__f241_r2Y * __f241_r2Y)
end)()
 * __f241_i2)
end)()
);
self["m_mass"]["col2"]["x"] = (function()
return ((function()
return ((function()
return ((function()
return (-__f241_r1Y)
end)()
 * __f241_r1X)
end)()
 * __f241_i1)
end)()
 - (function()
return ((function()
return (__f241_r2Y * __f241_r2X)
end)()
 * __f241_i2)
end)()
)
end)()
;
self["m_mass"]["col3"]["x"] = (function()
return ((function()
return ((function()
return (-__f241_r1Y)
end)()
 * __f241_i1)
end)()
 - (function()
return (__f241_r2Y * __f241_i2)
end)()
)
end)()
;
self["m_mass"]["col1"]["y"] = self["m_mass"]["col2"]["x"];
self["m_mass"]["col2"]["y"] = __add(__add(__add(__f241_m1, __f241_m2), (function()
return ((function()
return (__f241_r1X * __f241_r1X)
end)()
 * __f241_i1)
end)()
), (function()
return ((function()
return (__f241_r2X * __f241_r2X)
end)()
 * __f241_i2)
end)()
);
self["m_mass"]["col3"]["y"] = __add((function()
return (__f241_r1X * __f241_i1)
end)()
, (function()
return (__f241_r2X * __f241_i2)
end)()
);
self["m_mass"]["col1"]["z"] = self["m_mass"]["col3"]["x"];
self["m_mass"]["col2"]["z"] = self["m_mass"]["col3"]["y"];
self["m_mass"]["col3"]["z"] = __add(__f241_i1, __f241_i2);
self["m_motorMass"] = (function()
return (1 / __add(__f241_i1, __f241_i2))
end)()
;
(function()
local __oak_cond = __truthy((function()
return __oak_eq(self["m_enableMotor"], false)
end)()
)
if __oak_eq(__oak_cond, true) then self["m_motorImpulse"] = 0
return self["m_motorImpulse"]
else return __noop()
end
end)()
;
(function()
local __oak_cond = __truthy(self["m_enableLimit"])
if __oak_eq(__oak_cond, true) then return (function()
local __f241_jointAngle = (function()
return ((function()
return (__f241_bB["m_sweep"]["a"] - __f241_bA["m_sweep"]["a"])
end)()
 - self["m_referenceAngle"])
end)()
;
return (function()
local __oak_cond = __truthy((function()
return (__static_b2Math["Abs"]((function()
return (self["m_upperAngle"] - self["m_lowerAngle"])
end)()
) < (function()
return (2 * __static_b2Settings["b2_angularSlop"])
end)()
)
end)()
)
if __oak_eq(__oak_cond, true) then self["m_limitState"] = __static_b2Joint["e_equalLimits"]
return self["m_limitState"]
else return (function()
local __oak_cond = __truthy((function()
return (__f241_jointAngle <= self["m_lowerAngle"])
end)()
)
if __oak_eq(__oak_cond, true) then return (function()
(function()
local __oak_cond = __truthy((function()
return (not __oak_eq(self["m_limitState"], __static_b2Joint["e_atLowerLimit"]))
end)()
)
if __oak_eq(__oak_cond, true) then self["m_impulse"]["z"] = 0
return self["m_impulse"]["z"]
else return __noop()
end
end)()
;
self["m_limitState"] = __static_b2Joint["e_atLowerLimit"]
return self["m_limitState"]
end)()

else return (function()
local __oak_cond = __truthy((function()
return (__f241_jointAngle >= self["m_upperAngle"])
end)()
)
if __oak_eq(__oak_cond, true) then return (function()
(function()
local __oak_cond = __truthy((function()
return (not __oak_eq(self["m_limitState"], __static_b2Joint["e_atUpperLimit"]))
end)()
)
if __oak_eq(__oak_cond, true) then self["m_impulse"]["z"] = 0
return self["m_impulse"]["z"]
else return __noop()
end
end)()
;
self["m_limitState"] = __static_b2Joint["e_atUpperLimit"]
return self["m_limitState"]
end)()

else return (function()
self["m_limitState"] = __static_b2Joint["e_inactiveLimit"];
self["m_impulse"]["z"] = 0
return self["m_impulse"]["z"]
end)()

end
end)()

end
end)()

end
end)()

end)()

else self["m_limitState"] = __static_b2Joint["e_inactiveLimit"]
return self["m_limitState"]
end
end)()
;
return (function()
local __oak_cond = __truthy(__f241_step["warmStarting"])
if __oak_eq(__oak_cond, true) then return (function()
self["m_impulse"]["x"] = (function()
return (self["m_impulse"]["x"] * __f241_step["dtRatio"])
end)()
;
self["m_impulse"]["y"] = (function()
return (self["m_impulse"]["y"] * __f241_step["dtRatio"])
end)()
;
self["m_motorImpulse"] = (function()
return (self["m_motorImpulse"] * __f241_step["dtRatio"])
end)()
;
local __f241_PX = self["m_impulse"]["x"];
local __f241_PY = self["m_impulse"]["y"];
__f241_bA["m_linearVelocity"]["x"] = (function()
return (__f241_bA["m_linearVelocity"]["x"] - (function()
return (__f241_m1 * __f241_PX)
end)()
)
end)()
;
__f241_bA["m_linearVelocity"]["y"] = (function()
return (__f241_bA["m_linearVelocity"]["y"] - (function()
return (__f241_m1 * __f241_PY)
end)()
)
end)()
;
__f241_bA["m_angularVelocity"] = (function()
return (__f241_bA["m_angularVelocity"] - (function()
return (__f241_i1 * __add(__add((function()
return ((function()
return (__f241_r1X * __f241_PY)
end)()
 - (function()
return (__f241_r1Y * __f241_PX)
end)()
)
end)()
, self["m_motorImpulse"]), self["m_impulse"]["z"]))
end)()
)
end)()
;
__f241_bB["m_linearVelocity"]["x"] = __add(__f241_bB["m_linearVelocity"]["x"], (function()
return (__f241_m2 * __f241_PX)
end)()
);
__f241_bB["m_linearVelocity"]["y"] = __add(__f241_bB["m_linearVelocity"]["y"], (function()
return (__f241_m2 * __f241_PY)
end)()
);
__f241_bB["m_angularVelocity"] = __add(__f241_bB["m_angularVelocity"], (function()
return (__f241_i2 * __add(__add((function()
return ((function()
return (__f241_r2X * __f241_PY)
end)()
 - (function()
return (__f241_r2Y * __f241_PX)
end)()
)
end)()
, self["m_motorImpulse"]), self["m_impulse"]["z"]))
end)()
)
return __f241_bB["m_angularVelocity"]
end)()

else return (function()
self["m_impulse"]["SetZero"](self["m_impulse"]);
self["m_motorImpulse"] = 0
return self["m_motorImpulse"]
end)()

end
end)()

end;
__proto_b2RevoluteJoint["SolveVelocityConstraints"] = function(self, __f242_step)
local __f242_bA = self["m_bodyA"];
local __f242_bB = self["m_bodyB"];
local __f242_tMat = __noop();
local __f242_tX = 0;
local __f242_newImpulse = 0;
local __f242_r1X = 0;
local __f242_r1Y = 0;
local __f242_r2X = 0;
local __f242_r2Y = 0;
local __f242_v1 = __f242_bA["m_linearVelocity"];
local __f242_w1 = __f242_bA["m_angularVelocity"];
local __f242_v2 = __f242_bB["m_linearVelocity"];
local __f242_w2 = __f242_bB["m_angularVelocity"];
local __f242_m1 = __f242_bA["m_invMass"];
local __f242_m2 = __f242_bB["m_invMass"];
local __f242_i1 = __f242_bA["m_invI"];
local __f242_i2 = __f242_bB["m_invI"];
(function()
local __oak_cond = __truthy(__and(self["m_enableMotor"], (function()
return (not __oak_eq(self["m_limitState"], __static_b2Joint["e_equalLimits"]))
end)()
))
if __oak_eq(__oak_cond, true) then return (function()
local __f242_Cdot = (function()
return ((function()
return (__f242_w2 - __f242_w1)
end)()
 - self["m_motorSpeed"])
end)()
;
local __f242_impulse = (function()
return (self["m_motorMass"] * (function()
return (-__f242_Cdot)
end)()
)
end)()
;
local __f242_oldImpulse = self["m_motorImpulse"];
local __f242_maxImpulse = (function()
return (__f242_step["dt"] * self["m_maxMotorTorque"])
end)()
;
self["m_motorImpulse"] = __static_b2Math["Clamp"](__add(self["m_motorImpulse"], __f242_impulse), (function()
return (-__f242_maxImpulse)
end)()
, __f242_maxImpulse);
__f242_impulse = (function()
return (self["m_motorImpulse"] - __f242_oldImpulse)
end)()
;
__f242_w1 = (function()
return (__f242_w1 - (function()
return (__f242_i1 * __f242_impulse)
end)()
)
end)()
;
__f242_w2 = __add(__f242_w2, (function()
return (__f242_i2 * __f242_impulse)
end)()
)
return __f242_w2
end)()

else return __noop()
end
end)()
;
(function()
local __oak_cond = __truthy(__and(self["m_enableLimit"], (function()
return (not __oak_eq(self["m_limitState"], __static_b2Joint["e_inactiveLimit"]))
end)()
))
if __oak_eq(__oak_cond, true) then return (function()
__f242_tMat = __f242_bA["m_xf"]["R"];
__f242_r1X = (function()
return (self["m_localAnchor1"]["x"] - __f242_bA["m_sweep"]["localCenter"]["x"])
end)()
;
__f242_r1Y = (function()
return (self["m_localAnchor1"]["y"] - __f242_bA["m_sweep"]["localCenter"]["y"])
end)()
;
__f242_tX = __add((function()
return (__f242_tMat["col1"]["x"] * __f242_r1X)
end)()
, (function()
return (__f242_tMat["col2"]["x"] * __f242_r1Y)
end)()
);
__f242_r1Y = __add((function()
return (__f242_tMat["col1"]["y"] * __f242_r1X)
end)()
, (function()
return (__f242_tMat["col2"]["y"] * __f242_r1Y)
end)()
);
__f242_r1X = __f242_tX;
__f242_tMat = __f242_bB["m_xf"]["R"];
__f242_r2X = (function()
return (self["m_localAnchor2"]["x"] - __f242_bB["m_sweep"]["localCenter"]["x"])
end)()
;
__f242_r2Y = (function()
return (self["m_localAnchor2"]["y"] - __f242_bB["m_sweep"]["localCenter"]["y"])
end)()
;
__f242_tX = __add((function()
return (__f242_tMat["col1"]["x"] * __f242_r2X)
end)()
, (function()
return (__f242_tMat["col2"]["x"] * __f242_r2Y)
end)()
);
__f242_r2Y = __add((function()
return (__f242_tMat["col1"]["y"] * __f242_r2X)
end)()
, (function()
return (__f242_tMat["col2"]["y"] * __f242_r2Y)
end)()
);
__f242_r2X = __f242_tX;
local __f242_Cdot1X = (function()
return ((function()
return (__add(__f242_v2["x"], (function()
return ((function()
return (-__f242_w2)
end)()
 * __f242_r2Y)
end)()
) - __f242_v1["x"])
end)()
 - (function()
return ((function()
return (-__f242_w1)
end)()
 * __f242_r1Y)
end)()
)
end)()
;
local __f242_Cdot1Y = (function()
return ((function()
return (__add(__f242_v2["y"], (function()
return (__f242_w2 * __f242_r2X)
end)()
) - __f242_v1["y"])
end)()
 - (function()
return (__f242_w1 * __f242_r1X)
end)()
)
end)()
;
local __f242_Cdot2 = (function()
return (__f242_w2 - __f242_w1)
end)()
;
self["m_mass"]["Solve33"](self["m_mass"], self["impulse3"], (function()
return (-__f242_Cdot1X)
end)()
, (function()
return (-__f242_Cdot1Y)
end)()
, (function()
return (-__f242_Cdot2)
end)()
);
(function()
local __oak_cond = __truthy((function()
return __oak_eq(self["m_limitState"], __static_b2Joint["e_equalLimits"])
end)()
)
if __oak_eq(__oak_cond, true) then return self["m_impulse"]["Add"](self["m_impulse"], self["impulse3"])
else return (function()
local __oak_cond = __truthy((function()
return __oak_eq(self["m_limitState"], __static_b2Joint["e_atLowerLimit"])
end)()
)
if __oak_eq(__oak_cond, true) then return (function()
__f242_newImpulse = __add(self["m_impulse"]["z"], self["impulse3"]["z"]);
return (function()
local __oak_cond = __truthy((function()
return (__f242_newImpulse < 0)
end)()
)
if __oak_eq(__oak_cond, true) then return (function()
self["m_mass"]["Solve22"](self["m_mass"], self["reduced"], (function()
return (-__f242_Cdot1X)
end)()
, (function()
return (-__f242_Cdot1Y)
end)()
);
self["impulse3"]["x"] = self["reduced"]["x"];
self["impulse3"]["y"] = self["reduced"]["y"];
self["impulse3"]["z"] = (function()
return (-self["m_impulse"]["z"])
end)()
;
self["m_impulse"]["x"] = __add(self["m_impulse"]["x"], self["reduced"]["x"]);
self["m_impulse"]["y"] = __add(self["m_impulse"]["y"], self["reduced"]["y"]);
self["m_impulse"]["z"] = 0
return self["m_impulse"]["z"]
end)()

else return __noop()
end
end)()

end)()

else return (function()
local __oak_cond = __truthy((function()
return __oak_eq(self["m_limitState"], __static_b2Joint["e_atUpperLimit"])
end)()
)
if __oak_eq(__oak_cond, true) then return (function()
__f242_newImpulse = __add(self["m_impulse"]["z"], self["impulse3"]["z"]);
return (function()
local __oak_cond = __truthy((function()
return (__f242_newImpulse > 0)
end)()
)
if __oak_eq(__oak_cond, true) then return (function()
self["m_mass"]["Solve22"](self["m_mass"], self["reduced"], (function()
return (-__f242_Cdot1X)
end)()
, (function()
return (-__f242_Cdot1Y)
end)()
);
self["impulse3"]["x"] = self["reduced"]["x"];
self["impulse3"]["y"] = self["reduced"]["y"];
self["impulse3"]["z"] = (function()
return (-self["m_impulse"]["z"])
end)()
;
self["m_impulse"]["x"] = __add(self["m_impulse"]["x"], self["reduced"]["x"]);
self["m_impulse"]["y"] = __add(self["m_impulse"]["y"], self["reduced"]["y"]);
self["m_impulse"]["z"] = 0
return self["m_impulse"]["z"]
end)()

else return __noop()
end
end)()

end)()

else return __noop()
end
end)()

end
end)()

end
end)()
;
__f242_v1["x"] = (function()
return (__f242_v1["x"] - (function()
return (__f242_m1 * self["impulse3"]["x"])
end)()
)
end)()
;
__f242_v1["y"] = (function()
return (__f242_v1["y"] - (function()
return (__f242_m1 * self["impulse3"]["y"])
end)()
)
end)()
;
__f242_w1 = (function()
return (__f242_w1 - (function()
return (__f242_i1 * __add((function()
return ((function()
return (__f242_r1X * self["impulse3"]["y"])
end)()
 - (function()
return (__f242_r1Y * self["impulse3"]["x"])
end)()
)
end)()
, self["impulse3"]["z"]))
end)()
)
end)()
;
__f242_v2["x"] = __add(__f242_v2["x"], (function()
return (__f242_m2 * self["impulse3"]["x"])
end)()
);
__f242_v2["y"] = __add(__f242_v2["y"], (function()
return (__f242_m2 * self["impulse3"]["y"])
end)()
);
__f242_w2 = __add(__f242_w2, (function()
return (__f242_i2 * __add((function()
return ((function()
return (__f242_r2X * self["impulse3"]["y"])
end)()
 - (function()
return (__f242_r2Y * self["impulse3"]["x"])
end)()
)
end)()
, self["impulse3"]["z"]))
end)()
)
return __f242_w2
end)()

else return (function()
__f242_tMat = __f242_bA["m_xf"]["R"];
__f242_r1X = (function()
return (self["m_localAnchor1"]["x"] - __f242_bA["m_sweep"]["localCenter"]["x"])
end)()
;
__f242_r1Y = (function()
return (self["m_localAnchor1"]["y"] - __f242_bA["m_sweep"]["localCenter"]["y"])
end)()
;
__f242_tX = __add((function()
return (__f242_tMat["col1"]["x"] * __f242_r1X)
end)()
, (function()
return (__f242_tMat["col2"]["x"] * __f242_r1Y)
end)()
);
__f242_r1Y = __add((function()
return (__f242_tMat["col1"]["y"] * __f242_r1X)
end)()
, (function()
return (__f242_tMat["col2"]["y"] * __f242_r1Y)
end)()
);
__f242_r1X = __f242_tX;
__f242_tMat = __f242_bB["m_xf"]["R"];
__f242_r2X = (function()
return (self["m_localAnchor2"]["x"] - __f242_bB["m_sweep"]["localCenter"]["x"])
end)()
;
__f242_r2Y = (function()
return (self["m_localAnchor2"]["y"] - __f242_bB["m_sweep"]["localCenter"]["y"])
end)()
;
__f242_tX = __add((function()
return (__f242_tMat["col1"]["x"] * __f242_r2X)
end)()
, (function()
return (__f242_tMat["col2"]["x"] * __f242_r2Y)
end)()
);
__f242_r2Y = __add((function()
return (__f242_tMat["col1"]["y"] * __f242_r2X)
end)()
, (function()
return (__f242_tMat["col2"]["y"] * __f242_r2Y)
end)()
);
__f242_r2X = __f242_tX;
local __f242_CdotX = (function()
return ((function()
return (__add(__f242_v2["x"], (function()
return ((function()
return (-__f242_w2)
end)()
 * __f242_r2Y)
end)()
) - __f242_v1["x"])
end)()
 - (function()
return ((function()
return (-__f242_w1)
end)()
 * __f242_r1Y)
end)()
)
end)()
;
local __f242_CdotY = (function()
return ((function()
return (__add(__f242_v2["y"], (function()
return (__f242_w2 * __f242_r2X)
end)()
) - __f242_v1["y"])
end)()
 - (function()
return (__f242_w1 * __f242_r1X)
end)()
)
end)()
;
self["m_mass"]["Solve22"](self["m_mass"], self["impulse2"], (function()
return (-__f242_CdotX)
end)()
, (function()
return (-__f242_CdotY)
end)()
);
self["m_impulse"]["x"] = __add(self["m_impulse"]["x"], self["impulse2"]["x"]);
self["m_impulse"]["y"] = __add(self["m_impulse"]["y"], self["impulse2"]["y"]);
__f242_v1["x"] = (function()
return (__f242_v1["x"] - (function()
return (__f242_m1 * self["impulse2"]["x"])
end)()
)
end)()
;
__f242_v1["y"] = (function()
return (__f242_v1["y"] - (function()
return (__f242_m1 * self["impulse2"]["y"])
end)()
)
end)()
;
__f242_w1 = (function()
return (__f242_w1 - (function()
return (__f242_i1 * (function()
return ((function()
return (__f242_r1X * self["impulse2"]["y"])
end)()
 - (function()
return (__f242_r1Y * self["impulse2"]["x"])
end)()
)
end)()
)
end)()
)
end)()
;
__f242_v2["x"] = __add(__f242_v2["x"], (function()
return (__f242_m2 * self["impulse2"]["x"])
end)()
);
__f242_v2["y"] = __add(__f242_v2["y"], (function()
return (__f242_m2 * self["impulse2"]["y"])
end)()
);
__f242_w2 = __add(__f242_w2, (function()
return (__f242_i2 * (function()
return ((function()
return (__f242_r2X * self["impulse2"]["y"])
end)()
 - (function()
return (__f242_r2Y * self["impulse2"]["x"])
end)()
)
end)()
)
end)()
)
return __f242_w2
end)()

end
end)()
;
__f242_bA["m_linearVelocity"]["SetV"](__f242_bA["m_linearVelocity"], __f242_v1);
__f242_bA["m_angularVelocity"] = __f242_w1;
__f242_bB["m_linearVelocity"]["SetV"](__f242_bB["m_linearVelocity"], __f242_v2);
__f242_bB["m_angularVelocity"] = __f242_w2
return __f242_bB["m_angularVelocity"]
end;
__proto_b2RevoluteJoint["SolvePositionConstraints"] = function(self, __f243_baumgarte)
(function()
local __oak_cond = __truthy((function()
return __oak_eq(__f243_baumgarte, nil)
end)()
)
if __oak_eq(__oak_cond, true) then __f243_baumgarte = 0
return __f243_baumgarte
else return __noop()
end
end)()
;
local __f243_oldLimitImpulse = 0;
local __f243_C = 0;
local __f243_tMat = __noop();
local __f243_bA = self["m_bodyA"];
local __f243_bB = self["m_bodyB"];
local __f243_angularError = 0;
local __f243_positionError = 0;
local __f243_tX = 0;
local __f243_impulseX = 0;
local __f243_impulseY = 0;
(function()
local __oak_cond = __truthy(__and(self["m_enableLimit"], (function()
return (not __oak_eq(self["m_limitState"], __static_b2Joint["e_inactiveLimit"]))
end)()
))
if __oak_eq(__oak_cond, true) then return (function()
local __f243_angle = (function()
return ((function()
return (__f243_bB["m_sweep"]["a"] - __f243_bA["m_sweep"]["a"])
end)()
 - self["m_referenceAngle"])
end)()
;
local __f243_limitImpulse = 0;
(function()
local __oak_cond = __truthy((function()
return __oak_eq(self["m_limitState"], __static_b2Joint["e_equalLimits"])
end)()
)
if __oak_eq(__oak_cond, true) then return (function()
__f243_C = __static_b2Math["Clamp"]((function()
return (__f243_angle - self["m_lowerAngle"])
end)()
, (function()
return (-__static_b2Settings["b2_maxAngularCorrection"])
end)()
, __static_b2Settings["b2_maxAngularCorrection"]);
__f243_limitImpulse = (function()
return ((function()
return (-self["m_motorMass"])
end)()
 * __f243_C)
end)()
;
__f243_angularError = __static_b2Math["Abs"](__f243_C)
return __f243_angularError
end)()

else return (function()
local __oak_cond = __truthy((function()
return __oak_eq(self["m_limitState"], __static_b2Joint["e_atLowerLimit"])
end)()
)
if __oak_eq(__oak_cond, true) then return (function()
__f243_C = (function()
return (__f243_angle - self["m_lowerAngle"])
end)()
;
__f243_angularError = (function()
return (-__f243_C)
end)()
;
__f243_C = __static_b2Math["Clamp"](__add(__f243_C, __static_b2Settings["b2_angularSlop"]), (function()
return (-__static_b2Settings["b2_maxAngularCorrection"])
end)()
, 0);
__f243_limitImpulse = (function()
return ((function()
return (-self["m_motorMass"])
end)()
 * __f243_C)
end)()

return __f243_limitImpulse
end)()

else return (function()
local __oak_cond = __truthy((function()
return __oak_eq(self["m_limitState"], __static_b2Joint["e_atUpperLimit"])
end)()
)
if __oak_eq(__oak_cond, true) then return (function()
__f243_C = (function()
return (__f243_angle - self["m_upperAngle"])
end)()
;
__f243_angularError = __f243_C;
__f243_C = __static_b2Math["Clamp"]((function()
return (__f243_C - __static_b2Settings["b2_angularSlop"])
end)()
, 0, __static_b2Settings["b2_maxAngularCorrection"]);
__f243_limitImpulse = (function()
return ((function()
return (-self["m_motorMass"])
end)()
 * __f243_C)
end)()

return __f243_limitImpulse
end)()

else return __noop()
end
end)()

end
end)()

end
end)()
;
__f243_bA["m_sweep"]["a"] = (function()
return (__f243_bA["m_sweep"]["a"] - (function()
return (__f243_bA["m_invI"] * __f243_limitImpulse)
end)()
)
end)()
;
__f243_bB["m_sweep"]["a"] = __add(__f243_bB["m_sweep"]["a"], (function()
return (__f243_bB["m_invI"] * __f243_limitImpulse)
end)()
);
__f243_bA["SynchronizeTransform"](__f243_bA);
return __f243_bB["SynchronizeTransform"](__f243_bB)
end)()

else return __noop()
end
end)()
;
(function()
__f243_tMat = __f243_bA["m_xf"]["R"];
local __f243_r1X = (function()
return (self["m_localAnchor1"]["x"] - __f243_bA["m_sweep"]["localCenter"]["x"])
end)()
;
local __f243_r1Y = (function()
return (self["m_localAnchor1"]["y"] - __f243_bA["m_sweep"]["localCenter"]["y"])
end)()
;
__f243_tX = __add((function()
return (__f243_tMat["col1"]["x"] * __f243_r1X)
end)()
, (function()
return (__f243_tMat["col2"]["x"] * __f243_r1Y)
end)()
);
__f243_r1Y = __add((function()
return (__f243_tMat["col1"]["y"] * __f243_r1X)
end)()
, (function()
return (__f243_tMat["col2"]["y"] * __f243_r1Y)
end)()
);
__f243_r1X = __f243_tX;
__f243_tMat = __f243_bB["m_xf"]["R"];
local __f243_r2X = (function()
return (self["m_localAnchor2"]["x"] - __f243_bB["m_sweep"]["localCenter"]["x"])
end)()
;
local __f243_r2Y = (function()
return (self["m_localAnchor2"]["y"] - __f243_bB["m_sweep"]["localCenter"]["y"])
end)()
;
__f243_tX = __add((function()
return (__f243_tMat["col1"]["x"] * __f243_r2X)
end)()
, (function()
return (__f243_tMat["col2"]["x"] * __f243_r2Y)
end)()
);
__f243_r2Y = __add((function()
return (__f243_tMat["col1"]["y"] * __f243_r2X)
end)()
, (function()
return (__f243_tMat["col2"]["y"] * __f243_r2Y)
end)()
);
__f243_r2X = __f243_tX;
local __f243_CX = (function()
return ((function()
return (__add(__f243_bB["m_sweep"]["c"]["x"], __f243_r2X) - __f243_bA["m_sweep"]["c"]["x"])
end)()
 - __f243_r1X)
end)()
;
local __f243_CY = (function()
return ((function()
return (__add(__f243_bB["m_sweep"]["c"]["y"], __f243_r2Y) - __f243_bA["m_sweep"]["c"]["y"])
end)()
 - __f243_r1Y)
end)()
;
local __f243_CLengthSquared = __add((function()
return (__f243_CX * __f243_CX)
end)()
, (function()
return (__f243_CY * __f243_CY)
end)()
);
local __f243_CLength = __Math["sqrt"](__f243_CLengthSquared);
__f243_positionError = __f243_CLength;
local __f243_invMass1 = __f243_bA["m_invMass"];
local __f243_invMass2 = __f243_bB["m_invMass"];
local __f243_invI1 = __f243_bA["m_invI"];
local __f243_invI2 = __f243_bB["m_invI"];
local __f243_k_allowedStretch = (function()
return (10 * __static_b2Settings["b2_linearSlop"])
end)()
;
(function()
local __oak_cond = __truthy((function()
return (__f243_CLengthSquared > (function()
return (__f243_k_allowedStretch * __f243_k_allowedStretch)
end)()
)
end)()
)
if __oak_eq(__oak_cond, true) then return (function()
local __f243_uX = (function()
return (__f243_CX / __f243_CLength)
end)()
;
local __f243_uY = (function()
return (__f243_CY / __f243_CLength)
end)()
;
local __f243_k = __add(__f243_invMass1, __f243_invMass2);
local __f243_m = (function()
return (1 / __f243_k)
end)()
;
__f243_impulseX = (function()
return (__f243_m * (function()
return (-__f243_CX)
end)()
)
end)()
;
__f243_impulseY = (function()
return (__f243_m * (function()
return (-__f243_CY)
end)()
)
end)()
;
local __f243_k_beta = 0.5;
__f243_bA["m_sweep"]["c"]["x"] = (function()
return (__f243_bA["m_sweep"]["c"]["x"] - (function()
return ((function()
return (__f243_k_beta * __f243_invMass1)
end)()
 * __f243_impulseX)
end)()
)
end)()
;
__f243_bA["m_sweep"]["c"]["y"] = (function()
return (__f243_bA["m_sweep"]["c"]["y"] - (function()
return ((function()
return (__f243_k_beta * __f243_invMass1)
end)()
 * __f243_impulseY)
end)()
)
end)()
;
__f243_bB["m_sweep"]["c"]["x"] = __add(__f243_bB["m_sweep"]["c"]["x"], (function()
return ((function()
return (__f243_k_beta * __f243_invMass2)
end)()
 * __f243_impulseX)
end)()
);
__f243_bB["m_sweep"]["c"]["y"] = __add(__f243_bB["m_sweep"]["c"]["y"], (function()
return ((function()
return (__f243_k_beta * __f243_invMass2)
end)()
 * __f243_impulseY)
end)()
);
__f243_CX = (function()
return ((function()
return (__add(__f243_bB["m_sweep"]["c"]["x"], __f243_r2X) - __f243_bA["m_sweep"]["c"]["x"])
end)()
 - __f243_r1X)
end)()
;
__f243_CY = (function()
return ((function()
return (__add(__f243_bB["m_sweep"]["c"]["y"], __f243_r2Y) - __f243_bA["m_sweep"]["c"]["y"])
end)()
 - __f243_r1Y)
end)()

return __f243_CY
end)()

else return __noop()
end
end)()
;
self["K1"]["col1"]["x"] = __add(__f243_invMass1, __f243_invMass2);
self["K1"]["col2"]["x"] = 0;
self["K1"]["col1"]["y"] = 0;
self["K1"]["col2"]["y"] = __add(__f243_invMass1, __f243_invMass2);
self["K2"]["col1"]["x"] = (function()
return ((function()
return (__f243_invI1 * __f243_r1Y)
end)()
 * __f243_r1Y)
end)()
;
self["K2"]["col2"]["x"] = (function()
return ((function()
return ((function()
return (-__f243_invI1)
end)()
 * __f243_r1X)
end)()
 * __f243_r1Y)
end)()
;
self["K2"]["col1"]["y"] = (function()
return ((function()
return ((function()
return (-__f243_invI1)
end)()
 * __f243_r1X)
end)()
 * __f243_r1Y)
end)()
;
self["K2"]["col2"]["y"] = (function()
return ((function()
return (__f243_invI1 * __f243_r1X)
end)()
 * __f243_r1X)
end)()
;
self["K3"]["col1"]["x"] = (function()
return ((function()
return (__f243_invI2 * __f243_r2Y)
end)()
 * __f243_r2Y)
end)()
;
self["K3"]["col2"]["x"] = (function()
return ((function()
return ((function()
return (-__f243_invI2)
end)()
 * __f243_r2X)
end)()
 * __f243_r2Y)
end)()
;
self["K3"]["col1"]["y"] = (function()
return ((function()
return ((function()
return (-__f243_invI2)
end)()
 * __f243_r2X)
end)()
 * __f243_r2Y)
end)()
;
self["K3"]["col2"]["y"] = (function()
return ((function()
return (__f243_invI2 * __f243_r2X)
end)()
 * __f243_r2X)
end)()
;
self["K"]["SetM"](self["K"], self["K1"]);
self["K"]["AddM"](self["K"], self["K2"]);
self["K"]["AddM"](self["K"], self["K3"]);
self["K"]["Solve"](self["K"], __static_b2RevoluteJoint["tImpulse"], (function()
return (-__f243_CX)
end)()
, (function()
return (-__f243_CY)
end)()
);
__f243_impulseX = __static_b2RevoluteJoint["tImpulse"]["x"];
__f243_impulseY = __static_b2RevoluteJoint["tImpulse"]["y"];
__f243_bA["m_sweep"]["c"]["x"] = (function()
return (__f243_bA["m_sweep"]["c"]["x"] - (function()
return (__f243_bA["m_invMass"] * __f243_impulseX)
end)()
)
end)()
;
__f243_bA["m_sweep"]["c"]["y"] = (function()
return (__f243_bA["m_sweep"]["c"]["y"] - (function()
return (__f243_bA["m_invMass"] * __f243_impulseY)
end)()
)
end)()
;
__f243_bA["m_sweep"]["a"] = (function()
return (__f243_bA["m_sweep"]["a"] - (function()
return (__f243_bA["m_invI"] * (function()
return ((function()
return (__f243_r1X * __f243_impulseY)
end)()
 - (function()
return (__f243_r1Y * __f243_impulseX)
end)()
)
end)()
)
end)()
)
end)()
;
__f243_bB["m_sweep"]["c"]["x"] = __add(__f243_bB["m_sweep"]["c"]["x"], (function()
return (__f243_bB["m_invMass"] * __f243_impulseX)
end)()
);
__f243_bB["m_sweep"]["c"]["y"] = __add(__f243_bB["m_sweep"]["c"]["y"], (function()
return (__f243_bB["m_invMass"] * __f243_impulseY)
end)()
);
__f243_bB["m_sweep"]["a"] = __add(__f243_bB["m_sweep"]["a"], (function()
return (__f243_bB["m_invI"] * (function()
return ((function()
return (__f243_r2X * __f243_impulseY)
end)()
 - (function()
return (__f243_r2Y * __f243_impulseX)
end)()
)
end)()
)
end)()
);
__f243_bA["SynchronizeTransform"](__f243_bA);
return __f243_bB["SynchronizeTransform"](__f243_bB)
end)()
;
return __and((function()
return (__f243_positionError <= __static_b2Settings["b2_linearSlop"])
end)()
, (function()
return (__f243_angularError <= __static_b2Settings["b2_angularSlop"])
end)()
)
end;
__static_b2RevoluteJoint = {};
b2RevoluteJoint = function()
local self = b2Joint();
self["__type"] = 'b2RevoluteJoint';
self["__types"] = {'b2RevoluteJoint', 'b2Joint'};
self["__super"] = __proto_b2Joint;
self["GetAnchorA"] = __proto_b2RevoluteJoint["GetAnchorA"];
self["GetAnchorB"] = __proto_b2RevoluteJoint["GetAnchorB"];
self["GetReactionForce"] = __proto_b2RevoluteJoint["GetReactionForce"];
self["GetReactionTorque"] = __proto_b2RevoluteJoint["GetReactionTorque"];
self["GetJointAngle"] = __proto_b2RevoluteJoint["GetJointAngle"];
self["GetJointSpeed"] = __proto_b2RevoluteJoint["GetJointSpeed"];
self["IsLimitEnabled"] = __proto_b2RevoluteJoint["IsLimitEnabled"];
self["EnableLimit"] = __proto_b2RevoluteJoint["EnableLimit"];
self["GetLowerLimit"] = __proto_b2RevoluteJoint["GetLowerLimit"];
self["GetUpperLimit"] = __proto_b2RevoluteJoint["GetUpperLimit"];
self["SetLimits"] = __proto_b2RevoluteJoint["SetLimits"];
self["IsMotorEnabled"] = __proto_b2RevoluteJoint["IsMotorEnabled"];
self["EnableMotor"] = __proto_b2RevoluteJoint["EnableMotor"];
self["SetMotorSpeed"] = __proto_b2RevoluteJoint["SetMotorSpeed"];
self["GetMotorSpeed"] = __proto_b2RevoluteJoint["GetMotorSpeed"];
self["SetMaxMotorTorque"] = __proto_b2RevoluteJoint["SetMaxMotorTorque"];
self["GetMotorTorque"] = __proto_b2RevoluteJoint["GetMotorTorque"];
self["InitVelocityConstraints"] = __proto_b2RevoluteJoint["InitVelocityConstraints"];
self["SolveVelocityConstraints"] = __proto_b2RevoluteJoint["SolveVelocityConstraints"];
self["SolvePositionConstraints"] = __proto_b2RevoluteJoint["SolvePositionConstraints"];
(function()
Box2D["Dynamics"]["Joints"]["b2Joint"]["b2Joint"](self);
self["K"] = b2Mat22();
self["K1"] = b2Mat22();
self["K2"] = b2Mat22();
self["K3"] = b2Mat22();
self["impulse3"] = b2Vec3();
self["impulse2"] = b2Vec2();
self["reduced"] = b2Vec2();
self["m_localAnchor1"] = b2Vec2();
self["m_localAnchor2"] = b2Vec2();
self["m_impulse"] = b2Vec3();
self["m_mass"] = b2Mat33();
self["__super"]["b2Joint"](self, def);
self["m_localAnchor1"]["SetV"](self["m_localAnchor1"], def["localAnchorA"]);
self["m_localAnchor2"]["SetV"](self["m_localAnchor2"], def["localAnchorB"]);
self["m_referenceAngle"] = def["referenceAngle"];
self["m_impulse"]["SetZero"](self["m_impulse"]);
self["m_motorImpulse"] = 0;
self["m_lowerAngle"] = def["lowerAngle"];
self["m_upperAngle"] = def["upperAngle"];
self["m_maxMotorTorque"] = def["maxMotorTorque"];
self["m_motorSpeed"] = def["motorSpeed"];
self["m_enableLimit"] = def["enableLimit"];
self["m_enableMotor"] = def["enableMotor"];
self["m_limitState"] = __static_b2Joint["e_inactiveLimit"]
return self["m_limitState"]
end)()
;
return self
end;
Box2D["Dynamics"]["Joints"]["b2RevoluteJoint"] = b2RevoluteJoint;
__proto_b2RevoluteJointDef = {};
__proto_b2RevoluteJointDef["Initialize"] = function(self, __f245_bA, __f245_bB, __f245_anchor)
self["bodyA"] = __f245_bA;
self["bodyB"] = __f245_bB;
self["localAnchorA"] = self["bodyA"]["GetLocalPoint"](self["bodyA"], __f245_anchor);
self["localAnchorB"] = self["bodyB"]["GetLocalPoint"](self["bodyB"], __f245_anchor);
self["referenceAngle"] = (function()
return (self["bodyB"]["GetAngle"](self["bodyB"]) - self["bodyA"]["GetAngle"](self["bodyA"]))
end)()

return self["referenceAngle"]
end;
__static_b2RevoluteJointDef = {};
b2RevoluteJointDef = function()
local self = b2JointDef();
self["__type"] = 'b2RevoluteJointDef';
self["__types"] = {'b2RevoluteJointDef', 'b2JointDef'};
self["__super"] = __proto_b2JointDef;
self["Initialize"] = __proto_b2RevoluteJointDef["Initialize"];
(function()
Box2D["Dynamics"]["Joints"]["b2JointDef"]["b2JointDef"](self);
self["localAnchorA"] = b2Vec2();
self["localAnchorB"] = b2Vec2();
self["__super"]["b2JointDef"](self);
self["type"] = __static_b2Joint["e_revoluteJoint"];
self["localAnchorA"]["Set"](self["localAnchorA"], 0, 0);
self["localAnchorB"]["Set"](self["localAnchorB"], 0, 0);
self["referenceAngle"] = 0;
self["lowerAngle"] = 0;
self["upperAngle"] = 0;
self["maxMotorTorque"] = 0;
self["motorSpeed"] = 0;
self["enableLimit"] = false;
self["enableMotor"] = false
return self["enableMotor"]
end)()
;
return self
end;
Box2D["Dynamics"]["Joints"]["b2RevoluteJointDef"] = b2RevoluteJointDef;
__proto_b2WeldJoint = {};
__proto_b2WeldJoint["GetAnchorA"] = function(self)
return self["m_bodyA"]["GetWorldPoint"](self["m_bodyA"], self["m_localAnchorA"])
end;
__proto_b2WeldJoint["GetAnchorB"] = function(self)
return self["m_bodyB"]["GetWorldPoint"](self["m_bodyB"], self["m_localAnchorB"])
end;
__proto_b2WeldJoint["GetReactionForce"] = function(self, __f249_inv_dt)
(function()
local __oak_cond = __truthy((function()
return __oak_eq(__f249_inv_dt, nil)
end)()
)
if __oak_eq(__oak_cond, true) then __f249_inv_dt = 0
return __f249_inv_dt
else return __noop()
end
end)()
;
return b2Vec2((function()
return (__f249_inv_dt * self["m_impulse"]["x"])
end)()
, (function()
return (__f249_inv_dt * self["m_impulse"]["y"])
end)()
)
end;
__proto_b2WeldJoint["GetReactionTorque"] = function(self, __f250_inv_dt)
(function()
local __oak_cond = __truthy((function()
return __oak_eq(__f250_inv_dt, nil)
end)()
)
if __oak_eq(__oak_cond, true) then __f250_inv_dt = 0
return __f250_inv_dt
else return __noop()
end
end)()
;
return (function()
return (__f250_inv_dt * self["m_impulse"]["z"])
end)()

end;
__proto_b2WeldJoint["InitVelocityConstraints"] = function(self, __f251_step)
local __f251_tMat = __noop();
local __f251_tX = 0;
local __f251_bA = self["m_bodyA"];
local __f251_bB = self["m_bodyB"];
__f251_tMat = __f251_bA["m_xf"]["R"];
local __f251_rAX = (function()
return (self["m_localAnchorA"]["x"] - __f251_bA["m_sweep"]["localCenter"]["x"])
end)()
;
local __f251_rAY = (function()
return (self["m_localAnchorA"]["y"] - __f251_bA["m_sweep"]["localCenter"]["y"])
end)()
;
__f251_tX = __add((function()
return (__f251_tMat["col1"]["x"] * __f251_rAX)
end)()
, (function()
return (__f251_tMat["col2"]["x"] * __f251_rAY)
end)()
);
__f251_rAY = __add((function()
return (__f251_tMat["col1"]["y"] * __f251_rAX)
end)()
, (function()
return (__f251_tMat["col2"]["y"] * __f251_rAY)
end)()
);
__f251_rAX = __f251_tX;
__f251_tMat = __f251_bB["m_xf"]["R"];
local __f251_rBX = (function()
return (self["m_localAnchorB"]["x"] - __f251_bB["m_sweep"]["localCenter"]["x"])
end)()
;
local __f251_rBY = (function()
return (self["m_localAnchorB"]["y"] - __f251_bB["m_sweep"]["localCenter"]["y"])
end)()
;
__f251_tX = __add((function()
return (__f251_tMat["col1"]["x"] * __f251_rBX)
end)()
, (function()
return (__f251_tMat["col2"]["x"] * __f251_rBY)
end)()
);
__f251_rBY = __add((function()
return (__f251_tMat["col1"]["y"] * __f251_rBX)
end)()
, (function()
return (__f251_tMat["col2"]["y"] * __f251_rBY)
end)()
);
__f251_rBX = __f251_tX;
local __f251_mA = __f251_bA["m_invMass"];
local __f251_mB = __f251_bB["m_invMass"];
local __f251_iA = __f251_bA["m_invI"];
local __f251_iB = __f251_bB["m_invI"];
self["m_mass"]["col1"]["x"] = __add(__add(__add(__f251_mA, __f251_mB), (function()
return ((function()
return (__f251_rAY * __f251_rAY)
end)()
 * __f251_iA)
end)()
), (function()
return ((function()
return (__f251_rBY * __f251_rBY)
end)()
 * __f251_iB)
end)()
);
self["m_mass"]["col2"]["x"] = (function()
return ((function()
return ((function()
return ((function()
return (-__f251_rAY)
end)()
 * __f251_rAX)
end)()
 * __f251_iA)
end)()
 - (function()
return ((function()
return (__f251_rBY * __f251_rBX)
end)()
 * __f251_iB)
end)()
)
end)()
;
self["m_mass"]["col3"]["x"] = (function()
return ((function()
return ((function()
return (-__f251_rAY)
end)()
 * __f251_iA)
end)()
 - (function()
return (__f251_rBY * __f251_iB)
end)()
)
end)()
;
self["m_mass"]["col1"]["y"] = self["m_mass"]["col2"]["x"];
self["m_mass"]["col2"]["y"] = __add(__add(__add(__f251_mA, __f251_mB), (function()
return ((function()
return (__f251_rAX * __f251_rAX)
end)()
 * __f251_iA)
end)()
), (function()
return ((function()
return (__f251_rBX * __f251_rBX)
end)()
 * __f251_iB)
end)()
);
self["m_mass"]["col3"]["y"] = __add((function()
return (__f251_rAX * __f251_iA)
end)()
, (function()
return (__f251_rBX * __f251_iB)
end)()
);
self["m_mass"]["col1"]["z"] = self["m_mass"]["col3"]["x"];
self["m_mass"]["col2"]["z"] = self["m_mass"]["col3"]["y"];
self["m_mass"]["col3"]["z"] = __add(__f251_iA, __f251_iB);
return (function()
local __oak_cond = __truthy(__f251_step["warmStarting"])
if __oak_eq(__oak_cond, true) then return (function()
self["m_impulse"]["x"] = (function()
return (self["m_impulse"]["x"] * __f251_step["dtRatio"])
end)()
;
self["m_impulse"]["y"] = (function()
return (self["m_impulse"]["y"] * __f251_step["dtRatio"])
end)()
;
self["m_impulse"]["z"] = (function()
return (self["m_impulse"]["z"] * __f251_step["dtRatio"])
end)()
;
__f251_bA["m_linearVelocity"]["x"] = (function()
return (__f251_bA["m_linearVelocity"]["x"] - (function()
return (__f251_mA * self["m_impulse"]["x"])
end)()
)
end)()
;
__f251_bA["m_linearVelocity"]["y"] = (function()
return (__f251_bA["m_linearVelocity"]["y"] - (function()
return (__f251_mA * self["m_impulse"]["y"])
end)()
)
end)()
;
__f251_bA["m_angularVelocity"] = (function()
return (__f251_bA["m_angularVelocity"] - (function()
return (__f251_iA * __add((function()
return ((function()
return (__f251_rAX * self["m_impulse"]["y"])
end)()
 - (function()
return (__f251_rAY * self["m_impulse"]["x"])
end)()
)
end)()
, self["m_impulse"]["z"]))
end)()
)
end)()
;
__f251_bB["m_linearVelocity"]["x"] = __add(__f251_bB["m_linearVelocity"]["x"], (function()
return (__f251_mB * self["m_impulse"]["x"])
end)()
);
__f251_bB["m_linearVelocity"]["y"] = __add(__f251_bB["m_linearVelocity"]["y"], (function()
return (__f251_mB * self["m_impulse"]["y"])
end)()
);
__f251_bB["m_angularVelocity"] = __add(__f251_bB["m_angularVelocity"], (function()
return (__f251_iB * __add((function()
return ((function()
return (__f251_rBX * self["m_impulse"]["y"])
end)()
 - (function()
return (__f251_rBY * self["m_impulse"]["x"])
end)()
)
end)()
, self["m_impulse"]["z"]))
end)()
)
return __f251_bB["m_angularVelocity"]
end)()

else return self["m_impulse"]["SetZero"](self["m_impulse"])
end
end)()

end;
__proto_b2WeldJoint["SolveVelocityConstraints"] = function(self, __f252_step)
local __f252_tMat = __noop();
local __f252_tX = 0;
local __f252_bA = self["m_bodyA"];
local __f252_bB = self["m_bodyB"];
local __f252_vA = __f252_bA["m_linearVelocity"];
local __f252_wA = __f252_bA["m_angularVelocity"];
local __f252_vB = __f252_bB["m_linearVelocity"];
local __f252_wB = __f252_bB["m_angularVelocity"];
local __f252_mA = __f252_bA["m_invMass"];
local __f252_mB = __f252_bB["m_invMass"];
local __f252_iA = __f252_bA["m_invI"];
local __f252_iB = __f252_bB["m_invI"];
__f252_tMat = __f252_bA["m_xf"]["R"];
local __f252_rAX = (function()
return (self["m_localAnchorA"]["x"] - __f252_bA["m_sweep"]["localCenter"]["x"])
end)()
;
local __f252_rAY = (function()
return (self["m_localAnchorA"]["y"] - __f252_bA["m_sweep"]["localCenter"]["y"])
end)()
;
__f252_tX = __add((function()
return (__f252_tMat["col1"]["x"] * __f252_rAX)
end)()
, (function()
return (__f252_tMat["col2"]["x"] * __f252_rAY)
end)()
);
__f252_rAY = __add((function()
return (__f252_tMat["col1"]["y"] * __f252_rAX)
end)()
, (function()
return (__f252_tMat["col2"]["y"] * __f252_rAY)
end)()
);
__f252_rAX = __f252_tX;
__f252_tMat = __f252_bB["m_xf"]["R"];
local __f252_rBX = (function()
return (self["m_localAnchorB"]["x"] - __f252_bB["m_sweep"]["localCenter"]["x"])
end)()
;
local __f252_rBY = (function()
return (self["m_localAnchorB"]["y"] - __f252_bB["m_sweep"]["localCenter"]["y"])
end)()
;
__f252_tX = __add((function()
return (__f252_tMat["col1"]["x"] * __f252_rBX)
end)()
, (function()
return (__f252_tMat["col2"]["x"] * __f252_rBY)
end)()
);
__f252_rBY = __add((function()
return (__f252_tMat["col1"]["y"] * __f252_rBX)
end)()
, (function()
return (__f252_tMat["col2"]["y"] * __f252_rBY)
end)()
);
__f252_rBX = __f252_tX;
local __f252_Cdot1X = __add((function()
return ((function()
return (__f252_vB["x"] - (function()
return (__f252_wB * __f252_rBY)
end)()
)
end)()
 - __f252_vA["x"])
end)()
, (function()
return (__f252_wA * __f252_rAY)
end)()
);
local __f252_Cdot1Y = (function()
return ((function()
return (__add(__f252_vB["y"], (function()
return (__f252_wB * __f252_rBX)
end)()
) - __f252_vA["y"])
end)()
 - (function()
return (__f252_wA * __f252_rAX)
end)()
)
end)()
;
local __f252_Cdot2 = (function()
return (__f252_wB - __f252_wA)
end)()
;
local __f252_impulse = b2Vec3();
self["m_mass"]["Solve33"](self["m_mass"], __f252_impulse, (function()
return (-__f252_Cdot1X)
end)()
, (function()
return (-__f252_Cdot1Y)
end)()
, (function()
return (-__f252_Cdot2)
end)()
);
self["m_impulse"]["Add"](self["m_impulse"], __f252_impulse);
__f252_vA["x"] = (function()
return (__f252_vA["x"] - (function()
return (__f252_mA * __f252_impulse["x"])
end)()
)
end)()
;
__f252_vA["y"] = (function()
return (__f252_vA["y"] - (function()
return (__f252_mA * __f252_impulse["y"])
end)()
)
end)()
;
__f252_wA = (function()
return (__f252_wA - (function()
return (__f252_iA * __add((function()
return ((function()
return (__f252_rAX * __f252_impulse["y"])
end)()
 - (function()
return (__f252_rAY * __f252_impulse["x"])
end)()
)
end)()
, __f252_impulse["z"]))
end)()
)
end)()
;
__f252_vB["x"] = __add(__f252_vB["x"], (function()
return (__f252_mB * __f252_impulse["x"])
end)()
);
__f252_vB["y"] = __add(__f252_vB["y"], (function()
return (__f252_mB * __f252_impulse["y"])
end)()
);
__f252_wB = __add(__f252_wB, (function()
return (__f252_iB * __add((function()
return ((function()
return (__f252_rBX * __f252_impulse["y"])
end)()
 - (function()
return (__f252_rBY * __f252_impulse["x"])
end)()
)
end)()
, __f252_impulse["z"]))
end)()
);
__f252_bA["m_angularVelocity"] = __f252_wA;
__f252_bB["m_angularVelocity"] = __f252_wB
return __f252_bB["m_angularVelocity"]
end;
__proto_b2WeldJoint["SolvePositionConstraints"] = function(self, __f253_baumgarte)
(function()
local __oak_cond = __truthy((function()
return __oak_eq(__f253_baumgarte, nil)
end)()
)
if __oak_eq(__oak_cond, true) then __f253_baumgarte = 0
return __f253_baumgarte
else return __noop()
end
end)()
;
local __f253_tMat = __noop();
local __f253_tX = 0;
local __f253_bA = self["m_bodyA"];
local __f253_bB = self["m_bodyB"];
__f253_tMat = __f253_bA["m_xf"]["R"];
local __f253_rAX = (function()
return (self["m_localAnchorA"]["x"] - __f253_bA["m_sweep"]["localCenter"]["x"])
end)()
;
local __f253_rAY = (function()
return (self["m_localAnchorA"]["y"] - __f253_bA["m_sweep"]["localCenter"]["y"])
end)()
;
__f253_tX = __add((function()
return (__f253_tMat["col1"]["x"] * __f253_rAX)
end)()
, (function()
return (__f253_tMat["col2"]["x"] * __f253_rAY)
end)()
);
__f253_rAY = __add((function()
return (__f253_tMat["col1"]["y"] * __f253_rAX)
end)()
, (function()
return (__f253_tMat["col2"]["y"] * __f253_rAY)
end)()
);
__f253_rAX = __f253_tX;
__f253_tMat = __f253_bB["m_xf"]["R"];
local __f253_rBX = (function()
return (self["m_localAnchorB"]["x"] - __f253_bB["m_sweep"]["localCenter"]["x"])
end)()
;
local __f253_rBY = (function()
return (self["m_localAnchorB"]["y"] - __f253_bB["m_sweep"]["localCenter"]["y"])
end)()
;
__f253_tX = __add((function()
return (__f253_tMat["col1"]["x"] * __f253_rBX)
end)()
, (function()
return (__f253_tMat["col2"]["x"] * __f253_rBY)
end)()
);
__f253_rBY = __add((function()
return (__f253_tMat["col1"]["y"] * __f253_rBX)
end)()
, (function()
return (__f253_tMat["col2"]["y"] * __f253_rBY)
end)()
);
__f253_rBX = __f253_tX;
local __f253_mA = __f253_bA["m_invMass"];
local __f253_mB = __f253_bB["m_invMass"];
local __f253_iA = __f253_bA["m_invI"];
local __f253_iB = __f253_bB["m_invI"];
local __f253_C1X = (function()
return ((function()
return (__add(__f253_bB["m_sweep"]["c"]["x"], __f253_rBX) - __f253_bA["m_sweep"]["c"]["x"])
end)()
 - __f253_rAX)
end)()
;
local __f253_C1Y = (function()
return ((function()
return (__add(__f253_bB["m_sweep"]["c"]["y"], __f253_rBY) - __f253_bA["m_sweep"]["c"]["y"])
end)()
 - __f253_rAY)
end)()
;
local __f253_C2 = (function()
return ((function()
return (__f253_bB["m_sweep"]["a"] - __f253_bA["m_sweep"]["a"])
end)()
 - self["m_referenceAngle"])
end)()
;
local __f253_k_allowedStretch = (function()
return (10 * __static_b2Settings["b2_linearSlop"])
end)()
;
local __f253_positionError = __Math["sqrt"](__add((function()
return (__f253_C1X * __f253_C1X)
end)()
, (function()
return (__f253_C1Y * __f253_C1Y)
end)()
));
local __f253_angularError = __static_b2Math["Abs"](__f253_C2);
(function()
local __oak_cond = __truthy((function()
return (__f253_positionError > __f253_k_allowedStretch)
end)()
)
if __oak_eq(__oak_cond, true) then return (function()
__f253_iA = (function()
return (__f253_iA * 1)
end)()
;
__f253_iB = (function()
return (__f253_iB * 1)
end)()

return __f253_iB
end)()

else return __noop()
end
end)()
;
self["m_mass"]["col1"]["x"] = __add(__add(__add(__f253_mA, __f253_mB), (function()
return ((function()
return (__f253_rAY * __f253_rAY)
end)()
 * __f253_iA)
end)()
), (function()
return ((function()
return (__f253_rBY * __f253_rBY)
end)()
 * __f253_iB)
end)()
);
self["m_mass"]["col2"]["x"] = (function()
return ((function()
return ((function()
return ((function()
return (-__f253_rAY)
end)()
 * __f253_rAX)
end)()
 * __f253_iA)
end)()
 - (function()
return ((function()
return (__f253_rBY * __f253_rBX)
end)()
 * __f253_iB)
end)()
)
end)()
;
self["m_mass"]["col3"]["x"] = (function()
return ((function()
return ((function()
return (-__f253_rAY)
end)()
 * __f253_iA)
end)()
 - (function()
return (__f253_rBY * __f253_iB)
end)()
)
end)()
;
self["m_mass"]["col1"]["y"] = self["m_mass"]["col2"]["x"];
self["m_mass"]["col2"]["y"] = __add(__add(__add(__f253_mA, __f253_mB), (function()
return ((function()
return (__f253_rAX * __f253_rAX)
end)()
 * __f253_iA)
end)()
), (function()
return ((function()
return (__f253_rBX * __f253_rBX)
end)()
 * __f253_iB)
end)()
);
self["m_mass"]["col3"]["y"] = __add((function()
return (__f253_rAX * __f253_iA)
end)()
, (function()
return (__f253_rBX * __f253_iB)
end)()
);
self["m_mass"]["col1"]["z"] = self["m_mass"]["col3"]["x"];
self["m_mass"]["col2"]["z"] = self["m_mass"]["col3"]["y"];
self["m_mass"]["col3"]["z"] = __add(__f253_iA, __f253_iB);
local __f253_impulse = b2Vec3();
self["m_mass"]["Solve33"](self["m_mass"], __f253_impulse, (function()
return (-__f253_C1X)
end)()
, (function()
return (-__f253_C1Y)
end)()
, (function()
return (-__f253_C2)
end)()
);
__f253_bA["m_sweep"]["c"]["x"] = (function()
return (__f253_bA["m_sweep"]["c"]["x"] - (function()
return (__f253_mA * __f253_impulse["x"])
end)()
)
end)()
;
__f253_bA["m_sweep"]["c"]["y"] = (function()
return (__f253_bA["m_sweep"]["c"]["y"] - (function()
return (__f253_mA * __f253_impulse["y"])
end)()
)
end)()
;
__f253_bA["m_sweep"]["a"] = (function()
return (__f253_bA["m_sweep"]["a"] - (function()
return (__f253_iA * __add((function()
return ((function()
return (__f253_rAX * __f253_impulse["y"])
end)()
 - (function()
return (__f253_rAY * __f253_impulse["x"])
end)()
)
end)()
, __f253_impulse["z"]))
end)()
)
end)()
;
__f253_bB["m_sweep"]["c"]["x"] = __add(__f253_bB["m_sweep"]["c"]["x"], (function()
return (__f253_mB * __f253_impulse["x"])
end)()
);
__f253_bB["m_sweep"]["c"]["y"] = __add(__f253_bB["m_sweep"]["c"]["y"], (function()
return (__f253_mB * __f253_impulse["y"])
end)()
);
__f253_bB["m_sweep"]["a"] = __add(__f253_bB["m_sweep"]["a"], (function()
return (__f253_iB * __add((function()
return ((function()
return (__f253_rBX * __f253_impulse["y"])
end)()
 - (function()
return (__f253_rBY * __f253_impulse["x"])
end)()
)
end)()
, __f253_impulse["z"]))
end)()
);
__f253_bA["SynchronizeTransform"](__f253_bA);
__f253_bB["SynchronizeTransform"](__f253_bB);
return __and((function()
return (__f253_positionError <= __static_b2Settings["b2_linearSlop"])
end)()
, (function()
return (__f253_angularError <= __static_b2Settings["b2_angularSlop"])
end)()
)
end;
__static_b2WeldJoint = {};
b2WeldJoint = function()
local self = b2Joint();
self["__type"] = 'b2WeldJoint';
self["__types"] = {'b2WeldJoint', 'b2Joint'};
self["__super"] = __proto_b2Joint;
self["GetAnchorA"] = __proto_b2WeldJoint["GetAnchorA"];
self["GetAnchorB"] = __proto_b2WeldJoint["GetAnchorB"];
self["GetReactionForce"] = __proto_b2WeldJoint["GetReactionForce"];
self["GetReactionTorque"] = __proto_b2WeldJoint["GetReactionTorque"];
self["InitVelocityConstraints"] = __proto_b2WeldJoint["InitVelocityConstraints"];
self["SolveVelocityConstraints"] = __proto_b2WeldJoint["SolveVelocityConstraints"];
self["SolvePositionConstraints"] = __proto_b2WeldJoint["SolvePositionConstraints"];
(function()
Box2D["Dynamics"]["Joints"]["b2Joint"]["b2Joint"](self);
self["m_localAnchorA"] = b2Vec2();
self["m_localAnchorB"] = b2Vec2();
self["m_impulse"] = b2Vec3();
self["m_mass"] = b2Mat33();
self["__super"]["b2Joint"](self, def);
self["m_localAnchorA"]["SetV"](self["m_localAnchorA"], def["localAnchorA"]);
self["m_localAnchorB"]["SetV"](self["m_localAnchorB"], def["localAnchorB"]);
self["m_referenceAngle"] = def["referenceAngle"];
self["m_impulse"]["SetZero"](self["m_impulse"]);
self["m_mass"] = b2Mat33()
return self["m_mass"]
end)()
;
return self
end;
Box2D["Dynamics"]["Joints"]["b2WeldJoint"] = b2WeldJoint;
__proto_b2WeldJointDef = {};
__proto_b2WeldJointDef["Initialize"] = function(self, __f255_bA, __f255_bB, __f255_anchor)
self["bodyA"] = __f255_bA;
self["bodyB"] = __f255_bB;
self["localAnchorA"]["SetV"](self["localAnchorA"], self["bodyA"]["GetLocalPoint"](self["bodyA"], __f255_anchor));
self["localAnchorB"]["SetV"](self["localAnchorB"], self["bodyB"]["GetLocalPoint"](self["bodyB"], __f255_anchor));
self["referenceAngle"] = (function()
return (self["bodyB"]["GetAngle"](self["bodyB"]) - self["bodyA"]["GetAngle"](self["bodyA"]))
end)()

return self["referenceAngle"]
end;
__static_b2WeldJointDef = {};
b2WeldJointDef = function()
local self = b2JointDef();
self["__type"] = 'b2WeldJointDef';
self["__types"] = {'b2WeldJointDef', 'b2JointDef'};
self["__super"] = __proto_b2JointDef;
self["Initialize"] = __proto_b2WeldJointDef["Initialize"];
(function()
Box2D["Dynamics"]["Joints"]["b2JointDef"]["b2JointDef"](self);
self["localAnchorA"] = b2Vec2();
self["localAnchorB"] = b2Vec2();
self["__super"]["b2JointDef"](self);
self["type"] = __static_b2Joint["e_weldJoint"];
self["referenceAngle"] = 0
return self["referenceAngle"]
end)()
;
return self
end;
Box2D["Dynamics"]["Joints"]["b2WeldJointDef"] = b2WeldJointDef;
__proto_b2AABB = {};
__proto_b2AABB["IsValid"] = function(self)
local __f257_dX = (function()
return (self["upperBound"]["x"] - self["lowerBound"]["x"])
end)()
;
local __f257_dY = (function()
return (self["upperBound"]["y"] - self["lowerBound"]["y"])
end)()
;
local __f257_valid = __and((function()
return (__f257_dX >= 0)
end)()
, (function()
return (__f257_dY >= 0)
end)()
);
__f257_valid = __and(__and(__f257_valid, self["lowerBound"]["IsValid"](self["lowerBound"])), self["upperBound"]["IsValid"](self["upperBound"]));
return __f257_valid
end;
__proto_b2AABB["GetCenter"] = function(self)
return b2Vec2((function()
return (__add(self["lowerBound"]["x"], self["upperBound"]["x"]) / 2)
end)()
, (function()
return (__add(self["lowerBound"]["y"], self["upperBound"]["y"]) / 2)
end)()
)
end;
__proto_b2AABB["GetExtents"] = function(self)
return b2Vec2((function()
return ((function()
return (self["upperBound"]["x"] - self["lowerBound"]["x"])
end)()
 / 2)
end)()
, (function()
return ((function()
return (self["upperBound"]["y"] - self["lowerBound"]["y"])
end)()
 / 2)
end)()
)
end;
__proto_b2AABB["Contains"] = function(self, __f260_aabb)
local __f260_result = true;
__f260_result = __and(__f260_result, (function()
return (self["lowerBound"]["x"] <= __f260_aabb["lowerBound"]["x"])
end)()
);
__f260_result = __and(__f260_result, (function()
return (self["lowerBound"]["y"] <= __f260_aabb["lowerBound"]["y"])
end)()
);
__f260_result = __and(__f260_result, (function()
return (__f260_aabb["upperBound"]["x"] <= self["upperBound"]["x"])
end)()
);
__f260_result = __and(__f260_result, (function()
return (__f260_aabb["upperBound"]["y"] <= self["upperBound"]["y"])
end)()
);
return __f260_result
end;
__proto_b2AABB["RayCast"] = function(self, __f261_output, __f261_input)
local __f261_tmin = (function()
return (-__Number["MAX_VALUE"])
end)()
;
local __f261_tmax = __Number["MAX_VALUE"];
local __f261_pX = __f261_input["p1"]["x"];
local __f261_pY = __f261_input["p1"]["y"];
local __f261_dX = (function()
return (__f261_input["p2"]["x"] - __f261_input["p1"]["x"])
end)()
;
local __f261_dY = (function()
return (__f261_input["p2"]["y"] - __f261_input["p1"]["y"])
end)()
;
local __f261_absDX = __Math["abs"](__f261_dX);
local __f261_absDY = __Math["abs"](__f261_dY);
local __f261_normal = __f261_output["normal"];
local __f261_inv_d = 0;
local __f261_t1 = 0;
local __f261_t2 = 0;
local __f261_t3 = 0;
local __f261_s = 0;
(function()
local __oak_cond = __truthy((function()
return (__f261_absDX < __Number["MIN_VALUE"])
end)()
)
if __oak_eq(__oak_cond, true) then return (function()
local __oak_cond = __truthy(__or((function()
return (__f261_pX < self["lowerBound"]["x"])
end)()
, (function()
return (self["upperBound"]["x"] < __f261_pX)
end)()
))
if __oak_eq(__oak_cond, true) then return false
else return __noop()
end
end)()

else return (function()
__f261_inv_d = (function()
return (1 / __f261_dX)
end)()
;
__f261_t1 = (function()
return ((function()
return (self["lowerBound"]["x"] - __f261_pX)
end)()
 * __f261_inv_d)
end)()
;
__f261_t2 = (function()
return ((function()
return (self["upperBound"]["x"] - __f261_pX)
end)()
 * __f261_inv_d)
end)()
;
__f261_s = (function()
return (-1)
end)()
;
(function()
local __oak_cond = __truthy((function()
return (__f261_t1 > __f261_t2)
end)()
)
if __oak_eq(__oak_cond, true) then return (function()
__f261_t3 = __f261_t1;
__f261_t1 = __f261_t2;
__f261_t2 = __f261_t3;
__f261_s = 1
return __f261_s
end)()

else return __noop()
end
end)()
;
(function()
local __oak_cond = __truthy((function()
return (__f261_t1 > __f261_tmin)
end)()
)
if __oak_eq(__oak_cond, true) then return (function()
__f261_normal["x"] = __f261_s;
__f261_normal["y"] = 0;
__f261_tmin = __f261_t1
return __f261_tmin
end)()

else return __noop()
end
end)()
;
__f261_tmax = __Math["min"](__f261_tmax, __f261_t2);
return (function()
local __oak_cond = __truthy((function()
return (__f261_tmin > __f261_tmax)
end)()
)
if __oak_eq(__oak_cond, true) then return false
else return __noop()
end
end)()

end)()

end
end)()
;
(function()
local __oak_cond = __truthy((function()
return (__f261_absDY < __Number["MIN_VALUE"])
end)()
)
if __oak_eq(__oak_cond, true) then return (function()
local __oak_cond = __truthy(__or((function()
return (__f261_pY < self["lowerBound"]["y"])
end)()
, (function()
return (self["upperBound"]["y"] < __f261_pY)
end)()
))
if __oak_eq(__oak_cond, true) then return false
else return __noop()
end
end)()

else return (function()
__f261_inv_d = (function()
return (1 / __f261_dY)
end)()
;
__f261_t1 = (function()
return ((function()
return (self["lowerBound"]["y"] - __f261_pY)
end)()
 * __f261_inv_d)
end)()
;
__f261_t2 = (function()
return ((function()
return (self["upperBound"]["y"] - __f261_pY)
end)()
 * __f261_inv_d)
end)()
;
__f261_s = (function()
return (-1)
end)()
;
(function()
local __oak_cond = __truthy((function()
return (__f261_t1 > __f261_t2)
end)()
)
if __oak_eq(__oak_cond, true) then return (function()
__f261_t3 = __f261_t1;
__f261_t1 = __f261_t2;
__f261_t2 = __f261_t3;
__f261_s = 1
return __f261_s
end)()

else return __noop()
end
end)()
;
(function()
local __oak_cond = __truthy((function()
return (__f261_t1 > __f261_tmin)
end)()
)
if __oak_eq(__oak_cond, true) then return (function()
__f261_normal["y"] = __f261_s;
__f261_normal["x"] = 0;
__f261_tmin = __f261_t1
return __f261_tmin
end)()

else return __noop()
end
end)()
;
__f261_tmax = __Math["min"](__f261_tmax, __f261_t2);
return (function()
local __oak_cond = __truthy((function()
return (__f261_tmin > __f261_tmax)
end)()
)
if __oak_eq(__oak_cond, true) then return false
else return __noop()
end
end)()

end)()

end
end)()
;
__f261_output["fraction"] = __f261_tmin;
return true
end;
__proto_b2AABB["TestOverlap"] = function(self, __f262_other)
local __f262_d1X = (function()
return (__f262_other["lowerBound"]["x"] - self["upperBound"]["x"])
end)()
;
local __f262_d1Y = (function()
return (__f262_other["lowerBound"]["y"] - self["upperBound"]["y"])
end)()
;
local __f262_d2X = (function()
return (self["lowerBound"]["x"] - __f262_other["upperBound"]["x"])
end)()
;
local __f262_d2Y = (function()
return (self["lowerBound"]["y"] - __f262_other["upperBound"]["y"])
end)()
;
(function()
local __oak_cond = __truthy(__or((function()
return (__f262_d1X > 0)
end)()
, (function()
return (__f262_d1Y > 0)
end)()
))
if __oak_eq(__oak_cond, true) then return false
else return __noop()
end
end)()
;
(function()
local __oak_cond = __truthy(__or((function()
return (__f262_d2X > 0)
end)()
, (function()
return (__f262_d2Y > 0)
end)()
))
if __oak_eq(__oak_cond, true) then return false
else return __noop()
end
end)()
;
return true
end;
__proto_b2AABB["Combine"] = function(self, __f263_aabb1, __f263_aabb2)
self["lowerBound"]["x"] = __Math["min"](__f263_aabb1["lowerBound"]["x"], __f263_aabb2["lowerBound"]["x"]);
self["lowerBound"]["y"] = __Math["min"](__f263_aabb1["lowerBound"]["y"], __f263_aabb2["lowerBound"]["y"]);
self["upperBound"]["x"] = __Math["max"](__f263_aabb1["upperBound"]["x"], __f263_aabb2["upperBound"]["x"]);
self["upperBound"]["y"] = __Math["max"](__f263_aabb1["upperBound"]["y"], __f263_aabb2["upperBound"]["y"])
return self["upperBound"]["y"]
end;
__static_b2AABB = {};
b2AABB = function()
local self = {["__type"]='b2AABB', ["__types"]={'b2AABB'}};
self["IsValid"] = __proto_b2AABB["IsValid"];
self["GetCenter"] = __proto_b2AABB["GetCenter"];
self["GetExtents"] = __proto_b2AABB["GetExtents"];
self["Contains"] = __proto_b2AABB["Contains"];
self["RayCast"] = __proto_b2AABB["RayCast"];
self["TestOverlap"] = __proto_b2AABB["TestOverlap"];
self["Combine"] = __proto_b2AABB["Combine"];
(function()
self["lowerBound"] = b2Vec2();
self["upperBound"] = b2Vec2()
return self["upperBound"]
end)()
;
return self
end;
Box2D["Collision"]["b2AABB"] = b2AABB;
__proto_b2Bound = {};
__proto_b2Bound["IsLower"] = function(self)
return __oak_eq(__band(self["value"], 1), 0)
end;
__proto_b2Bound["IsUpper"] = function(self)
return __oak_eq(__band(self["value"], 1), 1)
end;
__proto_b2Bound["Swap"] = function(self, __f267_b)
local __f267_tempValue = self["value"];
local __f267_tempProxy = self["proxy"];
local __f267_tempStabbingCount = self["stabbingCount"];
self["value"] = __f267_b["value"];
self["proxy"] = __f267_b["proxy"];
self["stabbingCount"] = __f267_b["stabbingCount"];
__f267_b["value"] = __f267_tempValue;
__f267_b["proxy"] = __f267_tempProxy;
__f267_b["stabbingCount"] = __f267_tempStabbingCount
return __f267_b["stabbingCount"]
end;
__static_b2Bound = {};
b2Bound = function()
local self = {["__type"]='b2Bound', ["__types"]={'b2Bound'}};
self["IsLower"] = __proto_b2Bound["IsLower"];
self["IsUpper"] = __proto_b2Bound["IsUpper"];
self["Swap"] = __proto_b2Bound["Swap"];
return self
end;
Box2D["Collision"]["b2Bound"] = b2Bound;
__static_b2Collision = {};
__static_b2Collision["ClipSegmentToLine"] = function(__f268_vOut, __f268_vIn, __f268_normal, __f268_offset)
(function()
local __oak_cond = __truthy((function()
return __oak_eq(__f268_offset, nil)
end)()
)
if __oak_eq(__oak_cond, true) then __f268_offset = 0
return __f268_offset
else return __noop()
end
end)()
;
local __f268_cv = __noop();
local __f268_numOut = 0;
__f268_cv = __oak_acc(__f268_vIn, (function()
return 0
end)()
);
local __f268_vIn0 = __f268_cv["v"];
__f268_cv = __oak_acc(__f268_vIn, (function()
return 1
end)()
);
local __f268_vIn1 = __f268_cv["v"];
local __f268_distance0 = (function()
return (__add((function()
return (__f268_normal["x"] * __f268_vIn0["x"])
end)()
, (function()
return (__f268_normal["y"] * __f268_vIn0["y"])
end)()
) - __f268_offset)
end)()
;
local __f268_distance1 = (function()
return (__add((function()
return (__f268_normal["x"] * __f268_vIn1["x"])
end)()
, (function()
return (__f268_normal["y"] * __f268_vIn1["y"])
end)()
) - __f268_offset)
end)()
;
(function()
local __oak_cond = __truthy((function()
return (__f268_distance0 <= 0)
end)()
)
if __oak_eq(__oak_cond, true) then return __oak_acc(__f268_vOut, (function()
return (function()
local __tmp268_47 = __f268_numOut;
__f268_numOut = __as_oak_string(__f268_numOut + 1);
return __tmp268_47
end)()

end)()
)["Set"](__oak_acc(__f268_vOut, (function()
return (function()
local __tmp268_48 = __f268_numOut;
__f268_numOut = __as_oak_string(__f268_numOut + 1);
return __tmp268_48
end)()

end)()
), __oak_acc(__f268_vIn, (function()
return 0
end)()
))
else return __noop()
end
end)()
;
(function()
local __oak_cond = __truthy((function()
return (__f268_distance1 <= 0)
end)()
)
if __oak_eq(__oak_cond, true) then return __oak_acc(__f268_vOut, (function()
return (function()
local __tmp268_50 = __f268_numOut;
__f268_numOut = __as_oak_string(__f268_numOut + 1);
return __tmp268_50
end)()

end)()
)["Set"](__oak_acc(__f268_vOut, (function()
return (function()
local __tmp268_51 = __f268_numOut;
__f268_numOut = __as_oak_string(__f268_numOut + 1);
return __tmp268_51
end)()

end)()
), __oak_acc(__f268_vIn, (function()
return 1
end)()
))
else return __noop()
end
end)()
;
(function()
local __oak_cond = __truthy((function()
return ((function()
return (__f268_distance0 * __f268_distance1)
end)()
 < 0)
end)()
)
if __oak_eq(__oak_cond, true) then return (function()
local __f268_interp = (function()
return (__f268_distance0 / (function()
return (__f268_distance0 - __f268_distance1)
end)()
)
end)()
;
__f268_cv = __oak_acc(__f268_vOut, (function()
return __f268_numOut
end)()
);
local __f268_tVec = __f268_cv["v"];
__f268_tVec["x"] = __add(__f268_vIn0["x"], (function()
return (__f268_interp * (function()
return (__f268_vIn1["x"] - __f268_vIn0["x"])
end)()
)
end)()
);
__f268_tVec["y"] = __add(__f268_vIn0["y"], (function()
return (__f268_interp * (function()
return (__f268_vIn1["y"] - __f268_vIn0["y"])
end)()
)
end)()
);
__f268_cv = __oak_acc(__f268_vOut, (function()
return __f268_numOut
end)()
);
local __f268_cv2 = __noop();
(function()
local __oak_cond = __truthy((function()
return (__f268_distance0 > 0)
end)()
)
if __oak_eq(__oak_cond, true) then return (function()
__f268_cv2 = __oak_acc(__f268_vIn, (function()
return 0
end)()
);
__f268_cv["id"] = __f268_cv2["id"]
return __f268_cv["id"]
end)()

else return (function()
__f268_cv2 = __oak_acc(__f268_vIn, (function()
return 1
end)()
);
__f268_cv["id"] = __f268_cv2["id"]
return __f268_cv["id"]
end)()

end
end)()
;
return (function()
__f268_numOut = __as_oak_string(__f268_numOut + 1)
return __f268_numOut
end)()

end)()

else return __noop()
end
end)()
;
return __f268_numOut
end;
__static_b2Collision["EdgeSeparation"] = function(__f269_poly1, __f269_xf1, __f269_edge1, __f269_poly2, __f269_xf2)
(function()
local __oak_cond = __truthy((function()
return __oak_eq(__f269_edge1, nil)
end)()
)
if __oak_eq(__oak_cond, true) then __f269_edge1 = 0
return __f269_edge1
else return __noop()
end
end)()
;
local __f269_count1 = __parseInt(__f269_poly1["m_vertexCount"]);
local __f269_vertices1 = __f269_poly1["m_vertices"];
local __f269_normals1 = __f269_poly1["m_normals"];
local __f269_count2 = __parseInt(__f269_poly2["m_vertexCount"]);
local __f269_vertices2 = __f269_poly2["m_vertices"];
local __f269_tMat = __noop();
local __f269_tVec = __noop();
__f269_tMat = __f269_xf1["R"];
__f269_tVec = __oak_acc(__f269_normals1, (function()
return __f269_edge1
end)()
);
local __f269_normal1WorldX = __add((function()
return (__f269_tMat["col1"]["x"] * __f269_tVec["x"])
end)()
, (function()
return (__f269_tMat["col2"]["x"] * __f269_tVec["y"])
end)()
);
local __f269_normal1WorldY = __add((function()
return (__f269_tMat["col1"]["y"] * __f269_tVec["x"])
end)()
, (function()
return (__f269_tMat["col2"]["y"] * __f269_tVec["y"])
end)()
);
__f269_tMat = __f269_xf2["R"];
local __f269_normal1X = __add((function()
return (__f269_tMat["col1"]["x"] * __f269_normal1WorldX)
end)()
, (function()
return (__f269_tMat["col1"]["y"] * __f269_normal1WorldY)
end)()
);
local __f269_normal1Y = __add((function()
return (__f269_tMat["col2"]["x"] * __f269_normal1WorldX)
end)()
, (function()
return (__f269_tMat["col2"]["y"] * __f269_normal1WorldY)
end)()
);
local __f269_index = 0;
local __f269_minDot = __Number["MAX_VALUE"];
(function()
local __f269_i = 0;
local function __loop53()
return (function()
local __oak_cond = (function()
return (__f269_i < __f269_count2)
end)()

if __oak_eq(__oak_cond, true) then return (function()
local __r = (function()
return (function()
__f269_tVec = __oak_acc(__f269_vertices2, (function()
return __f269_i
end)()
);
local __f269_dot = __add((function()
return (__f269_tVec["x"] * __f269_normal1X)
end)()
, (function()
return (__f269_tVec["y"] * __f269_normal1Y)
end)()
);
return (function()
local __oak_cond = __truthy((function()
return (__f269_dot < __f269_minDot)
end)()
)
if __oak_eq(__oak_cond, true) then return (function()
__f269_minDot = __f269_dot;
__f269_index = __f269_i
return __f269_index
end)()

else return __noop()
end
end)()

end)()

end)()
;
return (function()
local __oak_cond = __r
if __oak_eq(__oak_cond, 'break') then return nil
else return (function()
(function()
__f269_i = __as_oak_string(__f269_i + 1)
return __f269_i
end)()
;
return __loop53()
end)()

end
end)()

end)()

else return nil
end
end)()

end;
return __loop53()
end)()
;
__f269_tVec = __oak_acc(__f269_vertices1, (function()
return __f269_edge1
end)()
);
__f269_tMat = __f269_xf1["R"];
local __f269_v1X = __add(__f269_xf1["position"]["x"], __add((function()
return (__f269_tMat["col1"]["x"] * __f269_tVec["x"])
end)()
, (function()
return (__f269_tMat["col2"]["x"] * __f269_tVec["y"])
end)()
));
local __f269_v1Y = __add(__f269_xf1["position"]["y"], __add((function()
return (__f269_tMat["col1"]["y"] * __f269_tVec["x"])
end)()
, (function()
return (__f269_tMat["col2"]["y"] * __f269_tVec["y"])
end)()
));
__f269_tVec = __oak_acc(__f269_vertices2, (function()
return __f269_index
end)()
);
__f269_tMat = __f269_xf2["R"];
local __f269_v2X = __add(__f269_xf2["position"]["x"], __add((function()
return (__f269_tMat["col1"]["x"] * __f269_tVec["x"])
end)()
, (function()
return (__f269_tMat["col2"]["x"] * __f269_tVec["y"])
end)()
));
local __f269_v2Y = __add(__f269_xf2["position"]["y"], __add((function()
return (__f269_tMat["col1"]["y"] * __f269_tVec["x"])
end)()
, (function()
return (__f269_tMat["col2"]["y"] * __f269_tVec["y"])
end)()
));
__f269_v2X = (function()
return (__f269_v2X - __f269_v1X)
end)()
;
__f269_v2Y = (function()
return (__f269_v2Y - __f269_v1Y)
end)()
;
local __f269_separation = __add((function()
return (__f269_v2X * __f269_normal1WorldX)
end)()
, (function()
return (__f269_v2Y * __f269_normal1WorldY)
end)()
);
return __f269_separation
end;
__static_b2Collision["FindMaxSeparation"] = function(__f270_edgeIndex, __f270_poly1, __f270_xf1, __f270_poly2, __f270_xf2)
local __f270_count1 = __parseInt(__f270_poly1["m_vertexCount"]);
local __f270_normals1 = __f270_poly1["m_normals"];
local __f270_tVec = __noop();
local __f270_tMat = __noop();
__f270_tMat = __f270_xf2["R"];
__f270_tVec = __f270_poly2["m_centroid"];
local __f270_dX = __add(__f270_xf2["position"]["x"], __add((function()
return (__f270_tMat["col1"]["x"] * __f270_tVec["x"])
end)()
, (function()
return (__f270_tMat["col2"]["x"] * __f270_tVec["y"])
end)()
));
local __f270_dY = __add(__f270_xf2["position"]["y"], __add((function()
return (__f270_tMat["col1"]["y"] * __f270_tVec["x"])
end)()
, (function()
return (__f270_tMat["col2"]["y"] * __f270_tVec["y"])
end)()
));
__f270_tMat = __f270_xf1["R"];
__f270_tVec = __f270_poly1["m_centroid"];
__f270_dX = (function()
return (__f270_dX - __add(__f270_xf1["position"]["x"], __add((function()
return (__f270_tMat["col1"]["x"] * __f270_tVec["x"])
end)()
, (function()
return (__f270_tMat["col2"]["x"] * __f270_tVec["y"])
end)()
)))
end)()
;
__f270_dY = (function()
return (__f270_dY - __add(__f270_xf1["position"]["y"], __add((function()
return (__f270_tMat["col1"]["y"] * __f270_tVec["x"])
end)()
, (function()
return (__f270_tMat["col2"]["y"] * __f270_tVec["y"])
end)()
)))
end)()
;
local __f270_dLocal1X = __add((function()
return (__f270_dX * __f270_xf1["R"]["col1"]["x"])
end)()
, (function()
return (__f270_dY * __f270_xf1["R"]["col1"]["y"])
end)()
);
local __f270_dLocal1Y = __add((function()
return (__f270_dX * __f270_xf1["R"]["col2"]["x"])
end)()
, (function()
return (__f270_dY * __f270_xf1["R"]["col2"]["y"])
end)()
);
local __f270_edge = 0;
local __f270_maxDot = (function()
return (-__Number["MAX_VALUE"])
end)()
;
(function()
local __f270_i = 0;
local function __loop55()
return (function()
local __oak_cond = (function()
return (__f270_i < __f270_count1)
end)()

if __oak_eq(__oak_cond, true) then return (function()
local __r = (function()
return (function()
__f270_tVec = __oak_acc(__f270_normals1, (function()
return __f270_i
end)()
);
local __f270_dot = __add((function()
return (__f270_tVec["x"] * __f270_dLocal1X)
end)()
, (function()
return (__f270_tVec["y"] * __f270_dLocal1Y)
end)()
);
return (function()
local __oak_cond = __truthy((function()
return (__f270_dot > __f270_maxDot)
end)()
)
if __oak_eq(__oak_cond, true) then return (function()
__f270_maxDot = __f270_dot;
__f270_edge = __f270_i
return __f270_edge
end)()

else return __noop()
end
end)()

end)()

end)()
;
return (function()
local __oak_cond = __r
if __oak_eq(__oak_cond, 'break') then return nil
else return (function()
(function()
__f270_i = __as_oak_string(__f270_i + 1)
return __f270_i
end)()
;
return __loop55()
end)()

end
end)()

end)()

else return nil
end
end)()

end;
return __loop55()
end)()
;
local __f270_s = __static_b2Collision["EdgeSeparation"](__f270_poly1, __f270_xf1, __f270_edge, __f270_poly2, __f270_xf2);
local __f270_prevEdge = __parseInt((function()
local __oak_cond = __truthy((function()
return ((function()
return (__f270_edge - 1)
end)()
 >= 0)
end)()
)
if __oak_eq(__oak_cond, true) then return (function()
return (__f270_edge - 1)
end)()

else return (function()
return (__f270_count1 - 1)
end)()

end
end)()
);
local __f270_sPrev = __static_b2Collision["EdgeSeparation"](__f270_poly1, __f270_xf1, __f270_prevEdge, __f270_poly2, __f270_xf2);
local __f270_nextEdge = __parseInt((function()
local __oak_cond = __truthy((function()
return (__add(__f270_edge, 1) < __f270_count1)
end)()
)
if __oak_eq(__oak_cond, true) then return __add(__f270_edge, 1)
else return 0
end
end)()
);
local __f270_sNext = __static_b2Collision["EdgeSeparation"](__f270_poly1, __f270_xf1, __f270_nextEdge, __f270_poly2, __f270_xf2);
local __f270_bestEdge = 0;
local __f270_bestSeparation = 0;
local __f270_increment = 0;
(function()
local __oak_cond = __truthy(__and((function()
return (__f270_sPrev > __f270_s)
end)()
, (function()
return (__f270_sPrev > __f270_sNext)
end)()
))
if __oak_eq(__oak_cond, true) then return (function()
__f270_increment = (function()
return (-1)
end)()
;
__f270_bestEdge = __f270_prevEdge;
__f270_bestSeparation = __f270_sPrev
return __f270_bestSeparation
end)()

else return (function()
local __oak_cond = __truthy((function()
return (__f270_sNext > __f270_s)
end)()
)
if __oak_eq(__oak_cond, true) then return (function()
__f270_increment = 1;
__f270_bestEdge = __f270_nextEdge;
__f270_bestSeparation = __f270_sNext
return __f270_bestSeparation
end)()

else return (function()
__f270_edgeIndex[__add(0, 1)] = __f270_edge;
return __f270_s
end)()

end
end)()

end
end)()
;
(function()
local function __loop57()
return (function()
local __oak_cond = true
if __oak_eq(__oak_cond, true) then return (function()
local __r = (function()
return (function()
(function()
local __oak_cond = __truthy((function()
return __oak_eq(__f270_increment, (function()
return (-1)
end)()
)
end)()
)
if __oak_eq(__oak_cond, true) then __f270_edge = (function()
local __oak_cond = __truthy((function()
return ((function()
return (__f270_bestEdge - 1)
end)()
 >= 0)
end)()
)
if __oak_eq(__oak_cond, true) then return (function()
return (__f270_bestEdge - 1)
end)()

else return (function()
return (__f270_count1 - 1)
end)()

end
end)()

return __f270_edge
else __f270_edge = (function()
local __oak_cond = __truthy((function()
return (__add(__f270_bestEdge, 1) < __f270_count1)
end)()
)
if __oak_eq(__oak_cond, true) then return __add(__f270_bestEdge, 1)
else return 0
end
end)()

return __f270_edge
end
end)()
;
__f270_s = __static_b2Collision["EdgeSeparation"](__f270_poly1, __f270_xf1, __f270_edge, __f270_poly2, __f270_xf2);
return (function()
local __oak_cond = __truthy((function()
return (__f270_s > __f270_bestSeparation)
end)()
)
if __oak_eq(__oak_cond, true) then return (function()
__f270_bestEdge = __f270_edge;
__f270_bestSeparation = __f270_s
return __f270_bestSeparation
end)()

else return 'break'
end
end)()

end)()

end)()
;
return (function()
local __oak_cond = __r
if __oak_eq(__oak_cond, 'break') then return nil
else return __loop57()
end
end)()

end)()

else return nil
end
end)()

end;
return __loop57()
end)()
;
__f270_edgeIndex[__add(0, 1)] = __f270_bestEdge;
return __f270_bestSeparation
end;
__static_b2Collision["FindIncidentEdge"] = function(__f271_c, __f271_poly1, __f271_xf1, __f271_edge1, __f271_poly2, __f271_xf2)
(function()
local __oak_cond = __truthy((function()
return __oak_eq(__f271_edge1, nil)
end)()
)
if __oak_eq(__oak_cond, true) then __f271_edge1 = 0
return __f271_edge1
else return __noop()
end
end)()
;
local __f271_count1 = __parseInt(__f271_poly1["m_vertexCount"]);
local __f271_normals1 = __f271_poly1["m_normals"];
local __f271_count2 = __parseInt(__f271_poly2["m_vertexCount"]);
local __f271_vertices2 = __f271_poly2["m_vertices"];
local __f271_normals2 = __f271_poly2["m_normals"];
local __f271_tMat = __noop();
local __f271_tVec = __noop();
__f271_tMat = __f271_xf1["R"];
__f271_tVec = __oak_acc(__f271_normals1, (function()
return __f271_edge1
end)()
);
local __f271_normal1X = __add((function()
return (__f271_tMat["col1"]["x"] * __f271_tVec["x"])
end)()
, (function()
return (__f271_tMat["col2"]["x"] * __f271_tVec["y"])
end)()
);
local __f271_normal1Y = __add((function()
return (__f271_tMat["col1"]["y"] * __f271_tVec["x"])
end)()
, (function()
return (__f271_tMat["col2"]["y"] * __f271_tVec["y"])
end)()
);
__f271_tMat = __f271_xf2["R"];
local __f271_tX = __add((function()
return (__f271_tMat["col1"]["x"] * __f271_normal1X)
end)()
, (function()
return (__f271_tMat["col1"]["y"] * __f271_normal1Y)
end)()
);
__f271_normal1Y = __add((function()
return (__f271_tMat["col2"]["x"] * __f271_normal1X)
end)()
, (function()
return (__f271_tMat["col2"]["y"] * __f271_normal1Y)
end)()
);
__f271_normal1X = __f271_tX;
local __f271_index = 0;
local __f271_minDot = __Number["MAX_VALUE"];
(function()
local __f271_i = 0;
local function __loop58()
return (function()
local __oak_cond = (function()
return (__f271_i < __f271_count2)
end)()

if __oak_eq(__oak_cond, true) then return (function()
local __r = (function()
return (function()
__f271_tVec = __oak_acc(__f271_normals2, (function()
return __f271_i
end)()
);
local __f271_dot = __add((function()
return (__f271_normal1X * __f271_tVec["x"])
end)()
, (function()
return (__f271_normal1Y * __f271_tVec["y"])
end)()
);
return (function()
local __oak_cond = __truthy((function()
return (__f271_dot < __f271_minDot)
end)()
)
if __oak_eq(__oak_cond, true) then return (function()
__f271_minDot = __f271_dot;
__f271_index = __f271_i
return __f271_index
end)()

else return __noop()
end
end)()

end)()

end)()
;
return (function()
local __oak_cond = __r
if __oak_eq(__oak_cond, 'break') then return nil
else return (function()
(function()
__f271_i = __as_oak_string(__f271_i + 1)
return __f271_i
end)()
;
return __loop58()
end)()

end
end)()

end)()

else return nil
end
end)()

end;
return __loop58()
end)()
;
local __f271_tClip = __noop();
local __f271_i1 = __parseInt(__f271_index);
local __f271_i2 = __parseInt((function()
local __oak_cond = __truthy((function()
return (__add(__f271_i1, 1) < __f271_count2)
end)()
)
if __oak_eq(__oak_cond, true) then return __add(__f271_i1, 1)
else return 0
end
end)()
);
__f271_tClip = __oak_acc(__f271_c, (function()
return 0
end)()
);
__f271_tVec = __oak_acc(__f271_vertices2, (function()
return __f271_i1
end)()
);
__f271_tMat = __f271_xf2["R"];
__f271_tClip["v"]["x"] = __add(__f271_xf2["position"]["x"], __add((function()
return (__f271_tMat["col1"]["x"] * __f271_tVec["x"])
end)()
, (function()
return (__f271_tMat["col2"]["x"] * __f271_tVec["y"])
end)()
));
__f271_tClip["v"]["y"] = __add(__f271_xf2["position"]["y"], __add((function()
return (__f271_tMat["col1"]["y"] * __f271_tVec["x"])
end)()
, (function()
return (__f271_tMat["col2"]["y"] * __f271_tVec["y"])
end)()
));
__f271_tClip["id"]["features"]["referenceEdge"] = __f271_edge1;
__f271_tClip["id"]["features"]["incidentEdge"] = __f271_i1;
__f271_tClip["id"]["features"]["incidentVertex"] = 0;
__f271_tClip = __oak_acc(__f271_c, (function()
return 1
end)()
);
__f271_tVec = __oak_acc(__f271_vertices2, (function()
return __f271_i2
end)()
);
__f271_tMat = __f271_xf2["R"];
__f271_tClip["v"]["x"] = __add(__f271_xf2["position"]["x"], __add((function()
return (__f271_tMat["col1"]["x"] * __f271_tVec["x"])
end)()
, (function()
return (__f271_tMat["col2"]["x"] * __f271_tVec["y"])
end)()
));
__f271_tClip["v"]["y"] = __add(__f271_xf2["position"]["y"], __add((function()
return (__f271_tMat["col1"]["y"] * __f271_tVec["x"])
end)()
, (function()
return (__f271_tMat["col2"]["y"] * __f271_tVec["y"])
end)()
));
__f271_tClip["id"]["features"]["referenceEdge"] = __f271_edge1;
__f271_tClip["id"]["features"]["incidentEdge"] = __f271_i2;
__f271_tClip["id"]["features"]["incidentVertex"] = 1
return __f271_tClip["id"]["features"]["incidentVertex"]
end;
__static_b2Collision["MakeClipPointVector"] = function()
local __f272_r = __newArray(2);
__f272_r[__add(0, 1)] = ClipVertex();
__f272_r[__add(1, 1)] = ClipVertex();
return __f272_r
end;
__static_b2Collision["CollidePolygons"] = function(__f273_manifold, __f273_polyA, __f273_xfA, __f273_polyB, __f273_xfB)
local __f273_cv = __noop();
__f273_manifold["m_pointCount"] = 0;
local __f273_totalRadius = __add(__f273_polyA["m_radius"], __f273_polyB["m_radius"]);
local __f273_edgeA = 0;
__static_b2Collision["s_edgeAO"][__add(0, 1)] = __f273_edgeA;
local __f273_separationA = __static_b2Collision["FindMaxSeparation"](__static_b2Collision["s_edgeAO"], __f273_polyA, __f273_xfA, __f273_polyB, __f273_xfB);
__f273_edgeA = __oak_acc(__static_b2Collision["s_edgeAO"], (function()
return 0
end)()
);
return (function()
local __oak_cond = __truthy((function()
return (__f273_separationA > __f273_totalRadius)
end)()
)
if __oak_eq(__oak_cond, true) then return __noop()
else return (function()
local __f273_edgeB = 0;
__static_b2Collision["s_edgeBO"][__add(0, 1)] = __f273_edgeB;
local __f273_separationB = __static_b2Collision["FindMaxSeparation"](__static_b2Collision["s_edgeBO"], __f273_polyB, __f273_xfB, __f273_polyA, __f273_xfA);
__f273_edgeB = __oak_acc(__static_b2Collision["s_edgeBO"], (function()
return 0
end)()
);
return (function()
local __oak_cond = __truthy((function()
return (__f273_separationB > __f273_totalRadius)
end)()
)
if __oak_eq(__oak_cond, true) then return __noop()
else return (function()
local __f273_poly1 = __noop();
local __f273_poly2 = __noop();
local __f273_xf1 = __noop();
local __f273_xf2 = __noop();
local __f273_edge1 = 0;
local __f273_flip = 0;
local __f273_k_relativeTol = 0.98;
local __f273_k_absoluteTol = 0.001;
local __f273_tMat = __noop();
(function()
local __oak_cond = __truthy((function()
return (__f273_separationB > __add((function()
return (__f273_k_relativeTol * __f273_separationA)
end)()
, __f273_k_absoluteTol))
end)()
)
if __oak_eq(__oak_cond, true) then return (function()
__f273_poly1 = __f273_polyB;
__f273_poly2 = __f273_polyA;
__f273_xf1 = __f273_xfB;
__f273_xf2 = __f273_xfA;
__f273_edge1 = __f273_edgeB;
__f273_manifold["m_type"] = __static_b2Manifold["e_faceB"];
__f273_flip = 1
return __f273_flip
end)()

else return (function()
__f273_poly1 = __f273_polyA;
__f273_poly2 = __f273_polyB;
__f273_xf1 = __f273_xfA;
__f273_xf2 = __f273_xfB;
__f273_edge1 = __f273_edgeA;
__f273_manifold["m_type"] = __static_b2Manifold["e_faceA"];
__f273_flip = 0
return __f273_flip
end)()

end
end)()
;
local __f273_incidentEdge = __static_b2Collision["s_incidentEdge"];
__static_b2Collision["FindIncidentEdge"](__f273_incidentEdge, __f273_poly1, __f273_xf1, __f273_edge1, __f273_poly2, __f273_xf2);
local __f273_count1 = __parseInt(__f273_poly1["m_vertexCount"]);
local __f273_vertices1 = __f273_poly1["m_vertices"];
local __f273_local_v11 = __oak_acc(__f273_vertices1, (function()
return __f273_edge1
end)()
);
local __f273_local_v12 = __noop();
(function()
local __oak_cond = __truthy((function()
return (__add(__f273_edge1, 1) < __f273_count1)
end)()
)
if __oak_eq(__oak_cond, true) then __f273_local_v12 = __oak_acc(__f273_vertices1, (function()
return __parseInt(__add(__f273_edge1, 1))
end)()
)
return __f273_local_v12
else __f273_local_v12 = __oak_acc(__f273_vertices1, (function()
return 0
end)()
)
return __f273_local_v12
end
end)()
;
local __f273_localTangent = __static_b2Collision["s_localTangent"];
__f273_localTangent["Set"](__f273_localTangent, (function()
return (__f273_local_v12["x"] - __f273_local_v11["x"])
end)()
, (function()
return (__f273_local_v12["y"] - __f273_local_v11["y"])
end)()
);
__f273_localTangent["Normalize"](__f273_localTangent);
local __f273_localNormal = __static_b2Collision["s_localNormal"];
__f273_localNormal["x"] = __f273_localTangent["y"];
__f273_localNormal["y"] = (function()
return (-__f273_localTangent["x"])
end)()
;
local __f273_planePoint = __static_b2Collision["s_planePoint"];
__f273_planePoint["Set"](__f273_planePoint, (function()
return (0.5 * __add(__f273_local_v11["x"], __f273_local_v12["x"]))
end)()
, (function()
return (0.5 * __add(__f273_local_v11["y"], __f273_local_v12["y"]))
end)()
);
local __f273_tangent = __static_b2Collision["s_tangent"];
__f273_tMat = __f273_xf1["R"];
__f273_tangent["x"] = __add((function()
return (__f273_tMat["col1"]["x"] * __f273_localTangent["x"])
end)()
, (function()
return (__f273_tMat["col2"]["x"] * __f273_localTangent["y"])
end)()
);
__f273_tangent["y"] = __add((function()
return (__f273_tMat["col1"]["y"] * __f273_localTangent["x"])
end)()
, (function()
return (__f273_tMat["col2"]["y"] * __f273_localTangent["y"])
end)()
);
local __f273_tangent2 = __static_b2Collision["s_tangent2"];
__f273_tangent2["x"] = (function()
return (-__f273_tangent["x"])
end)()
;
__f273_tangent2["y"] = (function()
return (-__f273_tangent["y"])
end)()
;
local __f273_normal = __static_b2Collision["s_normal"];
__f273_normal["x"] = __f273_tangent["y"];
__f273_normal["y"] = (function()
return (-__f273_tangent["x"])
end)()
;
local __f273_v11 = __static_b2Collision["s_v11"];
local __f273_v12 = __static_b2Collision["s_v12"];
__f273_v11["x"] = __add(__f273_xf1["position"]["x"], __add((function()
return (__f273_tMat["col1"]["x"] * __f273_local_v11["x"])
end)()
, (function()
return (__f273_tMat["col2"]["x"] * __f273_local_v11["y"])
end)()
));
__f273_v11["y"] = __add(__f273_xf1["position"]["y"], __add((function()
return (__f273_tMat["col1"]["y"] * __f273_local_v11["x"])
end)()
, (function()
return (__f273_tMat["col2"]["y"] * __f273_local_v11["y"])
end)()
));
__f273_v12["x"] = __add(__f273_xf1["position"]["x"], __add((function()
return (__f273_tMat["col1"]["x"] * __f273_local_v12["x"])
end)()
, (function()
return (__f273_tMat["col2"]["x"] * __f273_local_v12["y"])
end)()
));
__f273_v12["y"] = __add(__f273_xf1["position"]["y"], __add((function()
return (__f273_tMat["col1"]["y"] * __f273_local_v12["x"])
end)()
, (function()
return (__f273_tMat["col2"]["y"] * __f273_local_v12["y"])
end)()
));
local __f273_frontOffset = __add((function()
return (__f273_normal["x"] * __f273_v11["x"])
end)()
, (function()
return (__f273_normal["y"] * __f273_v11["y"])
end)()
);
local __f273_sideOffset1 = __add((function()
return ((function()
return ((function()
return (-__f273_tangent["x"])
end)()
 * __f273_v11["x"])
end)()
 - (function()
return (__f273_tangent["y"] * __f273_v11["y"])
end)()
)
end)()
, __f273_totalRadius);
local __f273_sideOffset2 = __add(__add((function()
return (__f273_tangent["x"] * __f273_v12["x"])
end)()
, (function()
return (__f273_tangent["y"] * __f273_v12["y"])
end)()
), __f273_totalRadius);
local __f273_clipPoints1 = __static_b2Collision["s_clipPoints1"];
local __f273_clipPoints2 = __static_b2Collision["s_clipPoints2"];
local __f273_np = 0;
__f273_np = __static_b2Collision["ClipSegmentToLine"](__f273_clipPoints1, __f273_incidentEdge, __f273_tangent2, __f273_sideOffset1);
return (function()
local __oak_cond = __truthy((function()
return (__f273_np < 2)
end)()
)
if __oak_eq(__oak_cond, true) then return __noop()
else return (function()
__f273_np = __static_b2Collision["ClipSegmentToLine"](__f273_clipPoints2, __f273_clipPoints1, __f273_tangent, __f273_sideOffset2);
return (function()
local __oak_cond = __truthy((function()
return (__f273_np < 2)
end)()
)
if __oak_eq(__oak_cond, true) then return __noop()
else return (function()
__f273_manifold["m_localPlaneNormal"]["SetV"](__f273_manifold["m_localPlaneNormal"], __f273_localNormal);
__f273_manifold["m_localPoint"]["SetV"](__f273_manifold["m_localPoint"], __f273_planePoint);
local __f273_pointCount = 0;
(function()
local __f273_i = 0;
local function __loop60()
return (function()
local __oak_cond = (function()
return (__f273_i < __static_b2Settings["b2_maxManifoldPoints"])
end)()

if __oak_eq(__oak_cond, true) then return (function()
local __r = (function()
return (function()
__f273_cv = __oak_acc(__f273_clipPoints2, (function()
return __f273_i
end)()
);
local __f273_separation = (function()
return (__add((function()
return (__f273_normal["x"] * __f273_cv["v"]["x"])
end)()
, (function()
return (__f273_normal["y"] * __f273_cv["v"]["y"])
end)()
) - __f273_frontOffset)
end)()
;
return (function()
local __oak_cond = __truthy((function()
return (__f273_separation <= __f273_totalRadius)
end)()
)
if __oak_eq(__oak_cond, true) then return (function()
local __f273_cp = __oak_acc(__f273_manifold["m_points"], (function()
return __f273_pointCount
end)()
);
__f273_tMat = __f273_xf2["R"];
local __f273_tX = (function()
return (__f273_cv["v"]["x"] - __f273_xf2["position"]["x"])
end)()
;
local __f273_tY = (function()
return (__f273_cv["v"]["y"] - __f273_xf2["position"]["y"])
end)()
;
__f273_cp["m_localPoint"]["x"] = __add((function()
return (__f273_tX * __f273_tMat["col1"]["x"])
end)()
, (function()
return (__f273_tY * __f273_tMat["col1"]["y"])
end)()
);
__f273_cp["m_localPoint"]["y"] = __add((function()
return (__f273_tX * __f273_tMat["col2"]["x"])
end)()
, (function()
return (__f273_tY * __f273_tMat["col2"]["y"])
end)()
);
__f273_cp["m_id"]["Set"](__f273_cp["m_id"], __f273_cv["id"]);
__f273_cp["m_id"]["features"]["flip"] = __f273_flip;
return (function()
__f273_pointCount = __as_oak_string(__f273_pointCount + 1)
return __f273_pointCount
end)()

end)()

else return __noop()
end
end)()

end)()

end)()
;
return (function()
local __oak_cond = __r
if __oak_eq(__oak_cond, 'break') then return nil
else return (function()
(function()
__f273_i = __as_oak_string(__f273_i + 1)
return __f273_i
end)()
;
return __loop60()
end)()

end
end)()

end)()

else return nil
end
end)()

end;
return __loop60()
end)()
;
__f273_manifold["m_pointCount"] = __f273_pointCount
return __f273_manifold["m_pointCount"]
end)()

end
end)()

end)()

end
end)()

end)()

end
end)()

end)()

end
end)()

end;
__static_b2Collision["CollideCircles"] = function(__f274_manifold, __f274_circle1, __f274_xf1, __f274_circle2, __f274_xf2)
__f274_manifold["m_pointCount"] = 0;
local __f274_tMat = __noop();
local __f274_tVec = __noop();
__f274_tMat = __f274_xf1["R"];
__f274_tVec = __f274_circle1["m_p"];
local __f274_p1X = __add(__f274_xf1["position"]["x"], __add((function()
return (__f274_tMat["col1"]["x"] * __f274_tVec["x"])
end)()
, (function()
return (__f274_tMat["col2"]["x"] * __f274_tVec["y"])
end)()
));
local __f274_p1Y = __add(__f274_xf1["position"]["y"], __add((function()
return (__f274_tMat["col1"]["y"] * __f274_tVec["x"])
end)()
, (function()
return (__f274_tMat["col2"]["y"] * __f274_tVec["y"])
end)()
));
__f274_tMat = __f274_xf2["R"];
__f274_tVec = __f274_circle2["m_p"];
local __f274_p2X = __add(__f274_xf2["position"]["x"], __add((function()
return (__f274_tMat["col1"]["x"] * __f274_tVec["x"])
end)()
, (function()
return (__f274_tMat["col2"]["x"] * __f274_tVec["y"])
end)()
));
local __f274_p2Y = __add(__f274_xf2["position"]["y"], __add((function()
return (__f274_tMat["col1"]["y"] * __f274_tVec["x"])
end)()
, (function()
return (__f274_tMat["col2"]["y"] * __f274_tVec["y"])
end)()
));
local __f274_dX = (function()
return (__f274_p2X - __f274_p1X)
end)()
;
local __f274_dY = (function()
return (__f274_p2Y - __f274_p1Y)
end)()
;
local __f274_distSqr = __add((function()
return (__f274_dX * __f274_dX)
end)()
, (function()
return (__f274_dY * __f274_dY)
end)()
);
local __f274_radius = __add(__f274_circle1["m_radius"], __f274_circle2["m_radius"]);
return (function()
local __oak_cond = __truthy((function()
return (__f274_distSqr > (function()
return (__f274_radius * __f274_radius)
end)()
)
end)()
)
if __oak_eq(__oak_cond, true) then return __noop()
else return (function()
__f274_manifold["m_type"] = __static_b2Manifold["e_circles"];
__f274_manifold["m_localPoint"]["SetV"](__f274_manifold["m_localPoint"], __f274_circle1["m_p"]);
__f274_manifold["m_localPlaneNormal"]["SetZero"](__f274_manifold["m_localPlaneNormal"]);
__f274_manifold["m_pointCount"] = 1;
__oak_acc(__f274_manifold["m_points"], (function()
return 0
end)()
)["m_localPoint"]["SetV"](__oak_acc(__f274_manifold["m_points"], (function()
return 0
end)()
)["m_localPoint"], __f274_circle2["m_p"]);
__oak_acc(__f274_manifold["m_points"], (function()
return 0
end)()
)["m_id"]["key"] = 0
return __oak_acc(__f274_manifold["m_points"], (function()
return 0
end)()
)["m_id"]["key"]
end)()

end
end)()

end;
__static_b2Collision["CollidePolygonAndCircle"] = function(__f275_manifold, __f275_polygon, __f275_xf1, __f275_circle, __f275_xf2)
__f275_manifold["m_pointCount"] = 0;
local __f275_tPoint = __noop();
local __f275_dX = 0;
local __f275_dY = 0;
local __f275_positionX = 0;
local __f275_positionY = 0;
local __f275_tVec = __noop();
local __f275_tMat = __noop();
__f275_tMat = __f275_xf2["R"];
__f275_tVec = __f275_circle["m_p"];
local __f275_cX = __add(__f275_xf2["position"]["x"], __add((function()
return (__f275_tMat["col1"]["x"] * __f275_tVec["x"])
end)()
, (function()
return (__f275_tMat["col2"]["x"] * __f275_tVec["y"])
end)()
));
local __f275_cY = __add(__f275_xf2["position"]["y"], __add((function()
return (__f275_tMat["col1"]["y"] * __f275_tVec["x"])
end)()
, (function()
return (__f275_tMat["col2"]["y"] * __f275_tVec["y"])
end)()
));
__f275_dX = (function()
return (__f275_cX - __f275_xf1["position"]["x"])
end)()
;
__f275_dY = (function()
return (__f275_cY - __f275_xf1["position"]["y"])
end)()
;
__f275_tMat = __f275_xf1["R"];
local __f275_cLocalX = __add((function()
return (__f275_dX * __f275_tMat["col1"]["x"])
end)()
, (function()
return (__f275_dY * __f275_tMat["col1"]["y"])
end)()
);
local __f275_cLocalY = __add((function()
return (__f275_dX * __f275_tMat["col2"]["x"])
end)()
, (function()
return (__f275_dY * __f275_tMat["col2"]["y"])
end)()
);
local __f275_dist = 0;
local __f275_normalIndex = 0;
local __f275_separation = (function()
return (-__Number["MAX_VALUE"])
end)()
;
local __f275_radius = __add(__f275_polygon["m_radius"], __f275_circle["m_radius"]);
local __f275_vertexCount = __parseInt(__f275_polygon["m_vertexCount"]);
local __f275_vertices = __f275_polygon["m_vertices"];
local __f275_normals = __f275_polygon["m_normals"];
return (function()
(function()
local __f275_i = 0;
local function __loop63()
return (function()
local __oak_cond = (function()
return (__f275_i < __f275_vertexCount)
end)()

if __oak_eq(__oak_cond, true) then return (function()
local __r = (function()
return (function()
__f275_tVec = __oak_acc(__f275_vertices, (function()
return __f275_i
end)()
);
__f275_dX = (function()
return (__f275_cLocalX - __f275_tVec["x"])
end)()
;
__f275_dY = (function()
return (__f275_cLocalY - __f275_tVec["y"])
end)()
;
__f275_tVec = __oak_acc(__f275_normals, (function()
return __f275_i
end)()
);
local __f275_s = __add((function()
return (__f275_tVec["x"] * __f275_dX)
end)()
, (function()
return (__f275_tVec["y"] * __f275_dY)
end)()
);
return (function()
local __oak_cond = __truthy((function()
return (__f275_s > __f275_radius)
end)()
)
if __oak_eq(__oak_cond, true) then return __noop()
else return (function()
local __oak_cond = __truthy((function()
return (__f275_s > __f275_separation)
end)()
)
if __oak_eq(__oak_cond, true) then return (function()
__f275_separation = __f275_s;
__f275_normalIndex = __f275_i
return __f275_normalIndex
end)()

else return __noop()
end
end)()

end
end)()

end)()

end)()
;
return (function()
local __oak_cond = __r
if __oak_eq(__oak_cond, 'break') then return nil
else return (function()
(function()
__f275_i = __as_oak_string(__f275_i + 1)
return __f275_i
end)()
;
return __loop63()
end)()

end
end)()

end)()

else return nil
end
end)()

end;
return __loop63()
end)()
;
local __f275_vertIndex1 = __parseInt(__f275_normalIndex);
local __f275_vertIndex2 = __parseInt((function()
local __oak_cond = __truthy((function()
return (__add(__f275_vertIndex1, 1) < __f275_vertexCount)
end)()
)
if __oak_eq(__oak_cond, true) then return __add(__f275_vertIndex1, 1)
else return 0
end
end)()
);
local __f275_v1 = __oak_acc(__f275_vertices, (function()
return __f275_vertIndex1
end)()
);
local __f275_v2 = __oak_acc(__f275_vertices, (function()
return __f275_vertIndex2
end)()
);
(function()
local __oak_cond = __truthy((function()
return (__f275_separation < __Number["MIN_VALUE"])
end)()
)
if __oak_eq(__oak_cond, true) then return (function()
__f275_manifold["m_pointCount"] = 1;
__f275_manifold["m_type"] = __static_b2Manifold["e_faceA"];
__f275_manifold["m_localPlaneNormal"]["SetV"](__f275_manifold["m_localPlaneNormal"], __oak_acc(__f275_normals, (function()
return __f275_normalIndex
end)()
));
__f275_manifold["m_localPoint"]["x"] = (function()
return (0.5 * __add(__f275_v1["x"], __f275_v2["x"]))
end)()
;
__f275_manifold["m_localPoint"]["y"] = (function()
return (0.5 * __add(__f275_v1["y"], __f275_v2["y"]))
end)()
;
__oak_acc(__f275_manifold["m_points"], (function()
return 0
end)()
)["m_localPoint"]["SetV"](__oak_acc(__f275_manifold["m_points"], (function()
return 0
end)()
)["m_localPoint"], __f275_circle["m_p"]);
__oak_acc(__f275_manifold["m_points"], (function()
return 0
end)()
)["m_id"]["key"] = 0;
return __noop()
end)()

else return __noop()
end
end)()
;
local __f275_u1 = __add((function()
return ((function()
return (__f275_cLocalX - __f275_v1["x"])
end)()
 * (function()
return (__f275_v2["x"] - __f275_v1["x"])
end)()
)
end)()
, (function()
return ((function()
return (__f275_cLocalY - __f275_v1["y"])
end)()
 * (function()
return (__f275_v2["y"] - __f275_v1["y"])
end)()
)
end)()
);
local __f275_u2 = __add((function()
return ((function()
return (__f275_cLocalX - __f275_v2["x"])
end)()
 * (function()
return (__f275_v1["x"] - __f275_v2["x"])
end)()
)
end)()
, (function()
return ((function()
return (__f275_cLocalY - __f275_v2["y"])
end)()
 * (function()
return (__f275_v1["y"] - __f275_v2["y"])
end)()
)
end)()
);
return (function()
local __oak_cond = __truthy((function()
return (__f275_u1 <= 0)
end)()
)
if __oak_eq(__oak_cond, true) then return (function()
local __oak_cond = __truthy((function()
return (__add((function()
return ((function()
return (__f275_cLocalX - __f275_v1["x"])
end)()
 * (function()
return (__f275_cLocalX - __f275_v1["x"])
end)()
)
end)()
, (function()
return ((function()
return (__f275_cLocalY - __f275_v1["y"])
end)()
 * (function()
return (__f275_cLocalY - __f275_v1["y"])
end)()
)
end)()
) > (function()
return (__f275_radius * __f275_radius)
end)()
)
end)()
)
if __oak_eq(__oak_cond, true) then return __noop()
else return (function()
__f275_manifold["m_pointCount"] = 1;
__f275_manifold["m_type"] = __static_b2Manifold["e_faceA"];
__f275_manifold["m_localPlaneNormal"]["x"] = (function()
return (__f275_cLocalX - __f275_v1["x"])
end)()
;
__f275_manifold["m_localPlaneNormal"]["y"] = (function()
return (__f275_cLocalY - __f275_v1["y"])
end)()
;
__f275_manifold["m_localPlaneNormal"]["Normalize"](__f275_manifold["m_localPlaneNormal"]);
__f275_manifold["m_localPoint"]["SetV"](__f275_manifold["m_localPoint"], __f275_v1);
__oak_acc(__f275_manifold["m_points"], (function()
return 0
end)()
)["m_localPoint"]["SetV"](__oak_acc(__f275_manifold["m_points"], (function()
return 0
end)()
)["m_localPoint"], __f275_circle["m_p"]);
__oak_acc(__f275_manifold["m_points"], (function()
return 0
end)()
)["m_id"]["key"] = 0
return __oak_acc(__f275_manifold["m_points"], (function()
return 0
end)()
)["m_id"]["key"]
end)()

end
end)()

else return (function()
local __oak_cond = __truthy((function()
return (__f275_u2 <= 0)
end)()
)
if __oak_eq(__oak_cond, true) then return (function()
local __oak_cond = __truthy((function()
return (__add((function()
return ((function()
return (__f275_cLocalX - __f275_v2["x"])
end)()
 * (function()
return (__f275_cLocalX - __f275_v2["x"])
end)()
)
end)()
, (function()
return ((function()
return (__f275_cLocalY - __f275_v2["y"])
end)()
 * (function()
return (__f275_cLocalY - __f275_v2["y"])
end)()
)
end)()
) > (function()
return (__f275_radius * __f275_radius)
end)()
)
end)()
)
if __oak_eq(__oak_cond, true) then return __noop()
else return (function()
__f275_manifold["m_pointCount"] = 1;
__f275_manifold["m_type"] = __static_b2Manifold["e_faceA"];
__f275_manifold["m_localPlaneNormal"]["x"] = (function()
return (__f275_cLocalX - __f275_v2["x"])
end)()
;
__f275_manifold["m_localPlaneNormal"]["y"] = (function()
return (__f275_cLocalY - __f275_v2["y"])
end)()
;
__f275_manifold["m_localPlaneNormal"]["Normalize"](__f275_manifold["m_localPlaneNormal"]);
__f275_manifold["m_localPoint"]["SetV"](__f275_manifold["m_localPoint"], __f275_v2);
__oak_acc(__f275_manifold["m_points"], (function()
return 0
end)()
)["m_localPoint"]["SetV"](__oak_acc(__f275_manifold["m_points"], (function()
return 0
end)()
)["m_localPoint"], __f275_circle["m_p"]);
__oak_acc(__f275_manifold["m_points"], (function()
return 0
end)()
)["m_id"]["key"] = 0
return __oak_acc(__f275_manifold["m_points"], (function()
return 0
end)()
)["m_id"]["key"]
end)()

end
end)()

else return (function()
local __f275_faceCenterX = (function()
return (0.5 * __add(__f275_v1["x"], __f275_v2["x"]))
end)()
;
local __f275_faceCenterY = (function()
return (0.5 * __add(__f275_v1["y"], __f275_v2["y"]))
end)()
;
__f275_separation = __add((function()
return ((function()
return (__f275_cLocalX - __f275_faceCenterX)
end)()
 * __oak_acc(__f275_normals, (function()
return __f275_vertIndex1
end)()
)["x"])
end)()
, (function()
return ((function()
return (__f275_cLocalY - __f275_faceCenterY)
end)()
 * __oak_acc(__f275_normals, (function()
return __f275_vertIndex1
end)()
)["y"])
end)()
);
return (function()
local __oak_cond = __truthy((function()
return (__f275_separation > __f275_radius)
end)()
)
if __oak_eq(__oak_cond, true) then return __noop()
else return (function()
__f275_manifold["m_pointCount"] = 1;
__f275_manifold["m_type"] = __static_b2Manifold["e_faceA"];
__f275_manifold["m_localPlaneNormal"]["x"] = __oak_acc(__f275_normals, (function()
return __f275_vertIndex1
end)()
)["x"];
__f275_manifold["m_localPlaneNormal"]["y"] = __oak_acc(__f275_normals, (function()
return __f275_vertIndex1
end)()
)["y"];
__f275_manifold["m_localPlaneNormal"]["Normalize"](__f275_manifold["m_localPlaneNormal"]);
__f275_manifold["m_localPoint"]["Set"](__f275_manifold["m_localPoint"], __f275_faceCenterX, __f275_faceCenterY);
__oak_acc(__f275_manifold["m_points"], (function()
return 0
end)()
)["m_localPoint"]["SetV"](__oak_acc(__f275_manifold["m_points"], (function()
return 0
end)()
)["m_localPoint"], __f275_circle["m_p"]);
__oak_acc(__f275_manifold["m_points"], (function()
return 0
end)()
)["m_id"]["key"] = 0
return __oak_acc(__f275_manifold["m_points"], (function()
return 0
end)()
)["m_id"]["key"]
end)()

end
end)()

end)()

end
end)()

end
end)()

end)()

end;
__static_b2Collision["TestOverlap"] = function(__f276_a, __f276_b)
local __f276_t1 = __f276_b["lowerBound"];
local __f276_t2 = __f276_a["upperBound"];
local __f276_d1X = (function()
return (__f276_t1["x"] - __f276_t2["x"])
end)()
;
local __f276_d1Y = (function()
return (__f276_t1["y"] - __f276_t2["y"])
end)()
;
__f276_t1 = __f276_a["lowerBound"];
__f276_t2 = __f276_b["upperBound"];
local __f276_d2X = (function()
return (__f276_t1["x"] - __f276_t2["x"])
end)()
;
local __f276_d2Y = (function()
return (__f276_t1["y"] - __f276_t2["y"])
end)()
;
(function()
local __oak_cond = __truthy(__or((function()
return (__f276_d1X > 0)
end)()
, (function()
return (__f276_d1Y > 0)
end)()
))
if __oak_eq(__oak_cond, true) then return false
else return __noop()
end
end)()
;
(function()
local __oak_cond = __truthy(__or((function()
return (__f276_d2X > 0)
end)()
, (function()
return (__f276_d2Y > 0)
end)()
))
if __oak_eq(__oak_cond, true) then return false
else return __noop()
end
end)()
;
return true
end;
b2Collision = __static_b2Collision;
Box2D["Collision"]["b2Collision"] = b2Collision;
__proto_b2ContactPoint = {};
__static_b2ContactPoint = {};
b2ContactPoint = function()
local self = {["__type"]='b2ContactPoint', ["__types"]={'b2ContactPoint'}};
(function()
self["position"] = b2Vec2();
self["velocity"] = b2Vec2();
self["normal"] = b2Vec2();
self["id"] = b2ContactID()
return self["id"]
end)()
;
return self
end;
Box2D["Collision"]["b2ContactPoint"] = b2ContactPoint;
__static_b2Distance = {};
__static_b2Distance["Distance"] = function(__f278_output, __f278_cache, __f278_input)
(function()
b2Distance["b2_gjkCalls"] = __as_oak_string(b2Distance["b2_gjkCalls"] + 1)
return b2Distance["b2_gjkCalls"]
end)()
;
local __f278_proxyA = __f278_input["proxyA"];
local __f278_proxyB = __f278_input["proxyB"];
local __f278_transformA = __f278_input["transformA"];
local __f278_transformB = __f278_input["transformB"];
local __f278_simplex = __static_b2Distance["s_simplex"];
__f278_simplex["ReadCache"](__f278_simplex, __f278_cache, __f278_proxyA, __f278_transformA, __f278_proxyB, __f278_transformB);
local __f278_vertices = __f278_simplex["m_vertices"];
local __f278_k_maxIters = 20;
local __f278_saveA = __static_b2Distance["s_saveA"];
local __f278_saveB = __static_b2Distance["s_saveB"];
local __f278_saveCount = 0;
local __f278_closestPoint = __f278_simplex["GetClosestPoint"](__f278_simplex);
local __f278_distanceSqr1 = __f278_closestPoint["LengthSquared"](__f278_closestPoint);
local __f278_distanceSqr2 = __f278_distanceSqr1;
local __f278_i = 0;
local __f278_p = __noop();
local __f278_iter = 0;
(function()
local function __loop66()
return (function()
local __oak_cond = (function()
return (__f278_iter < __f278_k_maxIters)
end)()

if __oak_eq(__oak_cond, true) then return (function()
local __r = (function()
return (function()
__f278_saveCount = __f278_simplex["m_count"];
(function()
__f278_i = 0;
local function __loop67()
return (function()
local __oak_cond = (function()
return (__f278_i < __f278_saveCount)
end)()

if __oak_eq(__oak_cond, true) then return (function()
local __r = (function()
return (function()
__f278_saveA[__add(__f278_i, 1)] = __oak_acc(__f278_vertices, (function()
return __f278_i
end)()
)["indexA"];
__f278_saveB[__add(__f278_i, 1)] = __oak_acc(__f278_vertices, (function()
return __f278_i
end)()
)["indexB"]
return __oak_acc(__f278_saveB, (function()
return __add(__f278_i, 1)
end)()
)
end)()

end)()
;
return (function()
local __oak_cond = __r
if __oak_eq(__oak_cond, 'break') then return nil
else return (function()
(function()
local __tmp278_68 = __f278_i;
__f278_i = __as_oak_string(__f278_i + 1);
return __tmp278_68
end)()
;
return __loop67()
end)()

end
end)()

end)()

else return nil
end
end)()

end;
return __loop67()
end)()
;
(function()
local __oak_cond = __f278_simplex["m_count"]
if __oak_eq(__oak_cond, 1) then return nil
elseif __oak_eq(__oak_cond, 2) then return __f278_simplex["Solve2"](__f278_simplex)
elseif __oak_eq(__oak_cond, 3) then return __f278_simplex["Solve3"](__f278_simplex)
else return __static_b2Settings["b2Assert"](false)
end
end)()
;
(function()
local __oak_cond = __truthy((function()
return __oak_eq(__f278_simplex["m_count"], 3)
end)()
)
if __oak_eq(__oak_cond, true) then return 'break'
else return __noop()
end
end)()
;
__f278_p = __f278_simplex["GetClosestPoint"](__f278_simplex);
__f278_distanceSqr2 = __f278_p["LengthSquared"](__f278_p);
(function()
local __oak_cond = __truthy((function()
return (__f278_distanceSqr2 > __f278_distanceSqr1)
end)()
)
if __oak_eq(__oak_cond, true) then return nil
else return __noop()
end
end)()
;
__f278_distanceSqr1 = __f278_distanceSqr2;
local __f278_d = __f278_simplex["GetSearchDirection"](__f278_simplex);
(function()
local __oak_cond = __truthy((function()
return (__f278_d["LengthSquared"](__f278_d) < (function()
return (__Number["MIN_VALUE"] * __Number["MIN_VALUE"])
end)()
)
end)()
)
if __oak_eq(__oak_cond, true) then return 'break'
else return __noop()
end
end)()
;
local __f278_vertex = __oak_acc(__f278_vertices, (function()
return __f278_simplex["m_count"]
end)()
);
__f278_vertex["indexA"] = __f278_proxyA["GetSupport"](__f278_proxyA, __static_b2Math["MulTMV"](__f278_transformA["R"], __f278_d["GetNegative"](__f278_d)));
__f278_vertex["wA"] = __static_b2Math["MulX"](__f278_transformA, __f278_proxyA["GetVertex"](__f278_proxyA, __f278_vertex["indexA"]));
__f278_vertex["indexB"] = __f278_proxyB["GetSupport"](__f278_proxyB, __static_b2Math["MulTMV"](__f278_transformB["R"], __f278_d));
__f278_vertex["wB"] = __static_b2Math["MulX"](__f278_transformB, __f278_proxyB["GetVertex"](__f278_proxyB, __f278_vertex["indexB"]));
__f278_vertex["w"] = __static_b2Math["SubtractVV"](__f278_vertex["wB"], __f278_vertex["wA"]);
(function()
__f278_iter = __as_oak_string(__f278_iter + 1)
return __f278_iter
end)()
;
(function()
b2Distance["b2_gjkIters"] = __as_oak_string(b2Distance["b2_gjkIters"] + 1)
return b2Distance["b2_gjkIters"]
end)()
;
local __f278_duplicate = false;
(function()
__f278_i = 0;
local function __loop71()
return (function()
local __oak_cond = (function()
return (__f278_i < __f278_saveCount)
end)()

if __oak_eq(__oak_cond, true) then return (function()
local __r = (function()
return (function()
local __oak_cond = __truthy(__and((function()
return __oak_eq(__f278_vertex["indexA"], __oak_acc(__f278_saveA, (function()
return __f278_i
end)()
))
end)()
, (function()
return __oak_eq(__f278_vertex["indexB"], __oak_acc(__f278_saveB, (function()
return __f278_i
end)()
))
end)()
))
if __oak_eq(__oak_cond, true) then return (function()
__f278_duplicate = true;
return 'break'
end)()

else return __noop()
end
end)()

end)()
;
return (function()
local __oak_cond = __r
if __oak_eq(__oak_cond, 'break') then return nil
else return (function()
(function()
local __tmp278_72 = __f278_i;
__f278_i = __as_oak_string(__f278_i + 1);
return __tmp278_72
end)()
;
return __loop71()
end)()

end
end)()

end)()

else return nil
end
end)()

end;
return __loop71()
end)()
;
(function()
local __oak_cond = __truthy(__f278_duplicate)
if __oak_eq(__oak_cond, true) then return 'break'
else return __noop()
end
end)()
;
return (function()
__f278_simplex["m_count"] = __as_oak_string(__f278_simplex["m_count"] + 1)
return __f278_simplex["m_count"]
end)()

end)()

end)()
;
return (function()
local __oak_cond = __r
if __oak_eq(__oak_cond, 'break') then return nil
else return __loop66()
end
end)()

end)()

else return nil
end
end)()

end;
return __loop66()
end)()
;
__f278_simplex["GetWitnessPoints"](__f278_simplex, __f278_output["pointA"], __f278_output["pointB"]);
__f278_output["distance"] = __static_b2Math["SubtractVV"](__f278_output["pointA"], __f278_output["pointB"])["Length"](__static_b2Math["SubtractVV"](__f278_output["pointA"], __f278_output["pointB"]));
__f278_output["iterations"] = __f278_iter;
__f278_simplex["WriteCache"](__f278_simplex, __f278_cache);
return (function()
local __oak_cond = __truthy(__f278_input["useRadii"])
if __oak_eq(__oak_cond, true) then return (function()
local __f278_rA = __f278_proxyA["m_radius"];
local __f278_rB = __f278_proxyB["m_radius"];
return (function()
local __oak_cond = __truthy(__and((function()
return (__f278_output["distance"] > __add(__f278_rA, __f278_rB))
end)()
, (function()
return (__f278_output["distance"] > __Number["MIN_VALUE"])
end)()
))
if __oak_eq(__oak_cond, true) then return (function()
__f278_output["distance"] = (function()
return (__f278_output["distance"] - __add(__f278_rA, __f278_rB))
end)()
;
local __f278_normal = __static_b2Math["SubtractVV"](__f278_output["pointB"], __f278_output["pointA"]);
__f278_normal["Normalize"](__f278_normal);
__f278_output["pointA"]["x"] = __add(__f278_output["pointA"]["x"], (function()
return (__f278_rA * __f278_normal["x"])
end)()
);
__f278_output["pointA"]["y"] = __add(__f278_output["pointA"]["y"], (function()
return (__f278_rA * __f278_normal["y"])
end)()
);
__f278_output["pointB"]["x"] = (function()
return (__f278_output["pointB"]["x"] - (function()
return (__f278_rB * __f278_normal["x"])
end)()
)
end)()
;
__f278_output["pointB"]["y"] = (function()
return (__f278_output["pointB"]["y"] - (function()
return (__f278_rB * __f278_normal["y"])
end)()
)
end)()

return __f278_output["pointB"]["y"]
end)()

else return (function()
__f278_p = b2Vec2();
__f278_p["x"] = (function()
return (0.5 * __add(__f278_output["pointA"]["x"], __f278_output["pointB"]["x"]))
end)()
;
__f278_p["y"] = (function()
return (0.5 * __add(__f278_output["pointA"]["y"], __f278_output["pointB"]["y"]))
end)()
;
(function()
__f278_output["pointB"]["x"] = __f278_p["x"];
__f278_output["pointA"]["x"] = __f278_output["pointB"]["x"]
return __f278_output["pointA"]["x"]
end)()
;
(function()
__f278_output["pointB"]["y"] = __f278_p["y"];
__f278_output["pointA"]["y"] = __f278_output["pointB"]["y"]
return __f278_output["pointA"]["y"]
end)()
;
__f278_output["distance"] = 0
return __f278_output["distance"]
end)()

end
end)()

end)()

else return __noop()
end
end)()

end;
b2Distance = __static_b2Distance;
Box2D["Collision"]["b2Distance"] = b2Distance;
__proto_b2DistanceInput = {};
__static_b2DistanceInput = {};
b2DistanceInput = function()
local self = {["__type"]='b2DistanceInput', ["__types"]={'b2DistanceInput'}};
return self
end;
Box2D["Collision"]["b2DistanceInput"] = b2DistanceInput;
__proto_b2DistanceOutput = {};
__static_b2DistanceOutput = {};
b2DistanceOutput = function()
local self = {["__type"]='b2DistanceOutput', ["__types"]={'b2DistanceOutput'}};
(function()
self["pointA"] = b2Vec2();
self["pointB"] = b2Vec2()
return self["pointB"]
end)()
;
return self
end;
Box2D["Collision"]["b2DistanceOutput"] = b2DistanceOutput;
__proto_b2DistanceProxy = {};
__proto_b2DistanceProxy["Set"] = function(self, __f280_shape)
return (function()
local __oak_cond = __f280_shape["GetType"](__f280_shape)
if __oak_eq(__oak_cond, __static_b2Shape["e_circleShape"]) then return (function()
local __f280_circle = (function()
local __oak_cond = __truthy(__instanceof(__f280_shape, 'b2CircleShape'))
if __oak_eq(__oak_cond, true) then return __f280_shape
else return nil
end
end)()
;
self["m_vertices"] = __newArray(1, true);
self["m_vertices"][__add(0, 1)] = __f280_circle["m_p"];
self["m_count"] = 1;
self["m_radius"] = __f280_circle["m_radius"]
return self["m_radius"]
end)()

elseif __oak_eq(__oak_cond, __static_b2Shape["e_polygonShape"]) then return (function()
local __f280_polygon = (function()
local __oak_cond = __truthy(__instanceof(__f280_shape, 'b2PolygonShape'))
if __oak_eq(__oak_cond, true) then return __f280_shape
else return nil
end
end)()
;
self["m_vertices"] = __f280_polygon["m_vertices"];
self["m_count"] = __f280_polygon["m_vertexCount"];
self["m_radius"] = __f280_polygon["m_radius"]
return self["m_radius"]
end)()

else return __static_b2Settings["b2Assert"](false)
end
end)()

end;
__proto_b2DistanceProxy["GetSupport"] = function(self, __f281_d)
local __f281_bestIndex = 0;
local __f281_bestValue = __add((function()
return (__oak_acc(self["m_vertices"], (function()
return 0
end)()
)["x"] * __f281_d["x"])
end)()
, (function()
return (__oak_acc(self["m_vertices"], (function()
return 0
end)()
)["y"] * __f281_d["y"])
end)()
);
(function()
local __f281_i = 1;
local function __loop74()
return (function()
local __oak_cond = (function()
return (__f281_i < self["m_count"])
end)()

if __oak_eq(__oak_cond, true) then return (function()
local __r = (function()
return (function()
local __f281_value = __add((function()
return (__oak_acc(self["m_vertices"], (function()
return __f281_i
end)()
)["x"] * __f281_d["x"])
end)()
, (function()
return (__oak_acc(self["m_vertices"], (function()
return __f281_i
end)()
)["y"] * __f281_d["y"])
end)()
);
return (function()
local __oak_cond = __truthy((function()
return (__f281_value > __f281_bestValue)
end)()
)
if __oak_eq(__oak_cond, true) then return (function()
__f281_bestIndex = __f281_i;
__f281_bestValue = __f281_value
return __f281_bestValue
end)()

else return __noop()
end
end)()

end)()

end)()
;
return (function()
local __oak_cond = __r
if __oak_eq(__oak_cond, 'break') then return nil
else return (function()
(function()
__f281_i = __as_oak_string(__f281_i + 1)
return __f281_i
end)()
;
return __loop74()
end)()

end
end)()

end)()

else return nil
end
end)()

end;
return __loop74()
end)()
;
return __f281_bestIndex
end;
__proto_b2DistanceProxy["GetSupportVertex"] = function(self, __f282_d)
local __f282_bestIndex = 0;
local __f282_bestValue = __add((function()
return (__oak_acc(self["m_vertices"], (function()
return 0
end)()
)["x"] * __f282_d["x"])
end)()
, (function()
return (__oak_acc(self["m_vertices"], (function()
return 0
end)()
)["y"] * __f282_d["y"])
end)()
);
(function()
local __f282_i = 1;
local function __loop76()
return (function()
local __oak_cond = (function()
return (__f282_i < self["m_count"])
end)()

if __oak_eq(__oak_cond, true) then return (function()
local __r = (function()
return (function()
local __f282_value = __add((function()
return (__oak_acc(self["m_vertices"], (function()
return __f282_i
end)()
)["x"] * __f282_d["x"])
end)()
, (function()
return (__oak_acc(self["m_vertices"], (function()
return __f282_i
end)()
)["y"] * __f282_d["y"])
end)()
);
return (function()
local __oak_cond = __truthy((function()
return (__f282_value > __f282_bestValue)
end)()
)
if __oak_eq(__oak_cond, true) then return (function()
__f282_bestIndex = __f282_i;
__f282_bestValue = __f282_value
return __f282_bestValue
end)()

else return __noop()
end
end)()

end)()

end)()
;
return (function()
local __oak_cond = __r
if __oak_eq(__oak_cond, 'break') then return nil
else return (function()
(function()
__f282_i = __as_oak_string(__f282_i + 1)
return __f282_i
end)()
;
return __loop76()
end)()

end
end)()

end)()

else return nil
end
end)()

end;
return __loop76()
end)()
;
return __oak_acc(self["m_vertices"], (function()
return __f282_bestIndex
end)()
)
end;
__proto_b2DistanceProxy["GetVertexCount"] = function(self)
return self["m_count"]
end;
__proto_b2DistanceProxy["GetVertex"] = function(self, __f284_index)
(function()
local __oak_cond = __truthy((function()
return __oak_eq(__f284_index, nil)
end)()
)
if __oak_eq(__oak_cond, true) then __f284_index = 0
return __f284_index
else return __noop()
end
end)()
;
__static_b2Settings["b2Assert"](__and((function()
return (0 <= __f284_index)
end)()
, (function()
return (__f284_index < self["m_count"])
end)()
));
return __oak_acc(self["m_vertices"], (function()
return __f284_index
end)()
)
end;
__static_b2DistanceProxy = {};
b2DistanceProxy = function()
local self = {["__type"]='b2DistanceProxy', ["__types"]={'b2DistanceProxy'}};
self["Set"] = __proto_b2DistanceProxy["Set"];
self["GetSupport"] = __proto_b2DistanceProxy["GetSupport"];
self["GetSupportVertex"] = __proto_b2DistanceProxy["GetSupportVertex"];
self["GetVertexCount"] = __proto_b2DistanceProxy["GetVertexCount"];
self["GetVertex"] = __proto_b2DistanceProxy["GetVertex"];
return self
end;
Box2D["Collision"]["b2DistanceProxy"] = b2DistanceProxy;
__proto_b2DynamicTreeBroadPhase = {};
__proto_b2DynamicTreeBroadPhase["CreateProxy"] = function(self, __f285_aabb, __f285_userData)
local __f285_proxy = self["m_tree"]["CreateProxy"](self["m_tree"], __f285_aabb, __f285_userData);
(function()
self["m_proxyCount"] = __as_oak_string(self["m_proxyCount"] + 1)
return self["m_proxyCount"]
end)()
;
self["BufferMove"](self, __f285_proxy);
return __f285_proxy
end;
__proto_b2DynamicTreeBroadPhase["DestroyProxy"] = function(self, __f286_proxy)
self["UnBufferMove"](self, __f286_proxy);
(function()
self["m_proxyCount"] = __as_oak_string(self["m_proxyCount"] + (-1))
return self["m_proxyCount"]
end)()
;
return self["m_tree"]["DestroyProxy"](self["m_tree"], __f286_proxy)
end;
__proto_b2DynamicTreeBroadPhase["MoveProxy"] = function(self, __f287_proxy, __f287_aabb, __f287_displacement)
local __f287_buffer = self["m_tree"]["MoveProxy"](self["m_tree"], __f287_proxy, __f287_aabb, __f287_displacement);
return (function()
local __oak_cond = __truthy(__f287_buffer)
if __oak_eq(__oak_cond, true) then return self["BufferMove"](self, __f287_proxy)
else return __noop()
end
end)()

end;
__proto_b2DynamicTreeBroadPhase["TestOverlap"] = function(self, __f288_proxyA, __f288_proxyB)
local __f288_aabbA = self["m_tree"]["GetFatAABB"](self["m_tree"], __f288_proxyA);
local __f288_aabbB = self["m_tree"]["GetFatAABB"](self["m_tree"], __f288_proxyB);
return __f288_aabbA["TestOverlap"](__f288_aabbA, __f288_aabbB)
end;
__proto_b2DynamicTreeBroadPhase["GetUserData"] = function(self, __f289_proxy)
return self["m_tree"]["GetUserData"](self["m_tree"], __f289_proxy)
end;
__proto_b2DynamicTreeBroadPhase["GetFatAABB"] = function(self, __f290_proxy)
return self["m_tree"]["GetFatAABB"](self["m_tree"], __f290_proxy)
end;
__proto_b2DynamicTreeBroadPhase["GetProxyCount"] = function(self)
return self["m_proxyCount"]
end;
__proto_b2DynamicTreeBroadPhase["UpdatePairs"] = function(self, __f292_callback)
local __f292___this = self;
__f292___this["m_pairCount"] = 0;
(function()
local __f292_i = 0;
local __f292_queryProxy = __noop()
return __f292_queryProxy
end)()
;
(function()
__f292_i = 0;
local function __loop80()
return (function()
local __oak_cond = (function()
return (__f292_i < len(__f292___this["m_moveBuffer"]))
end)()

if __oak_eq(__oak_cond, true) then return (function()
local __r = (function()
return (function()
__f292_queryProxy = __oak_acc(__f292___this["m_moveBuffer"], (function()
return __f292_i
end)()
);
local QueryCallback = function(__f293_proxy)
(function()
local __oak_cond = __truthy((function()
return __oak_eq(__f293_proxy, __f292_queryProxy)
end)()
)
if __oak_eq(__oak_cond, true) then return true
else return __noop()
end
end)()
;
(function()
local __oak_cond = __truthy((function()
return __oak_eq(__f292___this["m_pairCount"], len(__f292___this["m_pairBuffer"]))
end)()
)
if __oak_eq(__oak_cond, true) then __f292___this["m_pairBuffer"][__add(__f292___this["m_pairCount"], 1)] = b2DynamicTreePair()
return __oak_acc(__f292___this["m_pairBuffer"], (function()
return __add(__f292___this["m_pairCount"], 1)
end)()
)
else return __noop()
end
end)()
;
local __f293_pair = __oak_acc(__f292___this["m_pairBuffer"], (function()
return __f292___this["m_pairCount"]
end)()
);
__f293_pair["proxyA"] = (function()
local __oak_cond = __truthy((function()
return (__f293_proxy < __f292_queryProxy)
end)()
)
if __oak_eq(__oak_cond, true) then return __f293_proxy
else return __f292_queryProxy
end
end)()
;
__f293_pair["proxyB"] = (function()
local __oak_cond = __truthy((function()
return (__f293_proxy >= __f292_queryProxy)
end)()
)
if __oak_eq(__oak_cond, true) then return __f293_proxy
else return __f292_queryProxy
end
end)()
;
(function()
__f292___this["m_pairCount"] = __as_oak_string(__f292___this["m_pairCount"] + 1)
return __f292___this["m_pairCount"]
end)()
;
return true
end;
local __f292_fatAABB = __f292___this["m_tree"]["GetFatAABB"](__f292___this["m_tree"], __f292_queryProxy);
return __f292___this["m_tree"]["Query"](__f292___this["m_tree"], QueryCallback, __f292_fatAABB)
end)()

end)()
;
return (function()
local __oak_cond = __r
if __oak_eq(__oak_cond, 'break') then return nil
else return (function()
(function()
__f292_i = __as_oak_string(__f292_i + 1)
return __f292_i
end)()
;
return __loop80()
end)()

end
end)()

end)()

else return nil
end
end)()

end;
return __loop80()
end)()
;
__clear(__f292___this["m_moveBuffer"]);
return (function()
local __f292_i = 0;
local function __loop83()
return (function()
local __oak_cond = (function()
return (__f292_i < __f292___this["m_pairCount"])
end)()

if __oak_eq(__oak_cond, true) then return (function()
local __r = (function()
return (function()
local __f292_primaryPair = __oak_acc(__f292___this["m_pairBuffer"], (function()
return __f292_i
end)()
);
local __f292_userDataA = __f292___this["m_tree"]["GetUserData"](__f292___this["m_tree"], __f292_primaryPair["proxyA"]);
local __f292_userDataB = __f292___this["m_tree"]["GetUserData"](__f292___this["m_tree"], __f292_primaryPair["proxyB"]);
__f292_callback(__f292_userDataA, __f292_userDataB);
(function()
__f292_i = __as_oak_string(__f292_i + 1)
return __f292_i
end)()
;
return (function()
local function __loop85()
return (function()
local __oak_cond = (function()
return (__f292_i < __f292___this["m_pairCount"])
end)()

if __oak_eq(__oak_cond, true) then return (function()
local __r = (function()
return (function()
local __f292_pair = __oak_acc(__f292___this["m_pairBuffer"], (function()
return __f292_i
end)()
);
(function()
local __oak_cond = __truthy(__or((function()
return (not __oak_eq(__f292_pair["proxyA"], __f292_primaryPair["proxyA"]))
end)()
, (function()
return (not __oak_eq(__f292_pair["proxyB"], __f292_primaryPair["proxyB"]))
end)()
))
if __oak_eq(__oak_cond, true) then return 'break'
else return __noop()
end
end)()
;
return (function()
__f292_i = __as_oak_string(__f292_i + 1)
return __f292_i
end)()

end)()

end)()
;
return (function()
local __oak_cond = __r
if __oak_eq(__oak_cond, 'break') then return nil
else return __loop85()
end
end)()

end)()

else return nil
end
end)()

end;
return __loop85()
end)()

end)()

end)()
;
return (function()
local __oak_cond = __r
if __oak_eq(__oak_cond, 'break') then return nil
else return (function()
__noop();
return __loop83()
end)()

end
end)()

end)()

else return nil
end
end)()

end;
return __loop83()
end)()

end;
__proto_b2DynamicTreeBroadPhase["Query"] = function(self, __f294_callback, __f294_aabb)
return self["m_tree"]["Query"](self["m_tree"], __f294_callback, __f294_aabb)
end;
__proto_b2DynamicTreeBroadPhase["RayCast"] = function(self, __f295_callback, __f295_input)
return self["m_tree"]["RayCast"](self["m_tree"], __f295_callback, __f295_input)
end;
__proto_b2DynamicTreeBroadPhase["Validate"] = function(self)
return nil
end;
__proto_b2DynamicTreeBroadPhase["Rebalance"] = function(self, __f297_iterations)
(function()
local __oak_cond = __truthy((function()
return __oak_eq(__f297_iterations, nil)
end)()
)
if __oak_eq(__oak_cond, true) then __f297_iterations = 0
return __f297_iterations
else return __noop()
end
end)()
;
return self["m_tree"]["Rebalance"](self["m_tree"], __f297_iterations)
end;
__proto_b2DynamicTreeBroadPhase["BufferMove"] = function(self, __f298_proxy)
self["m_moveBuffer"][__add(len(self["m_moveBuffer"]), 1)] = __f298_proxy
return __oak_acc(self["m_moveBuffer"], (function()
return __add(len(self["m_moveBuffer"]), 1)
end)()
)
end;
__proto_b2DynamicTreeBroadPhase["UnBufferMove"] = function(self, __f299_proxy)
local __f299_i = __parseInt(__indexOf(self["m_moveBuffer"], __f299_proxy));
return __splice(self["m_moveBuffer"], __f299_i, 1)
end;
__proto_b2DynamicTreeBroadPhase["ComparePairs"] = function(self, __f300_pair1, __f300_pair2)
return 0
end;
__static_b2DynamicTreeBroadPhase = {};
b2DynamicTreeBroadPhase = function()
local self = {["__type"]='b2DynamicTreeBroadPhase', ["__types"]={'b2DynamicTreeBroadPhase'}};
self["CreateProxy"] = __proto_b2DynamicTreeBroadPhase["CreateProxy"];
self["DestroyProxy"] = __proto_b2DynamicTreeBroadPhase["DestroyProxy"];
self["MoveProxy"] = __proto_b2DynamicTreeBroadPhase["MoveProxy"];
self["TestOverlap"] = __proto_b2DynamicTreeBroadPhase["TestOverlap"];
self["GetUserData"] = __proto_b2DynamicTreeBroadPhase["GetUserData"];
self["GetFatAABB"] = __proto_b2DynamicTreeBroadPhase["GetFatAABB"];
self["GetProxyCount"] = __proto_b2DynamicTreeBroadPhase["GetProxyCount"];
self["UpdatePairs"] = __proto_b2DynamicTreeBroadPhase["UpdatePairs"];
self["Query"] = __proto_b2DynamicTreeBroadPhase["Query"];
self["RayCast"] = __proto_b2DynamicTreeBroadPhase["RayCast"];
self["Validate"] = __proto_b2DynamicTreeBroadPhase["Validate"];
self["Rebalance"] = __proto_b2DynamicTreeBroadPhase["Rebalance"];
self["BufferMove"] = __proto_b2DynamicTreeBroadPhase["BufferMove"];
self["UnBufferMove"] = __proto_b2DynamicTreeBroadPhase["UnBufferMove"];
self["ComparePairs"] = __proto_b2DynamicTreeBroadPhase["ComparePairs"];
(function()
self["m_tree"] = b2DynamicTree();
self["m_moveBuffer"] = __newArray();
self["m_pairBuffer"] = __newArray();
self["m_pairCount"] = 0
return self["m_pairCount"]
end)()
;
return self
end;
Box2D["Collision"]["b2DynamicTreeBroadPhase"] = b2DynamicTreeBroadPhase;
__proto_b2DynamicTreeNode = {};
__proto_b2DynamicTreeNode["IsLeaf"] = function(self)
return __oak_eq(self["child1"], nil)
end;
__static_b2DynamicTreeNode = {};
b2DynamicTreeNode = function()
local self = {["__type"]='b2DynamicTreeNode', ["__types"]={'b2DynamicTreeNode'}};
self["IsLeaf"] = __proto_b2DynamicTreeNode["IsLeaf"];
self["aabb"] = b2AABB();
return self
end;
Box2D["Collision"]["b2DynamicTreeNode"] = b2DynamicTreeNode;
__proto_b2DynamicTreePair = {};
__static_b2DynamicTreePair = {};
b2DynamicTreePair = function()
local self = {["__type"]='b2DynamicTreePair', ["__types"]={'b2DynamicTreePair'}};
return self
end;
Box2D["Collision"]["b2DynamicTreePair"] = b2DynamicTreePair;
__proto_b2Point = {};
__proto_b2Point["Support"] = function(self, __f304_xf, __f304_vX, __f304_vY)
(function()
local __oak_cond = __truthy((function()
return __oak_eq(__f304_vX, nil)
end)()
)
if __oak_eq(__oak_cond, true) then __f304_vX = 0
return __f304_vX
else return __noop()
end
end)()
;
(function()
local __oak_cond = __truthy((function()
return __oak_eq(__f304_vY, nil)
end)()
)
if __oak_eq(__oak_cond, true) then __f304_vY = 0
return __f304_vY
else return __noop()
end
end)()
;
return self["p"]
end;
__proto_b2Point["GetFirstVertex"] = function(self, __f305_xf)
return self["p"]
end;
__static_b2Point = {};
b2Point = function()
local self = {["__type"]='b2Point', ["__types"]={'b2Point'}};
self["Support"] = __proto_b2Point["Support"];
self["GetFirstVertex"] = __proto_b2Point["GetFirstVertex"];
self["p"] = b2Vec2();
return self
end;
Box2D["Collision"]["b2Point"] = b2Point;
__proto_b2RayCastOutput = {};
__static_b2RayCastOutput = {};
b2RayCastOutput = function()
local self = {["__type"]='b2RayCastOutput', ["__types"]={'b2RayCastOutput'}};
self["normal"] = b2Vec2();
return self
end;
Box2D["Collision"]["b2RayCastOutput"] = b2RayCastOutput;
__proto_b2Segment = {};
__proto_b2Segment["TestSegment"] = function(self, __f308_lambda, __f308_normal, __f308_segment, __f308_maxLambda)
(function()
local __oak_cond = __truthy((function()
return __oak_eq(__f308_maxLambda, nil)
end)()
)
if __oak_eq(__oak_cond, true) then __f308_maxLambda = 0
return __f308_maxLambda
else return __noop()
end
end)()
;
local __f308_s = __f308_segment["p1"];
local __f308_rX = (function()
return (__f308_segment["p2"]["x"] - __f308_s["x"])
end)()
;
local __f308_rY = (function()
return (__f308_segment["p2"]["y"] - __f308_s["y"])
end)()
;
local __f308_dX = (function()
return (self["p2"]["x"] - self["p1"]["x"])
end)()
;
local __f308_dY = (function()
return (self["p2"]["y"] - self["p1"]["y"])
end)()
;
local __f308_nX = __f308_dY;
local __f308_nY = (function()
return (-__f308_dX)
end)()
;
local __f308_k_slop = (function()
return (100 * __Number["MIN_VALUE"])
end)()
;
local __f308_denom = (function()
return (-__add((function()
return (__f308_rX * __f308_nX)
end)()
, (function()
return (__f308_rY * __f308_nY)
end)()
))
end)()
;
(function()
local __oak_cond = __truthy((function()
return (__f308_denom > __f308_k_slop)
end)()
)
if __oak_eq(__oak_cond, true) then return (function()
local __f308_bX = (function()
return (__f308_s["x"] - self["p1"]["x"])
end)()
;
local __f308_bY = (function()
return (__f308_s["y"] - self["p1"]["y"])
end)()
;
local __f308_a = __add((function()
return (__f308_bX * __f308_nX)
end)()
, (function()
return (__f308_bY * __f308_nY)
end)()
);
return (function()
local __oak_cond = __truthy(__and((function()
return (0 <= __f308_a)
end)()
, (function()
return (__f308_a <= (function()
return (__f308_maxLambda * __f308_denom)
end)()
)
end)()
))
if __oak_eq(__oak_cond, true) then return (function()
local __f308_mu2 = __add((function()
return ((function()
return (-__f308_rX)
end)()
 * __f308_bY)
end)()
, (function()
return (__f308_rY * __f308_bX)
end)()
);
return (function()
local __oak_cond = __truthy(__and((function()
return ((function()
return ((function()
return (-__f308_k_slop)
end)()
 * __f308_denom)
end)()
 <= __f308_mu2)
end)()
, (function()
return (__f308_mu2 <= (function()
return (__f308_denom * __add(1, __f308_k_slop))
end)()
)
end)()
))
if __oak_eq(__oak_cond, true) then return (function()
__f308_a = (function()
return (__f308_a / __f308_denom)
end)()
;
local __f308_nLen = __Math["sqrt"](__add((function()
return (__f308_nX * __f308_nX)
end)()
, (function()
return (__f308_nY * __f308_nY)
end)()
));
__f308_nX = (function()
return (__f308_nX / __f308_nLen)
end)()
;
__f308_nY = (function()
return (__f308_nY / __f308_nLen)
end)()
;
__f308_lambda[__add(0, 1)] = __f308_a;
__f308_normal["Set"](__f308_normal, __f308_nX, __f308_nY);
return true
end)()

else return __noop()
end
end)()

end)()

else return __noop()
end
end)()

end)()

else return __noop()
end
end)()
;
return false
end;
__proto_b2Segment["Extend"] = function(self, __f309_aabb)
self["ExtendForward"](self, __f309_aabb);
return self["ExtendBackward"](self, __f309_aabb)
end;
__proto_b2Segment["ExtendForward"] = function(self, __f310_aabb)
local __f310_dX = (function()
return (self["p2"]["x"] - self["p1"]["x"])
end)()
;
local __f310_dY = (function()
return (self["p2"]["y"] - self["p1"]["y"])
end)()
;
local __f310_lambda = __Math["min"]((function()
local __oak_cond = __truthy((function()
return (__f310_dX > 0)
end)()
)
if __oak_eq(__oak_cond, true) then return (function()
return ((function()
return (__f310_aabb["upperBound"]["x"] - self["p1"]["x"])
end)()
 / __f310_dX)
end)()

else return (function()
local __oak_cond = __truthy((function()
return (__f310_dX < 0)
end)()
)
if __oak_eq(__oak_cond, true) then return (function()
return ((function()
return (__f310_aabb["lowerBound"]["x"] - self["p1"]["x"])
end)()
 / __f310_dX)
end)()

else return __Number["POSITIVE_INFINITY"]
end
end)()

end
end)()
, (function()
local __oak_cond = __truthy((function()
return (__f310_dY > 0)
end)()
)
if __oak_eq(__oak_cond, true) then return (function()
return ((function()
return (__f310_aabb["upperBound"]["y"] - self["p1"]["y"])
end)()
 / __f310_dY)
end)()

else return (function()
local __oak_cond = __truthy((function()
return (__f310_dY < 0)
end)()
)
if __oak_eq(__oak_cond, true) then return (function()
return ((function()
return (__f310_aabb["lowerBound"]["y"] - self["p1"]["y"])
end)()
 / __f310_dY)
end)()

else return __Number["POSITIVE_INFINITY"]
end
end)()

end
end)()
);
self["p2"]["x"] = __add(self["p1"]["x"], (function()
return (__f310_dX * __f310_lambda)
end)()
);
self["p2"]["y"] = __add(self["p1"]["y"], (function()
return (__f310_dY * __f310_lambda)
end)()
)
return self["p2"]["y"]
end;
__proto_b2Segment["ExtendBackward"] = function(self, __f311_aabb)
local __f311_dX = __add((function()
return (-self["p2"]["x"])
end)()
, self["p1"]["x"]);
local __f311_dY = __add((function()
return (-self["p2"]["y"])
end)()
, self["p1"]["y"]);
local __f311_lambda = __Math["min"]((function()
local __oak_cond = __truthy((function()
return (__f311_dX > 0)
end)()
)
if __oak_eq(__oak_cond, true) then return (function()
return ((function()
return (__f311_aabb["upperBound"]["x"] - self["p2"]["x"])
end)()
 / __f311_dX)
end)()

else return (function()
local __oak_cond = __truthy((function()
return (__f311_dX < 0)
end)()
)
if __oak_eq(__oak_cond, true) then return (function()
return ((function()
return (__f311_aabb["lowerBound"]["x"] - self["p2"]["x"])
end)()
 / __f311_dX)
end)()

else return __Number["POSITIVE_INFINITY"]
end
end)()

end
end)()
, (function()
local __oak_cond = __truthy((function()
return (__f311_dY > 0)
end)()
)
if __oak_eq(__oak_cond, true) then return (function()
return ((function()
return (__f311_aabb["upperBound"]["y"] - self["p2"]["y"])
end)()
 / __f311_dY)
end)()

else return (function()
local __oak_cond = __truthy((function()
return (__f311_dY < 0)
end)()
)
if __oak_eq(__oak_cond, true) then return (function()
return ((function()
return (__f311_aabb["lowerBound"]["y"] - self["p2"]["y"])
end)()
 / __f311_dY)
end)()

else return __Number["POSITIVE_INFINITY"]
end
end)()

end
end)()
);
self["p1"]["x"] = __add(self["p2"]["x"], (function()
return (__f311_dX * __f311_lambda)
end)()
);
self["p1"]["y"] = __add(self["p2"]["y"], (function()
return (__f311_dY * __f311_lambda)
end)()
)
return self["p1"]["y"]
end;
__static_b2Segment = {};
b2Segment = function()
local self = {["__type"]='b2Segment', ["__types"]={'b2Segment'}};
self["TestSegment"] = __proto_b2Segment["TestSegment"];
self["Extend"] = __proto_b2Segment["Extend"];
self["ExtendForward"] = __proto_b2Segment["ExtendForward"];
self["ExtendBackward"] = __proto_b2Segment["ExtendBackward"];
(function()
self["p1"] = b2Vec2();
self["p2"] = b2Vec2()
return self["p2"]
end)()
;
return self
end;
Box2D["Collision"]["b2Segment"] = b2Segment;
__proto_b2SeparationFunction = {};
__proto_b2SeparationFunction["Initialize"] = function(self, __f313_cache, __f313_proxyA, __f313_transformA, __f313_proxyB, __f313_transformB)
self["m_proxyA"] = __f313_proxyA;
self["m_proxyB"] = __f313_proxyB;
local __f313_count = __parseInt(__f313_cache["count"]);
__static_b2Settings["b2Assert"](__and((function()
return (0 < __f313_count)
end)()
, (function()
return (__f313_count < 3)
end)()
));
local __f313_localPointA = __noop();
local __f313_localPointA1 = __noop();
local __f313_localPointA2 = __noop();
local __f313_localPointB = __noop();
local __f313_localPointB1 = __noop();
local __f313_localPointB2 = __noop();
local __f313_pointAX = 0;
local __f313_pointAY = 0;
local __f313_pointBX = 0;
local __f313_pointBY = 0;
local __f313_normalX = 0;
local __f313_normalY = 0;
local __f313_tMat = __noop();
local __f313_tVec = __noop();
local __f313_s = 0;
local __f313_sgn = 0;
return (function()
local __oak_cond = __truthy((function()
return __oak_eq(__f313_count, 1)
end)()
)
if __oak_eq(__oak_cond, true) then return (function()
self["m_type"] = __static_b2SeparationFunction["e_points"];
__f313_localPointA = self["m_proxyA"]["GetVertex"](self["m_proxyA"], __oak_acc(__f313_cache["indexA"], (function()
return 0
end)()
));
__f313_localPointB = self["m_proxyB"]["GetVertex"](self["m_proxyB"], __oak_acc(__f313_cache["indexB"], (function()
return 0
end)()
));
__f313_tVec = __f313_localPointA;
__f313_tMat = __f313_transformA["R"];
__f313_pointAX = __add(__f313_transformA["position"]["x"], __add((function()
return (__f313_tMat["col1"]["x"] * __f313_tVec["x"])
end)()
, (function()
return (__f313_tMat["col2"]["x"] * __f313_tVec["y"])
end)()
));
__f313_pointAY = __add(__f313_transformA["position"]["y"], __add((function()
return (__f313_tMat["col1"]["y"] * __f313_tVec["x"])
end)()
, (function()
return (__f313_tMat["col2"]["y"] * __f313_tVec["y"])
end)()
));
__f313_tVec = __f313_localPointB;
__f313_tMat = __f313_transformB["R"];
__f313_pointBX = __add(__f313_transformB["position"]["x"], __add((function()
return (__f313_tMat["col1"]["x"] * __f313_tVec["x"])
end)()
, (function()
return (__f313_tMat["col2"]["x"] * __f313_tVec["y"])
end)()
));
__f313_pointBY = __add(__f313_transformB["position"]["y"], __add((function()
return (__f313_tMat["col1"]["y"] * __f313_tVec["x"])
end)()
, (function()
return (__f313_tMat["col2"]["y"] * __f313_tVec["y"])
end)()
));
self["m_axis"]["x"] = (function()
return (__f313_pointBX - __f313_pointAX)
end)()
;
self["m_axis"]["y"] = (function()
return (__f313_pointBY - __f313_pointAY)
end)()
;
return self["m_axis"]["Normalize"](self["m_axis"])
end)()

else return (function()
local __oak_cond = __truthy((function()
return __oak_eq(__oak_acc(__f313_cache["indexB"], (function()
return 0
end)()
), __oak_acc(__f313_cache["indexB"], (function()
return 1
end)()
))
end)()
)
if __oak_eq(__oak_cond, true) then return (function()
self["m_type"] = __static_b2SeparationFunction["e_faceA"];
__f313_localPointA1 = self["m_proxyA"]["GetVertex"](self["m_proxyA"], __oak_acc(__f313_cache["indexA"], (function()
return 0
end)()
));
__f313_localPointA2 = self["m_proxyA"]["GetVertex"](self["m_proxyA"], __oak_acc(__f313_cache["indexA"], (function()
return 1
end)()
));
__f313_localPointB = self["m_proxyB"]["GetVertex"](self["m_proxyB"], __oak_acc(__f313_cache["indexB"], (function()
return 0
end)()
));
self["m_localPoint"]["x"] = (function()
return (0.5 * __add(__f313_localPointA1["x"], __f313_localPointA2["x"]))
end)()
;
self["m_localPoint"]["y"] = (function()
return (0.5 * __add(__f313_localPointA1["y"], __f313_localPointA2["y"]))
end)()
;
self["m_axis"] = __static_b2Math["CrossVF"](__static_b2Math["SubtractVV"](__f313_localPointA2, __f313_localPointA1), 1);
self["m_axis"]["Normalize"](self["m_axis"]);
__f313_tVec = self["m_axis"];
__f313_tMat = __f313_transformA["R"];
__f313_normalX = __add((function()
return (__f313_tMat["col1"]["x"] * __f313_tVec["x"])
end)()
, (function()
return (__f313_tMat["col2"]["x"] * __f313_tVec["y"])
end)()
);
__f313_normalY = __add((function()
return (__f313_tMat["col1"]["y"] * __f313_tVec["x"])
end)()
, (function()
return (__f313_tMat["col2"]["y"] * __f313_tVec["y"])
end)()
);
__f313_tVec = self["m_localPoint"];
__f313_tMat = __f313_transformA["R"];
__f313_pointAX = __add(__f313_transformA["position"]["x"], __add((function()
return (__f313_tMat["col1"]["x"] * __f313_tVec["x"])
end)()
, (function()
return (__f313_tMat["col2"]["x"] * __f313_tVec["y"])
end)()
));
__f313_pointAY = __add(__f313_transformA["position"]["y"], __add((function()
return (__f313_tMat["col1"]["y"] * __f313_tVec["x"])
end)()
, (function()
return (__f313_tMat["col2"]["y"] * __f313_tVec["y"])
end)()
));
__f313_tVec = __f313_localPointB;
__f313_tMat = __f313_transformB["R"];
__f313_pointBX = __add(__f313_transformB["position"]["x"], __add((function()
return (__f313_tMat["col1"]["x"] * __f313_tVec["x"])
end)()
, (function()
return (__f313_tMat["col2"]["x"] * __f313_tVec["y"])
end)()
));
__f313_pointBY = __add(__f313_transformB["position"]["y"], __add((function()
return (__f313_tMat["col1"]["y"] * __f313_tVec["x"])
end)()
, (function()
return (__f313_tMat["col2"]["y"] * __f313_tVec["y"])
end)()
));
__f313_s = __add((function()
return ((function()
return (__f313_pointBX - __f313_pointAX)
end)()
 * __f313_normalX)
end)()
, (function()
return ((function()
return (__f313_pointBY - __f313_pointAY)
end)()
 * __f313_normalY)
end)()
);
return (function()
local __oak_cond = __truthy((function()
return (__f313_s < 0)
end)()
)
if __oak_eq(__oak_cond, true) then return self["m_axis"]["NegativeSelf"](self["m_axis"])
else return __noop()
end
end)()

end)()

else return (function()
local __oak_cond = __truthy((function()
return __oak_eq(__oak_acc(__f313_cache["indexA"], (function()
return 0
end)()
), __oak_acc(__f313_cache["indexA"], (function()
return 0
end)()
))
end)()
)
if __oak_eq(__oak_cond, true) then return (function()
self["m_type"] = __static_b2SeparationFunction["e_faceB"];
__f313_localPointB1 = self["m_proxyB"]["GetVertex"](self["m_proxyB"], __oak_acc(__f313_cache["indexB"], (function()
return 0
end)()
));
__f313_localPointB2 = self["m_proxyB"]["GetVertex"](self["m_proxyB"], __oak_acc(__f313_cache["indexB"], (function()
return 1
end)()
));
__f313_localPointA = self["m_proxyA"]["GetVertex"](self["m_proxyA"], __oak_acc(__f313_cache["indexA"], (function()
return 0
end)()
));
self["m_localPoint"]["x"] = (function()
return (0.5 * __add(__f313_localPointB1["x"], __f313_localPointB2["x"]))
end)()
;
self["m_localPoint"]["y"] = (function()
return (0.5 * __add(__f313_localPointB1["y"], __f313_localPointB2["y"]))
end)()
;
self["m_axis"] = __static_b2Math["CrossVF"](__static_b2Math["SubtractVV"](__f313_localPointB2, __f313_localPointB1), 1);
self["m_axis"]["Normalize"](self["m_axis"]);
__f313_tVec = self["m_axis"];
__f313_tMat = __f313_transformB["R"];
__f313_normalX = __add((function()
return (__f313_tMat["col1"]["x"] * __f313_tVec["x"])
end)()
, (function()
return (__f313_tMat["col2"]["x"] * __f313_tVec["y"])
end)()
);
__f313_normalY = __add((function()
return (__f313_tMat["col1"]["y"] * __f313_tVec["x"])
end)()
, (function()
return (__f313_tMat["col2"]["y"] * __f313_tVec["y"])
end)()
);
__f313_tVec = self["m_localPoint"];
__f313_tMat = __f313_transformB["R"];
__f313_pointBX = __add(__f313_transformB["position"]["x"], __add((function()
return (__f313_tMat["col1"]["x"] * __f313_tVec["x"])
end)()
, (function()
return (__f313_tMat["col2"]["x"] * __f313_tVec["y"])
end)()
));
__f313_pointBY = __add(__f313_transformB["position"]["y"], __add((function()
return (__f313_tMat["col1"]["y"] * __f313_tVec["x"])
end)()
, (function()
return (__f313_tMat["col2"]["y"] * __f313_tVec["y"])
end)()
));
__f313_tVec = __f313_localPointA;
__f313_tMat = __f313_transformA["R"];
__f313_pointAX = __add(__f313_transformA["position"]["x"], __add((function()
return (__f313_tMat["col1"]["x"] * __f313_tVec["x"])
end)()
, (function()
return (__f313_tMat["col2"]["x"] * __f313_tVec["y"])
end)()
));
__f313_pointAY = __add(__f313_transformA["position"]["y"], __add((function()
return (__f313_tMat["col1"]["y"] * __f313_tVec["x"])
end)()
, (function()
return (__f313_tMat["col2"]["y"] * __f313_tVec["y"])
end)()
));
__f313_s = __add((function()
return ((function()
return (__f313_pointAX - __f313_pointBX)
end)()
 * __f313_normalX)
end)()
, (function()
return ((function()
return (__f313_pointAY - __f313_pointBY)
end)()
 * __f313_normalY)
end)()
);
return (function()
local __oak_cond = __truthy((function()
return (__f313_s < 0)
end)()
)
if __oak_eq(__oak_cond, true) then return self["m_axis"]["NegativeSelf"](self["m_axis"])
else return __noop()
end
end)()

end)()

else return (function()
__f313_localPointA1 = self["m_proxyA"]["GetVertex"](self["m_proxyA"], __oak_acc(__f313_cache["indexA"], (function()
return 0
end)()
));
__f313_localPointA2 = self["m_proxyA"]["GetVertex"](self["m_proxyA"], __oak_acc(__f313_cache["indexA"], (function()
return 1
end)()
));
__f313_localPointB1 = self["m_proxyB"]["GetVertex"](self["m_proxyB"], __oak_acc(__f313_cache["indexB"], (function()
return 0
end)()
));
__f313_localPointB2 = self["m_proxyB"]["GetVertex"](self["m_proxyB"], __oak_acc(__f313_cache["indexB"], (function()
return 1
end)()
));
local __f313_pA = __static_b2Math["MulX"](__f313_transformA, __f313_localPointA);
local __f313_dA = __static_b2Math["MulMV"](__f313_transformA["R"], __static_b2Math["SubtractVV"](__f313_localPointA2, __f313_localPointA1));
local __f313_pB = __static_b2Math["MulX"](__f313_transformB, __f313_localPointB);
local __f313_dB = __static_b2Math["MulMV"](__f313_transformB["R"], __static_b2Math["SubtractVV"](__f313_localPointB2, __f313_localPointB1));
local __f313_a = __add((function()
return (__f313_dA["x"] * __f313_dA["x"])
end)()
, (function()
return (__f313_dA["y"] * __f313_dA["y"])
end)()
);
local __f313_e = __add((function()
return (__f313_dB["x"] * __f313_dB["x"])
end)()
, (function()
return (__f313_dB["y"] * __f313_dB["y"])
end)()
);
local __f313_r = __static_b2Math["SubtractVV"](__f313_dB, __f313_dA);
local __f313_c = __add((function()
return (__f313_dA["x"] * __f313_r["x"])
end)()
, (function()
return (__f313_dA["y"] * __f313_r["y"])
end)()
);
local __f313_f = __add((function()
return (__f313_dB["x"] * __f313_r["x"])
end)()
, (function()
return (__f313_dB["y"] * __f313_r["y"])
end)()
);
local __f313_b = __add((function()
return (__f313_dA["x"] * __f313_dB["x"])
end)()
, (function()
return (__f313_dA["y"] * __f313_dB["y"])
end)()
);
local __f313_denom = (function()
return ((function()
return (__f313_a * __f313_e)
end)()
 - (function()
return (__f313_b * __f313_b)
end)()
)
end)()
;
__f313_s = 0;
(function()
local __oak_cond = __truthy((function()
return (not __oak_eq(__f313_denom, 0))
end)()
)
if __oak_eq(__oak_cond, true) then __f313_s = __static_b2Math["Clamp"]((function()
return ((function()
return ((function()
return (__f313_b * __f313_f)
end)()
 - (function()
return (__f313_c * __f313_e)
end)()
)
end)()
 / __f313_denom)
end)()
, 0, 1)
return __f313_s
else return __noop()
end
end)()
;
local __f313_t = (function()
return (__add((function()
return (__f313_b * __f313_s)
end)()
, __f313_f) / __f313_e)
end)()
;
(function()
local __oak_cond = __truthy((function()
return (__f313_t < 0)
end)()
)
if __oak_eq(__oak_cond, true) then return (function()
__f313_t = 0;
__f313_s = __static_b2Math["Clamp"]((function()
return ((function()
return (__f313_b - __f313_c)
end)()
 / __f313_a)
end)()
, 0, 1)
return __f313_s
end)()

else return __noop()
end
end)()
;
__f313_localPointA = b2Vec2();
__f313_localPointA["x"] = __add(__f313_localPointA1["x"], (function()
return (__f313_s * (function()
return (__f313_localPointA2["x"] - __f313_localPointA1["x"])
end)()
)
end)()
);
__f313_localPointA["y"] = __add(__f313_localPointA1["y"], (function()
return (__f313_s * (function()
return (__f313_localPointA2["y"] - __f313_localPointA1["y"])
end)()
)
end)()
);
__f313_localPointB = b2Vec2();
__f313_localPointB["x"] = __add(__f313_localPointB1["x"], (function()
return (__f313_s * (function()
return (__f313_localPointB2["x"] - __f313_localPointB1["x"])
end)()
)
end)()
);
__f313_localPointB["y"] = __add(__f313_localPointB1["y"], (function()
return (__f313_s * (function()
return (__f313_localPointB2["y"] - __f313_localPointB1["y"])
end)()
)
end)()
);
return (function()
local __oak_cond = __truthy(__or((function()
return __oak_eq(__f313_s, 0)
end)()
, (function()
return __oak_eq(__f313_s, 1)
end)()
))
if __oak_eq(__oak_cond, true) then return (function()
self["m_type"] = __static_b2SeparationFunction["e_faceB"];
self["m_axis"] = __static_b2Math["CrossVF"](__static_b2Math["SubtractVV"](__f313_localPointB2, __f313_localPointB1), 1);
self["m_axis"]["Normalize"](self["m_axis"]);
self["m_localPoint"] = __f313_localPointB;
__f313_tVec = self["m_axis"];
__f313_tMat = __f313_transformB["R"];
__f313_normalX = __add((function()
return (__f313_tMat["col1"]["x"] * __f313_tVec["x"])
end)()
, (function()
return (__f313_tMat["col2"]["x"] * __f313_tVec["y"])
end)()
);
__f313_normalY = __add((function()
return (__f313_tMat["col1"]["y"] * __f313_tVec["x"])
end)()
, (function()
return (__f313_tMat["col2"]["y"] * __f313_tVec["y"])
end)()
);
__f313_tVec = self["m_localPoint"];
__f313_tMat = __f313_transformB["R"];
__f313_pointBX = __add(__f313_transformB["position"]["x"], __add((function()
return (__f313_tMat["col1"]["x"] * __f313_tVec["x"])
end)()
, (function()
return (__f313_tMat["col2"]["x"] * __f313_tVec["y"])
end)()
));
__f313_pointBY = __add(__f313_transformB["position"]["y"], __add((function()
return (__f313_tMat["col1"]["y"] * __f313_tVec["x"])
end)()
, (function()
return (__f313_tMat["col2"]["y"] * __f313_tVec["y"])
end)()
));
__f313_tVec = __f313_localPointA;
__f313_tMat = __f313_transformA["R"];
__f313_pointAX = __add(__f313_transformA["position"]["x"], __add((function()
return (__f313_tMat["col1"]["x"] * __f313_tVec["x"])
end)()
, (function()
return (__f313_tMat["col2"]["x"] * __f313_tVec["y"])
end)()
));
__f313_pointAY = __add(__f313_transformA["position"]["y"], __add((function()
return (__f313_tMat["col1"]["y"] * __f313_tVec["x"])
end)()
, (function()
return (__f313_tMat["col2"]["y"] * __f313_tVec["y"])
end)()
));
__f313_sgn = __add((function()
return ((function()
return (__f313_pointAX - __f313_pointBX)
end)()
 * __f313_normalX)
end)()
, (function()
return ((function()
return (__f313_pointAY - __f313_pointBY)
end)()
 * __f313_normalY)
end)()
);
return (function()
local __oak_cond = __truthy((function()
return (__f313_s < 0)
end)()
)
if __oak_eq(__oak_cond, true) then return self["m_axis"]["NegativeSelf"](self["m_axis"])
else return __noop()
end
end)()

end)()

else return (function()
self["m_type"] = __static_b2SeparationFunction["e_faceA"];
self["m_axis"] = __static_b2Math["CrossVF"](__static_b2Math["SubtractVV"](__f313_localPointA2, __f313_localPointA1), 1);
self["m_localPoint"] = __f313_localPointA;
__f313_tVec = self["m_axis"];
__f313_tMat = __f313_transformA["R"];
__f313_normalX = __add((function()
return (__f313_tMat["col1"]["x"] * __f313_tVec["x"])
end)()
, (function()
return (__f313_tMat["col2"]["x"] * __f313_tVec["y"])
end)()
);
__f313_normalY = __add((function()
return (__f313_tMat["col1"]["y"] * __f313_tVec["x"])
end)()
, (function()
return (__f313_tMat["col2"]["y"] * __f313_tVec["y"])
end)()
);
__f313_tVec = self["m_localPoint"];
__f313_tMat = __f313_transformA["R"];
__f313_pointAX = __add(__f313_transformA["position"]["x"], __add((function()
return (__f313_tMat["col1"]["x"] * __f313_tVec["x"])
end)()
, (function()
return (__f313_tMat["col2"]["x"] * __f313_tVec["y"])
end)()
));
__f313_pointAY = __add(__f313_transformA["position"]["y"], __add((function()
return (__f313_tMat["col1"]["y"] * __f313_tVec["x"])
end)()
, (function()
return (__f313_tMat["col2"]["y"] * __f313_tVec["y"])
end)()
));
__f313_tVec = __f313_localPointB;
__f313_tMat = __f313_transformB["R"];
__f313_pointBX = __add(__f313_transformB["position"]["x"], __add((function()
return (__f313_tMat["col1"]["x"] * __f313_tVec["x"])
end)()
, (function()
return (__f313_tMat["col2"]["x"] * __f313_tVec["y"])
end)()
));
__f313_pointBY = __add(__f313_transformB["position"]["y"], __add((function()
return (__f313_tMat["col1"]["y"] * __f313_tVec["x"])
end)()
, (function()
return (__f313_tMat["col2"]["y"] * __f313_tVec["y"])
end)()
));
__f313_sgn = __add((function()
return ((function()
return (__f313_pointBX - __f313_pointAX)
end)()
 * __f313_normalX)
end)()
, (function()
return ((function()
return (__f313_pointBY - __f313_pointAY)
end)()
 * __f313_normalY)
end)()
);
return (function()
local __oak_cond = __truthy((function()
return (__f313_s < 0)
end)()
)
if __oak_eq(__oak_cond, true) then return self["m_axis"]["NegativeSelf"](self["m_axis"])
else return __noop()
end
end)()

end)()

end
end)()

end)()

end
end)()

end
end)()

end
end)()

end;
__proto_b2SeparationFunction["Evaluate"] = function(self, __f314_transformA, __f314_transformB)
local __f314_axisA = __noop();
local __f314_axisB = __noop();
local __f314_localPointA = __noop();
local __f314_localPointB = __noop();
local __f314_pointA = __noop();
local __f314_pointB = __noop();
local __f314_seperation = 0;
local __f314_normal = __noop();
return (function()
local __oak_cond = self["m_type"]
if __oak_eq(__oak_cond, __static_b2SeparationFunction["e_points"]) then return (function()
__f314_axisA = __static_b2Math["MulTMV"](__f314_transformA["R"], self["m_axis"]);
__f314_axisB = __static_b2Math["MulTMV"](__f314_transformB["R"], self["m_axis"]["GetNegative"](self["m_axis"]));
__f314_localPointA = self["m_proxyA"]["GetSupportVertex"](self["m_proxyA"], __f314_axisA);
__f314_localPointB = self["m_proxyB"]["GetSupportVertex"](self["m_proxyB"], __f314_axisB);
__f314_pointA = __static_b2Math["MulX"](__f314_transformA, __f314_localPointA);
__f314_pointB = __static_b2Math["MulX"](__f314_transformB, __f314_localPointB);
__f314_seperation = __add((function()
return ((function()
return (__f314_pointB["x"] - __f314_pointA["x"])
end)()
 * self["m_axis"]["x"])
end)()
, (function()
return ((function()
return (__f314_pointB["y"] - __f314_pointA["y"])
end)()
 * self["m_axis"]["y"])
end)()
);
return __f314_seperation
end)()

elseif __oak_eq(__oak_cond, __static_b2SeparationFunction["e_faceA"]) then return (function()
__f314_normal = __static_b2Math["MulMV"](__f314_transformA["R"], self["m_axis"]);
__f314_pointA = __static_b2Math["MulX"](__f314_transformA, self["m_localPoint"]);
__f314_axisB = __static_b2Math["MulTMV"](__f314_transformB["R"], __f314_normal["GetNegative"](__f314_normal));
__f314_localPointB = self["m_proxyB"]["GetSupportVertex"](self["m_proxyB"], __f314_axisB);
__f314_pointB = __static_b2Math["MulX"](__f314_transformB, __f314_localPointB);
__f314_seperation = __add((function()
return ((function()
return (__f314_pointB["x"] - __f314_pointA["x"])
end)()
 * __f314_normal["x"])
end)()
, (function()
return ((function()
return (__f314_pointB["y"] - __f314_pointA["y"])
end)()
 * __f314_normal["y"])
end)()
);
return __f314_seperation
end)()

elseif __oak_eq(__oak_cond, __static_b2SeparationFunction["e_faceB"]) then return (function()
__f314_normal = __static_b2Math["MulMV"](__f314_transformB["R"], self["m_axis"]);
__f314_pointB = __static_b2Math["MulX"](__f314_transformB, self["m_localPoint"]);
__f314_axisA = __static_b2Math["MulTMV"](__f314_transformA["R"], __f314_normal["GetNegative"](__f314_normal));
__f314_localPointA = self["m_proxyA"]["GetSupportVertex"](self["m_proxyA"], __f314_axisA);
__f314_pointA = __static_b2Math["MulX"](__f314_transformA, __f314_localPointA);
__f314_seperation = __add((function()
return ((function()
return (__f314_pointA["x"] - __f314_pointB["x"])
end)()
 * __f314_normal["x"])
end)()
, (function()
return ((function()
return (__f314_pointA["y"] - __f314_pointB["y"])
end)()
 * __f314_normal["y"])
end)()
);
return __f314_seperation
end)()

else return (function()
__static_b2Settings["b2Assert"](false);
return 0
end)()

end
end)()

end;
__static_b2SeparationFunction = {};
b2SeparationFunction = function()
local self = {["__type"]='b2SeparationFunction', ["__types"]={'b2SeparationFunction'}};
self["Initialize"] = __proto_b2SeparationFunction["Initialize"];
self["Evaluate"] = __proto_b2SeparationFunction["Evaluate"];
(function()
self["m_localPoint"] = b2Vec2();
self["m_axis"] = b2Vec2()
return self["m_axis"]
end)()
;
return self
end;
Box2D["Collision"]["b2SeparationFunction"] = b2SeparationFunction;
__proto_b2SimplexCache = {};
__static_b2SimplexCache = {};
b2SimplexCache = function()
local self = {["__type"]='b2SimplexCache', ["__types"]={'b2SimplexCache'}};
(function()
self["indexA"] = Vector_a2j_Number(3);
self["indexB"] = Vector_a2j_Number(3)
return self["indexB"]
end)()
;
return self
end;
Box2D["Collision"]["b2SimplexCache"] = b2SimplexCache;
__proto_b2SimplexVertex = {};
__proto_b2SimplexVertex["Set"] = function(self, __f317_other)
self["wA"]["SetV"](self["wA"], __f317_other["wA"]);
self["wB"]["SetV"](self["wB"], __f317_other["wB"]);
self["w"]["SetV"](self["w"], __f317_other["w"]);
self["a"] = __f317_other["a"];
self["indexA"] = __f317_other["indexA"];
self["indexB"] = __f317_other["indexB"]
return self["indexB"]
end;
__static_b2SimplexVertex = {};
b2SimplexVertex = function()
local self = {["__type"]='b2SimplexVertex', ["__types"]={'b2SimplexVertex'}};
self["Set"] = __proto_b2SimplexVertex["Set"];
return self
end;
Box2D["Collision"]["b2SimplexVertex"] = b2SimplexVertex;
__static_b2TimeOfImpact = {};
__static_b2TimeOfImpact["TimeOfImpact"] = function(__f318_input)
(function()
__static_b2TimeOfImpact["b2_toiCalls"] = __as_oak_string(__static_b2TimeOfImpact["b2_toiCalls"] + 1)
return __static_b2TimeOfImpact["b2_toiCalls"]
end)()
;
local __f318_proxyA = __f318_input["proxyA"];
local __f318_proxyB = __f318_input["proxyB"];
local __f318_sweepA = __f318_input["sweepA"];
local __f318_sweepB = __f318_input["sweepB"];
__static_b2Settings["b2Assert"]((function()
return __oak_eq(__f318_sweepA["t0"], __f318_sweepB["t0"])
end)()
);
__static_b2Settings["b2Assert"]((function()
return ((function()
return (1 - __f318_sweepA["t0"])
end)()
 > __Number["MIN_VALUE"])
end)()
);
local __f318_radius = __add(__f318_proxyA["m_radius"], __f318_proxyB["m_radius"]);
local __f318_tolerance = __f318_input["tolerance"];
local __f318_alpha = 0;
local __f318_k_maxIterations = 1000;
local __f318_iter = 0;
local __f318_target = 0;
__static_b2TimeOfImpact["s_cache"]["count"] = 0;
__static_b2TimeOfImpact["s_distanceInput"]["useRadii"] = false;
(function()
__noop();
local function __loop88()
return (function()
local __oak_cond = true
if __oak_eq(__oak_cond, true) then return (function()
local __r = (function()
return (function()
__f318_sweepA["GetTransform"](__f318_sweepA, __static_b2TimeOfImpact["s_xfA"], __f318_alpha);
__f318_sweepB["GetTransform"](__f318_sweepB, __static_b2TimeOfImpact["s_xfB"], __f318_alpha);
__static_b2TimeOfImpact["s_distanceInput"]["proxyA"] = __f318_proxyA;
__static_b2TimeOfImpact["s_distanceInput"]["proxyB"] = __f318_proxyB;
__static_b2TimeOfImpact["s_distanceInput"]["transformA"] = __static_b2TimeOfImpact["s_xfA"];
__static_b2TimeOfImpact["s_distanceInput"]["transformB"] = __static_b2TimeOfImpact["s_xfB"];
__static_b2Distance["Distance"](__static_b2TimeOfImpact["s_distanceOutput"], __static_b2TimeOfImpact["s_cache"], __static_b2TimeOfImpact["s_distanceInput"]);
(function()
local __oak_cond = __truthy((function()
return (__static_b2TimeOfImpact["s_distanceOutput"]["distance"] <= 0)
end)()
)
if __oak_eq(__oak_cond, true) then return (function()
__f318_alpha = 1;
return 'break'
end)()

else return __noop()
end
end)()
;
__static_b2TimeOfImpact["s_fcn"]["Initialize"](__static_b2TimeOfImpact["s_fcn"], __static_b2TimeOfImpact["s_cache"], __f318_proxyA, __static_b2TimeOfImpact["s_xfA"], __f318_proxyB, __static_b2TimeOfImpact["s_xfB"]);
local __f318_separation = __static_b2TimeOfImpact["s_fcn"]["Evaluate"](__static_b2TimeOfImpact["s_fcn"], __static_b2TimeOfImpact["s_xfA"], __static_b2TimeOfImpact["s_xfB"]);
(function()
local __oak_cond = __truthy((function()
return (__f318_separation <= 0)
end)()
)
if __oak_eq(__oak_cond, true) then return (function()
__f318_alpha = 1;
return 'break'
end)()

else return __noop()
end
end)()
;
(function()
local __oak_cond = __truthy((function()
return __oak_eq(__f318_iter, 0)
end)()
)
if __oak_eq(__oak_cond, true) then return (function()
local __oak_cond = __truthy((function()
return (__f318_separation > __f318_radius)
end)()
)
if __oak_eq(__oak_cond, true) then __f318_target = __static_b2Math["Max"]((function()
return (__f318_radius - __f318_tolerance)
end)()
, (function()
return (0.75 * __f318_radius)
end)()
)
return __f318_target
else __f318_target = __static_b2Math["Max"]((function()
return (__f318_separation - __f318_tolerance)
end)()
, (function()
return (0.02 * __f318_radius)
end)()
)
return __f318_target
end
end)()

else return __noop()
end
end)()
;
(function()
local __oak_cond = __truthy((function()
return ((function()
return (__f318_separation - __f318_target)
end)()
 < (function()
return (0.5 * __f318_tolerance)
end)()
)
end)()
)
if __oak_eq(__oak_cond, true) then return (function()
(function()
local __oak_cond = __truthy((function()
return __oak_eq(__f318_iter, 0)
end)()
)
if __oak_eq(__oak_cond, true) then return (function()
__f318_alpha = 1;
return 'break'
end)()

else return __noop()
end
end)()
;
return 'break'
end)()

else return __noop()
end
end)()
;
local __f318_newAlpha = __f318_alpha;
(function()
local __f318_x1 = __f318_alpha;
local __f318_x2 = 1;
local __f318_f1 = __f318_separation;
__f318_sweepA["GetTransform"](__f318_sweepA, __static_b2TimeOfImpact["s_xfA"], __f318_x2);
__f318_sweepB["GetTransform"](__f318_sweepB, __static_b2TimeOfImpact["s_xfB"], __f318_x2);
local __f318_f2 = __static_b2TimeOfImpact["s_fcn"]["Evaluate"](__static_b2TimeOfImpact["s_fcn"], __static_b2TimeOfImpact["s_xfA"], __static_b2TimeOfImpact["s_xfB"]);
(function()
local __oak_cond = __truthy((function()
return (__f318_f2 >= __f318_target)
end)()
)
if __oak_eq(__oak_cond, true) then return (function()
__f318_alpha = 1;
return 'break'
end)()

else return __noop()
end
end)()
;
local __f318_rootIterCount = 0;
return (function()
__noop();
local function __loop89()
return (function()
local __oak_cond = true
if __oak_eq(__oak_cond, true) then return (function()
local __r = (function()
return (function()
local __f318_x = 0;
(function()
local __oak_cond = __truthy(__band(__f318_rootIterCount, 1))
if __oak_eq(__oak_cond, true) then __f318_x = __add(__f318_x1, (function()
return ((function()
return ((function()
return (__f318_target - __f318_f1)
end)()
 * (function()
return (__f318_x2 - __f318_x1)
end)()
)
end)()
 / (function()
return (__f318_f2 - __f318_f1)
end)()
)
end)()
)
return __f318_x
else __f318_x = (function()
return (0.5 * __add(__f318_x1, __f318_x2))
end)()

return __f318_x
end
end)()
;
__f318_sweepA["GetTransform"](__f318_sweepA, __static_b2TimeOfImpact["s_xfA"], __f318_x);
__f318_sweepB["GetTransform"](__f318_sweepB, __static_b2TimeOfImpact["s_xfB"], __f318_x);
local __f318_f = __static_b2TimeOfImpact["s_fcn"]["Evaluate"](__static_b2TimeOfImpact["s_fcn"], __static_b2TimeOfImpact["s_xfA"], __static_b2TimeOfImpact["s_xfB"]);
(function()
local __oak_cond = __truthy((function()
return (__static_b2Math["Abs"]((function()
return (__f318_f - __f318_target)
end)()
) < (function()
return (0.025 * __f318_tolerance)
end)()
)
end)()
)
if __oak_eq(__oak_cond, true) then return (function()
__f318_newAlpha = __f318_x;
return 'break'
end)()

else return __noop()
end
end)()
;
(function()
local __oak_cond = __truthy((function()
return (__f318_f > __f318_target)
end)()
)
if __oak_eq(__oak_cond, true) then return (function()
__f318_x1 = __f318_x;
__f318_f1 = __f318_f
return __f318_f1
end)()

else return (function()
__f318_x2 = __f318_x;
__f318_f2 = __f318_f
return __f318_f2
end)()

end
end)()
;
(function()
__f318_rootIterCount = __as_oak_string(__f318_rootIterCount + 1)
return __f318_rootIterCount
end)()
;
(function()
__static_b2TimeOfImpact["b2_toiRootIters"] = __as_oak_string(__static_b2TimeOfImpact["b2_toiRootIters"] + 1)
return __static_b2TimeOfImpact["b2_toiRootIters"]
end)()
;
return (function()
local __oak_cond = __truthy((function()
return __oak_eq(__f318_rootIterCount, 50)
end)()
)
if __oak_eq(__oak_cond, true) then return 'break'
else return __noop()
end
end)()

end)()

end)()
;
return (function()
local __oak_cond = __r
if __oak_eq(__oak_cond, 'break') then return nil
else return (function()
__noop();
return __loop89()
end)()

end
end)()

end)()

else return nil
end
end)()

end;
return __loop89()
end)()

end)()
;
(function()
local __oak_cond = __truthy((function()
return (__f318_newAlpha < (function()
return (__add(1, (function()
return (100 * __Number["MIN_VALUE"])
end)()
) * __f318_alpha)
end)()
)
end)()
)
if __oak_eq(__oak_cond, true) then return 'break'
else return __noop()
end
end)()
;
__f318_alpha = __f318_newAlpha;
(function()
local __tmp318_92 = __f318_iter;
__f318_iter = __as_oak_string(__f318_iter + 1);
return __tmp318_92
end)()
;
(function()
__static_b2TimeOfImpact["b2_toiIters"] = __as_oak_string(__static_b2TimeOfImpact["b2_toiIters"] + 1)
return __static_b2TimeOfImpact["b2_toiIters"]
end)()
;
return (function()
local __oak_cond = __truthy((function()
return __oak_eq(__f318_iter, __f318_k_maxIterations)
end)()
)
if __oak_eq(__oak_cond, true) then return 'break'
else return __noop()
end
end)()

end)()

end)()
;
return (function()
local __oak_cond = __r
if __oak_eq(__oak_cond, 'break') then return nil
else return (function()
__noop();
return __loop88()
end)()

end
end)()

end)()

else return nil
end
end)()

end;
return __loop88()
end)()
;
return __f318_alpha
end;
b2TimeOfImpact = __static_b2TimeOfImpact;
Box2D["Collision"]["b2TimeOfImpact"] = b2TimeOfImpact;
__proto_b2TOIInput = {};
__static_b2TOIInput = {};
b2TOIInput = function()
local self = {["__type"]='b2TOIInput', ["__types"]={'b2TOIInput'}};
(function()
self["proxyA"] = b2DistanceProxy();
self["proxyB"] = b2DistanceProxy();
self["sweepA"] = b2Sweep();
self["sweepB"] = b2Sweep()
return self["sweepB"]
end)()
;
return self
end;
Box2D["Collision"]["b2TOIInput"] = b2TOIInput;
__proto_ClipVertex = {};
__proto_ClipVertex["Set"] = function(self, __f320_other)
self["v"]["SetV"](self["v"], __f320_other["v"]);
return self["id"]["Set"](self["id"], __f320_other["id"])
end;
__static_ClipVertex = {};
ClipVertex = function()
local self = {["__type"]='ClipVertex', ["__types"]={'ClipVertex'}};
self["Set"] = __proto_ClipVertex["Set"];
(function()
self["v"] = b2Vec2();
self["id"] = b2ContactID()
return self["id"]
end)()
;
return self
end;
Box2D["Collision"]["ClipVertex"] = ClipVertex;
__proto_Features = {};
__proto_Features["__dummy__"] = function(self)
return nil
end;
__static_Features = {};
Features = function()
local self = {["__type"]='Features', ["__types"]={'Features'}};
self["__dummy__"] = __proto_Features["__dummy__"];
return self
end;
Box2D["Collision"]["Features"] = Features;
__proto_b2MassData = {};
__static_b2MassData = {};
b2MassData = function()
local self = {["__type"]='b2MassData', ["__types"]={'b2MassData'}};
(function()
self["mass"] = 0;
self["center"] = b2Vec2(0, 0);
self["I"] = 0
return self["I"]
end)()
;
return self
end;
Box2D["Collision"]["Shapes"]["b2MassData"] = b2MassData;
__static_b2Settings = {};
__static_b2Settings["b2MixFriction"] = function(__f324_friction1, __f324_friction2)
(function()
local __oak_cond = __truthy((function()
return __oak_eq(__f324_friction1, nil)
end)()
)
if __oak_eq(__oak_cond, true) then __f324_friction1 = 0
return __f324_friction1
else return __noop()
end
end)()
;
(function()
local __oak_cond = __truthy((function()
return __oak_eq(__f324_friction2, nil)
end)()
)
if __oak_eq(__oak_cond, true) then __f324_friction2 = 0
return __f324_friction2
else return __noop()
end
end)()
;
return __Math["sqrt"]((function()
return (__f324_friction1 * __f324_friction2)
end)()
)
end;
__static_b2Settings["b2MixRestitution"] = function(__f325_restitution1, __f325_restitution2)
(function()
local __oak_cond = __truthy((function()
return __oak_eq(__f325_restitution1, nil)
end)()
)
if __oak_eq(__oak_cond, true) then __f325_restitution1 = 0
return __f325_restitution1
else return __noop()
end
end)()
;
(function()
local __oak_cond = __truthy((function()
return __oak_eq(__f325_restitution2, nil)
end)()
)
if __oak_eq(__oak_cond, true) then __f325_restitution2 = 0
return __f325_restitution2
else return __noop()
end
end)()
;
return (function()
local __oak_cond = __truthy((function()
return (__f325_restitution1 > __f325_restitution2)
end)()
)
if __oak_eq(__oak_cond, true) then return __f325_restitution1
else return __f325_restitution2
end
end)()

end;
__static_b2Settings["b2Assert"] = function(__f326_a)
return (function()
local __oak_cond = __truthy(__not(__f326_a))
if __oak_eq(__oak_cond, true) then return __throw('Assertion Failed')
else return __noop()
end
end)()

end;
b2Settings = __static_b2Settings;
Box2D["Common"]["b2Settings"] = b2Settings;
__static_b2Math = {};
__static_b2Math["IsValid"] = function(__f327_x)
(function()
local __oak_cond = __truthy((function()
return __oak_eq(__f327_x, nil)
end)()
)
if __oak_eq(__oak_cond, true) then __f327_x = 0
return __f327_x
else return __noop()
end
end)()
;
return __isFinite(__f327_x)
end;
__static_b2Math["Dot"] = function(__f328_a, __f328_b)
return __add((function()
return (__f328_a["x"] * __f328_b["x"])
end)()
, (function()
return (__f328_a["y"] * __f328_b["y"])
end)()
)
end;
__static_b2Math["CrossVV"] = function(__f329_a, __f329_b)
return ((function()
return (__f329_a["x"] * __f329_b["y"])
end)()
 - (function()
return (__f329_a["y"] * __f329_b["x"])
end)()
)
end;
__static_b2Math["CrossVF"] = function(__f330_a, __f330_s)
(function()
local __oak_cond = __truthy((function()
return __oak_eq(__f330_s, nil)
end)()
)
if __oak_eq(__oak_cond, true) then __f330_s = 0
return __f330_s
else return __noop()
end
end)()
;
local __f330_v = b2Vec2((function()
return (__f330_s * __f330_a["y"])
end)()
, (function()
return ((function()
return (-__f330_s)
end)()
 * __f330_a["x"])
end)()
);
return __f330_v
end;
__static_b2Math["CrossFV"] = function(__f331_s, __f331_a)
(function()
local __oak_cond = __truthy((function()
return __oak_eq(__f331_s, nil)
end)()
)
if __oak_eq(__oak_cond, true) then __f331_s = 0
return __f331_s
else return __noop()
end
end)()
;
local __f331_v = b2Vec2((function()
return ((function()
return (-__f331_s)
end)()
 * __f331_a["y"])
end)()
, (function()
return (__f331_s * __f331_a["x"])
end)()
);
return __f331_v
end;
__static_b2Math["MulMV"] = function(__f332_A, __f332_v)
local __f332_u = b2Vec2(__add((function()
return (__f332_A["col1"]["x"] * __f332_v["x"])
end)()
, (function()
return (__f332_A["col2"]["x"] * __f332_v["y"])
end)()
), __add((function()
return (__f332_A["col1"]["y"] * __f332_v["x"])
end)()
, (function()
return (__f332_A["col2"]["y"] * __f332_v["y"])
end)()
));
return __f332_u
end;
__static_b2Math["MulTMV"] = function(__f333_A, __f333_v)
local __f333_u = b2Vec2(__static_b2Math["Dot"](__f333_v, __f333_A["col1"]), __static_b2Math["Dot"](__f333_v, __f333_A["col2"]));
return __f333_u
end;
__static_b2Math["MulX"] = function(__f334_T, __f334_v)
local __f334_a = __static_b2Math["MulMV"](__f334_T["R"], __f334_v);
__f334_a["x"] = __add(__f334_a["x"], __f334_T["position"]["x"]);
__f334_a["y"] = __add(__f334_a["y"], __f334_T["position"]["y"]);
return __f334_a
end;
__static_b2Math["MulXT"] = function(__f335_T, __f335_v)
local __f335_a = __static_b2Math["SubtractVV"](__f335_v, __f335_T["position"]);
local __f335_tX = __add((function()
return (__f335_a["x"] * __f335_T["R"]["col1"]["x"])
end)()
, (function()
return (__f335_a["y"] * __f335_T["R"]["col1"]["y"])
end)()
);
__f335_a["y"] = __add((function()
return (__f335_a["x"] * __f335_T["R"]["col2"]["x"])
end)()
, (function()
return (__f335_a["y"] * __f335_T["R"]["col2"]["y"])
end)()
);
__f335_a["x"] = __f335_tX;
return __f335_a
end;
__static_b2Math["AddVV"] = function(__f336_a, __f336_b)
local __f336_v = b2Vec2(__add(__f336_a["x"], __f336_b["x"]), __add(__f336_a["y"], __f336_b["y"]));
return __f336_v
end;
__static_b2Math["SubtractVV"] = function(__f337_a, __f337_b)
local __f337_v = b2Vec2((function()
return (__f337_a["x"] - __f337_b["x"])
end)()
, (function()
return (__f337_a["y"] - __f337_b["y"])
end)()
);
return __f337_v
end;
__static_b2Math["Distance"] = function(__f338_a, __f338_b)
local __f338_cX = (function()
return (__f338_a["x"] - __f338_b["x"])
end)()
;
local __f338_cY = (function()
return (__f338_a["y"] - __f338_b["y"])
end)()
;
return __Math["sqrt"](__add((function()
return (__f338_cX * __f338_cX)
end)()
, (function()
return (__f338_cY * __f338_cY)
end)()
))
end;
__static_b2Math["DistanceSquared"] = function(__f339_a, __f339_b)
local __f339_cX = (function()
return (__f339_a["x"] - __f339_b["x"])
end)()
;
local __f339_cY = (function()
return (__f339_a["y"] - __f339_b["y"])
end)()
;
return __add((function()
return (__f339_cX * __f339_cX)
end)()
, (function()
return (__f339_cY * __f339_cY)
end)()
)
end;
__static_b2Math["MulFV"] = function(__f340_s, __f340_a)
(function()
local __oak_cond = __truthy((function()
return __oak_eq(__f340_s, nil)
end)()
)
if __oak_eq(__oak_cond, true) then __f340_s = 0
return __f340_s
else return __noop()
end
end)()
;
local __f340_v = b2Vec2((function()
return (__f340_s * __f340_a["x"])
end)()
, (function()
return (__f340_s * __f340_a["y"])
end)()
);
return __f340_v
end;
__static_b2Math["AddMM"] = function(__f341_A, __f341_B)
local __f341_C = __static_b2Mat22["FromVV"](__static_b2Math["AddVV"](__f341_A["col1"], __f341_B["col1"]), __static_b2Math["AddVV"](__f341_A["col2"], __f341_B["col2"]));
return __f341_C
end;
__static_b2Math["MulMM"] = function(__f342_A, __f342_B)
local __f342_C = __static_b2Mat22["FromVV"](__static_b2Math["MulMV"](__f342_A, __f342_B["col1"]), __static_b2Math["MulMV"](__f342_A, __f342_B["col2"]));
return __f342_C
end;
__static_b2Math["MulTMM"] = function(__f343_A, __f343_B)
local __f343_c1 = b2Vec2(__static_b2Math["Dot"](__f343_A["col1"], __f343_B["col1"]), __static_b2Math["Dot"](__f343_A["col2"], __f343_B["col1"]));
local __f343_c2 = b2Vec2(__static_b2Math["Dot"](__f343_A["col1"], __f343_B["col2"]), __static_b2Math["Dot"](__f343_A["col2"], __f343_B["col2"]));
local __f343_C = __static_b2Mat22["FromVV"](__f343_c1, __f343_c2);
return __f343_C
end;
__static_b2Math["Abs"] = function(__f344_a)
(function()
local __oak_cond = __truthy((function()
return __oak_eq(__f344_a, nil)
end)()
)
if __oak_eq(__oak_cond, true) then __f344_a = 0
return __f344_a
else return __noop()
end
end)()
;
return (function()
local __oak_cond = __truthy((function()
return (__f344_a > 0)
end)()
)
if __oak_eq(__oak_cond, true) then return __f344_a
else return (function()
return (-__f344_a)
end)()

end
end)()

end;
__static_b2Math["AbsV"] = function(__f345_a)
local __f345_b = b2Vec2(__static_b2Math["Abs"](__f345_a["x"]), __static_b2Math["Abs"](__f345_a["y"]));
return __f345_b
end;
__static_b2Math["AbsM"] = function(__f346_A)
local __f346_B = __static_b2Mat22["FromVV"](__static_b2Math["AbsV"](__f346_A["col1"]), __static_b2Math["AbsV"](__f346_A["col2"]));
return __f346_B
end;
__static_b2Math["Min"] = function(__f347_a, __f347_b)
(function()
local __oak_cond = __truthy((function()
return __oak_eq(__f347_a, nil)
end)()
)
if __oak_eq(__oak_cond, true) then __f347_a = 0
return __f347_a
else return __noop()
end
end)()
;
(function()
local __oak_cond = __truthy((function()
return __oak_eq(__f347_b, nil)
end)()
)
if __oak_eq(__oak_cond, true) then __f347_b = 0
return __f347_b
else return __noop()
end
end)()
;
return (function()
local __oak_cond = __truthy((function()
return (__f347_a < __f347_b)
end)()
)
if __oak_eq(__oak_cond, true) then return __f347_a
else return __f347_b
end
end)()

end;
__static_b2Math["MinV"] = function(__f348_a, __f348_b)
local __f348_c = b2Vec2(__static_b2Math["Min"](__f348_a["x"], __f348_b["x"]), __static_b2Math["Min"](__f348_a["y"], __f348_b["y"]));
return __f348_c
end;
__static_b2Math["Max"] = function(__f349_a, __f349_b)
(function()
local __oak_cond = __truthy((function()
return __oak_eq(__f349_a, nil)
end)()
)
if __oak_eq(__oak_cond, true) then __f349_a = 0
return __f349_a
else return __noop()
end
end)()
;
(function()
local __oak_cond = __truthy((function()
return __oak_eq(__f349_b, nil)
end)()
)
if __oak_eq(__oak_cond, true) then __f349_b = 0
return __f349_b
else return __noop()
end
end)()
;
return (function()
local __oak_cond = __truthy((function()
return (__f349_a > __f349_b)
end)()
)
if __oak_eq(__oak_cond, true) then return __f349_a
else return __f349_b
end
end)()

end;
__static_b2Math["MaxV"] = function(__f350_a, __f350_b)
local __f350_c = b2Vec2(__static_b2Math["Max"](__f350_a["x"], __f350_b["x"]), __static_b2Math["Max"](__f350_a["y"], __f350_b["y"]));
return __f350_c
end;
__static_b2Math["Clamp"] = function(__f351_a, __f351_low, __f351_high)
(function()
local __oak_cond = __truthy((function()
return __oak_eq(__f351_a, nil)
end)()
)
if __oak_eq(__oak_cond, true) then __f351_a = 0
return __f351_a
else return __noop()
end
end)()
;
(function()
local __oak_cond = __truthy((function()
return __oak_eq(__f351_low, nil)
end)()
)
if __oak_eq(__oak_cond, true) then __f351_low = 0
return __f351_low
else return __noop()
end
end)()
;
(function()
local __oak_cond = __truthy((function()
return __oak_eq(__f351_high, nil)
end)()
)
if __oak_eq(__oak_cond, true) then __f351_high = 0
return __f351_high
else return __noop()
end
end)()
;
return (function()
local __oak_cond = __truthy((function()
return (__f351_a < __f351_low)
end)()
)
if __oak_eq(__oak_cond, true) then return __f351_low
else return (function()
local __oak_cond = __truthy((function()
return (__f351_a > __f351_high)
end)()
)
if __oak_eq(__oak_cond, true) then return __f351_high
else return __f351_a
end
end)()

end
end)()

end;
__static_b2Math["ClampV"] = function(__f352_a, __f352_low, __f352_high)
return __static_b2Math["MaxV"](__f352_low, __static_b2Math["MinV"](__f352_a, __f352_high))
end;
__static_b2Math["Swap"] = function(__f353_a, __f353_b)
local __f353_tmp = __oak_acc(__f353_a, (function()
return 0
end)()
);
__f353_a[__add(0, 1)] = __oak_acc(__f353_b, (function()
return 0
end)()
);
__f353_b[__add(0, 1)] = __f353_tmp
return __oak_acc(__f353_b, (function()
return __add(0, 1)
end)()
)
end;
__static_b2Math["Random"] = function()
return ((function()
return (__Math["random"]() * 2)
end)()
 - 1)
end;
__static_b2Math["RandomRange"] = function(__f355_lo, __f355_hi)
(function()
local __oak_cond = __truthy((function()
return __oak_eq(__f355_lo, nil)
end)()
)
if __oak_eq(__oak_cond, true) then __f355_lo = 0
return __f355_lo
else return __noop()
end
end)()
;
(function()
local __oak_cond = __truthy((function()
return __oak_eq(__f355_hi, nil)
end)()
)
if __oak_eq(__oak_cond, true) then __f355_hi = 0
return __f355_hi
else return __noop()
end
end)()
;
local __f355_r = __Math["random"]();
__f355_r = __add((function()
return ((function()
return (__f355_hi - __f355_lo)
end)()
 * __f355_r)
end)()
, __f355_lo);
return __f355_r
end;
__static_b2Math["NextPowerOfTwo"] = function(__f356_x)
(function()
local __oak_cond = __truthy((function()
return __oak_eq(__f356_x, nil)
end)()
)
if __oak_eq(__oak_cond, true) then __f356_x = 0
return __f356_x
else return __noop()
end
end)()
;
__f356_x = __bor(__f356_x, __band(__shr(__f356_x, 1), 2147483647));
__f356_x = __bor(__f356_x, __band(__shr(__f356_x, 2), 1073741823));
__f356_x = __bor(__f356_x, __band(__shr(__f356_x, 4), 268435455));
__f356_x = __bor(__f356_x, __band(__shr(__f356_x, 8), 16777215));
__f356_x = __bor(__f356_x, __band(__shr(__f356_x, 16), 65535));
return __add(__f356_x, 1)
end;
__static_b2Math["IsPowerOfTwo"] = function(__f357_x)
(function()
local __oak_cond = __truthy((function()
return __oak_eq(__f357_x, nil)
end)()
)
if __oak_eq(__oak_cond, true) then __f357_x = 0
return __f357_x
else return __noop()
end
end)()
;
local __f357_result = __and((function()
return (__f357_x > 0)
end)()
, (function()
return __oak_eq(__band(__f357_x, (function()
return (__f357_x - 1)
end)()
), 0)
end)()
);
return __f357_result
end;
b2Math = __static_b2Math;
Box2D["Common"]["Math"]["b2Math"] = b2Math;
__proto_b2Sweep = {};
__proto_b2Sweep["Set"] = function(self, __f358_other)
self["localCenter"]["SetV"](self["localCenter"], __f358_other["localCenter"]);
self["c0"]["SetV"](self["c0"], __f358_other["c0"]);
self["c"]["SetV"](self["c"], __f358_other["c"]);
self["a0"] = __f358_other["a0"];
self["a"] = __f358_other["a"];
self["t0"] = __f358_other["t0"]
return self["t0"]
end;
__proto_b2Sweep["Copy"] = function(self)
local __f359_copy = b2Sweep();
__f359_copy["localCenter"]["SetV"](__f359_copy["localCenter"], self["localCenter"]);
__f359_copy["c0"]["SetV"](__f359_copy["c0"], self["c0"]);
__f359_copy["c"]["SetV"](__f359_copy["c"], self["c"]);
__f359_copy["a0"] = self["a0"];
__f359_copy["a"] = self["a"];
__f359_copy["t0"] = self["t0"];
return __f359_copy
end;
__proto_b2Sweep["GetTransform"] = function(self, __f360_xf, __f360_alpha)
(function()
local __oak_cond = __truthy((function()
return __oak_eq(__f360_alpha, nil)
end)()
)
if __oak_eq(__oak_cond, true) then __f360_alpha = 0
return __f360_alpha
else return __noop()
end
end)()
;
__f360_xf["position"]["x"] = __add((function()
return ((function()
return (1 - __f360_alpha)
end)()
 * self["c0"]["x"])
end)()
, (function()
return (__f360_alpha * self["c"]["x"])
end)()
);
__f360_xf["position"]["y"] = __add((function()
return ((function()
return (1 - __f360_alpha)
end)()
 * self["c0"]["y"])
end)()
, (function()
return (__f360_alpha * self["c"]["y"])
end)()
);
local __f360_angle = __add((function()
return ((function()
return (1 - __f360_alpha)
end)()
 * self["a0"])
end)()
, (function()
return (__f360_alpha * self["a"])
end)()
);
__f360_xf["R"]["Set"](__f360_xf["R"], __f360_angle);
local __f360_tMat = __f360_xf["R"];
__f360_xf["position"]["x"] = (function()
return (__f360_xf["position"]["x"] - __add((function()
return (__f360_tMat["col1"]["x"] * self["localCenter"]["x"])
end)()
, (function()
return (__f360_tMat["col2"]["x"] * self["localCenter"]["y"])
end)()
))
end)()
;
__f360_xf["position"]["y"] = (function()
return (__f360_xf["position"]["y"] - __add((function()
return (__f360_tMat["col1"]["y"] * self["localCenter"]["x"])
end)()
, (function()
return (__f360_tMat["col2"]["y"] * self["localCenter"]["y"])
end)()
))
end)()

return __f360_xf["position"]["y"]
end;
__proto_b2Sweep["Advance"] = function(self, __f361_t)
(function()
local __oak_cond = __truthy((function()
return __oak_eq(__f361_t, nil)
end)()
)
if __oak_eq(__oak_cond, true) then __f361_t = 0
return __f361_t
else return __noop()
end
end)()
;
return (function()
local __oak_cond = __truthy(__and((function()
return (self["t0"] < __f361_t)
end)()
, (function()
return ((function()
return (1 - self["t0"])
end)()
 > __Number["MIN_VALUE"])
end)()
))
if __oak_eq(__oak_cond, true) then return (function()
local __f361_alpha = (function()
return ((function()
return (__f361_t - self["t0"])
end)()
 / (function()
return (1 - self["t0"])
end)()
)
end)()
;
self["c0"]["x"] = __add((function()
return ((function()
return (1 - __f361_alpha)
end)()
 * self["c0"]["x"])
end)()
, (function()
return (__f361_alpha * self["c"]["x"])
end)()
);
self["c0"]["y"] = __add((function()
return ((function()
return (1 - __f361_alpha)
end)()
 * self["c0"]["y"])
end)()
, (function()
return (__f361_alpha * self["c"]["y"])
end)()
);
self["a0"] = __add((function()
return ((function()
return (1 - __f361_alpha)
end)()
 * self["a0"])
end)()
, (function()
return (__f361_alpha * self["a"])
end)()
);
self["t0"] = __f361_t
return self["t0"]
end)()

else return __noop()
end
end)()

end;
__static_b2Sweep = {};
b2Sweep = function()
local self = {["__type"]='b2Sweep', ["__types"]={'b2Sweep'}};
self["Set"] = __proto_b2Sweep["Set"];
self["Copy"] = __proto_b2Sweep["Copy"];
self["GetTransform"] = __proto_b2Sweep["GetTransform"];
self["Advance"] = __proto_b2Sweep["Advance"];
(function()
self["localCenter"] = b2Vec2();
self["c0"] = b2Vec2();
self["c"] = b2Vec2()
return self["c"]
end)()
;
return self
end;
Box2D["Common"]["Math"]["b2Sweep"] = b2Sweep;
__proto_b2ContactFilter = {};
__proto_b2ContactFilter["ShouldCollide"] = function(self, __f363_fixtureA, __f363_fixtureB)
local __f363_filter1 = __f363_fixtureA["GetFilterData"](__f363_fixtureA);
local __f363_filter2 = __f363_fixtureB["GetFilterData"](__f363_fixtureB);
(function()
local __oak_cond = __truthy(__and((function()
return __oak_eq(__f363_filter1["groupIndex"], __f363_filter2["groupIndex"])
end)()
, (function()
return (not __oak_eq(__f363_filter1["groupIndex"], 0))
end)()
))
if __oak_eq(__oak_cond, true) then return (function()
return (__f363_filter1["groupIndex"] > 0)
end)()

else return __noop()
end
end)()
;
local __f363_collide = __and((function()
return (not __oak_eq(__band(__f363_filter1["maskBits"], __f363_filter2["categoryBits"]), 0))
end)()
, (function()
return (not __oak_eq(__band(__f363_filter1["categoryBits"], __f363_filter2["maskBits"]), 0))
end)()
);
return __f363_collide
end;
__proto_b2ContactFilter["RayCollide"] = function(self, __f364_userData, __f364_fixture)
(function()
local __oak_cond = __truthy(__not(__f364_userData))
if __oak_eq(__oak_cond, true) then return true
else return __noop()
end
end)()
;
return self["ShouldCollide"](self, (function()
local __oak_cond = __truthy(__instanceof(__f364_userData, 'b2Fixture'))
if __oak_eq(__oak_cond, true) then return __f364_userData
else return nil
end
end)()
, __f364_fixture)
end;
__static_b2ContactFilter = {};
b2ContactFilter = function()
local self = {["__type"]='b2ContactFilter', ["__types"]={'b2ContactFilter'}};
self["ShouldCollide"] = __proto_b2ContactFilter["ShouldCollide"];
self["RayCollide"] = __proto_b2ContactFilter["RayCollide"];
return self
end;
Box2D["Dynamics"]["b2ContactFilter"] = b2ContactFilter;
__proto_b2ContactImpulse = {};
__static_b2ContactImpulse = {};
b2ContactImpulse = function()
local self = {["__type"]='b2ContactImpulse', ["__types"]={'b2ContactImpulse'}};
(function()
self["normalImpulses"] = Vector_a2j_Number(__static_b2Settings["b2_maxManifoldPoints"]);
self["tangentImpulses"] = Vector_a2j_Number(__static_b2Settings["b2_maxManifoldPoints"])
return self["tangentImpulses"]
end)()
;
return self
end;
Box2D["Dynamics"]["b2ContactImpulse"] = b2ContactImpulse;
__proto_b2ContactListener = {};
__proto_b2ContactListener["BeginContact"] = function(self, __f366_contact)
return nil
end;
__proto_b2ContactListener["EndContact"] = function(self, __f367_contact)
return nil
end;
__proto_b2ContactListener["PreSolve"] = function(self, __f368_contact, __f368_oldManifold)
return nil
end;
__proto_b2ContactListener["PostSolve"] = function(self, __f369_contact, __f369_impulse)
return nil
end;
__static_b2ContactListener = {};
b2ContactListener = function()
local self = {["__type"]='b2ContactListener', ["__types"]={'b2ContactListener'}};
self["BeginContact"] = __proto_b2ContactListener["BeginContact"];
self["EndContact"] = __proto_b2ContactListener["EndContact"];
self["PreSolve"] = __proto_b2ContactListener["PreSolve"];
self["PostSolve"] = __proto_b2ContactListener["PostSolve"];
return self
end;
Box2D["Dynamics"]["b2ContactListener"] = b2ContactListener;
__proto_b2DestructionListener = {};
__proto_b2DestructionListener["SayGoodbyeJoint"] = function(self, __f370_joint)
return nil
end;
__proto_b2DestructionListener["SayGoodbyeFixture"] = function(self, __f371_fixture)
return nil
end;
__static_b2DestructionListener = {};
b2DestructionListener = function()
local self = {["__type"]='b2DestructionListener', ["__types"]={'b2DestructionListener'}};
self["SayGoodbyeJoint"] = __proto_b2DestructionListener["SayGoodbyeJoint"];
self["SayGoodbyeFixture"] = __proto_b2DestructionListener["SayGoodbyeFixture"];
return self
end;
Box2D["Dynamics"]["b2DestructionListener"] = b2DestructionListener;
__proto_b2FilterData = {};
__proto_b2FilterData["Copy"] = function(self)
local __f372_copy = b2FilterData();
__f372_copy["categoryBits"] = self["categoryBits"];
__f372_copy["maskBits"] = self["maskBits"];
__f372_copy["groupIndex"] = self["groupIndex"];
return __f372_copy
end;
__static_b2FilterData = {};
b2FilterData = function()
local self = {["__type"]='b2FilterData', ["__types"]={'b2FilterData'}};
self["Copy"] = __proto_b2FilterData["Copy"];
(function()
self["categoryBits"] = 1;
self["maskBits"] = 65535;
self["groupIndex"] = 0
return self["groupIndex"]
end)()
;
return self
end;
Box2D["Dynamics"]["b2FilterData"] = b2FilterData;
__proto_b2TimeStep = {};
__proto_b2TimeStep["Set"] = function(self, __f374_step)
self["dt"] = __f374_step["dt"];
self["inv_dt"] = __f374_step["inv_dt"];
self["positionIterations"] = __f374_step["positionIterations"];
self["velocityIterations"] = __f374_step["velocityIterations"];
self["warmStarting"] = __f374_step["warmStarting"]
return self["warmStarting"]
end;
__static_b2TimeStep = {};
b2TimeStep = function()
local self = {["__type"]='b2TimeStep', ["__types"]={'b2TimeStep'}};
self["Set"] = __proto_b2TimeStep["Set"];
return self
end;
Box2D["Dynamics"]["b2TimeStep"] = b2TimeStep;
__proto_b2ContactConstraintPoint = {};
__static_b2ContactConstraintPoint = {};
b2ContactConstraintPoint = function()
local self = {["__type"]='b2ContactConstraintPoint', ["__types"]={'b2ContactConstraintPoint'}};
(function()
self["localPoint"] = b2Vec2();
self["rA"] = b2Vec2();
self["rB"] = b2Vec2()
return self["rB"]
end)()
;
return self
end;
Box2D["Dynamics"]["Contacts"]["b2ContactConstraintPoint"] = b2ContactConstraintPoint;
__proto_b2ContactEdge = {};
__static_b2ContactEdge = {};
b2ContactEdge = function()
local self = {["__type"]='b2ContactEdge', ["__types"]={'b2ContactEdge'}};
return self
end;
Box2D["Dynamics"]["Contacts"]["b2ContactEdge"] = b2ContactEdge;
__proto_b2ContactRegister = {};
__static_b2ContactRegister = {};
b2ContactRegister = function()
local self = {["__type"]='b2ContactRegister', ["__types"]={'b2ContactRegister'}};
return self
end;
Box2D["Dynamics"]["Contacts"]["b2ContactRegister"] = b2ContactRegister;
__proto_b2ContactResult = {};
__static_b2ContactResult = {};
b2ContactResult = function()
local self = {["__type"]='b2ContactResult', ["__types"]={'b2ContactResult'}};
(function()
self["position"] = b2Vec2();
self["normal"] = b2Vec2();
self["id"] = b2ContactID()
return self["id"]
end)()
;
return self
end;
Box2D["Dynamics"]["Contacts"]["b2ContactResult"] = b2ContactResult;
__proto_b2Controller = {};
__proto_b2Controller["Step"] = function(self, __f377_step)
return nil
end;
__proto_b2Controller["Draw"] = function(self, __f378_debugDraw)
return nil
end;
__proto_b2Controller["AddBody"] = function(self, __f379_body)
local __f379_edge = b2ControllerEdge();
__f379_edge["controller"] = self;
__f379_edge["body"] = __f379_body;
__f379_edge["nextBody"] = self["m_bodyList"];
__f379_edge["prevBody"] = nil;
self["m_bodyList"] = __f379_edge;
(function()
local __oak_cond = __truthy(__f379_edge["nextBody"])
if __oak_eq(__oak_cond, true) then __f379_edge["nextBody"]["prevBody"] = __f379_edge
return __f379_edge["nextBody"]["prevBody"]
else return __noop()
end
end)()
;
(function()
local __tmp379_94 = self["m_bodyCount"];
self["m_bodyCount"] = __as_oak_string(self["m_bodyCount"] + 1);
return __tmp379_94
end)()
;
__f379_edge["nextController"] = __f379_body["m_controllerList"];
__f379_edge["prevController"] = nil;
__f379_body["m_controllerList"] = __f379_edge;
(function()
local __oak_cond = __truthy(__f379_edge["nextController"])
if __oak_eq(__oak_cond, true) then __f379_edge["nextController"]["prevController"] = __f379_edge
return __f379_edge["nextController"]["prevController"]
else return __noop()
end
end)()
;
return (function()
local __tmp379_95 = __f379_body["m_controllerCount"];
__f379_body["m_controllerCount"] = __as_oak_string(__f379_body["m_controllerCount"] + 1);
return __tmp379_95
end)()

end;
__proto_b2Controller["RemoveBody"] = function(self, __f380_body)
local __f380_edge = __f380_body["m_controllerList"];
(function()
local function __loop96()
return (function()
local __oak_cond = __and(__f380_edge, (function()
return (not __oak_eq(__f380_edge["controller"], self))
end)()
)
if __oak_eq(__oak_cond, true) then return (function()
local __r = (function()
__f380_edge = __f380_edge["nextController"]
return __f380_edge
end)()
;
return (function()
local __oak_cond = __r
if __oak_eq(__oak_cond, 'break') then return nil
else return __loop96()
end
end)()

end)()

else return nil
end
end)()

end;
return __loop96()
end)()
;
(function()
local __oak_cond = __truthy(__f380_edge["prevBody"])
if __oak_eq(__oak_cond, true) then __f380_edge["prevBody"]["nextBody"] = __f380_edge["nextBody"]
return __f380_edge["prevBody"]["nextBody"]
else return __noop()
end
end)()
;
(function()
local __oak_cond = __truthy(__f380_edge["nextBody"])
if __oak_eq(__oak_cond, true) then __f380_edge["nextBody"]["prevBody"] = __f380_edge["prevBody"]
return __f380_edge["nextBody"]["prevBody"]
else return __noop()
end
end)()
;
(function()
local __oak_cond = __truthy(__f380_edge["nextController"])
if __oak_eq(__oak_cond, true) then __f380_edge["nextController"]["prevController"] = __f380_edge["prevController"]
return __f380_edge["nextController"]["prevController"]
else return __noop()
end
end)()
;
(function()
local __oak_cond = __truthy(__f380_edge["prevController"])
if __oak_eq(__oak_cond, true) then __f380_edge["prevController"]["nextController"] = __f380_edge["nextController"]
return __f380_edge["prevController"]["nextController"]
else return __noop()
end
end)()
;
(function()
local __oak_cond = __truthy((function()
return __oak_eq(self["m_bodyList"], __f380_edge)
end)()
)
if __oak_eq(__oak_cond, true) then self["m_bodyList"] = __f380_edge["nextBody"]
return self["m_bodyList"]
else return __noop()
end
end)()
;
(function()
local __oak_cond = __truthy((function()
return __oak_eq(__f380_body["m_controllerList"], __f380_edge)
end)()
)
if __oak_eq(__oak_cond, true) then __f380_body["m_controllerList"] = __f380_edge["nextController"]
return __f380_body["m_controllerList"]
else return __noop()
end
end)()
;
(function()
local __tmp380_97 = __f380_body["m_controllerCount"];
__f380_body["m_controllerCount"] = __as_oak_string(__f380_body["m_controllerCount"] + (-1));
return __tmp380_97
end)()
;
return (function()
local __tmp380_98 = self["m_bodyCount"];
self["m_bodyCount"] = __as_oak_string(self["m_bodyCount"] + (-1));
return __tmp380_98
end)()

end;
__proto_b2Controller["Clear"] = function(self)
local function __loop99()
return (function()
local __oak_cond = self["m_bodyList"]
if __oak_eq(__oak_cond, true) then return (function()
local __r = (function()
return self["RemoveBody"](self, self["m_bodyList"]["body"])
end)()
;
return (function()
local __oak_cond = __r
if __oak_eq(__oak_cond, 'break') then return nil
else return __loop99()
end
end)()

end)()

else return nil
end
end)()

end;
return __loop99()
end;
__proto_b2Controller["GetNext"] = function(self)
return self["m_next"]
end;
__proto_b2Controller["GetWorld"] = function(self)
return self["m_world"]
end;
__proto_b2Controller["GetBodyList"] = function(self)
return self["m_bodyList"]
end;
__static_b2Controller = {};
b2Controller = function()
local self = {["__type"]='b2Controller', ["__types"]={'b2Controller'}};
self["Step"] = __proto_b2Controller["Step"];
self["Draw"] = __proto_b2Controller["Draw"];
self["AddBody"] = __proto_b2Controller["AddBody"];
self["RemoveBody"] = __proto_b2Controller["RemoveBody"];
self["Clear"] = __proto_b2Controller["Clear"];
self["GetNext"] = __proto_b2Controller["GetNext"];
self["GetWorld"] = __proto_b2Controller["GetWorld"];
self["GetBodyList"] = __proto_b2Controller["GetBodyList"];
return self
end;
Box2D["Dynamics"]["Controllers"]["b2Controller"] = b2Controller;
__proto_b2ControllerEdge = {};
__static_b2ControllerEdge = {};
b2ControllerEdge = function()
local self = {["__type"]='b2ControllerEdge', ["__types"]={'b2ControllerEdge'}};
return self
end;
Box2D["Dynamics"]["Controllers"]["b2ControllerEdge"] = b2ControllerEdge;
__proto_b2Jacobian = {};
__proto_b2Jacobian["SetZero"] = function(self)
self["linearA"]["SetZero"](self["linearA"]);
self["angularA"] = 0;
self["linearB"]["SetZero"](self["linearB"]);
self["angularB"] = 0
return self["angularB"]
end;
__proto_b2Jacobian["Set"] = function(self, __f386_x1, __f386_a1, __f386_x2, __f386_a2)
(function()
local __oak_cond = __truthy((function()
return __oak_eq(__f386_a1, nil)
end)()
)
if __oak_eq(__oak_cond, true) then __f386_a1 = 0
return __f386_a1
else return __noop()
end
end)()
;
(function()
local __oak_cond = __truthy((function()
return __oak_eq(__f386_a2, nil)
end)()
)
if __oak_eq(__oak_cond, true) then __f386_a2 = 0
return __f386_a2
else return __noop()
end
end)()
;
self["linearA"]["SetV"](self["linearA"], __f386_x1);
self["angularA"] = __f386_a1;
self["linearB"]["SetV"](self["linearB"], __f386_x2);
self["angularB"] = __f386_a2
return self["angularB"]
end;
__proto_b2Jacobian["Compute"] = function(self, __f387_x1, __f387_a1, __f387_x2, __f387_a2)
(function()
local __oak_cond = __truthy((function()
return __oak_eq(__f387_a1, nil)
end)()
)
if __oak_eq(__oak_cond, true) then __f387_a1 = 0
return __f387_a1
else return __noop()
end
end)()
;
(function()
local __oak_cond = __truthy((function()
return __oak_eq(__f387_a2, nil)
end)()
)
if __oak_eq(__oak_cond, true) then __f387_a2 = 0
return __f387_a2
else return __noop()
end
end)()
;
return __add(__add(__add(__add((function()
return (self["linearA"]["x"] * __f387_x1["x"])
end)()
, (function()
return (self["linearA"]["y"] * __f387_x1["y"])
end)()
), (function()
return (self["angularA"] * __f387_a1)
end)()
), __add((function()
return (self["linearB"]["x"] * __f387_x2["x"])
end)()
, (function()
return (self["linearB"]["y"] * __f387_x2["y"])
end)()
)), (function()
return (self["angularB"] * __f387_a2)
end)()
)
end;
__static_b2Jacobian = {};
b2Jacobian = function()
local self = {["__type"]='b2Jacobian', ["__types"]={'b2Jacobian'}};
self["SetZero"] = __proto_b2Jacobian["SetZero"];
self["Set"] = __proto_b2Jacobian["Set"];
self["Compute"] = __proto_b2Jacobian["Compute"];
(function()
self["linearA"] = b2Vec2();
self["linearB"] = b2Vec2()
return self["linearB"]
end)()
;
return self
end;
Box2D["Dynamics"]["Joints"]["b2Jacobian"] = b2Jacobian;
__proto_b2JointEdge = {};
__static_b2JointEdge = {};
b2JointEdge = function()
local self = {["__type"]='b2JointEdge', ["__types"]={'b2JointEdge'}};
return self
end;
Box2D["Dynamics"]["Joints"]["b2JointEdge"] = b2JointEdge;
__proto_b2ContactID = {};
__proto_b2ContactID["__dummy__"] = function(self)
return nil
end;
__proto_b2ContactID["Set"] = function(self, __f390_id)
self["key"] = __f390_id["_key"]
return self["key"]
end;
__proto_b2ContactID["Copy"] = function(self)
local __f391_id = b2ContactID();
__f391_id["key"] = self["key"];
return __f391_id
end;
__static_b2ContactID = {};
b2ContactID = function()
local self = {["__type"]='b2ContactID', ["__types"]={'b2ContactID'}};
self["__dummy__"] = __proto_b2ContactID["__dummy__"];
self["Set"] = __proto_b2ContactID["Set"];
self["Copy"] = __proto_b2ContactID["Copy"];
(function()
self["features"] = Features();
self["features"]["_m_id"] = self
return self["features"]["_m_id"]
end)()
;
return self
end;
Box2D["Collision"]["b2ContactID"] = b2ContactID;
__proto_b2Color = {};
__proto_b2Color["__dummy__"] = function(self)
return nil
end;
__proto_b2Color["Set"] = function(self, __f394_rr, __f394_gg, __f394_bb)
(function()
local __oak_cond = __truthy((function()
return __oak_eq(__f394_rr, nil)
end)()
)
if __oak_eq(__oak_cond, true) then __f394_rr = 0
return __f394_rr
else return __noop()
end
end)()
;
(function()
local __oak_cond = __truthy((function()
return __oak_eq(__f394_gg, nil)
end)()
)
if __oak_eq(__oak_cond, true) then __f394_gg = 0
return __f394_gg
else return __noop()
end
end)()
;
(function()
local __oak_cond = __truthy((function()
return __oak_eq(__f394_bb, nil)
end)()
)
if __oak_eq(__oak_cond, true) then __f394_bb = 0
return __f394_bb
else return __noop()
end
end)()
;
self["_r"] = __parseUInt((function()
return (255 * __static_b2Math["Clamp"](__f394_rr, 0, 1))
end)()
);
self["_g"] = __parseUInt((function()
return (255 * __static_b2Math["Clamp"](__f394_gg, 0, 1))
end)()
);
self["_b"] = __parseUInt((function()
return (255 * __static_b2Math["Clamp"](__f394_bb, 0, 1))
end)()
)
return self["_b"]
end;
__static_b2Color = {};
b2Color = function()
local self = {["__type"]='b2Color', ["__types"]={'b2Color'}};
self["__dummy__"] = __proto_b2Color["__dummy__"];
self["Set"] = __proto_b2Color["Set"];
(function()
self["_r"] = 0;
self["_g"] = 0;
self["_b"] = 0;
(function()
local __oak_cond = __truthy((function()
return __oak_eq(rr, nil)
end)()
)
if __oak_eq(__oak_cond, true) then local __f395_rr = 0
return __f395_rr
else return __noop()
end
end)()
;
(function()
local __oak_cond = __truthy((function()
return __oak_eq(gg, nil)
end)()
)
if __oak_eq(__oak_cond, true) then local __f395_gg = 0
return __f395_gg
else return __noop()
end
end)()
;
(function()
local __oak_cond = __truthy((function()
return __oak_eq(bb, nil)
end)()
)
if __oak_eq(__oak_cond, true) then local __f395_bb = 0
return __f395_bb
else return __noop()
end
end)()
;
self["_r"] = __parseUInt((function()
return (255 * __static_b2Math["Clamp"](__f395_rr, 0, 1))
end)()
);
self["_g"] = __parseUInt((function()
return (255 * __static_b2Math["Clamp"](__f395_gg, 0, 1))
end)()
);
self["_b"] = __parseUInt((function()
return (255 * __static_b2Math["Clamp"](__f395_bb, 0, 1))
end)()
)
return self["_b"]
end)()
;
return self
end;
Box2D["Common"]["b2Color"] = b2Color;
__static_Object = {};
__static_Object["defineProperty"] = function(__f396_obj, __f396_p, __f396_cfg)
(function()
local __oak_cond = __truthy(__instanceof(__f396_cfg["get"], 'Function'))
if __oak_eq(__oak_cond, true) then return __f396_obj["__defineGetter__"](__f396_p, __f396_cfg["get"])
else return __noop()
end
end)()
;
return (function()
local __oak_cond = __truthy(__instanceof(__f396_cfg["set"], 'Function'))
if __oak_eq(__oak_cond, true) then return __f396_obj["__defineSetter__"](__f396_p, __f396_cfg["set"])
else return __noop()
end
end)()

end;
Object = __static_Object;
__static_a2j = {};
__static_a2j["inherit"] = function(__f397_cls, __f397_base)
local __f397_tmpCtr = __f397_cls;
emptyFn["prototype"] = __f397_base["prototype"];
__f397_cls["prototype"] = emptyFn();
__f397_cls["prototype"]["constructor"] = __f397_tmpCtr
return __f397_cls["prototype"]["constructor"]
end;
__static_a2j["generateCallback"] = function(__f398_context, __f398_cb)
return function()
return __f398_cb(__f398_context)
end
end;
__static_a2j["NVector"] = function(__f400_length)
(function()
local __oak_cond = __truthy((function()
return __oak_eq(__f400_length, nil)
end)()
)
if __oak_eq(__oak_cond, true) then __f400_length = 0
return __f400_length
else return __noop()
end
end)()
;
local __f400_tmp = __newArray(__or(__f400_length, 0));
(function()
local __f400_i = 0;
local function __loop100()
return (function()
local __oak_cond = (function()
return (__f400_i < __f400_length)
end)()

if __oak_eq(__oak_cond, true) then return (function()
local __r = (function()
__f400_tmp[__add(__f400_i, 1)] = 0
return __oak_acc(__f400_tmp, (function()
return __add(__f400_i, 1)
end)()
)
end)()
;
return (function()
local __oak_cond = __r
if __oak_eq(__oak_cond, 'break') then return nil
else return (function()
(function()
__f400_i = __as_oak_string(__f400_i + 1)
return __f400_i
end)()
;
return __loop100()
end)()

end
end)()

end)()

else return nil
end
end)()

end;
return __loop100()
end)()
;
return __f400_tmp
end;
__static_a2j["is"] = function(__f401_o1, __f401_o2)
(function()
local __oak_cond = __truthy((function()
return __oak_eq(__f401_o1, nil)
end)()
)
if __oak_eq(__oak_cond, true) then return false
else return __noop()
end
end)()
;
(function()
local __oak_cond = __truthy(__and(__instanceof(__f401_o2, 'Function'), __instanceof(__f401_o1, 'o2')))
if __oak_eq(__oak_cond, true) then return true
else return __noop()
end
end)()
;
(function()
local __oak_cond = __truthy(__and((function()
return (not __oak_eq(__f401_o1["constructor"]["__implements"], nil))
end)()
, __oak_acc(__f401_o1["constructor"]["__implements"], (function()
return __f401_o2
end)()
)))
if __oak_eq(__oak_cond, true) then return true
else return __noop()
end
end)()
;
return false
end;
__static_a2j["parseUInt"] = function(__f402_v)
return __Math["abs"](__parseInt(__f402_v))
end;
a2j = __static_a2j;
__proto_b2BoundValues = {};
__static_b2BoundValues = {};
b2BoundValues = function()
local self = {["__type"]='b2BoundValues', ["__types"]={'b2BoundValues'}};
(function()
self["lowerValues"] = Vector_a2j_Number();
self["lowerValues"][__add(0, 1)] = 0;
self["lowerValues"][__add(1, 1)] = 0;
self["upperValues"] = Vector_a2j_Number();
self["upperValues"][__add(0, 1)] = 0;
self["upperValues"][__add(1, 1)] = 0
return __oak_acc(self["upperValues"], (function()
return __add(1, 1)
end)()
)
end)()
;
return self
end;
Box2D["Collision"]["b2BoundValues"] = b2BoundValues;
__proto_b2DynamicTree = {};
__proto_b2DynamicTree["CreateProxy"] = function(self, __f404_aabb, __f404_userData)
local __f404_node = self["AllocateNode"](self);
local __f404_extendX = __static_b2Settings["b2_aabbExtension"];
local __f404_extendY = __static_b2Settings["b2_aabbExtension"];
__f404_node["aabb"]["lowerBound"]["x"] = (function()
return (__f404_aabb["lowerBound"]["x"] - __f404_extendX)
end)()
;
__f404_node["aabb"]["lowerBound"]["y"] = (function()
return (__f404_aabb["lowerBound"]["y"] - __f404_extendY)
end)()
;
__f404_node["aabb"]["upperBound"]["x"] = __add(__f404_aabb["upperBound"]["x"], __f404_extendX);
__f404_node["aabb"]["upperBound"]["y"] = __add(__f404_aabb["upperBound"]["y"], __f404_extendY);
__f404_node["userData"] = __f404_userData;
self["InsertLeaf"](self, __f404_node);
return __f404_node
end;
__proto_b2DynamicTree["DestroyProxy"] = function(self, __f405_proxy)
self["RemoveLeaf"](self, __f405_proxy);
return self["FreeNode"](self, __f405_proxy)
end;
__proto_b2DynamicTree["MoveProxy"] = function(self, __f406_proxy, __f406_aabb, __f406_displacement)
__static_b2Settings["b2Assert"](__f406_proxy["IsLeaf"](__f406_proxy));
(function()
local __oak_cond = __truthy(__f406_proxy["aabb"]["Contains"](__f406_proxy["aabb"], __f406_aabb))
if __oak_eq(__oak_cond, true) then return false
else return __noop()
end
end)()
;
self["RemoveLeaf"](self, __f406_proxy);
local __f406_extendX = __add(__static_b2Settings["b2_aabbExtension"], (function()
return (__static_b2Settings["b2_aabbMultiplier"] * (function()
local __oak_cond = __truthy((function()
return (__f406_displacement["x"] > 0)
end)()
)
if __oak_eq(__oak_cond, true) then return __f406_displacement["x"]
else return (function()
return (-__f406_displacement["x"])
end)()

end
end)()
)
end)()
);
local __f406_extendY = __add(__static_b2Settings["b2_aabbExtension"], (function()
return (__static_b2Settings["b2_aabbMultiplier"] * (function()
local __oak_cond = __truthy((function()
return (__f406_displacement["y"] > 0)
end)()
)
if __oak_eq(__oak_cond, true) then return __f406_displacement["y"]
else return (function()
return (-__f406_displacement["y"])
end)()

end
end)()
)
end)()
);
__f406_proxy["aabb"]["lowerBound"]["x"] = (function()
return (__f406_aabb["lowerBound"]["x"] - __f406_extendX)
end)()
;
__f406_proxy["aabb"]["lowerBound"]["y"] = (function()
return (__f406_aabb["lowerBound"]["y"] - __f406_extendY)
end)()
;
__f406_proxy["aabb"]["upperBound"]["x"] = __add(__f406_aabb["upperBound"]["x"], __f406_extendX);
__f406_proxy["aabb"]["upperBound"]["y"] = __add(__f406_aabb["upperBound"]["y"], __f406_extendY);
self["InsertLeaf"](self, __f406_proxy);
return true
end;
__proto_b2DynamicTree["Rebalance"] = function(self, __f407_iterations)
(function()
local __oak_cond = __truthy((function()
return __oak_eq(__f407_iterations, nil)
end)()
)
if __oak_eq(__oak_cond, true) then __f407_iterations = 0
return __f407_iterations
else return __noop()
end
end)()
;
return (function()
local __oak_cond = __truthy((function()
return __oak_eq(self["m_root"], nil)
end)()
)
if __oak_eq(__oak_cond, true) then return __noop()
else return (function()
local __f407_i = 0;
local function __loop102()
return (function()
local __oak_cond = (function()
return (__f407_i < __f407_iterations)
end)()

if __oak_eq(__oak_cond, true) then return (function()
local __r = (function()
return (function()
local __f407_node = self["m_root"];
local __f407_bit = 0;
(function()
local function __loop104()
return (function()
local __oak_cond = (function()
return __oak_eq(__f407_node["IsLeaf"](__f407_node), false)
end)()

if __oak_eq(__oak_cond, true) then return (function()
local __r = (function()
return (function()
__f407_node = (function()
local __oak_cond = __truthy(__band(__shr(self["m_path"], __f407_bit), 1))
if __oak_eq(__oak_cond, true) then return __f407_node["child2"]
else return __f407_node["child1"]
end
end)()
;
__f407_bit = __band(__add(__f407_bit, 1), 31)
return __f407_bit
end)()

end)()
;
return (function()
local __oak_cond = __r
if __oak_eq(__oak_cond, 'break') then return nil
else return __loop104()
end
end)()

end)()

else return nil
end
end)()

end;
return __loop104()
end)()
;
(function()
self["m_path"] = __as_oak_string(self["m_path"] + 1)
return self["m_path"]
end)()
;
self["RemoveLeaf"](self, __f407_node);
return self["InsertLeaf"](self, __f407_node)
end)()

end)()
;
return (function()
local __oak_cond = __r
if __oak_eq(__oak_cond, 'break') then return nil
else return (function()
(function()
local __tmp407_103 = __f407_i;
__f407_i = __as_oak_string(__f407_i + 1);
return __tmp407_103
end)()
;
return __loop102()
end)()

end
end)()

end)()

else return nil
end
end)()

end;
return __loop102()
end)()

end
end)()

end;
__proto_b2DynamicTree["GetFatAABB"] = function(self, __f408_proxy)
return __f408_proxy["aabb"]
end;
__proto_b2DynamicTree["GetUserData"] = function(self, __f409_proxy)
return __f409_proxy["userData"]
end;
__proto_b2DynamicTree["Query"] = function(self, __f410_callback, __f410_aabb)
return (function()
local __oak_cond = __truthy((function()
return __oak_eq(self["m_root"], nil)
end)()
)
if __oak_eq(__oak_cond, true) then return __noop()
else return (function()
local __f410_stack = __newArray();
local __f410_count = 0;
__f410_stack[__add((function()
local __tmp410_107 = __f410_count;
__f410_count = __as_oak_string(__f410_count + 1);
return __tmp410_107
end)()
, 1)] = self["m_root"];
return (function()
local function __loop108()
return (function()
local __oak_cond = (function()
return (__f410_count > 0)
end)()

if __oak_eq(__oak_cond, true) then return (function()
local __r = (function()
return (function()
local __f410_node = __oak_acc(__f410_stack, (function()
return (function()
__f410_count = __as_oak_string(__f410_count + (-1))
return __f410_count
end)()

end)()
);
return (function()
local __oak_cond = __truthy(__f410_node["aabb"]["TestOverlap"](__f410_node["aabb"], __f410_aabb))
if __oak_eq(__oak_cond, true) then return (function()
local __oak_cond = __truthy(__f410_node["IsLeaf"](__f410_node))
if __oak_eq(__oak_cond, true) then return (function()
local __f410_proceed = __f410_callback(__f410_node);
return (function()
local __oak_cond = __truthy(__not(__f410_proceed))
if __oak_eq(__oak_cond, true) then return __noop()
else return __noop()
end
end)()

end)()

else return (function()
__f410_stack[__add((function()
local __tmp410_111 = __f410_count;
__f410_count = __as_oak_string(__f410_count + 1);
return __tmp410_111
end)()
, 1)] = __f410_node["child1"];
__f410_stack[__add((function()
local __tmp410_113 = __f410_count;
__f410_count = __as_oak_string(__f410_count + 1);
return __tmp410_113
end)()
, 1)] = __f410_node["child2"]
return __oak_acc(__f410_stack, (function()
return __add((function()
local __tmp410_113 = __f410_count;
__f410_count = __as_oak_string(__f410_count + 1);
return __tmp410_113
end)()
, 1)
end)()
)
end)()

end
end)()

else return __noop()
end
end)()

end)()

end)()
;
return (function()
local __oak_cond = __r
if __oak_eq(__oak_cond, 'break') then return nil
else return __loop108()
end
end)()

end)()

else return nil
end
end)()

end;
return __loop108()
end)()

end)()

end
end)()

end;
__proto_b2DynamicTree["RayCast"] = function(self, __f411_callback, __f411_input)
return (function()
local __oak_cond = __truthy((function()
return __oak_eq(self["m_root"], nil)
end)()
)
if __oak_eq(__oak_cond, true) then return __noop()
else return (function()
local __f411_p1 = __f411_input["p1"];
local __f411_p2 = __f411_input["p2"];
local __f411_r = __static_b2Math["SubtractVV"](__f411_p1, __f411_p2);
__f411_r["Normalize"](__f411_r);
local __f411_v = __static_b2Math["CrossFV"](1, __f411_r);
local __f411_abs_v = __static_b2Math["AbsV"](__f411_v);
local __f411_maxFraction = __f411_input["maxFraction"];
local __f411_segmentAABB = b2AABB();
local __f411_tX = 0;
local __f411_tY = 0;
(function()
__f411_tX = __add(__f411_p1["x"], (function()
return (__f411_maxFraction * (function()
return (__f411_p2["x"] - __f411_p1["x"])
end)()
)
end)()
);
__f411_tY = __add(__f411_p1["y"], (function()
return (__f411_maxFraction * (function()
return (__f411_p2["y"] - __f411_p1["y"])
end)()
)
end)()
);
__f411_segmentAABB["lowerBound"]["x"] = __Math["min"](__f411_p1["x"], __f411_tX);
__f411_segmentAABB["lowerBound"]["y"] = __Math["min"](__f411_p1["y"], __f411_tY);
__f411_segmentAABB["upperBound"]["x"] = __Math["max"](__f411_p1["x"], __f411_tX);
__f411_segmentAABB["upperBound"]["y"] = __Math["max"](__f411_p1["y"], __f411_tY)
return __f411_segmentAABB["upperBound"]["y"]
end)()
;
local __f411_stack = __newArray();
local __f411_count = 0;
__f411_stack[__add((function()
local __tmp411_115 = __f411_count;
__f411_count = __as_oak_string(__f411_count + 1);
return __tmp411_115
end)()
, 1)] = self["m_root"];
return (function()
local function __loop116()
return (function()
local __oak_cond = (function()
return (__f411_count > 0)
end)()

if __oak_eq(__oak_cond, true) then return (function()
local __r = (function()
return (function()
local __f411_node = __oak_acc(__f411_stack, (function()
return (function()
__f411_count = __as_oak_string(__f411_count + (-1))
return __f411_count
end)()

end)()
);
(function()
local __oak_cond = __truthy((function()
return __oak_eq(__f411_node["aabb"]["TestOverlap"](__f411_node["aabb"], __f411_segmentAABB), false)
end)()
)
if __oak_eq(__oak_cond, true) then return 'continue'
else return __noop()
end
end)()
;
local __f411_c = __f411_node["aabb"]["GetCenter"](__f411_node["aabb"]);
local __f411_h = __f411_node["aabb"]["GetExtents"](__f411_node["aabb"]);
local __f411_separation = (function()
return ((function()
return (__Math["abs"](__add((function()
return (__f411_v["x"] * (function()
return (__f411_p1["x"] - __f411_c["x"])
end)()
)
end)()
, (function()
return (__f411_v["y"] * (function()
return (__f411_p1["y"] - __f411_c["y"])
end)()
)
end)()
)) - (function()
return (__f411_abs_v["x"] * __f411_h["x"])
end)()
)
end)()
 - (function()
return (__f411_abs_v["y"] * __f411_h["y"])
end)()
)
end)()
;
(function()
local __oak_cond = __truthy((function()
return (__f411_separation > 0)
end)()
)
if __oak_eq(__oak_cond, true) then return 'continue'
else return __noop()
end
end)()
;
return (function()
local __oak_cond = __truthy(__f411_node["IsLeaf"](__f411_node))
if __oak_eq(__oak_cond, true) then return (function()
local __f411_subInput = b2RayCastInput();
__f411_subInput["p1"] = __f411_input["p1"];
__f411_subInput["p2"] = __f411_input["p2"];
__f411_subInput["maxFraction"] = __f411_input["maxFraction"];
__f411_maxFraction = __f411_callback(__f411_subInput, __f411_node);
return (function()
local __oak_cond = __truthy((function()
return __oak_eq(__f411_maxFraction, 0)
end)()
)
if __oak_eq(__oak_cond, true) then return __noop()
else return (function()
local __oak_cond = __truthy((function()
return (__f411_maxFraction > 0)
end)()
)
if __oak_eq(__oak_cond, true) then return (function()
__f411_tX = __add(__f411_p1["x"], (function()
return (__f411_maxFraction * (function()
return (__f411_p2["x"] - __f411_p1["x"])
end)()
)
end)()
);
__f411_tY = __add(__f411_p1["y"], (function()
return (__f411_maxFraction * (function()
return (__f411_p2["y"] - __f411_p1["y"])
end)()
)
end)()
);
__f411_segmentAABB["lowerBound"]["x"] = __Math["min"](__f411_p1["x"], __f411_tX);
__f411_segmentAABB["lowerBound"]["y"] = __Math["min"](__f411_p1["y"], __f411_tY);
__f411_segmentAABB["upperBound"]["x"] = __Math["max"](__f411_p1["x"], __f411_tX);
__f411_segmentAABB["upperBound"]["y"] = __Math["max"](__f411_p1["y"], __f411_tY)
return __f411_segmentAABB["upperBound"]["y"]
end)()

else return __noop()
end
end)()

end
end)()

end)()

else return (function()
__f411_stack[__add((function()
local __tmp411_119 = __f411_count;
__f411_count = __as_oak_string(__f411_count + 1);
return __tmp411_119
end)()
, 1)] = __f411_node["child1"];
__f411_stack[__add((function()
local __tmp411_121 = __f411_count;
__f411_count = __as_oak_string(__f411_count + 1);
return __tmp411_121
end)()
, 1)] = __f411_node["child2"]
return __oak_acc(__f411_stack, (function()
return __add((function()
local __tmp411_121 = __f411_count;
__f411_count = __as_oak_string(__f411_count + 1);
return __tmp411_121
end)()
, 1)
end)()
)
end)()

end
end)()

end)()

end)()
;
return (function()
local __oak_cond = __r
if __oak_eq(__oak_cond, 'break') then return nil
else return __loop116()
end
end)()

end)()

else return nil
end
end)()

end;
return __loop116()
end)()

end)()

end
end)()

end;
__proto_b2DynamicTree["AllocateNode"] = function(self)
(function()
local __oak_cond = __truthy(self["m_freeList"])
if __oak_eq(__oak_cond, true) then return (function()
local __f412_node = self["m_freeList"];
self["m_freeList"] = __f412_node["parent"];
__f412_node["parent"] = nil;
__f412_node["child1"] = nil;
__f412_node["child2"] = nil;
return __f412_node
end)()

else return __noop()
end
end)()
;
return b2DynamicTreeNode()
end;
__proto_b2DynamicTree["FreeNode"] = function(self, __f413_node)
__f413_node["parent"] = self["m_freeList"];
self["m_freeList"] = __f413_node
return self["m_freeList"]
end;
__proto_b2DynamicTree["InsertLeaf"] = function(self, __f414_leaf)
(function()
self["m_insertionCount"] = __as_oak_string(self["m_insertionCount"] + 1)
return self["m_insertionCount"]
end)()
;
return (function()
local __oak_cond = __truthy((function()
return __oak_eq(self["m_root"], nil)
end)()
)
if __oak_eq(__oak_cond, true) then return (function()
self["m_root"] = __f414_leaf;
self["m_root"]["parent"] = nil;
return __noop()
end)()

else return (function()
local __f414_center = __f414_leaf["aabb"]["GetCenter"](__f414_leaf["aabb"]);
local __f414_sibling = self["m_root"];
(function()
local __oak_cond = __truthy((function()
return __oak_eq(__f414_sibling["IsLeaf"](__f414_sibling), false)
end)()
)
if __oak_eq(__oak_cond, true) then return (function()
local function __loop123()
local __r = (function()
return (function()
local __f414_child1 = __f414_sibling["child1"];
local __f414_child2 = __f414_sibling["child2"];
local __f414_norm1 = __add(__Math["abs"]((function()
return ((function()
return (__add(__f414_child1["aabb"]["lowerBound"]["x"], __f414_child1["aabb"]["upperBound"]["x"]) / 2)
end)()
 - __f414_center["x"])
end)()
), __Math["abs"]((function()
return ((function()
return (__add(__f414_child1["aabb"]["lowerBound"]["y"], __f414_child1["aabb"]["upperBound"]["y"]) / 2)
end)()
 - __f414_center["y"])
end)()
));
local __f414_norm2 = __add(__Math["abs"]((function()
return ((function()
return (__add(__f414_child2["aabb"]["lowerBound"]["x"], __f414_child2["aabb"]["upperBound"]["x"]) / 2)
end)()
 - __f414_center["x"])
end)()
), __Math["abs"]((function()
return ((function()
return (__add(__f414_child2["aabb"]["lowerBound"]["y"], __f414_child2["aabb"]["upperBound"]["y"]) / 2)
end)()
 - __f414_center["y"])
end)()
));
return (function()
local __oak_cond = __truthy((function()
return (__f414_norm1 < __f414_norm2)
end)()
)
if __oak_eq(__oak_cond, true) then __f414_sibling = __f414_child1
return __f414_sibling
else __f414_sibling = __f414_child2
return __f414_sibling
end
end)()

end)()

end)()
;
return (function()
local __oak_cond = __r
if __oak_eq(__oak_cond, 'break') then return nil
else return (function()
local __oak_cond = (function()
return __oak_eq(__f414_sibling["IsLeaf"](__f414_sibling), false)
end)()

if __oak_eq(__oak_cond, true) then return __loop123()
else return nil
end
end)()

end
end)()

end;
return __loop123()
end)()

else return __noop()
end
end)()
;
local __f414_node1 = __f414_sibling["parent"];
local __f414_node2 = self["AllocateNode"](self);
__f414_node2["parent"] = __f414_node1;
__f414_node2["userData"] = nil;
__f414_node2["aabb"]["Combine"](__f414_node2["aabb"], __f414_leaf["aabb"], __f414_sibling["aabb"]);
return (function()
local __oak_cond = __truthy(__f414_node1)
if __oak_eq(__oak_cond, true) then return (function()
(function()
local __oak_cond = __truthy((function()
return __oak_eq(__f414_sibling["parent"]["child1"], __f414_sibling)
end)()
)
if __oak_eq(__oak_cond, true) then __f414_node1["child1"] = __f414_node2
return __f414_node1["child1"]
else __f414_node1["child2"] = __f414_node2
return __f414_node1["child2"]
end
end)()
;
__f414_node2["child1"] = __f414_sibling;
__f414_node2["child2"] = __f414_leaf;
__f414_sibling["parent"] = __f414_node2;
__f414_leaf["parent"] = __f414_node2;
return (function()
local function __loop124()
local __r = (function()
return (function()
(function()
local __oak_cond = __truthy(__f414_node1["aabb"]["Contains"](__f414_node1["aabb"], __f414_node2["aabb"]))
if __oak_eq(__oak_cond, true) then return 'break'
else return __noop()
end
end)()
;
__f414_node1["aabb"]["Combine"](__f414_node1["aabb"], __f414_node1["child1"]["aabb"], __f414_node1["child2"]["aabb"]);
__f414_node2 = __f414_node1;
__f414_node1 = __f414_node1["parent"]
return __f414_node1
end)()

end)()
;
return (function()
local __oak_cond = __r
if __oak_eq(__oak_cond, 'break') then return nil
else return (function()
local __oak_cond = __f414_node1
if __oak_eq(__oak_cond, true) then return __loop124()
else return nil
end
end)()

end
end)()

end;
return __loop124()
end)()

end)()

else return (function()
__f414_node2["child1"] = __f414_sibling;
__f414_node2["child2"] = __f414_leaf;
__f414_sibling["parent"] = __f414_node2;
__f414_leaf["parent"] = __f414_node2;
self["m_root"] = __f414_node2
return self["m_root"]
end)()

end
end)()

end)()

end
end)()

end;
__proto_b2DynamicTree["RemoveLeaf"] = function(self, __f415_leaf)
return (function()
local __oak_cond = __truthy((function()
return __oak_eq(__f415_leaf, self["m_root"])
end)()
)
if __oak_eq(__oak_cond, true) then return (function()
self["m_root"] = nil;
return __noop()
end)()

else return (function()
local __f415_node2 = __f415_leaf["parent"];
local __f415_node1 = __f415_node2["parent"];
local __f415_sibling = __noop();
(function()
local __oak_cond = __truthy((function()
return __oak_eq(__f415_node2["child1"], __f415_leaf)
end)()
)
if __oak_eq(__oak_cond, true) then __f415_sibling = __f415_node2["child2"]
return __f415_sibling
else __f415_sibling = __f415_node2["child1"]
return __f415_sibling
end
end)()
;
return (function()
local __oak_cond = __truthy(__f415_node1)
if __oak_eq(__oak_cond, true) then return (function()
(function()
local __oak_cond = __truthy((function()
return __oak_eq(__f415_node1["child1"], __f415_node2)
end)()
)
if __oak_eq(__oak_cond, true) then __f415_node1["child1"] = __f415_sibling
return __f415_node1["child1"]
else __f415_node1["child2"] = __f415_sibling
return __f415_node1["child2"]
end
end)()
;
__f415_sibling["parent"] = __f415_node1;
self["FreeNode"](self, __f415_node2);
return (function()
local function __loop125()
return (function()
local __oak_cond = __f415_node1
if __oak_eq(__oak_cond, true) then return (function()
local __r = (function()
return (function()
local __f415_oldAABB = __f415_node1["aabb"];
__f415_node1["aabb"] = b2AABB["Combine"](b2AABB, __f415_node1["child1"]["aabb"], __f415_node1["child2"]["aabb"]);
(function()
local __oak_cond = __truthy(__f415_oldAABB["Contains"](__f415_oldAABB, __f415_node1["aabb"]))
if __oak_eq(__oak_cond, true) then return 'break'
else return __noop()
end
end)()
;
__f415_node1 = __f415_node1["parent"]
return __f415_node1
end)()

end)()
;
return (function()
local __oak_cond = __r
if __oak_eq(__oak_cond, 'break') then return nil
else return __loop125()
end
end)()

end)()

else return nil
end
end)()

end;
return __loop125()
end)()

end)()

else return (function()
self["m_root"] = __f415_sibling;
__f415_sibling["parent"] = nil;
return self["FreeNode"](self, __f415_node2)
end)()

end
end)()

end)()

end
end)()

end;
__static_b2DynamicTree = {};
b2DynamicTree = function()
local self = {["__type"]='b2DynamicTree', ["__types"]={'b2DynamicTree'}};
self["CreateProxy"] = __proto_b2DynamicTree["CreateProxy"];
self["DestroyProxy"] = __proto_b2DynamicTree["DestroyProxy"];
self["MoveProxy"] = __proto_b2DynamicTree["MoveProxy"];
self["Rebalance"] = __proto_b2DynamicTree["Rebalance"];
self["GetFatAABB"] = __proto_b2DynamicTree["GetFatAABB"];
self["GetUserData"] = __proto_b2DynamicTree["GetUserData"];
self["Query"] = __proto_b2DynamicTree["Query"];
self["RayCast"] = __proto_b2DynamicTree["RayCast"];
self["AllocateNode"] = __proto_b2DynamicTree["AllocateNode"];
self["FreeNode"] = __proto_b2DynamicTree["FreeNode"];
self["InsertLeaf"] = __proto_b2DynamicTree["InsertLeaf"];
self["RemoveLeaf"] = __proto_b2DynamicTree["RemoveLeaf"];
(function()
self["m_root"] = nil;
self["m_freeList"] = nil;
self["m_path"] = 0;
self["m_insertionCount"] = 0
return self["m_insertionCount"]
end)()
;
return self
end;
Box2D["Collision"]["b2DynamicTree"] = b2DynamicTree;
__proto_b2Manifold = {};
__proto_b2Manifold["Reset"] = function(self)
(function()
local __f417_i = 0;
local function __loop126()
return (function()
local __oak_cond = (function()
return (__f417_i < __static_b2Settings["b2_maxManifoldPoints"])
end)()

if __oak_eq(__oak_cond, true) then return (function()
local __r = (function()
return (function()
local __oak_cond = __truthy(__instanceof(__oak_acc(self["m_points"], (function()
return __f417_i
end)()
), 'b2ManifoldPoint'))
if __oak_eq(__oak_cond, true) then return __oak_acc(self["m_points"], (function()
return __f417_i
end)()
)
else return nil
end
end)()
["Reset"]((function()
local __oak_cond = __truthy(__instanceof(__oak_acc(self["m_points"], (function()
return __f417_i
end)()
), 'b2ManifoldPoint'))
if __oak_eq(__oak_cond, true) then return __oak_acc(self["m_points"], (function()
return __f417_i
end)()
)
else return nil
end
end)()
)
end)()
;
return (function()
local __oak_cond = __r
if __oak_eq(__oak_cond, 'break') then return nil
else return (function()
(function()
local __tmp417_127 = __f417_i;
__f417_i = __as_oak_string(__f417_i + 1);
return __tmp417_127
end)()
;
return __loop126()
end)()

end
end)()

end)()

else return nil
end
end)()

end;
return __loop126()
end)()
;
self["m_localPlaneNormal"]["SetZero"](self["m_localPlaneNormal"]);
self["m_localPoint"]["SetZero"](self["m_localPoint"]);
self["m_type"] = 0;
self["m_pointCount"] = 0
return self["m_pointCount"]
end;
__proto_b2Manifold["Set"] = function(self, __f418_m)
self["m_pointCount"] = __f418_m["m_pointCount"];
(function()
local __f418_i = 0;
local function __loop128()
return (function()
local __oak_cond = (function()
return (__f418_i < __static_b2Settings["b2_maxManifoldPoints"])
end)()

if __oak_eq(__oak_cond, true) then return (function()
local __r = (function()
return (function()
local __oak_cond = __truthy(__instanceof(__oak_acc(self["m_points"], (function()
return __f418_i
end)()
), 'b2ManifoldPoint'))
if __oak_eq(__oak_cond, true) then return __oak_acc(self["m_points"], (function()
return __f418_i
end)()
)
else return nil
end
end)()
["Set"]((function()
local __oak_cond = __truthy(__instanceof(__oak_acc(self["m_points"], (function()
return __f418_i
end)()
), 'b2ManifoldPoint'))
if __oak_eq(__oak_cond, true) then return __oak_acc(self["m_points"], (function()
return __f418_i
end)()
)
else return nil
end
end)()
, __oak_acc(__f418_m["m_points"], (function()
return __f418_i
end)()
))
end)()
;
return (function()
local __oak_cond = __r
if __oak_eq(__oak_cond, 'break') then return nil
else return (function()
(function()
local __tmp418_129 = __f418_i;
__f418_i = __as_oak_string(__f418_i + 1);
return __tmp418_129
end)()
;
return __loop128()
end)()

end
end)()

end)()

else return nil
end
end)()

end;
return __loop128()
end)()
;
self["m_localPlaneNormal"]["SetV"](self["m_localPlaneNormal"], __f418_m["m_localPlaneNormal"]);
self["m_localPoint"]["SetV"](self["m_localPoint"], __f418_m["m_localPoint"]);
self["m_type"] = __f418_m["m_type"]
return self["m_type"]
end;
__proto_b2Manifold["Copy"] = function(self)
local __f419_copy = b2Manifold();
__f419_copy["Set"](__f419_copy, self);
return __f419_copy
end;
__static_b2Manifold = {};
b2Manifold = function()
local self = {["__type"]='b2Manifold', ["__types"]={'b2Manifold'}};
self["Reset"] = __proto_b2Manifold["Reset"];
self["Set"] = __proto_b2Manifold["Set"];
self["Copy"] = __proto_b2Manifold["Copy"];
(function()
self["m_pointCount"] = 0;
self["m_points"] = __newArray(__static_b2Settings["b2_maxManifoldPoints"]);
(function()
local __f420_i = 0;
local function __loop130()
return (function()
local __oak_cond = (function()
return (__f420_i < __static_b2Settings["b2_maxManifoldPoints"])
end)()

if __oak_eq(__oak_cond, true) then return (function()
local __r = (function()
self["m_points"][__add(__f420_i, 1)] = b2ManifoldPoint()
return __oak_acc(self["m_points"], (function()
return __add(__f420_i, 1)
end)()
)
end)()
;
return (function()
local __oak_cond = __r
if __oak_eq(__oak_cond, 'break') then return nil
else return (function()
(function()
local __tmp420_131 = __f420_i;
__f420_i = __as_oak_string(__f420_i + 1);
return __tmp420_131
end)()
;
return __loop130()
end)()

end
end)()

end)()

else return nil
end
end)()

end;
return __loop130()
end)()
;
self["m_localPlaneNormal"] = b2Vec2();
self["m_localPoint"] = b2Vec2()
return self["m_localPoint"]
end)()
;
return self
end;
Box2D["Collision"]["b2Manifold"] = b2Manifold;
__proto_b2ManifoldPoint = {};
__proto_b2ManifoldPoint["Reset"] = function(self)
self["m_localPoint"]["SetZero"](self["m_localPoint"]);
self["m_normalImpulse"] = 0;
self["m_tangentImpulse"] = 0;
self["m_id"]["key"] = 0
return self["m_id"]["key"]
end;
__proto_b2ManifoldPoint["Set"] = function(self, __f422_m)
self["m_localPoint"]["SetV"](self["m_localPoint"], __f422_m["m_localPoint"]);
self["m_normalImpulse"] = __f422_m["m_normalImpulse"];
self["m_tangentImpulse"] = __f422_m["m_tangentImpulse"];
return self["m_id"]["Set"](self["m_id"], __f422_m["m_id"])
end;
__static_b2ManifoldPoint = {};
b2ManifoldPoint = function()
local self = {["__type"]='b2ManifoldPoint', ["__types"]={'b2ManifoldPoint'}};
self["Reset"] = __proto_b2ManifoldPoint["Reset"];
self["Set"] = __proto_b2ManifoldPoint["Set"];
(function()
self["m_localPoint"] = b2Vec2();
self["m_id"] = b2ContactID();
return self["Reset"](self)
end)()
;
return self
end;
Box2D["Collision"]["b2ManifoldPoint"] = b2ManifoldPoint;
__proto_b2RayCastInput = {};
__static_b2RayCastInput = {};
b2RayCastInput = function()
local self = {["__type"]='b2RayCastInput', ["__types"]={'b2RayCastInput'}};
(function()
self["p1"] = b2Vec2();
self["p2"] = b2Vec2();
(function()
local __oak_cond = __truthy((function()
return __oak_eq(p1, nil)
end)()
)
if __oak_eq(__oak_cond, true) then local __f424_p1 = nil
return __f424_p1
else return __noop()
end
end)()
;
(function()
local __oak_cond = __truthy((function()
return __oak_eq(p2, nil)
end)()
)
if __oak_eq(__oak_cond, true) then local __f424_p2 = nil
return __f424_p2
else return __noop()
end
end)()
;
(function()
local __oak_cond = __truthy((function()
return __oak_eq(maxFraction, nil)
end)()
)
if __oak_eq(__oak_cond, true) then local __f424_maxFraction = 1
return __f424_maxFraction
else return __noop()
end
end)()
;
(function()
local __oak_cond = __truthy(__f424_p1)
if __oak_eq(__oak_cond, true) then return self["p1"]["SetV"](self["p1"], __f424_p1)
else return __noop()
end
end)()
;
(function()
local __oak_cond = __truthy(__f424_p2)
if __oak_eq(__oak_cond, true) then return self["p2"]["SetV"](self["p2"], __f424_p2)
else return __noop()
end
end)()
;
self["maxFraction"] = __f424_maxFraction
return self["maxFraction"]
end)()
;
return self
end;
Box2D["Collision"]["b2RayCastInput"] = b2RayCastInput;
__proto_b2Simplex = {};
__proto_b2Simplex["ReadCache"] = function(self, __f425_cache, __f425_proxyA, __f425_transformA, __f425_proxyB, __f425_transformB)
__static_b2Settings["b2Assert"](__and((function()
return (0 <= __f425_cache["count"])
end)()
, (function()
return (__f425_cache["count"] <= 3)
end)()
));
local __f425_wALocal = __noop();
local __f425_wBLocal = __noop();
self["m_count"] = __f425_cache["count"];
local __f425_vertices = self["m_vertices"];
(function()
local __f425_i = 0;
local function __loop132()
return (function()
local __oak_cond = (function()
return (__f425_i < self["m_count"])
end)()

if __oak_eq(__oak_cond, true) then return (function()
local __r = (function()
return (function()
local __f425_v = __oak_acc(__f425_vertices, (function()
return __f425_i
end)()
);
__f425_v["indexA"] = __oak_acc(__f425_cache["indexA"], (function()
return __f425_i
end)()
);
__f425_v["indexB"] = __oak_acc(__f425_cache["indexB"], (function()
return __f425_i
end)()
);
__f425_wALocal = __f425_proxyA["GetVertex"](__f425_proxyA, __f425_v["indexA"]);
__f425_wBLocal = __f425_proxyB["GetVertex"](__f425_proxyB, __f425_v["indexB"]);
__f425_v["wA"] = __static_b2Math["MulX"](__f425_transformA, __f425_wALocal);
__f425_v["wB"] = __static_b2Math["MulX"](__f425_transformB, __f425_wBLocal);
__f425_v["w"] = __static_b2Math["SubtractVV"](__f425_v["wB"], __f425_v["wA"]);
__f425_v["a"] = 0
return __f425_v["a"]
end)()

end)()
;
return (function()
local __oak_cond = __r
if __oak_eq(__oak_cond, 'break') then return nil
else return (function()
(function()
local __tmp425_133 = __f425_i;
__f425_i = __as_oak_string(__f425_i + 1);
return __tmp425_133
end)()
;
return __loop132()
end)()

end
end)()

end)()

else return nil
end
end)()

end;
return __loop132()
end)()
;
(function()
local __oak_cond = __truthy((function()
return (self["m_count"] > 1)
end)()
)
if __oak_eq(__oak_cond, true) then return (function()
local __f425_metric1 = __f425_cache["metric"];
local __f425_metric2 = self["GetMetric"](self);
return (function()
local __oak_cond = __truthy(__or(__or((function()
return (__f425_metric2 < (function()
return (0.5 * __f425_metric1)
end)()
)
end)()
, (function()
return ((function()
return (2 * __f425_metric1)
end)()
 < __f425_metric2)
end)()
), (function()
return (__f425_metric2 < __Number["MIN_VALUE"])
end)()
))
if __oak_eq(__oak_cond, true) then self["m_count"] = 0
return self["m_count"]
else return __noop()
end
end)()

end)()

else return __noop()
end
end)()
;
return (function()
local __oak_cond = __truthy((function()
return __oak_eq(self["m_count"], 0)
end)()
)
if __oak_eq(__oak_cond, true) then return (function()
__f425_v = __oak_acc(__f425_vertices, (function()
return 0
end)()
);
__f425_v["indexA"] = 0;
__f425_v["indexB"] = 0;
__f425_wALocal = __f425_proxyA["GetVertex"](__f425_proxyA, 0);
__f425_wBLocal = __f425_proxyB["GetVertex"](__f425_proxyB, 0);
__f425_v["wA"] = __static_b2Math["MulX"](__f425_transformA, __f425_wALocal);
__f425_v["wB"] = __static_b2Math["MulX"](__f425_transformB, __f425_wBLocal);
__f425_v["w"] = __static_b2Math["SubtractVV"](__f425_v["wB"], __f425_v["wA"]);
self["m_count"] = 1
return self["m_count"]
end)()

else return __noop()
end
end)()

end;
__proto_b2Simplex["WriteCache"] = function(self, __f426_cache)
__f426_cache["metric"] = self["GetMetric"](self);
__f426_cache["count"] = __parseUInt(self["m_count"]);
local __f426_vertices = self["m_vertices"];
return (function()
local __f426_i = 0;
local function __loop134()
return (function()
local __oak_cond = (function()
return (__f426_i < self["m_count"])
end)()

if __oak_eq(__oak_cond, true) then return (function()
local __r = (function()
return (function()
__f426_cache["indexA"][__add(__f426_i, 1)] = __parseUInt(__oak_acc(__f426_vertices, (function()
return __f426_i
end)()
)["indexA"]);
__f426_cache["indexB"][__add(__f426_i, 1)] = __parseUInt(__oak_acc(__f426_vertices, (function()
return __f426_i
end)()
)["indexB"])
return __oak_acc(__f426_cache["indexB"], (function()
return __add(__f426_i, 1)
end)()
)
end)()

end)()
;
return (function()
local __oak_cond = __r
if __oak_eq(__oak_cond, 'break') then return nil
else return (function()
(function()
local __tmp426_135 = __f426_i;
__f426_i = __as_oak_string(__f426_i + 1);
return __tmp426_135
end)()
;
return __loop134()
end)()

end
end)()

end)()

else return nil
end
end)()

end;
return __loop134()
end)()

end;
__proto_b2Simplex["GetSearchDirection"] = function(self)
return (function()
local __oak_cond = self["m_count"]
if __oak_eq(__oak_cond, 1) then return self["m_v1"]["w"]["GetNegative"](self["m_v1"]["w"])
elseif __oak_eq(__oak_cond, 2) then return (function()
local __f427_e12 = __static_b2Math["SubtractVV"](self["m_v2"]["w"], self["m_v1"]["w"]);
local __f427_sgn = __static_b2Math["CrossVV"](__f427_e12, self["m_v1"]["w"]["GetNegative"](self["m_v1"]["w"]));
return (function()
local __oak_cond = __truthy((function()
return (__f427_sgn > 0)
end)()
)
if __oak_eq(__oak_cond, true) then return __static_b2Math["CrossFV"](1, __f427_e12)
else return __static_b2Math["CrossVF"](__f427_e12, 1)
end
end)()

end)()

else return (function()
__static_b2Settings["b2Assert"](false);
return b2Vec2()
end)()

end
end)()

end;
__proto_b2Simplex["GetClosestPoint"] = function(self)
return (function()
local __oak_cond = self["m_count"]
if __oak_eq(__oak_cond, 0) then return (function()
__static_b2Settings["b2Assert"](false);
return b2Vec2()
end)()

elseif __oak_eq(__oak_cond, 1) then return self["m_v1"]["w"]
elseif __oak_eq(__oak_cond, 2) then return b2Vec2(__add((function()
return (self["m_v1"]["a"] * self["m_v1"]["w"]["x"])
end)()
, (function()
return (self["m_v2"]["a"] * self["m_v2"]["w"]["x"])
end)()
), __add((function()
return (self["m_v1"]["a"] * self["m_v1"]["w"]["y"])
end)()
, (function()
return (self["m_v2"]["a"] * self["m_v2"]["w"]["y"])
end)()
))
else return (function()
__static_b2Settings["b2Assert"](false);
return b2Vec2()
end)()

end
end)()

end;
__proto_b2Simplex["GetWitnessPoints"] = function(self, __f429_pA, __f429_pB)
return (function()
local __oak_cond = self["m_count"]
if __oak_eq(__oak_cond, 0) then return __static_b2Settings["b2Assert"](false)
elseif __oak_eq(__oak_cond, 1) then return (function()
__f429_pA["SetV"](__f429_pA, self["m_v1"]["wA"]);
return __f429_pB["SetV"](__f429_pB, self["m_v1"]["wB"])
end)()

elseif __oak_eq(__oak_cond, 2) then return (function()
__f429_pA["x"] = __add((function()
return (self["m_v1"]["a"] * self["m_v1"]["wA"]["x"])
end)()
, (function()
return (self["m_v2"]["a"] * self["m_v2"]["wA"]["x"])
end)()
);
__f429_pA["y"] = __add((function()
return (self["m_v1"]["a"] * self["m_v1"]["wA"]["y"])
end)()
, (function()
return (self["m_v2"]["a"] * self["m_v2"]["wA"]["y"])
end)()
);
__f429_pB["x"] = __add((function()
return (self["m_v1"]["a"] * self["m_v1"]["wB"]["x"])
end)()
, (function()
return (self["m_v2"]["a"] * self["m_v2"]["wB"]["x"])
end)()
);
__f429_pB["y"] = __add((function()
return (self["m_v1"]["a"] * self["m_v1"]["wB"]["y"])
end)()
, (function()
return (self["m_v2"]["a"] * self["m_v2"]["wB"]["y"])
end)()
)
return __f429_pB["y"]
end)()

elseif __oak_eq(__oak_cond, 3) then return (function()
(function()
__f429_pA["x"] = __add(__add((function()
return (self["m_v1"]["a"] * self["m_v1"]["wA"]["x"])
end)()
, (function()
return (self["m_v2"]["a"] * self["m_v2"]["wA"]["x"])
end)()
), (function()
return (self["m_v3"]["a"] * self["m_v3"]["wA"]["x"])
end)()
);
__f429_pB["x"] = __f429_pA["x"]
return __f429_pB["x"]
end)()
;
return (function()
__f429_pA["y"] = __add(__add((function()
return (self["m_v1"]["a"] * self["m_v1"]["wA"]["y"])
end)()
, (function()
return (self["m_v2"]["a"] * self["m_v2"]["wA"]["y"])
end)()
), (function()
return (self["m_v3"]["a"] * self["m_v3"]["wA"]["y"])
end)()
);
__f429_pB["y"] = __f429_pA["y"]
return __f429_pB["y"]
end)()

end)()

else return __static_b2Settings["b2Assert"](false)
end
end)()

end;
__proto_b2Simplex["GetMetric"] = function(self)
return (function()
local __oak_cond = self["m_count"]
if __oak_eq(__oak_cond, 0) then return (function()
__static_b2Settings["b2Assert"](false);
return 0
end)()

elseif __oak_eq(__oak_cond, 1) then return 0
elseif __oak_eq(__oak_cond, 2) then return __static_b2Math["SubtractVV"](self["m_v1"]["w"], self["m_v2"]["w"])["Length"](__static_b2Math["SubtractVV"](self["m_v1"]["w"], self["m_v2"]["w"]))
elseif __oak_eq(__oak_cond, 3) then return __static_b2Math["CrossVV"](__static_b2Math["SubtractVV"](self["m_v2"]["w"], self["m_v1"]["w"]), __static_b2Math["SubtractVV"](self["m_v3"]["w"], self["m_v1"]["w"]))
else return (function()
__static_b2Settings["b2Assert"](false);
return 0
end)()

end
end)()

end;
__proto_b2Simplex["Solve2"] = function(self)
local __f431_w1 = self["m_v1"]["w"];
local __f431_w2 = self["m_v2"]["w"];
local __f431_e12 = __static_b2Math["SubtractVV"](__f431_w2, __f431_w1);
local __f431_d12_2 = (function()
return (-__add((function()
return (__f431_w1["x"] * __f431_e12["x"])
end)()
, (function()
return (__f431_w1["y"] * __f431_e12["y"])
end)()
))
end)()
;
return (function()
local __oak_cond = __truthy((function()
return (__f431_d12_2 <= 0)
end)()
)
if __oak_eq(__oak_cond, true) then return (function()
self["m_v1"]["a"] = 1;
self["m_count"] = 1;
return __noop()
end)()

else return (function()
local __f431_d12_1 = __add((function()
return (__f431_w2["x"] * __f431_e12["x"])
end)()
, (function()
return (__f431_w2["y"] * __f431_e12["y"])
end)()
);
return (function()
local __oak_cond = __truthy((function()
return (__f431_d12_1 <= 0)
end)()
)
if __oak_eq(__oak_cond, true) then return (function()
self["m_v2"]["a"] = 1;
self["m_count"] = 1;
self["m_v1"]["Set"](self["m_v1"], self["m_v2"]);
return __noop()
end)()

else return (function()
local __f431_inv_d12 = (function()
return (1 / __add(__f431_d12_1, __f431_d12_2))
end)()
;
self["m_v1"]["a"] = (function()
return (__f431_d12_1 * __f431_inv_d12)
end)()
;
self["m_v2"]["a"] = (function()
return (__f431_d12_2 * __f431_inv_d12)
end)()
;
self["m_count"] = 2
return self["m_count"]
end)()

end
end)()

end)()

end
end)()

end;
__proto_b2Simplex["Solve3"] = function(self)
local __f432_w1 = self["m_v1"]["w"];
local __f432_w2 = self["m_v2"]["w"];
local __f432_w3 = self["m_v3"]["w"];
local __f432_e12 = __static_b2Math["SubtractVV"](__f432_w2, __f432_w1);
local __f432_w1e12 = __static_b2Math["Dot"](__f432_w1, __f432_e12);
local __f432_w2e12 = __static_b2Math["Dot"](__f432_w2, __f432_e12);
local __f432_d12_1 = __f432_w2e12;
local __f432_d12_2 = (function()
return (-__f432_w1e12)
end)()
;
local __f432_e13 = __static_b2Math["SubtractVV"](__f432_w3, __f432_w1);
local __f432_w1e13 = __static_b2Math["Dot"](__f432_w1, __f432_e13);
local __f432_w3e13 = __static_b2Math["Dot"](__f432_w3, __f432_e13);
local __f432_d13_1 = __f432_w3e13;
local __f432_d13_2 = (function()
return (-__f432_w1e13)
end)()
;
local __f432_e23 = __static_b2Math["SubtractVV"](__f432_w3, __f432_w2);
local __f432_w2e23 = __static_b2Math["Dot"](__f432_w2, __f432_e23);
local __f432_w3e23 = __static_b2Math["Dot"](__f432_w3, __f432_e23);
local __f432_d23_1 = __f432_w3e23;
local __f432_d23_2 = (function()
return (-__f432_w2e23)
end)()
;
local __f432_n123 = __static_b2Math["CrossVV"](__f432_e12, __f432_e13);
local __f432_d123_1 = (function()
return (__f432_n123 * __static_b2Math["CrossVV"](__f432_w2, __f432_w3))
end)()
;
local __f432_d123_2 = (function()
return (__f432_n123 * __static_b2Math["CrossVV"](__f432_w3, __f432_w1))
end)()
;
local __f432_d123_3 = (function()
return (__f432_n123 * __static_b2Math["CrossVV"](__f432_w1, __f432_w2))
end)()
;
return (function()
local __oak_cond = __truthy(__and((function()
return (__f432_d12_2 <= 0)
end)()
, (function()
return (__f432_d13_2 <= 0)
end)()
))
if __oak_eq(__oak_cond, true) then return (function()
self["m_v1"]["a"] = 1;
self["m_count"] = 1;
return __noop()
end)()

else return (function()
local __oak_cond = __truthy(__and(__and((function()
return (__f432_d12_1 > 0)
end)()
, (function()
return (__f432_d12_2 > 0)
end)()
), (function()
return (__f432_d123_3 <= 0)
end)()
))
if __oak_eq(__oak_cond, true) then return (function()
local __f432_inv_d12 = (function()
return (1 / __add(__f432_d12_1, __f432_d12_2))
end)()
;
self["m_v1"]["a"] = (function()
return (__f432_d12_1 * __f432_inv_d12)
end)()
;
self["m_v2"]["a"] = (function()
return (__f432_d12_2 * __f432_inv_d12)
end)()
;
self["m_count"] = 2;
return __noop()
end)()

else return (function()
local __oak_cond = __truthy(__and(__and((function()
return (__f432_d13_1 > 0)
end)()
, (function()
return (__f432_d13_2 > 0)
end)()
), (function()
return (__f432_d123_2 <= 0)
end)()
))
if __oak_eq(__oak_cond, true) then return (function()
local __f432_inv_d13 = (function()
return (1 / __add(__f432_d13_1, __f432_d13_2))
end)()
;
self["m_v1"]["a"] = (function()
return (__f432_d13_1 * __f432_inv_d13)
end)()
;
self["m_v3"]["a"] = (function()
return (__f432_d13_2 * __f432_inv_d13)
end)()
;
self["m_count"] = 2;
self["m_v2"]["Set"](self["m_v2"], self["m_v3"]);
return __noop()
end)()

else return (function()
local __oak_cond = __truthy(__and((function()
return (__f432_d12_1 <= 0)
end)()
, (function()
return (__f432_d23_2 <= 0)
end)()
))
if __oak_eq(__oak_cond, true) then return (function()
self["m_v2"]["a"] = 1;
self["m_count"] = 1;
self["m_v1"]["Set"](self["m_v1"], self["m_v2"]);
return __noop()
end)()

else return (function()
local __oak_cond = __truthy(__and((function()
return (__f432_d13_1 <= 0)
end)()
, (function()
return (__f432_d23_1 <= 0)
end)()
))
if __oak_eq(__oak_cond, true) then return (function()
self["m_v3"]["a"] = 1;
self["m_count"] = 1;
self["m_v1"]["Set"](self["m_v1"], self["m_v3"]);
return __noop()
end)()

else return (function()
local __oak_cond = __truthy(__and(__and((function()
return (__f432_d23_1 > 0)
end)()
, (function()
return (__f432_d23_2 > 0)
end)()
), (function()
return (__f432_d123_1 <= 0)
end)()
))
if __oak_eq(__oak_cond, true) then return (function()
local __f432_inv_d23 = (function()
return (1 / __add(__f432_d23_1, __f432_d23_2))
end)()
;
self["m_v2"]["a"] = (function()
return (__f432_d23_1 * __f432_inv_d23)
end)()
;
self["m_v3"]["a"] = (function()
return (__f432_d23_2 * __f432_inv_d23)
end)()
;
self["m_count"] = 2;
self["m_v1"]["Set"](self["m_v1"], self["m_v3"]);
return __noop()
end)()

else return (function()
local __f432_inv_d123 = (function()
return (1 / __add(__add(__f432_d123_1, __f432_d123_2), __f432_d123_3))
end)()
;
self["m_v1"]["a"] = (function()
return (__f432_d123_1 * __f432_inv_d123)
end)()
;
self["m_v2"]["a"] = (function()
return (__f432_d123_2 * __f432_inv_d123)
end)()
;
self["m_v3"]["a"] = (function()
return (__f432_d123_3 * __f432_inv_d123)
end)()
;
self["m_count"] = 3
return self["m_count"]
end)()

end
end)()

end
end)()

end
end)()

end
end)()

end
end)()

end
end)()

end;
__static_b2Simplex = {};
b2Simplex = function()
local self = {["__type"]='b2Simplex', ["__types"]={'b2Simplex'}};
self["ReadCache"] = __proto_b2Simplex["ReadCache"];
self["WriteCache"] = __proto_b2Simplex["WriteCache"];
self["GetSearchDirection"] = __proto_b2Simplex["GetSearchDirection"];
self["GetClosestPoint"] = __proto_b2Simplex["GetClosestPoint"];
self["GetWitnessPoints"] = __proto_b2Simplex["GetWitnessPoints"];
self["GetMetric"] = __proto_b2Simplex["GetMetric"];
self["Solve2"] = __proto_b2Simplex["Solve2"];
self["Solve3"] = __proto_b2Simplex["Solve3"];
(function()
self["m_v1"] = b2SimplexVertex();
self["m_v2"] = b2SimplexVertex();
self["m_v3"] = b2SimplexVertex();
self["m_vertices"] = __newArray(3);
self["m_vertices"][__add(0, 1)] = self["m_v1"];
self["m_vertices"][__add(1, 1)] = self["m_v2"];
self["m_vertices"][__add(2, 1)] = self["m_v3"]
return __oak_acc(self["m_vertices"], (function()
return __add(2, 1)
end)()
)
end)()
;
return self
end;
Box2D["Collision"]["b2Simplex"] = b2Simplex;
__proto_b2WorldManifold = {};
__proto_b2WorldManifold["Initialize"] = function(self, __f434_manifold, __f434_xfA, __f434_radiusA, __f434_xfB, __f434_radiusB)
(function()
local __oak_cond = __truthy((function()
return __oak_eq(__f434_radiusA, nil)
end)()
)
if __oak_eq(__oak_cond, true) then __f434_radiusA = 0
return __f434_radiusA
else return __noop()
end
end)()
;
(function()
local __oak_cond = __truthy((function()
return __oak_eq(__f434_radiusB, nil)
end)()
)
if __oak_eq(__oak_cond, true) then __f434_radiusB = 0
return __f434_radiusB
else return __noop()
end
end)()
;
return (function()
local __oak_cond = __truthy((function()
return __oak_eq(__f434_manifold["m_pointCount"], 0)
end)()
)
if __oak_eq(__oak_cond, true) then return __noop()
else return (function()
local __f434_i = 0;
local __f434_tVec = __noop();
local __f434_tMat = __noop();
local __f434_normalX = 0;
local __f434_normalY = 0;
local __f434_planePointX = 0;
local __f434_planePointY = 0;
local __f434_clipPointX = 0;
local __f434_clipPointY = 0;
return (function()
local __oak_cond = __f434_manifold["m_type"]
if __oak_eq(__oak_cond, __static_b2Manifold["e_circles"]) then return (function()
__f434_tMat = __f434_xfA["R"];
__f434_tVec = __f434_manifold["m_localPoint"];
local __f434_pointAX = __add(__add(__f434_xfA["position"]["x"], (function()
return (__f434_tMat["col1"]["x"] * __f434_tVec["x"])
end)()
), (function()
return (__f434_tMat["col2"]["x"] * __f434_tVec["y"])
end)()
);
local __f434_pointAY = __add(__add(__f434_xfA["position"]["y"], (function()
return (__f434_tMat["col1"]["y"] * __f434_tVec["x"])
end)()
), (function()
return (__f434_tMat["col2"]["y"] * __f434_tVec["y"])
end)()
);
__f434_tMat = __f434_xfB["R"];
__f434_tVec = __oak_acc(__f434_manifold["m_points"], (function()
return 0
end)()
)["m_localPoint"];
local __f434_pointBX = __add(__add(__f434_xfB["position"]["x"], (function()
return (__f434_tMat["col1"]["x"] * __f434_tVec["x"])
end)()
), (function()
return (__f434_tMat["col2"]["x"] * __f434_tVec["y"])
end)()
);
local __f434_pointBY = __add(__add(__f434_xfB["position"]["y"], (function()
return (__f434_tMat["col1"]["y"] * __f434_tVec["x"])
end)()
), (function()
return (__f434_tMat["col2"]["y"] * __f434_tVec["y"])
end)()
);
local __f434_dX = (function()
return (__f434_pointBX - __f434_pointAX)
end)()
;
local __f434_dY = (function()
return (__f434_pointBY - __f434_pointAY)
end)()
;
local __f434_d2 = __add((function()
return (__f434_dX * __f434_dX)
end)()
, (function()
return (__f434_dY * __f434_dY)
end)()
);
(function()
local __oak_cond = __truthy((function()
return (__f434_d2 > (function()
return (__Number["MIN_VALUE"] * __Number["MIN_VALUE"])
end)()
)
end)()
)
if __oak_eq(__oak_cond, true) then return (function()
local __f434_d = __Math["sqrt"](__f434_d2);
self["m_normal"]["x"] = (function()
return (__f434_dX / __f434_d)
end)()
;
self["m_normal"]["y"] = (function()
return (__f434_dY / __f434_d)
end)()

return self["m_normal"]["y"]
end)()

else return (function()
self["m_normal"]["x"] = 1;
self["m_normal"]["y"] = 0
return self["m_normal"]["y"]
end)()

end
end)()
;
local __f434_cAX = __add(__f434_pointAX, (function()
return (__f434_radiusA * self["m_normal"]["x"])
end)()
);
local __f434_cAY = __add(__f434_pointAY, (function()
return (__f434_radiusA * self["m_normal"]["y"])
end)()
);
local __f434_cBX = (function()
return (__f434_pointBX - (function()
return (__f434_radiusB * self["m_normal"]["x"])
end)()
)
end)()
;
local __f434_cBY = (function()
return (__f434_pointBY - (function()
return (__f434_radiusB * self["m_normal"]["y"])
end)()
)
end)()
;
__oak_acc(self["m_points"], (function()
return 0
end)()
)["x"] = (function()
return (0.5 * __add(__f434_cAX, __f434_cBX))
end)()
;
__oak_acc(self["m_points"], (function()
return 0
end)()
)["y"] = (function()
return (0.5 * __add(__f434_cAY, __f434_cBY))
end)()

return __oak_acc(self["m_points"], (function()
return 0
end)()
)["y"]
end)()

elseif __oak_eq(__oak_cond, __static_b2Manifold["e_faceA"]) then return (function()
__f434_tMat = __f434_xfA["R"];
__f434_tVec = __f434_manifold["m_localPlaneNormal"];
__f434_normalX = __add((function()
return (__f434_tMat["col1"]["x"] * __f434_tVec["x"])
end)()
, (function()
return (__f434_tMat["col2"]["x"] * __f434_tVec["y"])
end)()
);
__f434_normalY = __add((function()
return (__f434_tMat["col1"]["y"] * __f434_tVec["x"])
end)()
, (function()
return (__f434_tMat["col2"]["y"] * __f434_tVec["y"])
end)()
);
__f434_tMat = __f434_xfA["R"];
__f434_tVec = __f434_manifold["m_localPoint"];
__f434_planePointX = __add(__add(__f434_xfA["position"]["x"], (function()
return (__f434_tMat["col1"]["x"] * __f434_tVec["x"])
end)()
), (function()
return (__f434_tMat["col2"]["x"] * __f434_tVec["y"])
end)()
);
__f434_planePointY = __add(__add(__f434_xfA["position"]["y"], (function()
return (__f434_tMat["col1"]["y"] * __f434_tVec["x"])
end)()
), (function()
return (__f434_tMat["col2"]["y"] * __f434_tVec["y"])
end)()
);
self["m_normal"]["x"] = __f434_normalX;
self["m_normal"]["y"] = __f434_normalY;
return (function()
__f434_i = 0;
local function __loop136()
return (function()
local __oak_cond = (function()
return (__f434_i < __f434_manifold["m_pointCount"])
end)()

if __oak_eq(__oak_cond, true) then return (function()
local __r = (function()
return (function()
__f434_tMat = __f434_xfB["R"];
__f434_tVec = __oak_acc(__f434_manifold["m_points"], (function()
return __f434_i
end)()
)["m_localPoint"];
__f434_clipPointX = __add(__add(__f434_xfB["position"]["x"], (function()
return (__f434_tMat["col1"]["x"] * __f434_tVec["x"])
end)()
), (function()
return (__f434_tMat["col2"]["x"] * __f434_tVec["y"])
end)()
);
__f434_clipPointY = __add(__add(__f434_xfB["position"]["y"], (function()
return (__f434_tMat["col1"]["y"] * __f434_tVec["x"])
end)()
), (function()
return (__f434_tMat["col2"]["y"] * __f434_tVec["y"])
end)()
);
__oak_acc(self["m_points"], (function()
return __f434_i
end)()
)["x"] = __add(__f434_clipPointX, (function()
return ((function()
return (0.5 * (function()
return ((function()
return ((function()
return (__f434_radiusA - (function()
return ((function()
return (__f434_clipPointX - __f434_planePointX)
end)()
 * __f434_normalX)
end)()
)
end)()
 - (function()
return ((function()
return (__f434_clipPointY - __f434_planePointY)
end)()
 * __f434_normalY)
end)()
)
end)()
 - __f434_radiusB)
end)()
)
end)()
 * __f434_normalX)
end)()
);
__oak_acc(self["m_points"], (function()
return __f434_i
end)()
)["y"] = __add(__f434_clipPointY, (function()
return ((function()
return (0.5 * (function()
return ((function()
return ((function()
return (__f434_radiusA - (function()
return ((function()
return (__f434_clipPointX - __f434_planePointX)
end)()
 * __f434_normalX)
end)()
)
end)()
 - (function()
return ((function()
return (__f434_clipPointY - __f434_planePointY)
end)()
 * __f434_normalY)
end)()
)
end)()
 - __f434_radiusB)
end)()
)
end)()
 * __f434_normalY)
end)()
)
return __oak_acc(self["m_points"], (function()
return __f434_i
end)()
)["y"]
end)()

end)()
;
return (function()
local __oak_cond = __r
if __oak_eq(__oak_cond, 'break') then return nil
else return (function()
(function()
local __tmp434_137 = __f434_i;
__f434_i = __as_oak_string(__f434_i + 1);
return __tmp434_137
end)()
;
return __loop136()
end)()

end
end)()

end)()

else return nil
end
end)()

end;
return __loop136()
end)()

end)()

elseif __oak_eq(__oak_cond, __static_b2Manifold["e_faceB"]) then return (function()
__f434_tMat = __f434_xfB["R"];
__f434_tVec = __f434_manifold["m_localPlaneNormal"];
__f434_normalX = __add((function()
return (__f434_tMat["col1"]["x"] * __f434_tVec["x"])
end)()
, (function()
return (__f434_tMat["col2"]["x"] * __f434_tVec["y"])
end)()
);
__f434_normalY = __add((function()
return (__f434_tMat["col1"]["y"] * __f434_tVec["x"])
end)()
, (function()
return (__f434_tMat["col2"]["y"] * __f434_tVec["y"])
end)()
);
__f434_tMat = __f434_xfB["R"];
__f434_tVec = __f434_manifold["m_localPoint"];
__f434_planePointX = __add(__add(__f434_xfB["position"]["x"], (function()
return (__f434_tMat["col1"]["x"] * __f434_tVec["x"])
end)()
), (function()
return (__f434_tMat["col2"]["x"] * __f434_tVec["y"])
end)()
);
__f434_planePointY = __add(__add(__f434_xfB["position"]["y"], (function()
return (__f434_tMat["col1"]["y"] * __f434_tVec["x"])
end)()
), (function()
return (__f434_tMat["col2"]["y"] * __f434_tVec["y"])
end)()
);
self["m_normal"]["x"] = (function()
return (-__f434_normalX)
end)()
;
self["m_normal"]["y"] = (function()
return (-__f434_normalY)
end)()
;
return (function()
__f434_i = 0;
local function __loop138()
return (function()
local __oak_cond = (function()
return (__f434_i < __f434_manifold["m_pointCount"])
end)()

if __oak_eq(__oak_cond, true) then return (function()
local __r = (function()
return (function()
__f434_tMat = __f434_xfA["R"];
__f434_tVec = __oak_acc(__f434_manifold["m_points"], (function()
return __f434_i
end)()
)["m_localPoint"];
__f434_clipPointX = __add(__add(__f434_xfA["position"]["x"], (function()
return (__f434_tMat["col1"]["x"] * __f434_tVec["x"])
end)()
), (function()
return (__f434_tMat["col2"]["x"] * __f434_tVec["y"])
end)()
);
__f434_clipPointY = __add(__add(__f434_xfA["position"]["y"], (function()
return (__f434_tMat["col1"]["y"] * __f434_tVec["x"])
end)()
), (function()
return (__f434_tMat["col2"]["y"] * __f434_tVec["y"])
end)()
);
__oak_acc(self["m_points"], (function()
return __f434_i
end)()
)["x"] = __add(__f434_clipPointX, (function()
return ((function()
return (0.5 * (function()
return ((function()
return ((function()
return (__f434_radiusB - (function()
return ((function()
return (__f434_clipPointX - __f434_planePointX)
end)()
 * __f434_normalX)
end)()
)
end)()
 - (function()
return ((function()
return (__f434_clipPointY - __f434_planePointY)
end)()
 * __f434_normalY)
end)()
)
end)()
 - __f434_radiusA)
end)()
)
end)()
 * __f434_normalX)
end)()
);
__oak_acc(self["m_points"], (function()
return __f434_i
end)()
)["y"] = __add(__f434_clipPointY, (function()
return ((function()
return (0.5 * (function()
return ((function()
return ((function()
return (__f434_radiusB - (function()
return ((function()
return (__f434_clipPointX - __f434_planePointX)
end)()
 * __f434_normalX)
end)()
)
end)()
 - (function()
return ((function()
return (__f434_clipPointY - __f434_planePointY)
end)()
 * __f434_normalY)
end)()
)
end)()
 - __f434_radiusA)
end)()
)
end)()
 * __f434_normalY)
end)()
)
return __oak_acc(self["m_points"], (function()
return __f434_i
end)()
)["y"]
end)()

end)()
;
return (function()
local __oak_cond = __r
if __oak_eq(__oak_cond, 'break') then return nil
else return (function()
(function()
local __tmp434_139 = __f434_i;
__f434_i = __as_oak_string(__f434_i + 1);
return __tmp434_139
end)()
;
return __loop138()
end)()

end
end)()

end)()

else return nil
end
end)()

end;
return __loop138()
end)()

end)()

else return nil
end
end)()

end)()

end
end)()

end;
__static_b2WorldManifold = {};
b2WorldManifold = function()
local self = {["__type"]='b2WorldManifold', ["__types"]={'b2WorldManifold'}};
self["Initialize"] = __proto_b2WorldManifold["Initialize"];
(function()
self["m_normal"] = b2Vec2();
self["m_points"] = __newArray(__static_b2Settings["b2_maxManifoldPoints"]);
return (function()
local __f435_i = 0;
local function __loop140()
return (function()
local __oak_cond = (function()
return (__f435_i < __static_b2Settings["b2_maxManifoldPoints"])
end)()

if __oak_eq(__oak_cond, true) then return (function()
local __r = (function()
self["m_points"][__add(__f435_i, 1)] = b2Vec2()
return __oak_acc(self["m_points"], (function()
return __add(__f435_i, 1)
end)()
)
end)()
;
return (function()
local __oak_cond = __r
if __oak_eq(__oak_cond, 'break') then return nil
else return (function()
(function()
local __tmp435_141 = __f435_i;
__f435_i = __as_oak_string(__f435_i + 1);
return __tmp435_141
end)()
;
return __loop140()
end)()

end
end)()

end)()

else return nil
end
end)()

end;
return __loop140()
end)()

end)()
;
return self
end;
Box2D["Collision"]["b2WorldManifold"] = b2WorldManifold;
__proto_b2EdgeChainDef = {};
__static_b2EdgeChainDef = {};
b2EdgeChainDef = function()
local self = {["__type"]='b2EdgeChainDef', ["__types"]={'b2EdgeChainDef'}};
(function()
self["vertexCount"] = 0;
self["isALoop"] = true;
self["vertices"] = {}
return self["vertices"]
end)()
;
return self
end;
Box2D["Collision"]["Shapes"]["b2EdgeChainDef"] = b2EdgeChainDef;
__proto_b2Shape = {};
__proto_b2Shape["Copy"] = function(self)
return nil
end;
__proto_b2Shape["Set"] = function(self, __f438_other)
self["m_radius"] = __f438_other["m_radius"]
return self["m_radius"]
end;
__proto_b2Shape["GetType"] = function(self)
return self["m_type"]
end;
__proto_b2Shape["TestPoint"] = function(self, __f440_xf, __f440_p)
return false
end;
__proto_b2Shape["RayCast"] = function(self, __f441_output, __f441_input, __f441_transform)
return false
end;
__proto_b2Shape["ComputeAABB"] = function(self, __f442_aabb, __f442_xf)
return nil
end;
__proto_b2Shape["ComputeMass"] = function(self, __f443_massData, __f443_density)
return (function()
local __oak_cond = __truthy((function()
return __oak_eq(__f443_density, nil)
end)()
)
if __oak_eq(__oak_cond, true) then __f443_density = 0
return __f443_density
else return __noop()
end
end)()

end;
__proto_b2Shape["ComputeSubmergedArea"] = function(self, __f444_normal, __f444_offset, __f444_xf, __f444_c)
(function()
local __oak_cond = __truthy((function()
return __oak_eq(__f444_offset, nil)
end)()
)
if __oak_eq(__oak_cond, true) then __f444_offset = 0
return __f444_offset
else return __noop()
end
end)()
;
return 0
end;
__static_b2Shape = {};
__static_b2Shape["TestOverlap"] = function(__f445_shape1, __f445_transform1, __f445_shape2, __f445_transform2)
local __f445_input = b2DistanceInput();
__f445_input["proxyA"] = b2DistanceProxy();
__f445_input["proxyA"]["Set"](__f445_input["proxyA"], __f445_shape1);
__f445_input["proxyB"] = b2DistanceProxy();
__f445_input["proxyB"]["Set"](__f445_input["proxyB"], __f445_shape2);
__f445_input["transformA"] = __f445_transform1;
__f445_input["transformB"] = __f445_transform2;
__f445_input["useRadii"] = true;
local __f445_simplexCache = b2SimplexCache();
__f445_simplexCache["count"] = 0;
local __f445_output = b2DistanceOutput();
__static_b2Distance["Distance"](__f445_output, __f445_simplexCache, __f445_input);
return (function()
return (__f445_output["distance"] < (function()
return (10 * __Number["MIN_VALUE"])
end)()
)
end)()

end;
b2Shape = function()
local self = {["__type"]='b2Shape', ["__types"]={'b2Shape'}};
self["Copy"] = __proto_b2Shape["Copy"];
self["Set"] = __proto_b2Shape["Set"];
self["GetType"] = __proto_b2Shape["GetType"];
self["TestPoint"] = __proto_b2Shape["TestPoint"];
self["RayCast"] = __proto_b2Shape["RayCast"];
self["ComputeAABB"] = __proto_b2Shape["ComputeAABB"];
self["ComputeMass"] = __proto_b2Shape["ComputeMass"];
self["ComputeSubmergedArea"] = __proto_b2Shape["ComputeSubmergedArea"];
(function()
self["m_type"] = __static_b2Shape["e_unknownShape"];
self["m_radius"] = __static_b2Settings["b2_linearSlop"]
return self["m_radius"]
end)()
;
return self
end;
Box2D["Collision"]["Shapes"]["b2Shape"] = b2Shape;
__proto_b2Mat22 = {};
__proto_b2Mat22["Set"] = function(self, __f447_angle)
(function()
local __oak_cond = __truthy((function()
return __oak_eq(__f447_angle, nil)
end)()
)
if __oak_eq(__oak_cond, true) then __f447_angle = 0
return __f447_angle
else return __noop()
end
end)()
;
local __f447_c = __Math["cos"](__f447_angle);
local __f447_s = __Math["sin"](__f447_angle);
self["col1"]["x"] = __f447_c;
self["col2"]["x"] = (function()
return (-__f447_s)
end)()
;
self["col1"]["y"] = __f447_s;
self["col2"]["y"] = __f447_c
return self["col2"]["y"]
end;
__proto_b2Mat22["SetVV"] = function(self, __f448_c1, __f448_c2)
self["col1"]["SetV"](self["col1"], __f448_c1);
return self["col2"]["SetV"](self["col2"], __f448_c2)
end;
__proto_b2Mat22["Copy"] = function(self)
local __f449_mat = b2Mat22();
__f449_mat["SetM"](__f449_mat, self);
return __f449_mat
end;
__proto_b2Mat22["SetM"] = function(self, __f450_m)
self["col1"]["SetV"](self["col1"], __f450_m["col1"]);
return self["col2"]["SetV"](self["col2"], __f450_m["col2"])
end;
__proto_b2Mat22["AddM"] = function(self, __f451_m)
self["col1"]["x"] = __add(self["col1"]["x"], __f451_m["col1"]["x"]);
self["col1"]["y"] = __add(self["col1"]["y"], __f451_m["col1"]["y"]);
self["col2"]["x"] = __add(self["col2"]["x"], __f451_m["col2"]["x"]);
self["col2"]["y"] = __add(self["col2"]["y"], __f451_m["col2"]["y"])
return self["col2"]["y"]
end;
__proto_b2Mat22["SetIdentity"] = function(self)
self["col1"]["x"] = 1;
self["col2"]["x"] = 0;
self["col1"]["y"] = 0;
self["col2"]["y"] = 1
return self["col2"]["y"]
end;
__proto_b2Mat22["SetZero"] = function(self)
self["col1"]["x"] = 0;
self["col2"]["x"] = 0;
self["col1"]["y"] = 0;
self["col2"]["y"] = 0
return self["col2"]["y"]
end;
__proto_b2Mat22["GetAngle"] = function(self)
return __Math["atan2"](self["col1"]["y"], self["col1"]["x"])
end;
__proto_b2Mat22["GetInverse"] = function(self, __f455_out)
local __f455_a = self["col1"]["x"];
local __f455_b = self["col2"]["x"];
local __f455_c = self["col1"]["y"];
local __f455_d = self["col2"]["y"];
local __f455_det = (function()
return ((function()
return (__f455_a * __f455_d)
end)()
 - (function()
return (__f455_b * __f455_c)
end)()
)
end)()
;
(function()
local __oak_cond = __truthy((function()
return (not __oak_eq(__f455_det, 0))
end)()
)
if __oak_eq(__oak_cond, true) then __f455_det = (function()
return (1 / __f455_det)
end)()

return __f455_det
else return __noop()
end
end)()
;
__f455_out["col1"]["x"] = (function()
return (__f455_det * __f455_d)
end)()
;
__f455_out["col2"]["x"] = (function()
return ((function()
return (-__f455_det)
end)()
 * __f455_b)
end)()
;
__f455_out["col1"]["y"] = (function()
return ((function()
return (-__f455_det)
end)()
 * __f455_c)
end)()
;
__f455_out["col2"]["y"] = (function()
return (__f455_det * __f455_a)
end)()
;
return __f455_out
end;
__proto_b2Mat22["Solve"] = function(self, __f456_out, __f456_bX, __f456_bY)
(function()
local __oak_cond = __truthy((function()
return __oak_eq(__f456_bX, nil)
end)()
)
if __oak_eq(__oak_cond, true) then __f456_bX = 0
return __f456_bX
else return __noop()
end
end)()
;
(function()
local __oak_cond = __truthy((function()
return __oak_eq(__f456_bY, nil)
end)()
)
if __oak_eq(__oak_cond, true) then __f456_bY = 0
return __f456_bY
else return __noop()
end
end)()
;
local __f456_a11 = self["col1"]["x"];
local __f456_a12 = self["col2"]["x"];
local __f456_a21 = self["col1"]["y"];
local __f456_a22 = self["col2"]["y"];
local __f456_det = (function()
return ((function()
return (__f456_a11 * __f456_a22)
end)()
 - (function()
return (__f456_a12 * __f456_a21)
end)()
)
end)()
;
(function()
local __oak_cond = __truthy((function()
return (not __oak_eq(__f456_det, 0))
end)()
)
if __oak_eq(__oak_cond, true) then __f456_det = (function()
return (1 / __f456_det)
end)()

return __f456_det
else return __noop()
end
end)()
;
__f456_out["x"] = (function()
return (__f456_det * (function()
return ((function()
return (__f456_a22 * __f456_bX)
end)()
 - (function()
return (__f456_a12 * __f456_bY)
end)()
)
end)()
)
end)()
;
__f456_out["y"] = (function()
return (__f456_det * (function()
return ((function()
return (__f456_a11 * __f456_bY)
end)()
 - (function()
return (__f456_a21 * __f456_bX)
end)()
)
end)()
)
end)()
;
return __f456_out
end;
__proto_b2Mat22["Abs"] = function(self)
self["col1"]["Abs"](self["col1"]);
return self["col2"]["Abs"](self["col2"])
end;
__static_b2Mat22 = {};
__static_b2Mat22["FromAngle"] = function(__f458_angle)
(function()
local __oak_cond = __truthy((function()
return __oak_eq(__f458_angle, nil)
end)()
)
if __oak_eq(__oak_cond, true) then __f458_angle = 0
return __f458_angle
else return __noop()
end
end)()
;
local __f458_mat = b2Mat22();
__f458_mat["Set"](__f458_mat, __f458_angle);
return __f458_mat
end;
__static_b2Mat22["FromVV"] = function(__f459_c1, __f459_c2)
local __f459_mat = b2Mat22();
__f459_mat["SetVV"](__f459_mat, __f459_c1, __f459_c2);
return __f459_mat
end;
b2Mat22 = function()
local self = {["__type"]='b2Mat22', ["__types"]={'b2Mat22'}};
self["Set"] = __proto_b2Mat22["Set"];
self["SetVV"] = __proto_b2Mat22["SetVV"];
self["Copy"] = __proto_b2Mat22["Copy"];
self["SetM"] = __proto_b2Mat22["SetM"];
self["AddM"] = __proto_b2Mat22["AddM"];
self["SetIdentity"] = __proto_b2Mat22["SetIdentity"];
self["SetZero"] = __proto_b2Mat22["SetZero"];
self["GetAngle"] = __proto_b2Mat22["GetAngle"];
self["GetInverse"] = __proto_b2Mat22["GetInverse"];
self["Solve"] = __proto_b2Mat22["Solve"];
self["Abs"] = __proto_b2Mat22["Abs"];
(function()
self["col1"] = b2Vec2();
self["col2"] = b2Vec2();
return self["SetIdentity"](self)
end)()
;
return self
end;
Box2D["Common"]["Math"]["b2Mat22"] = b2Mat22;
__proto_b2Mat33 = {};
__proto_b2Mat33["SetVVV"] = function(self, __f461_c1, __f461_c2, __f461_c3)
self["col1"]["SetV"](self["col1"], __f461_c1);
self["col2"]["SetV"](self["col2"], __f461_c2);
return self["col3"]["SetV"](self["col3"], __f461_c3)
end;
__proto_b2Mat33["Copy"] = function(self)
return b2Mat33(self["col1"], self["col2"], self["col3"])
end;
__proto_b2Mat33["SetM"] = function(self, __f463_m)
self["col1"]["SetV"](self["col1"], __f463_m["col1"]);
self["col2"]["SetV"](self["col2"], __f463_m["col2"]);
return self["col3"]["SetV"](self["col3"], __f463_m["col3"])
end;
__proto_b2Mat33["AddM"] = function(self, __f464_m)
self["col1"]["x"] = __add(self["col1"]["x"], __f464_m["col1"]["x"]);
self["col1"]["y"] = __add(self["col1"]["y"], __f464_m["col1"]["y"]);
self["col1"]["z"] = __add(self["col1"]["z"], __f464_m["col1"]["z"]);
self["col2"]["x"] = __add(self["col2"]["x"], __f464_m["col2"]["x"]);
self["col2"]["y"] = __add(self["col2"]["y"], __f464_m["col2"]["y"]);
self["col2"]["z"] = __add(self["col2"]["z"], __f464_m["col2"]["z"]);
self["col3"]["x"] = __add(self["col3"]["x"], __f464_m["col3"]["x"]);
self["col3"]["y"] = __add(self["col3"]["y"], __f464_m["col3"]["y"]);
self["col3"]["z"] = __add(self["col3"]["z"], __f464_m["col3"]["z"])
return self["col3"]["z"]
end;
__proto_b2Mat33["SetIdentity"] = function(self)
self["col1"]["x"] = 1;
self["col2"]["x"] = 0;
self["col3"]["x"] = 0;
self["col1"]["y"] = 0;
self["col2"]["y"] = 1;
self["col3"]["y"] = 0;
self["col1"]["z"] = 0;
self["col2"]["z"] = 0;
self["col3"]["z"] = 1
return self["col3"]["z"]
end;
__proto_b2Mat33["SetZero"] = function(self)
self["col1"]["x"] = 0;
self["col2"]["x"] = 0;
self["col3"]["x"] = 0;
self["col1"]["y"] = 0;
self["col2"]["y"] = 0;
self["col3"]["y"] = 0;
self["col1"]["z"] = 0;
self["col2"]["z"] = 0;
self["col3"]["z"] = 0
return self["col3"]["z"]
end;
__proto_b2Mat33["Solve22"] = function(self, __f467_out, __f467_bX, __f467_bY)
(function()
local __oak_cond = __truthy((function()
return __oak_eq(__f467_bX, nil)
end)()
)
if __oak_eq(__oak_cond, true) then __f467_bX = 0
return __f467_bX
else return __noop()
end
end)()
;
(function()
local __oak_cond = __truthy((function()
return __oak_eq(__f467_bY, nil)
end)()
)
if __oak_eq(__oak_cond, true) then __f467_bY = 0
return __f467_bY
else return __noop()
end
end)()
;
local __f467_a11 = self["col1"]["x"];
local __f467_a12 = self["col2"]["x"];
local __f467_a21 = self["col1"]["y"];
local __f467_a22 = self["col2"]["y"];
local __f467_det = (function()
return ((function()
return (__f467_a11 * __f467_a22)
end)()
 - (function()
return (__f467_a12 * __f467_a21)
end)()
)
end)()
;
(function()
local __oak_cond = __truthy((function()
return (not __oak_eq(__f467_det, 0))
end)()
)
if __oak_eq(__oak_cond, true) then __f467_det = (function()
return (1 / __f467_det)
end)()

return __f467_det
else return __noop()
end
end)()
;
__f467_out["x"] = (function()
return (__f467_det * (function()
return ((function()
return (__f467_a22 * __f467_bX)
end)()
 - (function()
return (__f467_a12 * __f467_bY)
end)()
)
end)()
)
end)()
;
__f467_out["y"] = (function()
return (__f467_det * (function()
return ((function()
return (__f467_a11 * __f467_bY)
end)()
 - (function()
return (__f467_a21 * __f467_bX)
end)()
)
end)()
)
end)()
;
return __f467_out
end;
__proto_b2Mat33["Solve33"] = function(self, __f468_out, __f468_bX, __f468_bY, __f468_bZ)
(function()
local __oak_cond = __truthy((function()
return __oak_eq(__f468_bX, nil)
end)()
)
if __oak_eq(__oak_cond, true) then __f468_bX = 0
return __f468_bX
else return __noop()
end
end)()
;
(function()
local __oak_cond = __truthy((function()
return __oak_eq(__f468_bY, nil)
end)()
)
if __oak_eq(__oak_cond, true) then __f468_bY = 0
return __f468_bY
else return __noop()
end
end)()
;
(function()
local __oak_cond = __truthy((function()
return __oak_eq(__f468_bZ, nil)
end)()
)
if __oak_eq(__oak_cond, true) then __f468_bZ = 0
return __f468_bZ
else return __noop()
end
end)()
;
local __f468_a11 = self["col1"]["x"];
local __f468_a21 = self["col1"]["y"];
local __f468_a31 = self["col1"]["z"];
local __f468_a12 = self["col2"]["x"];
local __f468_a22 = self["col2"]["y"];
local __f468_a32 = self["col2"]["z"];
local __f468_a13 = self["col3"]["x"];
local __f468_a23 = self["col3"]["y"];
local __f468_a33 = self["col3"]["z"];
local __f468_det = __add(__add((function()
return (__f468_a11 * (function()
return ((function()
return (__f468_a22 * __f468_a33)
end)()
 - (function()
return (__f468_a32 * __f468_a23)
end)()
)
end)()
)
end)()
, (function()
return (__f468_a21 * (function()
return ((function()
return (__f468_a32 * __f468_a13)
end)()
 - (function()
return (__f468_a12 * __f468_a33)
end)()
)
end)()
)
end)()
), (function()
return (__f468_a31 * (function()
return ((function()
return (__f468_a12 * __f468_a23)
end)()
 - (function()
return (__f468_a22 * __f468_a13)
end)()
)
end)()
)
end)()
);
(function()
local __oak_cond = __truthy((function()
return (not __oak_eq(__f468_det, 0))
end)()
)
if __oak_eq(__oak_cond, true) then __f468_det = (function()
return (1 / __f468_det)
end)()

return __f468_det
else return __noop()
end
end)()
;
__f468_out["x"] = (function()
return (__f468_det * __add(__add((function()
return (__f468_bX * (function()
return ((function()
return (__f468_a22 * __f468_a33)
end)()
 - (function()
return (__f468_a32 * __f468_a23)
end)()
)
end)()
)
end)()
, (function()
return (__f468_bY * (function()
return ((function()
return (__f468_a32 * __f468_a13)
end)()
 - (function()
return (__f468_a12 * __f468_a33)
end)()
)
end)()
)
end)()
), (function()
return (__f468_bZ * (function()
return ((function()
return (__f468_a12 * __f468_a23)
end)()
 - (function()
return (__f468_a22 * __f468_a13)
end)()
)
end)()
)
end)()
))
end)()
;
__f468_out["y"] = (function()
return (__f468_det * __add(__add((function()
return (__f468_a11 * (function()
return ((function()
return (__f468_bY * __f468_a33)
end)()
 - (function()
return (__f468_bZ * __f468_a23)
end)()
)
end)()
)
end)()
, (function()
return (__f468_a21 * (function()
return ((function()
return (__f468_bZ * __f468_a13)
end)()
 - (function()
return (__f468_bX * __f468_a33)
end)()
)
end)()
)
end)()
), (function()
return (__f468_a31 * (function()
return ((function()
return (__f468_bX * __f468_a23)
end)()
 - (function()
return (__f468_bY * __f468_a13)
end)()
)
end)()
)
end)()
))
end)()
;
__f468_out["z"] = (function()
return (__f468_det * __add(__add((function()
return (__f468_a11 * (function()
return ((function()
return (__f468_a22 * __f468_bZ)
end)()
 - (function()
return (__f468_a32 * __f468_bY)
end)()
)
end)()
)
end)()
, (function()
return (__f468_a21 * (function()
return ((function()
return (__f468_a32 * __f468_bX)
end)()
 - (function()
return (__f468_a12 * __f468_bZ)
end)()
)
end)()
)
end)()
), (function()
return (__f468_a31 * (function()
return ((function()
return (__f468_a12 * __f468_bY)
end)()
 - (function()
return (__f468_a22 * __f468_bX)
end)()
)
end)()
)
end)()
))
end)()
;
return __f468_out
end;
__static_b2Mat33 = {};
b2Mat33 = function()
local self = {["__type"]='b2Mat33', ["__types"]={'b2Mat33'}};
self["SetVVV"] = __proto_b2Mat33["SetVVV"];
self["Copy"] = __proto_b2Mat33["Copy"];
self["SetM"] = __proto_b2Mat33["SetM"];
self["AddM"] = __proto_b2Mat33["AddM"];
self["SetIdentity"] = __proto_b2Mat33["SetIdentity"];
self["SetZero"] = __proto_b2Mat33["SetZero"];
self["Solve22"] = __proto_b2Mat33["Solve22"];
self["Solve33"] = __proto_b2Mat33["Solve33"];
(function()
self["col1"] = b2Vec3();
self["col2"] = b2Vec3();
self["col3"] = b2Vec3();
(function()
local __oak_cond = __truthy((function()
return __oak_eq(c1, nil)
end)()
)
if __oak_eq(__oak_cond, true) then local __f469_c1 = nil
return __f469_c1
else return __noop()
end
end)()
;
(function()
local __oak_cond = __truthy((function()
return __oak_eq(c2, nil)
end)()
)
if __oak_eq(__oak_cond, true) then local __f469_c2 = nil
return __f469_c2
else return __noop()
end
end)()
;
(function()
local __oak_cond = __truthy((function()
return __oak_eq(c3, nil)
end)()
)
if __oak_eq(__oak_cond, true) then local __f469_c3 = nil
return __f469_c3
else return __noop()
end
end)()
;
return (function()
local __oak_cond = __truthy(__and(__and(__not(__f469_c1), __not(__f469_c2)), __not(__f469_c3)))
if __oak_eq(__oak_cond, true) then return (function()
self["col1"]["SetZero"](self["col1"]);
self["col2"]["SetZero"](self["col2"]);
return self["col3"]["SetZero"](self["col3"])
end)()

else return (function()
self["col1"]["SetV"](self["col1"], __f469_c1);
self["col2"]["SetV"](self["col2"], __f469_c2);
return self["col3"]["SetV"](self["col3"], __f469_c3)
end)()

end
end)()

end)()
;
return self
end;
Box2D["Common"]["Math"]["b2Mat33"] = b2Mat33;
__proto_b2Transform = {};
__proto_b2Transform["Initialize"] = function(self, __f470_pos, __f470_r)
self["position"]["SetV"](self["position"], __f470_pos);
return self["R"]["SetM"](self["R"], __f470_r)
end;
__proto_b2Transform["SetIdentity"] = function(self)
self["position"]["SetZero"](self["position"]);
return self["R"]["SetIdentity"](self["R"])
end;
__proto_b2Transform["Set"] = function(self, __f472_x)
self["position"]["SetV"](self["position"], __f472_x["position"]);
return self["R"]["SetM"](self["R"], __f472_x["R"])
end;
__proto_b2Transform["GetAngle"] = function(self)
return __Math["atan2"](self["R"]["col1"]["y"], self["R"]["col1"]["x"])
end;
__static_b2Transform = {};
b2Transform = function()
local self = {["__type"]='b2Transform', ["__types"]={'b2Transform'}};
self["Initialize"] = __proto_b2Transform["Initialize"];
self["SetIdentity"] = __proto_b2Transform["SetIdentity"];
self["Set"] = __proto_b2Transform["Set"];
self["GetAngle"] = __proto_b2Transform["GetAngle"];
(function()
self["position"] = b2Vec2();
self["R"] = b2Mat22();
(function()
local __oak_cond = __truthy((function()
return __oak_eq(pos, nil)
end)()
)
if __oak_eq(__oak_cond, true) then local __f474_pos = nil
return __f474_pos
else return __noop()
end
end)()
;
(function()
local __oak_cond = __truthy((function()
return __oak_eq(r, nil)
end)()
)
if __oak_eq(__oak_cond, true) then local __f474_r = nil
return __f474_r
else return __noop()
end
end)()
;
return (function()
local __oak_cond = __truthy(__f474_pos)
if __oak_eq(__oak_cond, true) then return (function()
self["position"]["SetV"](self["position"], __f474_pos);
return self["R"]["SetM"](self["R"], __f474_r)
end)()

else return __noop()
end
end)()

end)()
;
return self
end;
Box2D["Common"]["Math"]["b2Transform"] = b2Transform;
__proto_b2Vec2 = {};
__proto_b2Vec2["SetZero"] = function(self)
self["x"] = 0;
self["y"] = 0
return self["y"]
end;
__proto_b2Vec2["Set"] = function(self, __f476_x_, __f476_y_)
(function()
local __oak_cond = __truthy((function()
return __oak_eq(__f476_x_, nil)
end)()
)
if __oak_eq(__oak_cond, true) then __f476_x_ = 0
return __f476_x_
else return __noop()
end
end)()
;
(function()
local __oak_cond = __truthy((function()
return __oak_eq(__f476_y_, nil)
end)()
)
if __oak_eq(__oak_cond, true) then __f476_y_ = 0
return __f476_y_
else return __noop()
end
end)()
;
self["x"] = __f476_x_;
self["y"] = __f476_y_
return self["y"]
end;
__proto_b2Vec2["SetV"] = function(self, __f477_v)
self["x"] = __f477_v["x"];
self["y"] = __f477_v["y"]
return self["y"]
end;
__proto_b2Vec2["GetNegative"] = function(self)
return b2Vec2((function()
return (-self["x"])
end)()
, (function()
return (-self["y"])
end)()
)
end;
__proto_b2Vec2["NegativeSelf"] = function(self)
self["x"] = (function()
return (-self["x"])
end)()
;
self["y"] = (function()
return (-self["y"])
end)()

return self["y"]
end;
__proto_b2Vec2["Copy"] = function(self)
return b2Vec2(self["x"], self["y"])
end;
__proto_b2Vec2["Add"] = function(self, __f481_v)
self["x"] = __add(self["x"], __f481_v["x"]);
self["y"] = __add(self["y"], __f481_v["y"])
return self["y"]
end;
__proto_b2Vec2["Subtract"] = function(self, __f482_v)
self["x"] = (function()
return (self["x"] - __f482_v["x"])
end)()
;
self["y"] = (function()
return (self["y"] - __f482_v["y"])
end)()

return self["y"]
end;
__proto_b2Vec2["Multiply"] = function(self, __f483_a)
(function()
local __oak_cond = __truthy((function()
return __oak_eq(__f483_a, nil)
end)()
)
if __oak_eq(__oak_cond, true) then __f483_a = 0
return __f483_a
else return __noop()
end
end)()
;
self["x"] = (function()
return (self["x"] * __f483_a)
end)()
;
self["y"] = (function()
return (self["y"] * __f483_a)
end)()

return self["y"]
end;
__proto_b2Vec2["MulM"] = function(self, __f484_A)
local __f484_tX = self["x"];
self["x"] = __add((function()
return (__f484_A["col1"]["x"] * __f484_tX)
end)()
, (function()
return (__f484_A["col2"]["x"] * self["y"])
end)()
);
self["y"] = __add((function()
return (__f484_A["col1"]["y"] * __f484_tX)
end)()
, (function()
return (__f484_A["col2"]["y"] * self["y"])
end)()
)
return self["y"]
end;
__proto_b2Vec2["MulTM"] = function(self, __f485_A)
local __f485_tX = __static_b2Math["Dot"](self, __f485_A["col1"]);
self["y"] = __static_b2Math["Dot"](self, __f485_A["col2"]);
self["x"] = __f485_tX
return self["x"]
end;
__proto_b2Vec2["CrossVF"] = function(self, __f486_s)
(function()
local __oak_cond = __truthy((function()
return __oak_eq(__f486_s, nil)
end)()
)
if __oak_eq(__oak_cond, true) then __f486_s = 0
return __f486_s
else return __noop()
end
end)()
;
local __f486_tX = self["x"];
self["x"] = (function()
return (__f486_s * self["y"])
end)()
;
self["y"] = (function()
return ((function()
return (-__f486_s)
end)()
 * __f486_tX)
end)()

return self["y"]
end;
__proto_b2Vec2["CrossFV"] = function(self, __f487_s)
(function()
local __oak_cond = __truthy((function()
return __oak_eq(__f487_s, nil)
end)()
)
if __oak_eq(__oak_cond, true) then __f487_s = 0
return __f487_s
else return __noop()
end
end)()
;
local __f487_tX = self["x"];
self["x"] = (function()
return ((function()
return (-__f487_s)
end)()
 * self["y"])
end)()
;
self["y"] = (function()
return (__f487_s * __f487_tX)
end)()

return self["y"]
end;
__proto_b2Vec2["MinV"] = function(self, __f488_b)
self["x"] = (function()
local __oak_cond = __truthy((function()
return (self["x"] < __f488_b["x"])
end)()
)
if __oak_eq(__oak_cond, true) then return self["x"]
else return __f488_b["x"]
end
end)()
;
self["y"] = (function()
local __oak_cond = __truthy((function()
return (self["y"] < __f488_b["y"])
end)()
)
if __oak_eq(__oak_cond, true) then return self["y"]
else return __f488_b["y"]
end
end)()

return self["y"]
end;
__proto_b2Vec2["MaxV"] = function(self, __f489_b)
self["x"] = (function()
local __oak_cond = __truthy((function()
return (self["x"] > __f489_b["x"])
end)()
)
if __oak_eq(__oak_cond, true) then return self["x"]
else return __f489_b["x"]
end
end)()
;
self["y"] = (function()
local __oak_cond = __truthy((function()
return (self["y"] > __f489_b["y"])
end)()
)
if __oak_eq(__oak_cond, true) then return self["y"]
else return __f489_b["y"]
end
end)()

return self["y"]
end;
__proto_b2Vec2["Abs"] = function(self)
(function()
local __oak_cond = __truthy((function()
return (self["x"] < 0)
end)()
)
if __oak_eq(__oak_cond, true) then self["x"] = (function()
return (-self["x"])
end)()

return self["x"]
else return __noop()
end
end)()
;
return (function()
local __oak_cond = __truthy((function()
return (self["y"] < 0)
end)()
)
if __oak_eq(__oak_cond, true) then self["y"] = (function()
return (-self["y"])
end)()

return self["y"]
else return __noop()
end
end)()

end;
__proto_b2Vec2["Length"] = function(self)
return __Math["sqrt"](__add((function()
return (self["x"] * self["x"])
end)()
, (function()
return (self["y"] * self["y"])
end)()
))
end;
__proto_b2Vec2["LengthSquared"] = function(self)
return __add((function()
return (self["x"] * self["x"])
end)()
, (function()
return (self["y"] * self["y"])
end)()
)
end;
__proto_b2Vec2["Normalize"] = function(self)
local __f493_length = __Math["sqrt"](__add((function()
return (self["x"] * self["x"])
end)()
, (function()
return (self["y"] * self["y"])
end)()
));
(function()
local __oak_cond = __truthy((function()
return (__f493_length < __Number["MIN_VALUE"])
end)()
)
if __oak_eq(__oak_cond, true) then return 0
else return __noop()
end
end)()
;
local __f493_invLength = (function()
return (1 / __f493_length)
end)()
;
self["x"] = (function()
return (self["x"] * __f493_invLength)
end)()
;
self["y"] = (function()
return (self["y"] * __f493_invLength)
end)()
;
return __f493_length
end;
__proto_b2Vec2["IsValid"] = function(self)
return __and(__static_b2Math["IsValid"](self["x"]), __static_b2Math["IsValid"](self["y"]))
end;
__static_b2Vec2 = {};
__static_b2Vec2["Make"] = function(__f495_x_, __f495_y_)
(function()
local __oak_cond = __truthy((function()
return __oak_eq(__f495_x_, nil)
end)()
)
if __oak_eq(__oak_cond, true) then __f495_x_ = 0
return __f495_x_
else return __noop()
end
end)()
;
(function()
local __oak_cond = __truthy((function()
return __oak_eq(__f495_y_, nil)
end)()
)
if __oak_eq(__oak_cond, true) then __f495_y_ = 0
return __f495_y_
else return __noop()
end
end)()
;
return b2Vec2(__f495_x_, __f495_y_)
end;
b2Vec2 = function(__f496_x_, __f496_y_)
local self = {["__type"]='b2Vec2', ["__types"]={'b2Vec2'}};
self["SetZero"] = __proto_b2Vec2["SetZero"];
self["Set"] = __proto_b2Vec2["Set"];
self["SetV"] = __proto_b2Vec2["SetV"];
self["GetNegative"] = __proto_b2Vec2["GetNegative"];
self["NegativeSelf"] = __proto_b2Vec2["NegativeSelf"];
self["Copy"] = __proto_b2Vec2["Copy"];
self["Add"] = __proto_b2Vec2["Add"];
self["Subtract"] = __proto_b2Vec2["Subtract"];
self["Multiply"] = __proto_b2Vec2["Multiply"];
self["MulM"] = __proto_b2Vec2["MulM"];
self["MulTM"] = __proto_b2Vec2["MulTM"];
self["CrossVF"] = __proto_b2Vec2["CrossVF"];
self["CrossFV"] = __proto_b2Vec2["CrossFV"];
self["MinV"] = __proto_b2Vec2["MinV"];
self["MaxV"] = __proto_b2Vec2["MaxV"];
self["Abs"] = __proto_b2Vec2["Abs"];
self["Length"] = __proto_b2Vec2["Length"];
self["LengthSquared"] = __proto_b2Vec2["LengthSquared"];
self["Normalize"] = __proto_b2Vec2["Normalize"];
self["IsValid"] = __proto_b2Vec2["IsValid"];
(function()
(function()
local __oak_cond = __truthy((function()
return __oak_eq(__f496_x_, nil)
end)()
)
if __oak_eq(__oak_cond, true) then __f496_x_ = 0
return __f496_x_
else return __noop()
end
end)()
;
(function()
local __oak_cond = __truthy((function()
return __oak_eq(__f496_y_, nil)
end)()
)
if __oak_eq(__oak_cond, true) then __f496_y_ = 0
return __f496_y_
else return __noop()
end
end)()
;
self["x"] = __f496_x_;
self["y"] = __f496_y_
return self["y"]
end)()
;
return self
end;
Box2D["Common"]["Math"]["b2Vec2"] = b2Vec2;
__proto_b2Vec3 = {};
__proto_b2Vec3["SetZero"] = function(self)
(function()
self["z"] = 0;
self["y"] = self["z"]
return self["y"]
end)()
;
self["x"] = self["y"]
return self["x"]
end;
__proto_b2Vec3["Set"] = function(self, __f498_x, __f498_y, __f498_z)
(function()
local __oak_cond = __truthy((function()
return __oak_eq(__f498_x, nil)
end)()
)
if __oak_eq(__oak_cond, true) then __f498_x = 0
return __f498_x
else return __noop()
end
end)()
;
(function()
local __oak_cond = __truthy((function()
return __oak_eq(__f498_y, nil)
end)()
)
if __oak_eq(__oak_cond, true) then __f498_y = 0
return __f498_y
else return __noop()
end
end)()
;
(function()
local __oak_cond = __truthy((function()
return __oak_eq(__f498_z, nil)
end)()
)
if __oak_eq(__oak_cond, true) then __f498_z = 0
return __f498_z
else return __noop()
end
end)()
;
self["x"] = __f498_x;
self["y"] = __f498_y;
self["z"] = __f498_z
return self["z"]
end;
__proto_b2Vec3["SetV"] = function(self, __f499_v)
self["x"] = __f499_v["x"];
self["y"] = __f499_v["y"];
self["z"] = __f499_v["z"]
return self["z"]
end;
__proto_b2Vec3["GetNegative"] = function(self)
return b2Vec3((function()
return (-self["x"])
end)()
, (function()
return (-self["y"])
end)()
, (function()
return (-self["z"])
end)()
)
end;
__proto_b2Vec3["NegativeSelf"] = function(self)
self["x"] = (function()
return (-self["x"])
end)()
;
self["y"] = (function()
return (-self["y"])
end)()
;
self["z"] = (function()
return (-self["z"])
end)()

return self["z"]
end;
__proto_b2Vec3["Copy"] = function(self)
return b2Vec3(self["x"], self["y"], self["z"])
end;
__proto_b2Vec3["Add"] = function(self, __f503_v)
self["x"] = __add(self["x"], __f503_v["x"]);
self["y"] = __add(self["y"], __f503_v["y"]);
self["z"] = __add(self["z"], __f503_v["z"])
return self["z"]
end;
__proto_b2Vec3["Subtract"] = function(self, __f504_v)
self["x"] = (function()
return (self["x"] - __f504_v["x"])
end)()
;
self["y"] = (function()
return (self["y"] - __f504_v["y"])
end)()
;
self["z"] = (function()
return (self["z"] - __f504_v["z"])
end)()

return self["z"]
end;
__proto_b2Vec3["Multiply"] = function(self, __f505_a)
(function()
local __oak_cond = __truthy((function()
return __oak_eq(__f505_a, nil)
end)()
)
if __oak_eq(__oak_cond, true) then __f505_a = 0
return __f505_a
else return __noop()
end
end)()
;
self["x"] = (function()
return (self["x"] * __f505_a)
end)()
;
self["y"] = (function()
return (self["y"] * __f505_a)
end)()
;
self["z"] = (function()
return (self["z"] * __f505_a)
end)()

return self["z"]
end;
__static_b2Vec3 = {};
b2Vec3 = function(__f506_x, __f506_y, __f506_z)
local self = {["__type"]='b2Vec3', ["__types"]={'b2Vec3'}};
self["SetZero"] = __proto_b2Vec3["SetZero"];
self["Set"] = __proto_b2Vec3["Set"];
self["SetV"] = __proto_b2Vec3["SetV"];
self["GetNegative"] = __proto_b2Vec3["GetNegative"];
self["NegativeSelf"] = __proto_b2Vec3["NegativeSelf"];
self["Copy"] = __proto_b2Vec3["Copy"];
self["Add"] = __proto_b2Vec3["Add"];
self["Subtract"] = __proto_b2Vec3["Subtract"];
self["Multiply"] = __proto_b2Vec3["Multiply"];
(function()
(function()
local __oak_cond = __truthy((function()
return __oak_eq(__f506_x, nil)
end)()
)
if __oak_eq(__oak_cond, true) then __f506_x = 0
return __f506_x
else return __noop()
end
end)()
;
(function()
local __oak_cond = __truthy((function()
return __oak_eq(__f506_y, nil)
end)()
)
if __oak_eq(__oak_cond, true) then __f506_y = 0
return __f506_y
else return __noop()
end
end)()
;
(function()
local __oak_cond = __truthy((function()
return __oak_eq(__f506_z, nil)
end)()
)
if __oak_eq(__oak_cond, true) then __f506_z = 0
return __f506_z
else return __noop()
end
end)()
;
self["x"] = __f506_x;
self["y"] = __f506_y;
self["z"] = __f506_z
return self["z"]
end)()
;
return self
end;
Box2D["Common"]["Math"]["b2Vec3"] = b2Vec3;
__proto_b2Body = {};
__proto_b2Body["connectEdges"] = function(self, __f507_s1, __f507_s2, __f507_angle1)
(function()
local __oak_cond = __truthy((function()
return __oak_eq(__f507_angle1, nil)
end)()
)
if __oak_eq(__oak_cond, true) then __f507_angle1 = 0
return __f507_angle1
else return __noop()
end
end)()
;
local __f507_angle2 = __Math["atan2"](__f507_s2["GetDirectionVector"](__f507_s2)["y"], __f507_s2["GetDirectionVector"](__f507_s2)["x"]);
local __f507_coreOffset = __Math["tan"]((function()
return ((function()
return (__f507_angle2 - __f507_angle1)
end)()
 * 0.5)
end)()
);
local __f507_core = __static_b2Math["MulFV"](__f507_coreOffset, __f507_s2["GetDirectionVector"](__f507_s2));
__f507_core = __static_b2Math["SubtractVV"](__f507_core, __f507_s2["GetNormalVector"](__f507_s2));
__f507_core = __static_b2Math["MulFV"](__static_b2Settings["b2_toiSlop"], __f507_core);
__f507_core = __static_b2Math["AddVV"](__f507_core, __f507_s2["GetVertex1"](__f507_s2));
local __f507_cornerDir = __static_b2Math["AddVV"](__f507_s1["GetDirectionVector"](__f507_s1), __f507_s2["GetDirectionVector"](__f507_s2));
__f507_cornerDir["Normalize"](__f507_cornerDir);
local __f507_convex = (function()
return (__static_b2Math["Dot"](__f507_s1["GetDirectionVector"](__f507_s1), __f507_s2["GetNormalVector"](__f507_s2)) > 0)
end)()
;
__f507_s1["SetNextEdge"](__f507_s1, __f507_s2, __f507_core, __f507_cornerDir, __f507_convex);
__f507_s2["SetPrevEdge"](__f507_s2, __f507_s1, __f507_core, __f507_cornerDir, __f507_convex);
return __f507_angle2
end;
__proto_b2Body["CreateFixture"] = function(self, __f508_def)
(function()
local __oak_cond = __truthy((function()
return __oak_eq(self["m_world"]["IsLocked"](self["m_world"]), true)
end)()
)
if __oak_eq(__oak_cond, true) then return nil
else return __noop()
end
end)()
;
local __f508_fixture = b2Fixture();
__f508_fixture["Create"](__f508_fixture, self, self["m_xf"], __f508_def);
(function()
local __oak_cond = __truthy(__band(self["m_flags"], __static_b2Body["e_activeFlag"]))
if __oak_eq(__oak_cond, true) then return (function()
local __f508_broadPhase = self["m_world"]["m_contactManager"]["m_broadPhase"];
return __f508_fixture["CreateProxy"](__f508_fixture, __f508_broadPhase, self["m_xf"])
end)()

else return __noop()
end
end)()
;
__f508_fixture["m_next"] = self["m_fixtureList"];
self["m_fixtureList"] = __f508_fixture;
(function()
self["m_fixtureCount"] = __as_oak_string(self["m_fixtureCount"] + 1)
return self["m_fixtureCount"]
end)()
;
__f508_fixture["m_body"] = self;
(function()
local __oak_cond = __truthy((function()
return (__f508_fixture["m_density"] > 0)
end)()
)
if __oak_eq(__oak_cond, true) then return self["ResetMassData"](self)
else return __noop()
end
end)()
;
self["m_world"]["m_flags"] = __bor(self["m_world"]["m_flags"], __static_b2World["e_newFixture"]);
return __f508_fixture
end;
__proto_b2Body["CreateFixture2"] = function(self, __f509_shape, __f509_density)
(function()
local __oak_cond = __truthy((function()
return __oak_eq(__f509_density, nil)
end)()
)
if __oak_eq(__oak_cond, true) then __f509_density = 0
return __f509_density
else return __noop()
end
end)()
;
local __f509_def = b2FixtureDef();
__f509_def["shape"] = __f509_shape;
__f509_def["density"] = __f509_density;
return self["CreateFixture"](self, __f509_def)
end;
__proto_b2Body["DestroyFixture"] = function(self, __f510_fixture)
return (function()
local __oak_cond = __truthy((function()
return __oak_eq(self["m_world"]["IsLocked"](self["m_world"]), true)
end)()
)
if __oak_eq(__oak_cond, true) then return __noop()
else return (function()
local __f510_node = self["m_fixtureList"];
local __f510_ppF = nil;
local __f510_found = false;
(function()
local function __loop143()
return (function()
local __oak_cond = (function()
return (not __oak_eq(__f510_node, nil))
end)()

if __oak_eq(__oak_cond, true) then return (function()
local __r = (function()
return (function()
(function()
local __oak_cond = __truthy((function()
return __oak_eq(__f510_node, __f510_fixture)
end)()
)
if __oak_eq(__oak_cond, true) then return (function()
(function()
local __oak_cond = __truthy(__f510_ppF)
if __oak_eq(__oak_cond, true) then __f510_ppF["m_next"] = __f510_fixture["m_next"]
return __f510_ppF["m_next"]
else self["m_fixtureList"] = __f510_fixture["m_next"]
return self["m_fixtureList"]
end
end)()
;
__f510_found = true;
return 'break'
end)()

else return __noop()
end
end)()
;
__f510_ppF = __f510_node;
__f510_node = __f510_node["m_next"]
return __f510_node
end)()

end)()
;
return (function()
local __oak_cond = __r
if __oak_eq(__oak_cond, 'break') then return nil
else return __loop143()
end
end)()

end)()

else return nil
end
end)()

end;
return __loop143()
end)()
;
local __f510_edge = self["m_contactList"];
(function()
local function __loop144()
return (function()
local __oak_cond = __f510_edge
if __oak_eq(__oak_cond, true) then return (function()
local __r = (function()
return (function()
local __f510_c = __f510_edge["contact"];
__f510_edge = __f510_edge["next"];
local __f510_fixtureA = __f510_c["GetFixtureA"](__f510_c);
local __f510_fixtureB = __f510_c["GetFixtureB"](__f510_c);
return (function()
local __oak_cond = __truthy(__or((function()
return __oak_eq(__f510_fixture, __f510_fixtureA)
end)()
, (function()
return __oak_eq(__f510_fixture, __f510_fixtureB)
end)()
))
if __oak_eq(__oak_cond, true) then return self["m_world"]["m_contactManager"]["Destroy"](self["m_world"]["m_contactManager"], __f510_c)
else return __noop()
end
end)()

end)()

end)()
;
return (function()
local __oak_cond = __r
if __oak_eq(__oak_cond, 'break') then return nil
else return __loop144()
end
end)()

end)()

else return nil
end
end)()

end;
return __loop144()
end)()
;
(function()
local __oak_cond = __truthy(__band(self["m_flags"], __static_b2Body["e_activeFlag"]))
if __oak_eq(__oak_cond, true) then return (function()
local __f510_broadPhase = self["m_world"]["m_contactManager"]["m_broadPhase"];
return __f510_fixture["DestroyProxy"](__f510_fixture, __f510_broadPhase)
end)()

else return nil
end
end)()
;
__f510_fixture["Destroy"](__f510_fixture);
__f510_fixture["m_body"] = nil;
__f510_fixture["m_next"] = nil;
(function()
self["m_fixtureCount"] = __as_oak_string(self["m_fixtureCount"] + (-1))
return self["m_fixtureCount"]
end)()
;
return self["ResetMassData"](self)
end)()

end
end)()

end;
__proto_b2Body["SetPositionAndAngle"] = function(self, __f511_position, __f511_angle)
(function()
local __oak_cond = __truthy((function()
return __oak_eq(__f511_angle, nil)
end)()
)
if __oak_eq(__oak_cond, true) then __f511_angle = 0
return __f511_angle
else return __noop()
end
end)()
;
local __f511_f = __noop();
return (function()
local __oak_cond = __truthy((function()
return __oak_eq(self["m_world"]["IsLocked"](self["m_world"]), true)
end)()
)
if __oak_eq(__oak_cond, true) then return __noop()
else return (function()
self["m_xf"]["R"]["Set"](self["m_xf"]["R"], __f511_angle);
self["m_xf"]["position"]["SetV"](self["m_xf"]["position"], __f511_position);
local __f511_tMat = self["m_xf"]["R"];
local __f511_tVec = self["m_sweep"]["localCenter"];
self["m_sweep"]["c"]["x"] = __add((function()
return (__f511_tMat["col1"]["x"] * __f511_tVec["x"])
end)()
, (function()
return (__f511_tMat["col2"]["x"] * __f511_tVec["y"])
end)()
);
self["m_sweep"]["c"]["y"] = __add((function()
return (__f511_tMat["col1"]["y"] * __f511_tVec["x"])
end)()
, (function()
return (__f511_tMat["col2"]["y"] * __f511_tVec["y"])
end)()
);
self["m_sweep"]["c"]["x"] = __add(self["m_sweep"]["c"]["x"], self["m_xf"]["position"]["x"]);
self["m_sweep"]["c"]["y"] = __add(self["m_sweep"]["c"]["y"], self["m_xf"]["position"]["y"]);
self["m_sweep"]["c0"]["SetV"](self["m_sweep"]["c0"], self["m_sweep"]["c"]);
(function()
self["m_sweep"]["a"] = __f511_angle;
self["m_sweep"]["a0"] = self["m_sweep"]["a"]
return self["m_sweep"]["a0"]
end)()
;
local __f511_broadPhase = self["m_world"]["m_contactManager"]["m_broadPhase"];
(function()
__f511_f = self["m_fixtureList"];
local function __loop146()
return (function()
local __oak_cond = __f511_f
if __oak_eq(__oak_cond, true) then return (function()
local __r = (function()
return __f511_f["Synchronize"](__f511_f, __f511_broadPhase, self["m_xf"], self["m_xf"])
end)()
;
return (function()
local __oak_cond = __r
if __oak_eq(__oak_cond, 'break') then return nil
else return (function()
__f511_f = __f511_f["m_next"];
return __loop146()
end)()

end
end)()

end)()

else return nil
end
end)()

end;
return __loop146()
end)()
;
return self["m_world"]["m_contactManager"]["FindNewContacts"](self["m_world"]["m_contactManager"])
end)()

end
end)()

end;
__proto_b2Body["SetTransform"] = function(self, __f512_xf)
return self["SetPositionAndAngle"](self, __f512_xf["position"], __f512_xf["GetAngle"](__f512_xf))
end;
__proto_b2Body["GetTransform"] = function(self)
return self["m_xf"]
end;
__proto_b2Body["GetPosition"] = function(self)
return self["m_xf"]["position"]
end;
__proto_b2Body["SetPosition"] = function(self, __f515_position)
return self["SetPositionAndAngle"](self, __f515_position, self["GetAngle"](self))
end;
__proto_b2Body["GetAngle"] = function(self)
return self["m_sweep"]["a"]
end;
__proto_b2Body["SetAngle"] = function(self, __f517_angle)
(function()
local __oak_cond = __truthy((function()
return __oak_eq(__f517_angle, nil)
end)()
)
if __oak_eq(__oak_cond, true) then __f517_angle = 0
return __f517_angle
else return __noop()
end
end)()
;
return self["SetPositionAndAngle"](self, self["GetPosition"](self), __f517_angle)
end;
__proto_b2Body["GetWorldCenter"] = function(self)
return self["m_sweep"]["c"]
end;
__proto_b2Body["GetLocalCenter"] = function(self)
return self["m_sweep"]["localCenter"]
end;
__proto_b2Body["SetLinearVelocity"] = function(self, __f520_v)
return (function()
local __oak_cond = __truthy((function()
return __oak_eq(self["m_type"], __static_b2Body["b2_staticBody"])
end)()
)
if __oak_eq(__oak_cond, true) then return __noop()
else return self["m_linearVelocity"]["SetV"](self["m_linearVelocity"], __f520_v)
end
end)()

end;
__proto_b2Body["GetLinearVelocity"] = function(self)
return self["m_linearVelocity"]
end;
__proto_b2Body["SetAngularVelocity"] = function(self, __f522_omega)
(function()
local __oak_cond = __truthy((function()
return __oak_eq(__f522_omega, nil)
end)()
)
if __oak_eq(__oak_cond, true) then __f522_omega = 0
return __f522_omega
else return __noop()
end
end)()
;
return (function()
local __oak_cond = __truthy((function()
return __oak_eq(self["m_type"], __static_b2Body["b2_staticBody"])
end)()
)
if __oak_eq(__oak_cond, true) then return __noop()
else self["m_angularVelocity"] = __f522_omega
return self["m_angularVelocity"]
end
end)()

end;
__proto_b2Body["GetAngularVelocity"] = function(self)
return self["m_angularVelocity"]
end;
__proto_b2Body["GetDefinition"] = function(self)
local __f524_bd = b2BodyDef();
__f524_bd["type"] = self["GetType"](self);
__f524_bd["allowSleep"] = (function()
return __oak_eq(__band(self["m_flags"], __static_b2Body["e_allowSleepFlag"]), __static_b2Body["e_allowSleepFlag"])
end)()
;
__f524_bd["angle"] = self["GetAngle"](self);
__f524_bd["angularDamping"] = self["m_angularDamping"];
__f524_bd["angularVelocity"] = self["m_angularVelocity"];
__f524_bd["fixedRotation"] = (function()
return __oak_eq(__band(self["m_flags"], __static_b2Body["e_fixedRotationFlag"]), __static_b2Body["e_fixedRotationFlag"])
end)()
;
__f524_bd["bullet"] = (function()
return __oak_eq(__band(self["m_flags"], __static_b2Body["e_bulletFlag"]), __static_b2Body["e_bulletFlag"])
end)()
;
__f524_bd["awake"] = (function()
return __oak_eq(__band(self["m_flags"], __static_b2Body["e_awakeFlag"]), __static_b2Body["e_awakeFlag"])
end)()
;
__f524_bd["linearDamping"] = self["m_linearDamping"];
__f524_bd["linearVelocity"]["SetV"](__f524_bd["linearVelocity"], self["GetLinearVelocity"](self));
__f524_bd["position"] = self["GetPosition"](self);
__f524_bd["userData"] = self["GetUserData"](self);
return __f524_bd
end;
__proto_b2Body["ApplyForce"] = function(self, __f525_force, __f525_point)
return (function()
local __oak_cond = __truthy((function()
return (not __oak_eq(self["m_type"], __static_b2Body["b2_dynamicBody"]))
end)()
)
if __oak_eq(__oak_cond, true) then return __noop()
else return (function()
(function()
local __oak_cond = __truthy((function()
return __oak_eq(self["IsAwake"](self), false)
end)()
)
if __oak_eq(__oak_cond, true) then return self["SetAwake"](self, true)
else return __noop()
end
end)()
;
self["m_force"]["x"] = __add(self["m_force"]["x"], __f525_force["x"]);
self["m_force"]["y"] = __add(self["m_force"]["y"], __f525_force["y"]);
self["m_torque"] = __add(self["m_torque"], (function()
return ((function()
return ((function()
return (__f525_point["x"] - self["m_sweep"]["c"]["x"])
end)()
 * __f525_force["y"])
end)()
 - (function()
return ((function()
return (__f525_point["y"] - self["m_sweep"]["c"]["y"])
end)()
 * __f525_force["x"])
end)()
)
end)()
)
return self["m_torque"]
end)()

end
end)()

end;
__proto_b2Body["ApplyTorque"] = function(self, __f526_torque)
(function()
local __oak_cond = __truthy((function()
return __oak_eq(__f526_torque, nil)
end)()
)
if __oak_eq(__oak_cond, true) then __f526_torque = 0
return __f526_torque
else return __noop()
end
end)()
;
return (function()
local __oak_cond = __truthy((function()
return (not __oak_eq(self["m_type"], __static_b2Body["b2_dynamicBody"]))
end)()
)
if __oak_eq(__oak_cond, true) then return __noop()
else return (function()
(function()
local __oak_cond = __truthy((function()
return __oak_eq(self["IsAwake"](self), false)
end)()
)
if __oak_eq(__oak_cond, true) then return self["SetAwake"](self, true)
else return __noop()
end
end)()
;
self["m_torque"] = __add(self["m_torque"], __f526_torque)
return self["m_torque"]
end)()

end
end)()

end;
__proto_b2Body["ApplyImpulse"] = function(self, __f527_impulse, __f527_point)
return (function()
local __oak_cond = __truthy((function()
return (not __oak_eq(self["m_type"], __static_b2Body["b2_dynamicBody"]))
end)()
)
if __oak_eq(__oak_cond, true) then return __noop()
else return (function()
(function()
local __oak_cond = __truthy((function()
return __oak_eq(self["IsAwake"](self), false)
end)()
)
if __oak_eq(__oak_cond, true) then return self["SetAwake"](self, true)
else return __noop()
end
end)()
;
self["m_linearVelocity"]["x"] = __add(self["m_linearVelocity"]["x"], (function()
return (self["m_invMass"] * __f527_impulse["x"])
end)()
);
self["m_linearVelocity"]["y"] = __add(self["m_linearVelocity"]["y"], (function()
return (self["m_invMass"] * __f527_impulse["y"])
end)()
);
self["m_angularVelocity"] = __add(self["m_angularVelocity"], (function()
return (self["m_invI"] * (function()
return ((function()
return ((function()
return (__f527_point["x"] - self["m_sweep"]["c"]["x"])
end)()
 * __f527_impulse["y"])
end)()
 - (function()
return ((function()
return (__f527_point["y"] - self["m_sweep"]["c"]["y"])
end)()
 * __f527_impulse["x"])
end)()
)
end)()
)
end)()
)
return self["m_angularVelocity"]
end)()

end
end)()

end;
__proto_b2Body["Split"] = function(self, __f528_callback)
local __f528_linearVelocity = self["GetLinearVelocity"](self)["Copy"](self["GetLinearVelocity"](self));
local __f528_angularVelocity = self["GetAngularVelocity"](self);
local __f528_center = self["GetWorldCenter"](self);
local __f528_body1 = self;
local __f528_body2 = self["m_world"]["CreateBody"](self["m_world"], self["GetDefinition"](self));
local __f528_prev = __noop();
(function()
local __f528_f = __f528_body1["m_fixtureList"];
local function __loop147()
return (function()
local __oak_cond = __f528_f
if __oak_eq(__oak_cond, true) then return (function()
local __r = (function()
return (function()
local __oak_cond = __truthy(__f528_callback(__f528_f))
if __oak_eq(__oak_cond, true) then return (function()
local __f528_next = __f528_f["m_next"];
(function()
local __oak_cond = __truthy(__f528_prev)
if __oak_eq(__oak_cond, true) then __f528_prev["m_next"] = __f528_next
return __f528_prev["m_next"]
else __f528_body1["m_fixtureList"] = __f528_next
return __f528_body1["m_fixtureList"]
end
end)()
;
(function()
local __tmp528_148 = __f528_body1["m_fixtureCount"];
__f528_body1["m_fixtureCount"] = __as_oak_string(__f528_body1["m_fixtureCount"] + (-1));
return __tmp528_148
end)()
;
__f528_f["m_next"] = __f528_body2["m_fixtureList"];
__f528_body2["m_fixtureList"] = __f528_f;
(function()
local __tmp528_149 = __f528_body2["m_fixtureCount"];
__f528_body2["m_fixtureCount"] = __as_oak_string(__f528_body2["m_fixtureCount"] + 1);
return __tmp528_149
end)()
;
__f528_f["m_body"] = __f528_body2;
__f528_f = __f528_next
return __f528_f
end)()

else return (function()
__f528_prev = __f528_f;
__f528_f = __f528_f["m_next"]
return __f528_f
end)()

end
end)()

end)()
;
return (function()
local __oak_cond = __r
if __oak_eq(__oak_cond, 'break') then return nil
else return (function()
__noop();
return __loop147()
end)()

end
end)()

end)()

else return nil
end
end)()

end;
return __loop147()
end)()
;
__f528_body1["ResetMassData"](__f528_body1);
__f528_body2["ResetMassData"](__f528_body2);
local __f528_center1 = __f528_body1["GetWorldCenter"](__f528_body1);
local __f528_center2 = __f528_body2["GetWorldCenter"](__f528_body2);
local __f528_velocity1 = __static_b2Math["AddVV"](__f528_linearVelocity, __static_b2Math["CrossFV"](__f528_angularVelocity, __static_b2Math["SubtractVV"](__f528_center1, __f528_center)));
local __f528_velocity2 = __static_b2Math["AddVV"](__f528_linearVelocity, __static_b2Math["CrossFV"](__f528_angularVelocity, __static_b2Math["SubtractVV"](__f528_center2, __f528_center)));
__f528_body1["SetLinearVelocity"](__f528_body1, __f528_velocity1);
__f528_body2["SetLinearVelocity"](__f528_body2, __f528_velocity2);
__f528_body1["SetAngularVelocity"](__f528_body1, __f528_angularVelocity);
__f528_body2["SetAngularVelocity"](__f528_body2, __f528_angularVelocity);
__f528_body1["SynchronizeFixtures"](__f528_body1);
__f528_body2["SynchronizeFixtures"](__f528_body2);
return __f528_body2
end;
__proto_b2Body["Merge"] = function(self, __f529_other)
local __f529_f = __noop();
(function()
__f529_f = __f529_other["m_fixtureList"];
local function __loop150()
return (function()
local __oak_cond = __f529_f
if __oak_eq(__oak_cond, true) then return (function()
local __r = (function()
return (function()
local __f529_next = __f529_f["m_next"];
(function()
local __tmp529_151 = __f529_other["m_fixtureCount"];
__f529_other["m_fixtureCount"] = __as_oak_string(__f529_other["m_fixtureCount"] + (-1));
return __tmp529_151
end)()
;
__f529_f["m_next"] = self["m_fixtureList"];
self["m_fixtureList"] = __f529_f;
(function()
local __tmp529_152 = self["m_fixtureCount"];
self["m_fixtureCount"] = __as_oak_string(self["m_fixtureCount"] + 1);
return __tmp529_152
end)()
;
__f529_f["m_body"] = body2;
__f529_f = __f529_next
return __f529_f
end)()

end)()
;
return (function()
local __oak_cond = __r
if __oak_eq(__oak_cond, 'break') then return nil
else return (function()
__noop();
return __loop150()
end)()

end
end)()

end)()

else return nil
end
end)()

end;
return __loop150()
end)()
;
body1["m_fixtureCount"] = 0;
local __f529_body1 = self;
local __f529_body2 = __f529_other;
local __f529_center1 = __f529_body1["GetWorldCenter"](__f529_body1);
local __f529_center2 = __f529_body2["GetWorldCenter"](__f529_body2);
local __f529_velocity1 = __f529_body1["GetLinearVelocity"](__f529_body1)["Copy"](__f529_body1["GetLinearVelocity"](__f529_body1));
local __f529_velocity2 = __f529_body2["GetLinearVelocity"](__f529_body2)["Copy"](__f529_body2["GetLinearVelocity"](__f529_body2));
local __f529_angular1 = __f529_body1["GetAngularVelocity"](__f529_body1);
local __f529_angular = __f529_body2["GetAngularVelocity"](__f529_body2);
__f529_body1["ResetMassData"](__f529_body1);
return self["SynchronizeFixtures"](self)
end;
__proto_b2Body["GetMass"] = function(self)
return self["m_mass"]
end;
__proto_b2Body["GetInertia"] = function(self)
return self["m_I"]
end;
__proto_b2Body["GetMassData"] = function(self, __f532_data)
__f532_data["mass"] = self["m_mass"];
__f532_data["I"] = self["m_I"];
return __f532_data["center"]["SetV"](__f532_data["center"], self["m_sweep"]["localCenter"])
end;
__proto_b2Body["SetMassData"] = function(self, __f533_massData)
__static_b2Settings["b2Assert"]((function()
return __oak_eq(self["m_world"]["IsLocked"](self["m_world"]), false)
end)()
);
return (function()
local __oak_cond = __truthy((function()
return __oak_eq(self["m_world"]["IsLocked"](self["m_world"]), true)
end)()
)
if __oak_eq(__oak_cond, true) then return __noop()
else return (function()
local __oak_cond = __truthy((function()
return (not __oak_eq(self["m_type"], __static_b2Body["b2_dynamicBody"]))
end)()
)
if __oak_eq(__oak_cond, true) then return __noop()
else return (function()
self["m_invMass"] = 0;
self["m_I"] = 0;
self["m_invI"] = 0;
self["m_mass"] = __f533_massData["mass"];
(function()
local __oak_cond = __truthy((function()
return (self["m_mass"] <= 0)
end)()
)
if __oak_eq(__oak_cond, true) then self["m_mass"] = 1
return self["m_mass"]
else return __noop()
end
end)()
;
self["m_invMass"] = (function()
return (1 / self["m_mass"])
end)()
;
(function()
local __oak_cond = __truthy(__and((function()
return (__f533_massData["I"] > 0)
end)()
, (function()
return __oak_eq(__band(self["m_flags"], __static_b2Body["e_fixedRotationFlag"]), 0)
end)()
))
if __oak_eq(__oak_cond, true) then return (function()
self["m_I"] = (function()
return (__f533_massData["I"] - (function()
return (self["m_mass"] * __add((function()
return (__f533_massData["center"]["x"] * __f533_massData["center"]["x"])
end)()
, (function()
return (__f533_massData["center"]["y"] * __f533_massData["center"]["y"])
end)()
))
end)()
)
end)()
;
self["m_invI"] = (function()
return (1 / self["m_I"])
end)()

return self["m_invI"]
end)()

else return __noop()
end
end)()
;
local __f533_oldCenter = self["m_sweep"]["c"]["Copy"](self["m_sweep"]["c"]);
self["m_sweep"]["localCenter"]["SetV"](self["m_sweep"]["localCenter"], __f533_massData["center"]);
self["m_sweep"]["c0"]["SetV"](self["m_sweep"]["c0"], __static_b2Math["MulX"](self["m_xf"], self["m_sweep"]["localCenter"]));
self["m_sweep"]["c"]["SetV"](self["m_sweep"]["c"], self["m_sweep"]["c0"]);
self["m_linearVelocity"]["x"] = __add(self["m_linearVelocity"]["x"], (function()
return (self["m_angularVelocity"] * (function()
return (-(function()
return (self["m_sweep"]["c"]["y"] - __f533_oldCenter["y"])
end)()
)
end)()
)
end)()
);
self["m_linearVelocity"]["y"] = __add(self["m_linearVelocity"]["y"], (function()
return (self["m_angularVelocity"] * (function()
return (function()
return (self["m_sweep"]["c"]["x"] - __f533_oldCenter["x"])
end)()

end)()
)
end)()
)
return self["m_linearVelocity"]["y"]
end)()

end
end)()

end
end)()

end;
__proto_b2Body["ResetMassData"] = function(self)
self["m_mass"] = 0;
self["m_invMass"] = 0;
self["m_I"] = 0;
self["m_invI"] = 0;
self["m_sweep"]["localCenter"]["SetZero"](self["m_sweep"]["localCenter"]);
return (function()
local __oak_cond = __truthy(__or((function()
return __oak_eq(self["m_type"], __static_b2Body["b2_staticBody"])
end)()
, (function()
return __oak_eq(self["m_type"], __static_b2Body["b2_kinematicBody"])
end)()
))
if __oak_eq(__oak_cond, true) then return __noop()
else return (function()
local __f534_center = __static_b2Vec2["Make"](0, 0);
(function()
local __f534_f = self["m_fixtureList"];
local function __loop153()
return (function()
local __oak_cond = __f534_f
if __oak_eq(__oak_cond, true) then return (function()
local __r = (function()
return (function()
(function()
local __oak_cond = __truthy((function()
return __oak_eq(__f534_f["m_density"], 0)
end)()
)
if __oak_eq(__oak_cond, true) then return 'continue'
else return __noop()
end
end)()
;
local __f534_massData = __f534_f["GetMassData"](__f534_f);
self["m_mass"] = __add(self["m_mass"], __f534_massData["mass"]);
__f534_center["x"] = __add(__f534_center["x"], (function()
return (__f534_massData["center"]["x"] * __f534_massData["mass"])
end)()
);
__f534_center["y"] = __add(__f534_center["y"], (function()
return (__f534_massData["center"]["y"] * __f534_massData["mass"])
end)()
);
self["m_I"] = __add(self["m_I"], __f534_massData["I"])
return self["m_I"]
end)()

end)()
;
return (function()
local __oak_cond = __r
if __oak_eq(__oak_cond, 'break') then return nil
else return (function()
__f534_f = __f534_f["m_next"];
return __loop153()
end)()

end
end)()

end)()

else return nil
end
end)()

end;
return __loop153()
end)()
;
(function()
local __oak_cond = __truthy((function()
return (self["m_mass"] > 0)
end)()
)
if __oak_eq(__oak_cond, true) then return (function()
self["m_invMass"] = (function()
return (1 / self["m_mass"])
end)()
;
__f534_center["x"] = (function()
return (__f534_center["x"] * self["m_invMass"])
end)()
;
__f534_center["y"] = (function()
return (__f534_center["y"] * self["m_invMass"])
end)()

return __f534_center["y"]
end)()

else return (function()
self["m_mass"] = 1;
self["m_invMass"] = 1
return self["m_invMass"]
end)()

end
end)()
;
(function()
local __oak_cond = __truthy(__and((function()
return (self["m_I"] > 0)
end)()
, (function()
return __oak_eq(__band(self["m_flags"], __static_b2Body["e_fixedRotationFlag"]), 0)
end)()
))
if __oak_eq(__oak_cond, true) then return (function()
self["m_I"] = (function()
return (self["m_I"] - (function()
return (self["m_mass"] * __add((function()
return (__f534_center["x"] * __f534_center["x"])
end)()
, (function()
return (__f534_center["y"] * __f534_center["y"])
end)()
))
end)()
)
end)()
;
self["m_I"] = (function()
return (self["m_I"] * self["m_inertiaScale"])
end)()
;
__static_b2Settings["b2Assert"]((function()
return (self["m_I"] > 0)
end)()
);
self["m_invI"] = (function()
return (1 / self["m_I"])
end)()

return self["m_invI"]
end)()

else return (function()
self["m_I"] = 0;
self["m_invI"] = 0
return self["m_invI"]
end)()

end
end)()
;
local __f534_oldCenter = self["m_sweep"]["c"]["Copy"](self["m_sweep"]["c"]);
self["m_sweep"]["localCenter"]["SetV"](self["m_sweep"]["localCenter"], __f534_center);
self["m_sweep"]["c0"]["SetV"](self["m_sweep"]["c0"], __static_b2Math["MulX"](self["m_xf"], self["m_sweep"]["localCenter"]));
self["m_sweep"]["c"]["SetV"](self["m_sweep"]["c"], self["m_sweep"]["c0"]);
self["m_linearVelocity"]["x"] = __add(self["m_linearVelocity"]["x"], (function()
return (self["m_angularVelocity"] * (function()
return (-(function()
return (self["m_sweep"]["c"]["y"] - __f534_oldCenter["y"])
end)()
)
end)()
)
end)()
);
self["m_linearVelocity"]["y"] = __add(self["m_linearVelocity"]["y"], (function()
return (self["m_angularVelocity"] * (function()
return (function()
return (self["m_sweep"]["c"]["x"] - __f534_oldCenter["x"])
end)()

end)()
)
end)()
)
return self["m_linearVelocity"]["y"]
end)()

end
end)()

end;
__proto_b2Body["GetWorldPoint"] = function(self, __f535_localPoint)
local __f535_A = self["m_xf"]["R"];
local __f535_u = b2Vec2(__add((function()
return (__f535_A["col1"]["x"] * __f535_localPoint["x"])
end)()
, (function()
return (__f535_A["col2"]["x"] * __f535_localPoint["y"])
end)()
), __add((function()
return (__f535_A["col1"]["y"] * __f535_localPoint["x"])
end)()
, (function()
return (__f535_A["col2"]["y"] * __f535_localPoint["y"])
end)()
));
__f535_u["x"] = __add(__f535_u["x"], self["m_xf"]["position"]["x"]);
__f535_u["y"] = __add(__f535_u["y"], self["m_xf"]["position"]["y"]);
return __f535_u
end;
__proto_b2Body["GetWorldVector"] = function(self, __f536_localVector)
return __static_b2Math["MulMV"](self["m_xf"]["R"], __f536_localVector)
end;
__proto_b2Body["GetLocalPoint"] = function(self, __f537_worldPoint)
return __static_b2Math["MulXT"](self["m_xf"], __f537_worldPoint)
end;
__proto_b2Body["GetLocalVector"] = function(self, __f538_worldVector)
return __static_b2Math["MulTMV"](self["m_xf"]["R"], __f538_worldVector)
end;
__proto_b2Body["GetLinearVelocityFromWorldPoint"] = function(self, __f539_worldPoint)
return b2Vec2((function()
return (self["m_linearVelocity"]["x"] - (function()
return (self["m_angularVelocity"] * (function()
return (__f539_worldPoint["y"] - self["m_sweep"]["c"]["y"])
end)()
)
end)()
)
end)()
, __add(self["m_linearVelocity"]["y"], (function()
return (self["m_angularVelocity"] * (function()
return (__f539_worldPoint["x"] - self["m_sweep"]["c"]["x"])
end)()
)
end)()
))
end;
__proto_b2Body["GetLinearVelocityFromLocalPoint"] = function(self, __f540_localPoint)
local __f540_A = self["m_xf"]["R"];
local __f540_worldPoint = b2Vec2(__add((function()
return (__f540_A["col1"]["x"] * __f540_localPoint["x"])
end)()
, (function()
return (__f540_A["col2"]["x"] * __f540_localPoint["y"])
end)()
), __add((function()
return (__f540_A["col1"]["y"] * __f540_localPoint["x"])
end)()
, (function()
return (__f540_A["col2"]["y"] * __f540_localPoint["y"])
end)()
));
__f540_worldPoint["x"] = __add(__f540_worldPoint["x"], self["m_xf"]["position"]["x"]);
__f540_worldPoint["y"] = __add(__f540_worldPoint["y"], self["m_xf"]["position"]["y"]);
return b2Vec2((function()
return (self["m_linearVelocity"]["x"] - (function()
return (self["m_angularVelocity"] * (function()
return (__f540_worldPoint["y"] - self["m_sweep"]["c"]["y"])
end)()
)
end)()
)
end)()
, __add(self["m_linearVelocity"]["y"], (function()
return (self["m_angularVelocity"] * (function()
return (__f540_worldPoint["x"] - self["m_sweep"]["c"]["x"])
end)()
)
end)()
))
end;
__proto_b2Body["GetLinearDamping"] = function(self)
return self["m_linearDamping"]
end;
__proto_b2Body["SetLinearDamping"] = function(self, __f542_linearDamping)
(function()
local __oak_cond = __truthy((function()
return __oak_eq(__f542_linearDamping, nil)
end)()
)
if __oak_eq(__oak_cond, true) then __f542_linearDamping = 0
return __f542_linearDamping
else return __noop()
end
end)()
;
self["m_linearDamping"] = __f542_linearDamping
return self["m_linearDamping"]
end;
__proto_b2Body["GetAngularDamping"] = function(self)
return self["m_angularDamping"]
end;
__proto_b2Body["SetAngularDamping"] = function(self, __f544_angularDamping)
(function()
local __oak_cond = __truthy((function()
return __oak_eq(__f544_angularDamping, nil)
end)()
)
if __oak_eq(__oak_cond, true) then __f544_angularDamping = 0
return __f544_angularDamping
else return __noop()
end
end)()
;
self["m_angularDamping"] = __f544_angularDamping
return self["m_angularDamping"]
end;
__proto_b2Body["SetType"] = function(self, __f545_type)
(function()
local __oak_cond = __truthy((function()
return __oak_eq(__f545_type, nil)
end)()
)
if __oak_eq(__oak_cond, true) then __f545_type = 0
return __f545_type
else return __noop()
end
end)()
;
return (function()
local __oak_cond = __truthy((function()
return __oak_eq(self["m_type"], __f545_type)
end)()
)
if __oak_eq(__oak_cond, true) then return __noop()
else return (function()
self["m_type"] = __f545_type;
self["ResetMassData"](self);
(function()
local __oak_cond = __truthy((function()
return __oak_eq(self["m_type"], __static_b2Body["b2_staticBody"])
end)()
)
if __oak_eq(__oak_cond, true) then return (function()
self["m_linearVelocity"]["SetZero"](self["m_linearVelocity"]);
self["m_angularVelocity"] = 0
return self["m_angularVelocity"]
end)()

else return __noop()
end
end)()
;
self["SetAwake"](self, true);
self["m_force"]["SetZero"](self["m_force"]);
self["m_torque"] = 0;
return (function()
local __f545_ce = self["m_contactList"];
local function __loop154()
return (function()
local __oak_cond = __f545_ce
if __oak_eq(__oak_cond, true) then return (function()
local __r = (function()
return __f545_ce["contact"]["FlagForFiltering"](__f545_ce["contact"])
end)()
;
return (function()
local __oak_cond = __r
if __oak_eq(__oak_cond, 'break') then return nil
else return (function()
__f545_ce = __f545_ce["next"];
return __loop154()
end)()

end
end)()

end)()

else return nil
end
end)()

end;
return __loop154()
end)()

end)()

end
end)()

end;
__proto_b2Body["GetType"] = function(self)
return self["m_type"]
end;
__proto_b2Body["SetBullet"] = function(self, __f547_flag)
return (function()
local __oak_cond = __truthy(__f547_flag)
if __oak_eq(__oak_cond, true) then self["m_flags"] = __bor(self["m_flags"], __static_b2Body["e_bulletFlag"])
return self["m_flags"]
else self["m_flags"] = __band(self["m_flags"], __bnot(__static_b2Body["e_bulletFlag"]))
return self["m_flags"]
end
end)()

end;
__proto_b2Body["IsBullet"] = function(self)
return __oak_eq(__band(self["m_flags"], __static_b2Body["e_bulletFlag"]), __static_b2Body["e_bulletFlag"])
end;
__proto_b2Body["SetSleepingAllowed"] = function(self, __f549_flag)
return (function()
local __oak_cond = __truthy(__f549_flag)
if __oak_eq(__oak_cond, true) then self["m_flags"] = __bor(self["m_flags"], __static_b2Body["e_allowSleepFlag"])
return self["m_flags"]
else return (function()
self["m_flags"] = __band(self["m_flags"], __bnot(__static_b2Body["e_allowSleepFlag"]));
return self["SetAwake"](self, true)
end)()

end
end)()

end;
__proto_b2Body["SetAwake"] = function(self, __f550_flag)
return (function()
local __oak_cond = __truthy(__f550_flag)
if __oak_eq(__oak_cond, true) then return (function()
self["m_flags"] = __bor(self["m_flags"], __static_b2Body["e_awakeFlag"]);
self["m_sleepTime"] = 0
return self["m_sleepTime"]
end)()

else return (function()
self["m_flags"] = __band(self["m_flags"], __bnot(__static_b2Body["e_awakeFlag"]));
self["m_sleepTime"] = 0;
self["m_linearVelocity"]["SetZero"](self["m_linearVelocity"]);
self["m_angularVelocity"] = 0;
self["m_force"]["SetZero"](self["m_force"]);
self["m_torque"] = 0
return self["m_torque"]
end)()

end
end)()

end;
__proto_b2Body["IsAwake"] = function(self)
return __oak_eq(__band(self["m_flags"], __static_b2Body["e_awakeFlag"]), __static_b2Body["e_awakeFlag"])
end;
__proto_b2Body["SetFixedRotation"] = function(self, __f552_fixed)
(function()
local __oak_cond = __truthy(__f552_fixed)
if __oak_eq(__oak_cond, true) then self["m_flags"] = __bor(self["m_flags"], __static_b2Body["e_fixedRotationFlag"])
return self["m_flags"]
else self["m_flags"] = __band(self["m_flags"], __bnot(__static_b2Body["e_fixedRotationFlag"]))
return self["m_flags"]
end
end)()
;
return self["ResetMassData"](self)
end;
__proto_b2Body["IsFixedRotation"] = function(self)
return __oak_eq(__band(self["m_flags"], __static_b2Body["e_fixedRotationFlag"]), __static_b2Body["e_fixedRotationFlag"])
end;
__proto_b2Body["SetActive"] = function(self, __f554_flag)
return (function()
local __oak_cond = __truthy((function()
return __oak_eq(__f554_flag, self["IsActive"](self))
end)()
)
if __oak_eq(__oak_cond, true) then return __noop()
else return (function()
local __f554_broadPhase = __noop();
local __f554_f = __noop();
return (function()
local __oak_cond = __truthy(__f554_flag)
if __oak_eq(__oak_cond, true) then return (function()
self["m_flags"] = __bor(self["m_flags"], __static_b2Body["e_activeFlag"]);
__f554_broadPhase = self["m_world"]["m_contactManager"]["m_broadPhase"];
return (function()
__f554_f = self["m_fixtureList"];
local function __loop155()
return (function()
local __oak_cond = __f554_f
if __oak_eq(__oak_cond, true) then return (function()
local __r = (function()
return __f554_f["CreateProxy"](__f554_f, __f554_broadPhase, self["m_xf"])
end)()
;
return (function()
local __oak_cond = __r
if __oak_eq(__oak_cond, 'break') then return nil
else return (function()
__f554_f = __f554_f["m_next"];
return __loop155()
end)()

end
end)()

end)()

else return nil
end
end)()

end;
return __loop155()
end)()

end)()

else return (function()
self["m_flags"] = __band(self["m_flags"], __bnot(__static_b2Body["e_activeFlag"]));
__f554_broadPhase = self["m_world"]["m_contactManager"]["m_broadPhase"];
(function()
__f554_f = self["m_fixtureList"];
local function __loop156()
return (function()
local __oak_cond = __f554_f
if __oak_eq(__oak_cond, true) then return (function()
local __r = (function()
return __f554_f["DestroyProxy"](__f554_f, __f554_broadPhase)
end)()
;
return (function()
local __oak_cond = __r
if __oak_eq(__oak_cond, 'break') then return nil
else return (function()
__f554_f = __f554_f["m_next"];
return __loop156()
end)()

end
end)()

end)()

else return nil
end
end)()

end;
return __loop156()
end)()
;
local __f554_ce = self["m_contactList"];
(function()
local function __loop157()
return (function()
local __oak_cond = __f554_ce
if __oak_eq(__oak_cond, true) then return (function()
local __r = (function()
return (function()
local __f554_ce0 = __f554_ce;
__f554_ce = __f554_ce["next"];
return self["m_world"]["m_contactManager"]["Destroy"](self["m_world"]["m_contactManager"], __f554_ce0["contact"])
end)()

end)()
;
return (function()
local __oak_cond = __r
if __oak_eq(__oak_cond, 'break') then return nil
else return __loop157()
end
end)()

end)()

else return nil
end
end)()

end;
return __loop157()
end)()
;
self["m_contactList"] = nil
return self["m_contactList"]
end)()

end
end)()

end)()

end
end)()

end;
__proto_b2Body["IsActive"] = function(self)
return __oak_eq(__band(self["m_flags"], __static_b2Body["e_activeFlag"]), __static_b2Body["e_activeFlag"])
end;
__proto_b2Body["IsSleepingAllowed"] = function(self)
return __oak_eq(__band(self["m_flags"], __static_b2Body["e_allowSleepFlag"]), __static_b2Body["e_allowSleepFlag"])
end;
__proto_b2Body["GetFixtureList"] = function(self)
return self["m_fixtureList"]
end;
__proto_b2Body["GetJointList"] = function(self)
return self["m_jointList"]
end;
__proto_b2Body["GetControllerList"] = function(self)
return self["m_controllerList"]
end;
__proto_b2Body["GetContactList"] = function(self)
return self["m_contactList"]
end;
__proto_b2Body["GetNext"] = function(self)
return self["m_next"]
end;
__proto_b2Body["GetUserData"] = function(self)
return self["m_userData"]
end;
__proto_b2Body["SetUserData"] = function(self, __f563_data)
self["m_userData"] = __f563_data
return self["m_userData"]
end;
__proto_b2Body["GetWorld"] = function(self)
return self["m_world"]
end;
__proto_b2Body["SynchronizeFixtures"] = function(self)
local __f565_xf1 = __static_b2Body["s_xf1"];
__f565_xf1["R"]["Set"](__f565_xf1["R"], self["m_sweep"]["a0"]);
local __f565_tMat = __f565_xf1["R"];
local __f565_tVec = self["m_sweep"]["localCenter"];
__f565_xf1["position"]["x"] = (function()
return (self["m_sweep"]["c0"]["x"] - __add((function()
return (__f565_tMat["col1"]["x"] * __f565_tVec["x"])
end)()
, (function()
return (__f565_tMat["col2"]["x"] * __f565_tVec["y"])
end)()
))
end)()
;
__f565_xf1["position"]["y"] = (function()
return (self["m_sweep"]["c0"]["y"] - __add((function()
return (__f565_tMat["col1"]["y"] * __f565_tVec["x"])
end)()
, (function()
return (__f565_tMat["col2"]["y"] * __f565_tVec["y"])
end)()
))
end)()
;
local __f565_f = __noop();
local __f565_broadPhase = self["m_world"]["m_contactManager"]["m_broadPhase"];
return (function()
__f565_f = self["m_fixtureList"];
local function __loop158()
return (function()
local __oak_cond = __f565_f
if __oak_eq(__oak_cond, true) then return (function()
local __r = (function()
return __f565_f["Synchronize"](__f565_f, __f565_broadPhase, __f565_xf1, self["m_xf"])
end)()
;
return (function()
local __oak_cond = __r
if __oak_eq(__oak_cond, 'break') then return nil
else return (function()
__f565_f = __f565_f["m_next"];
return __loop158()
end)()

end
end)()

end)()

else return nil
end
end)()

end;
return __loop158()
end)()

end;
__proto_b2Body["SynchronizeTransform"] = function(self)
self["m_xf"]["R"]["Set"](self["m_xf"]["R"], self["m_sweep"]["a"]);
local __f566_tMat = self["m_xf"]["R"];
local __f566_tVec = self["m_sweep"]["localCenter"];
self["m_xf"]["position"]["x"] = (function()
return (self["m_sweep"]["c"]["x"] - __add((function()
return (__f566_tMat["col1"]["x"] * __f566_tVec["x"])
end)()
, (function()
return (__f566_tMat["col2"]["x"] * __f566_tVec["y"])
end)()
))
end)()
;
self["m_xf"]["position"]["y"] = (function()
return (self["m_sweep"]["c"]["y"] - __add((function()
return (__f566_tMat["col1"]["y"] * __f566_tVec["x"])
end)()
, (function()
return (__f566_tMat["col2"]["y"] * __f566_tVec["y"])
end)()
))
end)()

return self["m_xf"]["position"]["y"]
end;
__proto_b2Body["ShouldCollide"] = function(self, __f567_other)
(function()
local __oak_cond = __truthy(__and((function()
return (not __oak_eq(self["m_type"], __static_b2Body["b2_dynamicBody"]))
end)()
, (function()
return (not __oak_eq(__f567_other["m_type"], __static_b2Body["b2_dynamicBody"]))
end)()
))
if __oak_eq(__oak_cond, true) then return false
else return __noop()
end
end)()
;
(function()
local __f567_jn = self["m_jointList"];
local function __loop159()
return (function()
local __oak_cond = __f567_jn
if __oak_eq(__oak_cond, true) then return (function()
local __r = (function()
return (function()
local __oak_cond = __truthy((function()
return __oak_eq(__f567_jn["other"], __f567_other)
end)()
)
if __oak_eq(__oak_cond, true) then return (function()
local __oak_cond = __truthy((function()
return __oak_eq(__f567_jn["joint"]["m_collideConnected"], false)
end)()
)
if __oak_eq(__oak_cond, true) then return false
else return __noop()
end
end)()

else return __noop()
end
end)()

end)()
;
return (function()
local __oak_cond = __r
if __oak_eq(__oak_cond, 'break') then return nil
else return (function()
__f567_jn = __f567_jn["next"];
return __loop159()
end)()

end
end)()

end)()

else return nil
end
end)()

end;
return __loop159()
end)()
;
return true
end;
__proto_b2Body["Advance"] = function(self, __f568_t)
(function()
local __oak_cond = __truthy((function()
return __oak_eq(__f568_t, nil)
end)()
)
if __oak_eq(__oak_cond, true) then __f568_t = 0
return __f568_t
else return __noop()
end
end)()
;
self["m_sweep"]["Advance"](self["m_sweep"], __f568_t);
self["m_sweep"]["c"]["SetV"](self["m_sweep"]["c"], self["m_sweep"]["c0"]);
self["m_sweep"]["a"] = self["m_sweep"]["a0"];
return self["SynchronizeTransform"](self)
end;
__static_b2Body = {};
b2Body = function()
local self = {["__type"]='b2Body', ["__types"]={'b2Body'}};
self["connectEdges"] = __proto_b2Body["connectEdges"];
self["CreateFixture"] = __proto_b2Body["CreateFixture"];
self["CreateFixture2"] = __proto_b2Body["CreateFixture2"];
self["DestroyFixture"] = __proto_b2Body["DestroyFixture"];
self["SetPositionAndAngle"] = __proto_b2Body["SetPositionAndAngle"];
self["SetTransform"] = __proto_b2Body["SetTransform"];
self["GetTransform"] = __proto_b2Body["GetTransform"];
self["GetPosition"] = __proto_b2Body["GetPosition"];
self["SetPosition"] = __proto_b2Body["SetPosition"];
self["GetAngle"] = __proto_b2Body["GetAngle"];
self["SetAngle"] = __proto_b2Body["SetAngle"];
self["GetWorldCenter"] = __proto_b2Body["GetWorldCenter"];
self["GetLocalCenter"] = __proto_b2Body["GetLocalCenter"];
self["SetLinearVelocity"] = __proto_b2Body["SetLinearVelocity"];
self["GetLinearVelocity"] = __proto_b2Body["GetLinearVelocity"];
self["SetAngularVelocity"] = __proto_b2Body["SetAngularVelocity"];
self["GetAngularVelocity"] = __proto_b2Body["GetAngularVelocity"];
self["GetDefinition"] = __proto_b2Body["GetDefinition"];
self["ApplyForce"] = __proto_b2Body["ApplyForce"];
self["ApplyTorque"] = __proto_b2Body["ApplyTorque"];
self["ApplyImpulse"] = __proto_b2Body["ApplyImpulse"];
self["Split"] = __proto_b2Body["Split"];
self["Merge"] = __proto_b2Body["Merge"];
self["GetMass"] = __proto_b2Body["GetMass"];
self["GetInertia"] = __proto_b2Body["GetInertia"];
self["GetMassData"] = __proto_b2Body["GetMassData"];
self["SetMassData"] = __proto_b2Body["SetMassData"];
self["ResetMassData"] = __proto_b2Body["ResetMassData"];
self["GetWorldPoint"] = __proto_b2Body["GetWorldPoint"];
self["GetWorldVector"] = __proto_b2Body["GetWorldVector"];
self["GetLocalPoint"] = __proto_b2Body["GetLocalPoint"];
self["GetLocalVector"] = __proto_b2Body["GetLocalVector"];
self["GetLinearVelocityFromWorldPoint"] = __proto_b2Body["GetLinearVelocityFromWorldPoint"];
self["GetLinearVelocityFromLocalPoint"] = __proto_b2Body["GetLinearVelocityFromLocalPoint"];
self["GetLinearDamping"] = __proto_b2Body["GetLinearDamping"];
self["SetLinearDamping"] = __proto_b2Body["SetLinearDamping"];
self["GetAngularDamping"] = __proto_b2Body["GetAngularDamping"];
self["SetAngularDamping"] = __proto_b2Body["SetAngularDamping"];
self["SetType"] = __proto_b2Body["SetType"];
self["GetType"] = __proto_b2Body["GetType"];
self["SetBullet"] = __proto_b2Body["SetBullet"];
self["IsBullet"] = __proto_b2Body["IsBullet"];
self["SetSleepingAllowed"] = __proto_b2Body["SetSleepingAllowed"];
self["SetAwake"] = __proto_b2Body["SetAwake"];
self["IsAwake"] = __proto_b2Body["IsAwake"];
self["SetFixedRotation"] = __proto_b2Body["SetFixedRotation"];
self["IsFixedRotation"] = __proto_b2Body["IsFixedRotation"];
self["SetActive"] = __proto_b2Body["SetActive"];
self["IsActive"] = __proto_b2Body["IsActive"];
self["IsSleepingAllowed"] = __proto_b2Body["IsSleepingAllowed"];
self["GetFixtureList"] = __proto_b2Body["GetFixtureList"];
self["GetJointList"] = __proto_b2Body["GetJointList"];
self["GetControllerList"] = __proto_b2Body["GetControllerList"];
self["GetContactList"] = __proto_b2Body["GetContactList"];
self["GetNext"] = __proto_b2Body["GetNext"];
self["GetUserData"] = __proto_b2Body["GetUserData"];
self["SetUserData"] = __proto_b2Body["SetUserData"];
self["GetWorld"] = __proto_b2Body["GetWorld"];
self["SynchronizeFixtures"] = __proto_b2Body["SynchronizeFixtures"];
self["SynchronizeTransform"] = __proto_b2Body["SynchronizeTransform"];
self["ShouldCollide"] = __proto_b2Body["ShouldCollide"];
self["Advance"] = __proto_b2Body["Advance"];
(function()
self["m_xf"] = b2Transform();
self["m_sweep"] = b2Sweep();
self["m_linearVelocity"] = b2Vec2();
self["m_force"] = b2Vec2();
self["m_flags"] = 0;
(function()
local __oak_cond = __truthy(bd["bullet"])
if __oak_eq(__oak_cond, true) then self["m_flags"] = __bor(self["m_flags"], __static_b2Body["e_bulletFlag"])
return self["m_flags"]
else return __noop()
end
end)()
;
(function()
local __oak_cond = __truthy(bd["fixedRotation"])
if __oak_eq(__oak_cond, true) then self["m_flags"] = __bor(self["m_flags"], __static_b2Body["e_fixedRotationFlag"])
return self["m_flags"]
else return __noop()
end
end)()
;
(function()
local __oak_cond = __truthy(bd["allowSleep"])
if __oak_eq(__oak_cond, true) then self["m_flags"] = __bor(self["m_flags"], __static_b2Body["e_allowSleepFlag"])
return self["m_flags"]
else return __noop()
end
end)()
;
(function()
local __oak_cond = __truthy(bd["awake"])
if __oak_eq(__oak_cond, true) then self["m_flags"] = __bor(self["m_flags"], __static_b2Body["e_awakeFlag"])
return self["m_flags"]
else return __noop()
end
end)()
;
(function()
local __oak_cond = __truthy(bd["active"])
if __oak_eq(__oak_cond, true) then self["m_flags"] = __bor(self["m_flags"], __static_b2Body["e_activeFlag"])
return self["m_flags"]
else return __noop()
end
end)()
;
self["m_world"] = world;
self["m_xf"]["position"]["SetV"](self["m_xf"]["position"], bd["position"]);
self["m_xf"]["R"]["Set"](self["m_xf"]["R"], bd["angle"]);
self["m_sweep"]["localCenter"]["SetZero"](self["m_sweep"]["localCenter"]);
self["m_sweep"]["t0"] = 1;
(function()
self["m_sweep"]["a"] = bd["angle"];
self["m_sweep"]["a0"] = self["m_sweep"]["a"]
return self["m_sweep"]["a0"]
end)()
;
local __f569_tMat = self["m_xf"]["R"];
local __f569_tVec = self["m_sweep"]["localCenter"];
self["m_sweep"]["c"]["x"] = __add((function()
return (__f569_tMat["col1"]["x"] * __f569_tVec["x"])
end)()
, (function()
return (__f569_tMat["col2"]["x"] * __f569_tVec["y"])
end)()
);
self["m_sweep"]["c"]["y"] = __add((function()
return (__f569_tMat["col1"]["y"] * __f569_tVec["x"])
end)()
, (function()
return (__f569_tMat["col2"]["y"] * __f569_tVec["y"])
end)()
);
self["m_sweep"]["c"]["x"] = __add(self["m_sweep"]["c"]["x"], self["m_xf"]["position"]["x"]);
self["m_sweep"]["c"]["y"] = __add(self["m_sweep"]["c"]["y"], self["m_xf"]["position"]["y"]);
self["m_sweep"]["c0"]["SetV"](self["m_sweep"]["c0"], self["m_sweep"]["c"]);
self["m_jointList"] = nil;
self["m_controllerList"] = nil;
self["m_contactList"] = nil;
self["m_controllerCount"] = 0;
self["m_prev"] = nil;
self["m_next"] = nil;
self["m_linearVelocity"]["SetV"](self["m_linearVelocity"], bd["linearVelocity"]);
self["m_angularVelocity"] = bd["angularVelocity"];
self["m_linearDamping"] = bd["linearDamping"];
self["m_angularDamping"] = bd["angularDamping"];
self["m_force"]["Set"](self["m_force"], 0, 0);
self["m_torque"] = 0;
self["m_sleepTime"] = 0;
self["m_type"] = bd["type"];
(function()
local __oak_cond = __truthy((function()
return __oak_eq(self["m_type"], __static_b2Body["b2_dynamicBody"])
end)()
)
if __oak_eq(__oak_cond, true) then return (function()
self["m_mass"] = 1;
self["m_invMass"] = 1
return self["m_invMass"]
end)()

else return (function()
self["m_mass"] = 0;
self["m_invMass"] = 0
return self["m_invMass"]
end)()

end
end)()
;
self["m_I"] = 0;
self["m_invI"] = 0;
self["m_inertiaScale"] = bd["inertiaScale"];
self["m_userData"] = bd["userData"];
self["m_fixtureList"] = nil;
self["m_fixtureCount"] = 0
return self["m_fixtureCount"]
end)()
;
return self
end;
Box2D["Dynamics"]["b2Body"] = b2Body;
__proto_b2BodyDef = {};
__static_b2BodyDef = {};
b2BodyDef = function()
local self = {["__type"]='b2BodyDef', ["__types"]={'b2BodyDef'}};
(function()
self["position"] = b2Vec2();
self["linearVelocity"] = b2Vec2();
self["userData"] = nil;
self["position"]["Set"](self["position"], 0, 0);
self["angle"] = 0;
self["linearVelocity"]["Set"](self["linearVelocity"], 0, 0);
self["angularVelocity"] = 0;
self["linearDamping"] = 0;
self["angularDamping"] = 0;
self["allowSleep"] = true;
self["awake"] = true;
self["fixedRotation"] = false;
self["bullet"] = false;
self["type"] = __static_b2Body["b2_staticBody"];
self["active"] = true;
self["inertiaScale"] = 1
return self["inertiaScale"]
end)()
;
return self
end;
Box2D["Dynamics"]["b2BodyDef"] = b2BodyDef;
__proto_b2ContactManager = {};
__proto_b2ContactManager["AddPair"] = function(self, __f571_proxyUserDataA, __f571_proxyUserDataB)
local __f571_fixtureA = (function()
local __oak_cond = __truthy(__instanceof(__f571_proxyUserDataA, 'b2Fixture'))
if __oak_eq(__oak_cond, true) then return __f571_proxyUserDataA
else return nil
end
end)()
;
local __f571_fixtureB = (function()
local __oak_cond = __truthy(__instanceof(__f571_proxyUserDataB, 'b2Fixture'))
if __oak_eq(__oak_cond, true) then return __f571_proxyUserDataB
else return nil
end
end)()
;
local __f571_bodyA = __f571_fixtureA["GetBody"](__f571_fixtureA);
local __f571_bodyB = __f571_fixtureB["GetBody"](__f571_fixtureB);
(function()
local __oak_cond = __truthy((function()
return __oak_eq(__f571_bodyA, __f571_bodyB)
end)()
)
if __oak_eq(__oak_cond, true) then return __noop()
else return __noop()
end
end)()
;
local __f571_edge = __f571_bodyB["GetContactList"](__f571_bodyB);
(function()
local function __loop160()
return (function()
local __oak_cond = __f571_edge
if __oak_eq(__oak_cond, true) then return (function()
local __r = (function()
return (function()
local __oak_cond = __truthy((function()
return __oak_eq(__f571_edge["other"], __f571_bodyA)
end)()
)
if __oak_eq(__oak_cond, true) then return (function()
local __f571_fA = __f571_edge["contact"]["GetFixtureA"](__f571_edge["contact"]);
local __f571_fB = __f571_edge["contact"]["GetFixtureB"](__f571_edge["contact"]);
return (function()
local __oak_cond = __truthy(__and((function()
return __oak_eq(__f571_fA, __f571_fixtureA)
end)()
, (function()
return __oak_eq(__f571_fB, __f571_fixtureB)
end)()
))
if __oak_eq(__oak_cond, true) then return __noop()
else return (function()
local __oak_cond = __truthy(__and((function()
return __oak_eq(__f571_fA, __f571_fixtureB)
end)()
, (function()
return __oak_eq(__f571_fB, __f571_fixtureA)
end)()
))
if __oak_eq(__oak_cond, true) then return __noop()
else return __noop()
end
end)()

end
end)()

end)()

else __f571_edge = __f571_edge["next"]
return __f571_edge
end
end)()

end)()
;
return (function()
local __oak_cond = __r
if __oak_eq(__oak_cond, 'break') then return nil
else return __loop160()
end
end)()

end)()

else return nil
end
end)()

end;
return __loop160()
end)()
;
(function()
local __oak_cond = __truthy((function()
return __oak_eq(__f571_bodyB["ShouldCollide"](__f571_bodyB, __f571_bodyA), false)
end)()
)
if __oak_eq(__oak_cond, true) then return __noop()
else return __noop()
end
end)()
;
(function()
local __oak_cond = __truthy((function()
return __oak_eq(self["m_contactFilter"]["ShouldCollide"](self["m_contactFilter"], __f571_fixtureA, __f571_fixtureB), false)
end)()
)
if __oak_eq(__oak_cond, true) then return __noop()
else return __noop()
end
end)()
;
local __f571_c = self["m_contactFactory"]["Create"](self["m_contactFactory"], __f571_fixtureA, __f571_fixtureB);
__f571_fixtureA = __f571_c["GetFixtureA"](__f571_c);
__f571_fixtureB = __f571_c["GetFixtureB"](__f571_c);
__f571_bodyA = __f571_fixtureA["m_body"];
__f571_bodyB = __f571_fixtureB["m_body"];
__f571_c["m_prev"] = nil;
__f571_c["m_next"] = self["m_world"]["m_contactList"];
(function()
local __oak_cond = __truthy((function()
return (not __oak_eq(self["m_world"]["m_contactList"], nil))
end)()
)
if __oak_eq(__oak_cond, true) then self["m_world"]["m_contactList"]["m_prev"] = __f571_c
return self["m_world"]["m_contactList"]["m_prev"]
else return __noop()
end
end)()
;
self["m_world"]["m_contactList"] = __f571_c;
__f571_c["m_nodeA"]["contact"] = __f571_c;
__f571_c["m_nodeA"]["other"] = __f571_bodyB;
__f571_c["m_nodeA"]["prev"] = nil;
__f571_c["m_nodeA"]["next"] = __f571_bodyA["m_contactList"];
(function()
local __oak_cond = __truthy((function()
return (not __oak_eq(__f571_bodyA["m_contactList"], nil))
end)()
)
if __oak_eq(__oak_cond, true) then __f571_bodyA["m_contactList"]["prev"] = __f571_c["m_nodeA"]
return __f571_bodyA["m_contactList"]["prev"]
else return __noop()
end
end)()
;
__f571_bodyA["m_contactList"] = __f571_c["m_nodeA"];
__f571_c["m_nodeB"]["contact"] = __f571_c;
__f571_c["m_nodeB"]["other"] = __f571_bodyA;
__f571_c["m_nodeB"]["prev"] = nil;
__f571_c["m_nodeB"]["next"] = __f571_bodyB["m_contactList"];
(function()
local __oak_cond = __truthy((function()
return (not __oak_eq(__f571_bodyB["m_contactList"], nil))
end)()
)
if __oak_eq(__oak_cond, true) then __f571_bodyB["m_contactList"]["prev"] = __f571_c["m_nodeB"]
return __f571_bodyB["m_contactList"]["prev"]
else return __noop()
end
end)()
;
__f571_bodyB["m_contactList"] = __f571_c["m_nodeB"];
(function()
self["m_world"]["m_contactCount"] = __as_oak_string(self["m_world"]["m_contactCount"] + 1)
return self["m_world"]["m_contactCount"]
end)()
;
return __noop()
end;
__proto_b2ContactManager["FindNewContacts"] = function(self)
return self["m_broadPhase"]["UpdatePairs"](self["m_broadPhase"], __generateCallback(self, self["AddPair"]))
end;
__proto_b2ContactManager["Destroy"] = function(self, __f573_c)
local __f573_fixtureA = __f573_c["GetFixtureA"](__f573_c);
local __f573_fixtureB = __f573_c["GetFixtureB"](__f573_c);
local __f573_bodyA = __f573_fixtureA["GetBody"](__f573_fixtureA);
local __f573_bodyB = __f573_fixtureB["GetBody"](__f573_fixtureB);
(function()
local __oak_cond = __truthy(__f573_c["IsTouching"](__f573_c))
if __oak_eq(__oak_cond, true) then return self["m_contactListener"]["EndContact"](self["m_contactListener"], __f573_c)
else return __noop()
end
end)()
;
(function()
local __oak_cond = __truthy(__f573_c["m_prev"])
if __oak_eq(__oak_cond, true) then __f573_c["m_prev"]["m_next"] = __f573_c["m_next"]
return __f573_c["m_prev"]["m_next"]
else return __noop()
end
end)()
;
(function()
local __oak_cond = __truthy(__f573_c["m_next"])
if __oak_eq(__oak_cond, true) then __f573_c["m_next"]["m_prev"] = __f573_c["m_prev"]
return __f573_c["m_next"]["m_prev"]
else return __noop()
end
end)()
;
(function()
local __oak_cond = __truthy((function()
return __oak_eq(__f573_c, self["m_world"]["m_contactList"])
end)()
)
if __oak_eq(__oak_cond, true) then self["m_world"]["m_contactList"] = __f573_c["m_next"]
return self["m_world"]["m_contactList"]
else return __noop()
end
end)()
;
(function()
local __oak_cond = __truthy(__f573_c["m_nodeA"]["prev"])
if __oak_eq(__oak_cond, true) then __f573_c["m_nodeA"]["prev"]["next"] = __f573_c["m_nodeA"]["next"]
return __f573_c["m_nodeA"]["prev"]["next"]
else return __noop()
end
end)()
;
(function()
local __oak_cond = __truthy(__f573_c["m_nodeA"]["next"])
if __oak_eq(__oak_cond, true) then __f573_c["m_nodeA"]["next"]["prev"] = __f573_c["m_nodeA"]["prev"]
return __f573_c["m_nodeA"]["next"]["prev"]
else return __noop()
end
end)()
;
(function()
local __oak_cond = __truthy((function()
return __oak_eq(__f573_c["m_nodeA"], __f573_bodyA["m_contactList"])
end)()
)
if __oak_eq(__oak_cond, true) then __f573_bodyA["m_contactList"] = __f573_c["m_nodeA"]["next"]
return __f573_bodyA["m_contactList"]
else return __noop()
end
end)()
;
(function()
local __oak_cond = __truthy(__f573_c["m_nodeB"]["prev"])
if __oak_eq(__oak_cond, true) then __f573_c["m_nodeB"]["prev"]["next"] = __f573_c["m_nodeB"]["next"]
return __f573_c["m_nodeB"]["prev"]["next"]
else return __noop()
end
end)()
;
(function()
local __oak_cond = __truthy(__f573_c["m_nodeB"]["next"])
if __oak_eq(__oak_cond, true) then __f573_c["m_nodeB"]["next"]["prev"] = __f573_c["m_nodeB"]["prev"]
return __f573_c["m_nodeB"]["next"]["prev"]
else return __noop()
end
end)()
;
(function()
local __oak_cond = __truthy((function()
return __oak_eq(__f573_c["m_nodeB"], __f573_bodyB["m_contactList"])
end)()
)
if __oak_eq(__oak_cond, true) then __f573_bodyB["m_contactList"] = __f573_c["m_nodeB"]["next"]
return __f573_bodyB["m_contactList"]
else return __noop()
end
end)()
;
self["m_contactFactory"]["Destroy"](self["m_contactFactory"], __f573_c);
return (function()
self["m_contactCount"] = __as_oak_string(self["m_contactCount"] + (-1))
return self["m_contactCount"]
end)()

end;
__proto_b2ContactManager["Collide"] = function(self)
local __f574_c = self["m_world"]["m_contactList"];
return (function()
local function __loop163()
return (function()
local __oak_cond = __f574_c
if __oak_eq(__oak_cond, true) then return (function()
local __r = (function()
return (function()
local __f574_fixtureA = __f574_c["GetFixtureA"](__f574_c);
local __f574_fixtureB = __f574_c["GetFixtureB"](__f574_c);
local __f574_bodyA = __f574_fixtureA["GetBody"](__f574_fixtureA);
local __f574_bodyB = __f574_fixtureB["GetBody"](__f574_fixtureB);
(function()
local __oak_cond = __truthy(__and((function()
return __oak_eq(__f574_bodyA["IsAwake"](__f574_bodyA), false)
end)()
, (function()
return __oak_eq(__f574_bodyB["IsAwake"](__f574_bodyB), false)
end)()
))
if __oak_eq(__oak_cond, true) then return (function()
__f574_c = __f574_c["GetNext"](__f574_c);
return 'continue'
end)()

else return __noop()
end
end)()
;
(function()
local __oak_cond = __truthy(__band(__f574_c["m_flags"], __static_b2Contact["e_filterFlag"]))
if __oak_eq(__oak_cond, true) then return (function()
(function()
local __oak_cond = __truthy((function()
return __oak_eq(__f574_bodyB["ShouldCollide"](__f574_bodyB, __f574_bodyA), false)
end)()
)
if __oak_eq(__oak_cond, true) then return (function()
local __f574_cNuke = __f574_c;
__f574_c = __f574_cNuke["GetNext"](__f574_cNuke);
self["Destroy"](self, __f574_cNuke);
return 'continue'
end)()

else return __noop()
end
end)()
;
(function()
local __oak_cond = __truthy((function()
return __oak_eq(self["m_contactFilter"]["ShouldCollide"](self["m_contactFilter"], __f574_fixtureA, __f574_fixtureB), false)
end)()
)
if __oak_eq(__oak_cond, true) then return (function()
__f574_cNuke = __f574_c;
__f574_c = __f574_cNuke["GetNext"](__f574_cNuke);
self["Destroy"](self, __f574_cNuke);
return 'continue'
end)()

else return __noop()
end
end)()
;
__f574_c["m_flags"] = __band(__f574_c["m_flags"], __bnot(__static_b2Contact["e_filterFlag"]))
return __f574_c["m_flags"]
end)()

else return __noop()
end
end)()
;
local __f574_proxyA = __f574_fixtureA["m_proxy"];
local __f574_proxyB = __f574_fixtureB["m_proxy"];
local __f574_overlap = self["m_broadPhase"]["TestOverlap"](self["m_broadPhase"], __f574_proxyA, __f574_proxyB);
(function()
local __oak_cond = __truthy((function()
return __oak_eq(__f574_overlap, false)
end)()
)
if __oak_eq(__oak_cond, true) then return (function()
__f574_cNuke = __f574_c;
__f574_c = __f574_cNuke["GetNext"](__f574_cNuke);
self["Destroy"](self, __f574_cNuke);
return 'continue'
end)()

else return __noop()
end
end)()
;
__f574_c["Update"](__f574_c, self["m_contactListener"]);
__f574_c = __f574_c["GetNext"](__f574_c)
return __f574_c
end)()

end)()
;
return (function()
local __oak_cond = __r
if __oak_eq(__oak_cond, 'break') then return nil
else return __loop163()
end
end)()

end)()

else return nil
end
end)()

end;
return __loop163()
end)()

end;
__static_b2ContactManager = {};
b2ContactManager = function()
local self = {["__type"]='b2ContactManager', ["__types"]={'b2ContactManager'}};
self["AddPair"] = __proto_b2ContactManager["AddPair"];
self["FindNewContacts"] = __proto_b2ContactManager["FindNewContacts"];
self["Destroy"] = __proto_b2ContactManager["Destroy"];
self["Collide"] = __proto_b2ContactManager["Collide"];
(function()
self["m_world"] = nil;
self["m_contactCount"] = 0;
self["m_contactFilter"] = __static_b2ContactFilter["b2_defaultFilter"];
self["m_contactListener"] = __static_b2ContactListener["b2_defaultListener"];
self["m_contactFactory"] = b2ContactFactory(self["m_allocator"]);
self["m_broadPhase"] = b2DynamicTreeBroadPhase()
return self["m_broadPhase"]
end)()
;
return self
end;
Box2D["Dynamics"]["b2ContactManager"] = b2ContactManager;
__proto_b2DebugDraw = {};
__proto_b2DebugDraw["SetFlags"] = function(self, __f576_flags)
(function()
local __oak_cond = __truthy((function()
return __oak_eq(__f576_flags, nil)
end)()
)
if __oak_eq(__oak_cond, true) then __f576_flags = 0
return __f576_flags
else return __noop()
end
end)()
;
self["m_drawFlags"] = __f576_flags
return self["m_drawFlags"]
end;
__proto_b2DebugDraw["GetFlags"] = function(self)
return self["m_drawFlags"]
end;
__proto_b2DebugDraw["AppendFlags"] = function(self, __f578_flags)
(function()
local __oak_cond = __truthy((function()
return __oak_eq(__f578_flags, nil)
end)()
)
if __oak_eq(__oak_cond, true) then __f578_flags = 0
return __f578_flags
else return __noop()
end
end)()
;
self["m_drawFlags"] = __bor(self["m_drawFlags"], __f578_flags)
return self["m_drawFlags"]
end;
__proto_b2DebugDraw["ClearFlags"] = function(self, __f579_flags)
(function()
local __oak_cond = __truthy((function()
return __oak_eq(__f579_flags, nil)
end)()
)
if __oak_eq(__oak_cond, true) then __f579_flags = 0
return __f579_flags
else return __noop()
end
end)()
;
self["m_drawFlags"] = __band(self["m_drawFlags"], __bnot(__f579_flags))
return self["m_drawFlags"]
end;
__proto_b2DebugDraw["SetSprite"] = function(self, __f580_sprite)
self["m_ctx"] = __f580_sprite
return self["m_ctx"]
end;
__proto_b2DebugDraw["GetSprite"] = function(self)
return self["m_ctx"]
end;
__proto_b2DebugDraw["SetDrawScale"] = function(self, __f582_drawScale)
(function()
local __oak_cond = __truthy((function()
return __oak_eq(__f582_drawScale, nil)
end)()
)
if __oak_eq(__oak_cond, true) then __f582_drawScale = 0
return __f582_drawScale
else return __noop()
end
end)()
;
self["m_drawScale"] = __f582_drawScale
return self["m_drawScale"]
end;
__proto_b2DebugDraw["GetDrawScale"] = function(self)
return self["m_drawScale"]
end;
__proto_b2DebugDraw["SetLineThickness"] = function(self, __f584_lineThickness)
(function()
local __oak_cond = __truthy((function()
return __oak_eq(__f584_lineThickness, nil)
end)()
)
if __oak_eq(__oak_cond, true) then __f584_lineThickness = 0
return __f584_lineThickness
else return __noop()
end
end)()
;
self["m_lineThickness"] = __f584_lineThickness;
self["m_ctx"]["strokeWidth"] = __f584_lineThickness
return self["m_ctx"]["strokeWidth"]
end;
__proto_b2DebugDraw["GetLineThickness"] = function(self)
return self["m_lineThickness"]
end;
__proto_b2DebugDraw["SetAlpha"] = function(self, __f586_alpha)
(function()
local __oak_cond = __truthy((function()
return __oak_eq(__f586_alpha, nil)
end)()
)
if __oak_eq(__oak_cond, true) then __f586_alpha = 0
return __f586_alpha
else return __noop()
end
end)()
;
self["m_alpha"] = __f586_alpha
return self["m_alpha"]
end;
__proto_b2DebugDraw["GetAlpha"] = function(self)
return self["m_alpha"]
end;
__proto_b2DebugDraw["SetFillAlpha"] = function(self, __f588_alpha)
(function()
local __oak_cond = __truthy((function()
return __oak_eq(__f588_alpha, nil)
end)()
)
if __oak_eq(__oak_cond, true) then __f588_alpha = 0
return __f588_alpha
else return __noop()
end
end)()
;
self["m_fillAlpha"] = __f588_alpha
return self["m_fillAlpha"]
end;
__proto_b2DebugDraw["GetFillAlpha"] = function(self)
return self["m_fillAlpha"]
end;
__proto_b2DebugDraw["SetXFormScale"] = function(self, __f590_xformScale)
(function()
local __oak_cond = __truthy((function()
return __oak_eq(__f590_xformScale, nil)
end)()
)
if __oak_eq(__oak_cond, true) then __f590_xformScale = 0
return __f590_xformScale
else return __noop()
end
end)()
;
self["m_xformScale"] = __f590_xformScale
return self["m_xformScale"]
end;
__proto_b2DebugDraw["GetXFormScale"] = function(self)
return self["m_xformScale"]
end;
__proto_b2DebugDraw["DrawPolygon"] = function(self, __f592_vertices, __f592_vertexCount, __f592_color)
return (function()
local __oak_cond = __truthy(__not(__f592_vertexCount))
if __oak_eq(__oak_cond, true) then return __noop()
else return (function()
local __f592_s = self["m_ctx"];
local __f592_drawScale = self["m_drawScale"];
__f592_s["beginPath"]();
__f592_s["strokeStyle"] = self["_color"](self, __f592_color["color"], self["m_alpha"]);
__f592_s["moveTo"]((function()
return (__oak_acc(__f592_vertices, (function()
return 0
end)()
)["x"] * __f592_drawScale)
end)()
, (function()
return (__oak_acc(__f592_vertices, (function()
return 0
end)()
)["y"] * __f592_drawScale)
end)()
);
(function()
local __f592_i = 1;
local function __loop164()
return (function()
local __oak_cond = (function()
return (__f592_i < __f592_vertexCount)
end)()

if __oak_eq(__oak_cond, true) then return (function()
local __r = (function()
return __f592_s["lineTo"]((function()
return (__oak_acc(__f592_vertices, (function()
return __f592_i
end)()
)["x"] * __f592_drawScale)
end)()
, (function()
return (__oak_acc(__f592_vertices, (function()
return __f592_i
end)()
)["y"] * __f592_drawScale)
end)()
)
end)()
;
return (function()
local __oak_cond = __r
if __oak_eq(__oak_cond, 'break') then return nil
else return (function()
(function()
local __tmp592_165 = __f592_i;
__f592_i = __as_oak_string(__f592_i + 1);
return __tmp592_165
end)()
;
return __loop164()
end)()

end
end)()

end)()

else return nil
end
end)()

end;
return __loop164()
end)()
;
__f592_s["lineTo"]((function()
return (__oak_acc(__f592_vertices, (function()
return 0
end)()
)["x"] * __f592_drawScale)
end)()
, (function()
return (__oak_acc(__f592_vertices, (function()
return 0
end)()
)["y"] * __f592_drawScale)
end)()
);
__f592_s["closePath"]();
return __f592_s["stroke"]()
end)()

end
end)()

end;
__proto_b2DebugDraw["DrawSolidPolygon"] = function(self, __f593_vertices, __f593_vertexCount, __f593_color)
return (function()
local __oak_cond = __truthy(__not(__f593_vertexCount))
if __oak_eq(__oak_cond, true) then return __noop()
else return (function()
local __f593_s = self["m_ctx"];
local __f593_drawScale = self["m_drawScale"];
__f593_s["beginPath"]();
__f593_s["strokeStyle"] = self["_color"](self, __f593_color["color"], self["m_alpha"]);
__f593_s["fillStyle"] = self["_color"](self, __f593_color["color"], self["m_fillAlpha"]);
__f593_s["moveTo"]((function()
return (__oak_acc(__f593_vertices, (function()
return 0
end)()
)["x"] * __f593_drawScale)
end)()
, (function()
return (__oak_acc(__f593_vertices, (function()
return 0
end)()
)["y"] * __f593_drawScale)
end)()
);
(function()
local __f593_i = 1;
local function __loop166()
return (function()
local __oak_cond = (function()
return (__f593_i < __f593_vertexCount)
end)()

if __oak_eq(__oak_cond, true) then return (function()
local __r = (function()
return __f593_s["lineTo"]((function()
return (__oak_acc(__f593_vertices, (function()
return __f593_i
end)()
)["x"] * __f593_drawScale)
end)()
, (function()
return (__oak_acc(__f593_vertices, (function()
return __f593_i
end)()
)["y"] * __f593_drawScale)
end)()
)
end)()
;
return (function()
local __oak_cond = __r
if __oak_eq(__oak_cond, 'break') then return nil
else return (function()
(function()
local __tmp593_167 = __f593_i;
__f593_i = __as_oak_string(__f593_i + 1);
return __tmp593_167
end)()
;
return __loop166()
end)()

end
end)()

end)()

else return nil
end
end)()

end;
return __loop166()
end)()
;
__f593_s["lineTo"]((function()
return (__oak_acc(__f593_vertices, (function()
return 0
end)()
)["x"] * __f593_drawScale)
end)()
, (function()
return (__oak_acc(__f593_vertices, (function()
return 0
end)()
)["y"] * __f593_drawScale)
end)()
);
__f593_s["closePath"]();
__f593_s["fill"]();
return __f593_s["stroke"]()
end)()

end
end)()

end;
__proto_b2DebugDraw["DrawCircle"] = function(self, __f594_center, __f594_radius, __f594_color)
return (function()
local __oak_cond = __truthy(__not(__f594_radius))
if __oak_eq(__oak_cond, true) then return __noop()
else return (function()
local __f594_s = self["m_ctx"];
local __f594_drawScale = self["m_drawScale"];
__f594_s["beginPath"]();
__f594_s["strokeStyle"] = self["_color"](self, __f594_color["color"], self["m_alpha"]);
__f594_s["arc"]((function()
return (__f594_center["x"] * __f594_drawScale)
end)()
, (function()
return (__f594_center["y"] * __f594_drawScale)
end)()
, (function()
return (__f594_radius * __f594_drawScale)
end)()
, 0, (function()
return (__Math["PI"] * 2)
end)()
, true);
__f594_s["closePath"]();
return __f594_s["stroke"]()
end)()

end
end)()

end;
__proto_b2DebugDraw["DrawSolidCircle"] = function(self, __f595_center, __f595_radius, __f595_axis, __f595_color)
return (function()
local __oak_cond = __truthy(__not(__f595_radius))
if __oak_eq(__oak_cond, true) then return __noop()
else return (function()
(function()
local __f595_s = self["m_ctx"];
local __f595_drawScale = self["m_drawScale"];
local __f595_cx = (function()
return (__f595_center["x"] * __f595_drawScale)
end)()
;
local __f595_cy = (function()
return (__f595_center["y"] * __f595_drawScale)
end)()

return __f595_cy
end)()
;
__f595_s["moveTo"](0, 0);
__f595_s["beginPath"]();
__f595_s["strokeStyle"] = self["_color"](self, __f595_color["color"], self["m_alpha"]);
__f595_s["fillStyle"] = self["_color"](self, __f595_color["color"], self["m_fillAlpha"]);
__f595_s["arc"](__f595_cx, __f595_cy, (function()
return (__f595_radius * __f595_drawScale)
end)()
, 0, (function()
return (__Math["PI"] * 2)
end)()
, true);
__f595_s["moveTo"](__f595_cx, __f595_cy);
__f595_s["lineTo"]((function()
return (__add(__f595_center["x"], (function()
return (__f595_axis["x"] * __f595_radius)
end)()
) * __f595_drawScale)
end)()
, (function()
return (__add(__f595_center["y"], (function()
return (__f595_axis["y"] * __f595_radius)
end)()
) * __f595_drawScale)
end)()
);
__f595_s["closePath"]();
__f595_s["fill"]();
return __f595_s["stroke"]()
end)()

end
end)()

end;
__proto_b2DebugDraw["DrawSegment"] = function(self, __f596_p1, __f596_p2, __f596_color)
(function()
local __f596_s = self["m_ctx"];
local __f596_drawScale = self["m_drawScale"]
return __f596_drawScale
end)()
;
__f596_s["strokeStyle"] = self["_color"](self, __f596_color["color"], self["m_alpha"]);
__f596_s["beginPath"]();
__f596_s["moveTo"]((function()
return (__f596_p1["x"] * __f596_drawScale)
end)()
, (function()
return (__f596_p1["y"] * __f596_drawScale)
end)()
);
__f596_s["lineTo"]((function()
return (__f596_p2["x"] * __f596_drawScale)
end)()
, (function()
return (__f596_p2["y"] * __f596_drawScale)
end)()
);
__f596_s["closePath"]();
return __f596_s["stroke"]()
end;
__proto_b2DebugDraw["DrawTransform"] = function(self, __f597_xf)
(function()
local __f597_s = self["m_ctx"];
local __f597_drawScale = self["m_drawScale"]
return __f597_drawScale
end)()
;
__f597_s["beginPath"]();
__f597_s["strokeStyle"] = self["_color"](self, 16711680, self["m_alpha"]);
__f597_s["moveTo"]((function()
return (__f597_xf["position"]["x"] * __f597_drawScale)
end)()
, (function()
return (__f597_xf["position"]["y"] * __f597_drawScale)
end)()
);
__f597_s["lineTo"]((function()
return (__add(__f597_xf["position"]["x"], (function()
return (self["m_xformScale"] * __f597_xf["R"]["col1"]["x"])
end)()
) * __f597_drawScale)
end)()
, (function()
return (__add(__f597_xf["position"]["y"], (function()
return (self["m_xformScale"] * __f597_xf["R"]["col1"]["y"])
end)()
) * __f597_drawScale)
end)()
);
__f597_s["strokeStyle"] = self["_color"](self, 65280, self["m_alpha"]);
__f597_s["moveTo"]((function()
return (__f597_xf["position"]["x"] * __f597_drawScale)
end)()
, (function()
return (__f597_xf["position"]["y"] * __f597_drawScale)
end)()
);
__f597_s["lineTo"]((function()
return (__add(__f597_xf["position"]["x"], (function()
return (self["m_xformScale"] * __f597_xf["R"]["col2"]["x"])
end)()
) * __f597_drawScale)
end)()
, (function()
return (__add(__f597_xf["position"]["y"], (function()
return (self["m_xformScale"] * __f597_xf["R"]["col2"]["y"])
end)()
) * __f597_drawScale)
end)()
);
__f597_s["closePath"]();
return __f597_s["stroke"]()
end;
__proto_b2DebugDraw["_color"] = function(self, __f598_color, __f598_alpha)
return __add(__add(__add(__add(__add(__add(__add(__add('rgba(', __shr(__band(__f598_color, 16711680), 16)), ','), __shr(__band(__f598_color, 65280), 8)), ','), __band(__f598_color, 255)), ','), __f598_alpha), ')')
end;
__static_b2DebugDraw = {};
b2DebugDraw = function()
local self = {["__type"]='b2DebugDraw', ["__types"]={'b2DebugDraw'}};
self["SetFlags"] = __proto_b2DebugDraw["SetFlags"];
self["GetFlags"] = __proto_b2DebugDraw["GetFlags"];
self["AppendFlags"] = __proto_b2DebugDraw["AppendFlags"];
self["ClearFlags"] = __proto_b2DebugDraw["ClearFlags"];
self["SetSprite"] = __proto_b2DebugDraw["SetSprite"];
self["GetSprite"] = __proto_b2DebugDraw["GetSprite"];
self["SetDrawScale"] = __proto_b2DebugDraw["SetDrawScale"];
self["GetDrawScale"] = __proto_b2DebugDraw["GetDrawScale"];
self["SetLineThickness"] = __proto_b2DebugDraw["SetLineThickness"];
self["GetLineThickness"] = __proto_b2DebugDraw["GetLineThickness"];
self["SetAlpha"] = __proto_b2DebugDraw["SetAlpha"];
self["GetAlpha"] = __proto_b2DebugDraw["GetAlpha"];
self["SetFillAlpha"] = __proto_b2DebugDraw["SetFillAlpha"];
self["GetFillAlpha"] = __proto_b2DebugDraw["GetFillAlpha"];
self["SetXFormScale"] = __proto_b2DebugDraw["SetXFormScale"];
self["GetXFormScale"] = __proto_b2DebugDraw["GetXFormScale"];
self["DrawPolygon"] = __proto_b2DebugDraw["DrawPolygon"];
self["DrawSolidPolygon"] = __proto_b2DebugDraw["DrawSolidPolygon"];
self["DrawCircle"] = __proto_b2DebugDraw["DrawCircle"];
self["DrawSolidCircle"] = __proto_b2DebugDraw["DrawSolidCircle"];
self["DrawSegment"] = __proto_b2DebugDraw["DrawSegment"];
self["DrawTransform"] = __proto_b2DebugDraw["DrawTransform"];
self["_color"] = __proto_b2DebugDraw["_color"];
(function()
self["m_drawScale"] = 1;
self["m_lineThickness"] = 1;
self["m_alpha"] = 1;
self["m_fillAlpha"] = 1;
self["m_xformScale"] = 1;
local __f599___this = self;
self["m_sprite"] = {["graphics"]={["clear"]=function()
return __f599___this["m_ctx"]["clearRect"](0, 0, __f599___this["m_ctx"]["canvas"]["width"], __f599___this["m_ctx"]["canvas"]["height"])
end}};
self["m_drawFlags"] = 0
return self["m_drawFlags"]
end)()
;
return self
end;
Box2D["Dynamics"]["b2DebugDraw"] = b2DebugDraw;
__proto_b2Fixture = {};
__proto_b2Fixture["GetType"] = function(self)
return self["m_shape"]["GetType"](self["m_shape"])
end;
__proto_b2Fixture["GetShape"] = function(self)
return self["m_shape"]
end;
__proto_b2Fixture["SetSensor"] = function(self, __f603_sensor)
return (function()
local __oak_cond = __truthy((function()
return __oak_eq(self["m_isSensor"], __f603_sensor)
end)()
)
if __oak_eq(__oak_cond, true) then return __noop()
else return (function()
self["m_isSensor"] = __f603_sensor;
return (function()
local __oak_cond = __truthy((function()
return __oak_eq(self["m_body"], nil)
end)()
)
if __oak_eq(__oak_cond, true) then return __noop()
else return (function()
local __f603_edge = self["m_body"]["GetContactList"](self["m_body"]);
return (function()
local function __loop168()
return (function()
local __oak_cond = __f603_edge
if __oak_eq(__oak_cond, true) then return (function()
local __r = (function()
return (function()
local __f603_contact = __f603_edge["contact"];
local __f603_fixtureA = __f603_contact["GetFixtureA"](__f603_contact);
local __f603_fixtureB = __f603_contact["GetFixtureB"](__f603_contact);
(function()
local __oak_cond = __truthy(__or((function()
return __oak_eq(__f603_fixtureA, self)
end)()
, (function()
return __oak_eq(__f603_fixtureB, self)
end)()
))
if __oak_eq(__oak_cond, true) then return __f603_contact["SetSensor"](__f603_contact, __or(__f603_fixtureA["IsSensor"](__f603_fixtureA), __f603_fixtureB["IsSensor"](__f603_fixtureB)))
else return __noop()
end
end)()
;
__f603_edge = __f603_edge["next"]
return __f603_edge
end)()

end)()
;
return (function()
local __oak_cond = __r
if __oak_eq(__oak_cond, 'break') then return nil
else return __loop168()
end
end)()

end)()

else return nil
end
end)()

end;
return __loop168()
end)()

end)()

end
end)()

end)()

end
end)()

end;
__proto_b2Fixture["IsSensor"] = function(self)
return self["m_isSensor"]
end;
__proto_b2Fixture["SetFilterData"] = function(self, __f605_filter)
self["m_filter"] = __f605_filter["Copy"](__f605_filter);
return (function()
local __oak_cond = __truthy(self["m_body"])
if __oak_eq(__oak_cond, true) then return __noop()
else return (function()
local __f605_edge = self["m_body"]["GetContactList"](self["m_body"]);
return (function()
local function __loop169()
return (function()
local __oak_cond = __f605_edge
if __oak_eq(__oak_cond, true) then return (function()
local __r = (function()
return (function()
local __f605_contact = __f605_edge["contact"];
local __f605_fixtureA = __f605_contact["GetFixtureA"](__f605_contact);
local __f605_fixtureB = __f605_contact["GetFixtureB"](__f605_contact);
(function()
local __oak_cond = __truthy(__or((function()
return __oak_eq(__f605_fixtureA, self)
end)()
, (function()
return __oak_eq(__f605_fixtureB, self)
end)()
))
if __oak_eq(__oak_cond, true) then return __f605_contact["FlagForFiltering"](__f605_contact)
else return __noop()
end
end)()
;
__f605_edge = __f605_edge["next"]
return __f605_edge
end)()

end)()
;
return (function()
local __oak_cond = __r
if __oak_eq(__oak_cond, 'break') then return nil
else return __loop169()
end
end)()

end)()

else return nil
end
end)()

end;
return __loop169()
end)()

end)()

end
end)()

end;
__proto_b2Fixture["GetFilterData"] = function(self)
return self["m_filter"]["Copy"](self["m_filter"])
end;
__proto_b2Fixture["GetBody"] = function(self)
return self["m_body"]
end;
__proto_b2Fixture["GetNext"] = function(self)
return self["m_next"]
end;
__proto_b2Fixture["GetUserData"] = function(self)
return self["m_userData"]
end;
__proto_b2Fixture["SetUserData"] = function(self, __f610_data)
self["m_userData"] = __f610_data
return self["m_userData"]
end;
__proto_b2Fixture["TestPoint"] = function(self, __f611_p)
return self["m_shape"]["TestPoint"](self["m_shape"], self["m_body"]["GetTransform"](self["m_body"]), __f611_p)
end;
__proto_b2Fixture["RayCast"] = function(self, __f612_output, __f612_input)
return self["m_shape"]["RayCast"](self["m_shape"], __f612_output, __f612_input, self["m_body"]["GetTransform"](self["m_body"]))
end;
__proto_b2Fixture["GetMassData"] = function(self, __f613_massData)
(function()
local __oak_cond = __truthy((function()
return __oak_eq(__f613_massData, nil)
end)()
)
if __oak_eq(__oak_cond, true) then __f613_massData = nil
return __f613_massData
else return __noop()
end
end)()
;
(function()
local __oak_cond = __truthy((function()
return __oak_eq(__f613_massData, nil)
end)()
)
if __oak_eq(__oak_cond, true) then __f613_massData = b2MassData()
return __f613_massData
else return __noop()
end
end)()
;
self["m_shape"]["ComputeMass"](self["m_shape"], __f613_massData, self["m_density"]);
return __f613_massData
end;
__proto_b2Fixture["SetDensity"] = function(self, __f614_density)
(function()
local __oak_cond = __truthy((function()
return __oak_eq(__f614_density, nil)
end)()
)
if __oak_eq(__oak_cond, true) then __f614_density = 0
return __f614_density
else return __noop()
end
end)()
;
self["m_density"] = __f614_density
return self["m_density"]
end;
__proto_b2Fixture["GetDensity"] = function(self)
return self["m_density"]
end;
__proto_b2Fixture["GetFriction"] = function(self)
return self["m_friction"]
end;
__proto_b2Fixture["SetFriction"] = function(self, __f617_friction)
(function()
local __oak_cond = __truthy((function()
return __oak_eq(__f617_friction, nil)
end)()
)
if __oak_eq(__oak_cond, true) then __f617_friction = 0
return __f617_friction
else return __noop()
end
end)()
;
self["m_friction"] = __f617_friction
return self["m_friction"]
end;
__proto_b2Fixture["GetRestitution"] = function(self)
return self["m_restitution"]
end;
__proto_b2Fixture["SetRestitution"] = function(self, __f619_restitution)
(function()
local __oak_cond = __truthy((function()
return __oak_eq(__f619_restitution, nil)
end)()
)
if __oak_eq(__oak_cond, true) then __f619_restitution = 0
return __f619_restitution
else return __noop()
end
end)()
;
self["m_restitution"] = __f619_restitution
return self["m_restitution"]
end;
__proto_b2Fixture["GetAABB"] = function(self)
return self["m_aabb"]
end;
__proto_b2Fixture["Create"] = function(self, __f621_body, __f621_xf, __f621_def)
self["m_userData"] = __f621_def["userData"];
self["m_friction"] = __f621_def["friction"];
self["m_restitution"] = __f621_def["restitution"];
self["m_body"] = __f621_body;
self["m_next"] = nil;
self["m_filter"] = __f621_def["filter"]["Copy"](__f621_def["filter"]);
self["m_isSensor"] = __f621_def["isSensor"];
self["m_shape"] = __f621_def["shape"]["Copy"](__f621_def["shape"]);
self["m_density"] = __f621_def["density"]
return self["m_density"]
end;
__proto_b2Fixture["Destroy"] = function(self)
self["m_shape"] = nil
return self["m_shape"]
end;
__proto_b2Fixture["CreateProxy"] = function(self, __f623_broadPhase, __f623_xf)
self["m_shape"]["ComputeAABB"](self["m_shape"], self["m_aabb"], __f623_xf);
self["m_proxy"] = __f623_broadPhase["CreateProxy"](__f623_broadPhase, self["m_aabb"], self)
return self["m_proxy"]
end;
__proto_b2Fixture["DestroyProxy"] = function(self, __f624_broadPhase)
return (function()
local __oak_cond = __truthy((function()
return __oak_eq(self["m_proxy"], nil)
end)()
)
if __oak_eq(__oak_cond, true) then return __noop()
else return (function()
__f624_broadPhase["DestroyProxy"](__f624_broadPhase, self["m_proxy"]);
self["m_proxy"] = nil
return self["m_proxy"]
end)()

end
end)()

end;
__proto_b2Fixture["Synchronize"] = function(self, __f625_broadPhase, __f625_transform1, __f625_transform2)
return (function()
local __oak_cond = __truthy(__not(self["m_proxy"]))
if __oak_eq(__oak_cond, true) then return __noop()
else return (function()
local __f625_aabb1 = b2AABB();
local __f625_aabb2 = b2AABB();
self["m_shape"]["ComputeAABB"](self["m_shape"], __f625_aabb1, __f625_transform1);
self["m_shape"]["ComputeAABB"](self["m_shape"], __f625_aabb2, __f625_transform2);
self["m_aabb"]["Combine"](self["m_aabb"], __f625_aabb1, __f625_aabb2);
local __f625_displacement = __static_b2Math["SubtractVV"](__f625_transform2["position"], __f625_transform1["position"]);
return __f625_broadPhase["MoveProxy"](__f625_broadPhase, self["m_proxy"], self["m_aabb"], __f625_displacement)
end)()

end
end)()

end;
__static_b2Fixture = {};
b2Fixture = function()
local self = {["__type"]='b2Fixture', ["__types"]={'b2Fixture'}};
self["GetType"] = __proto_b2Fixture["GetType"];
self["GetShape"] = __proto_b2Fixture["GetShape"];
self["SetSensor"] = __proto_b2Fixture["SetSensor"];
self["IsSensor"] = __proto_b2Fixture["IsSensor"];
self["SetFilterData"] = __proto_b2Fixture["SetFilterData"];
self["GetFilterData"] = __proto_b2Fixture["GetFilterData"];
self["GetBody"] = __proto_b2Fixture["GetBody"];
self["GetNext"] = __proto_b2Fixture["GetNext"];
self["GetUserData"] = __proto_b2Fixture["GetUserData"];
self["SetUserData"] = __proto_b2Fixture["SetUserData"];
self["TestPoint"] = __proto_b2Fixture["TestPoint"];
self["RayCast"] = __proto_b2Fixture["RayCast"];
self["GetMassData"] = __proto_b2Fixture["GetMassData"];
self["SetDensity"] = __proto_b2Fixture["SetDensity"];
self["GetDensity"] = __proto_b2Fixture["GetDensity"];
self["GetFriction"] = __proto_b2Fixture["GetFriction"];
self["SetFriction"] = __proto_b2Fixture["SetFriction"];
self["GetRestitution"] = __proto_b2Fixture["GetRestitution"];
self["SetRestitution"] = __proto_b2Fixture["SetRestitution"];
self["GetAABB"] = __proto_b2Fixture["GetAABB"];
self["Create"] = __proto_b2Fixture["Create"];
self["Destroy"] = __proto_b2Fixture["Destroy"];
self["CreateProxy"] = __proto_b2Fixture["CreateProxy"];
self["DestroyProxy"] = __proto_b2Fixture["DestroyProxy"];
self["Synchronize"] = __proto_b2Fixture["Synchronize"];
(function()
self["m_filter"] = b2FilterData();
self["m_aabb"] = b2AABB();
self["m_userData"] = nil;
self["m_body"] = nil;
self["m_next"] = nil;
self["m_shape"] = nil;
self["m_density"] = 0;
self["m_friction"] = 0;
self["m_restitution"] = 0
return self["m_restitution"]
end)()
;
return self
end;
Box2D["Dynamics"]["b2Fixture"] = b2Fixture;
__proto_b2FixtureDef = {};
__static_b2FixtureDef = {};
b2FixtureDef = function()
local self = {["__type"]='b2FixtureDef', ["__types"]={'b2FixtureDef'}};
(function()
self["filter"] = b2FilterData();
self["shape"] = nil;
self["userData"] = nil;
self["friction"] = 0.2;
self["restitution"] = 0;
self["density"] = 0;
self["filter"]["categoryBits"] = 1;
self["filter"]["maskBits"] = 65535;
self["filter"]["groupIndex"] = 0;
self["isSensor"] = false
return self["isSensor"]
end)()
;
return self
end;
Box2D["Dynamics"]["b2FixtureDef"] = b2FixtureDef;
__proto_b2Island = {};
__proto_b2Island["Initialize"] = function(self, __f628_bodyCapacity, __f628_contactCapacity, __f628_jointCapacity, __f628_allocator, __f628_listener, __f628_contactSolver)
(function()
local __oak_cond = __truthy((function()
return __oak_eq(__f628_bodyCapacity, nil)
end)()
)
if __oak_eq(__oak_cond, true) then __f628_bodyCapacity = 0
return __f628_bodyCapacity
else return __noop()
end
end)()
;
(function()
local __oak_cond = __truthy((function()
return __oak_eq(__f628_contactCapacity, nil)
end)()
)
if __oak_eq(__oak_cond, true) then __f628_contactCapacity = 0
return __f628_contactCapacity
else return __noop()
end
end)()
;
(function()
local __oak_cond = __truthy((function()
return __oak_eq(__f628_jointCapacity, nil)
end)()
)
if __oak_eq(__oak_cond, true) then __f628_jointCapacity = 0
return __f628_jointCapacity
else return __noop()
end
end)()
;
local __f628_i = 0;
self["m_bodyCapacity"] = __f628_bodyCapacity;
self["m_contactCapacity"] = __f628_contactCapacity;
self["m_jointCapacity"] = __f628_jointCapacity;
self["m_bodyCount"] = 0;
self["m_contactCount"] = 0;
self["m_jointCount"] = 0;
self["m_allocator"] = __f628_allocator;
self["m_listener"] = __f628_listener;
self["m_contactSolver"] = __f628_contactSolver;
(function()
__f628_i = len(self["m_bodies"]);
local function __loop170()
return (function()
local __oak_cond = (function()
return (__f628_i < __f628_bodyCapacity)
end)()

if __oak_eq(__oak_cond, true) then return (function()
local __r = (function()
self["m_bodies"][__add(__f628_i, 1)] = nil
return __oak_acc(self["m_bodies"], (function()
return __add(__f628_i, 1)
end)()
)
end)()
;
return (function()
local __oak_cond = __r
if __oak_eq(__oak_cond, 'break') then return nil
else return (function()
(function()
local __tmp628_171 = __f628_i;
__f628_i = __as_oak_string(__f628_i + 1);
return __tmp628_171
end)()
;
return __loop170()
end)()

end
end)()

end)()

else return nil
end
end)()

end;
return __loop170()
end)()
;
(function()
__f628_i = len(self["m_contacts"]);
local function __loop172()
return (function()
local __oak_cond = (function()
return (__f628_i < __f628_contactCapacity)
end)()

if __oak_eq(__oak_cond, true) then return (function()
local __r = (function()
self["m_contacts"][__add(__f628_i, 1)] = nil
return __oak_acc(self["m_contacts"], (function()
return __add(__f628_i, 1)
end)()
)
end)()
;
return (function()
local __oak_cond = __r
if __oak_eq(__oak_cond, 'break') then return nil
else return (function()
(function()
local __tmp628_173 = __f628_i;
__f628_i = __as_oak_string(__f628_i + 1);
return __tmp628_173
end)()
;
return __loop172()
end)()

end
end)()

end)()

else return nil
end
end)()

end;
return __loop172()
end)()
;
return (function()
__f628_i = len(self["m_joints"]);
local function __loop174()
return (function()
local __oak_cond = (function()
return (__f628_i < __f628_jointCapacity)
end)()

if __oak_eq(__oak_cond, true) then return (function()
local __r = (function()
self["m_joints"][__add(__f628_i, 1)] = nil
return __oak_acc(self["m_joints"], (function()
return __add(__f628_i, 1)
end)()
)
end)()
;
return (function()
local __oak_cond = __r
if __oak_eq(__oak_cond, 'break') then return nil
else return (function()
(function()
local __tmp628_175 = __f628_i;
__f628_i = __as_oak_string(__f628_i + 1);
return __tmp628_175
end)()
;
return __loop174()
end)()

end
end)()

end)()

else return nil
end
end)()

end;
return __loop174()
end)()

end;
__proto_b2Island["Clear"] = function(self)
self["m_bodyCount"] = 0;
self["m_contactCount"] = 0;
self["m_jointCount"] = 0
return self["m_jointCount"]
end;
__proto_b2Island["Solve"] = function(self, __f630_step, __f630_gravity, __f630_allowSleep)
local __f630_i = 0;
local __f630_j = 0;
local __f630_b = __noop();
local __f630_joint = __noop();
(function()
__f630_i = 0;
local function __loop176()
return (function()
local __oak_cond = (function()
return (__f630_i < self["m_bodyCount"])
end)()

if __oak_eq(__oak_cond, true) then return (function()
local __r = (function()
return (function()
__f630_b = __oak_acc(self["m_bodies"], (function()
return __f630_i
end)()
);
(function()
local __oak_cond = __truthy((function()
return (not __oak_eq(__f630_b["GetType"](__f630_b), __static_b2Body["b2_dynamicBody"]))
end)()
)
if __oak_eq(__oak_cond, true) then return 'continue'
else return __noop()
end
end)()
;
__f630_b["m_linearVelocity"]["x"] = __add(__f630_b["m_linearVelocity"]["x"], (function()
return (__f630_step["dt"] * __add(__f630_gravity["x"], (function()
return (__f630_b["m_invMass"] * __f630_b["m_force"]["x"])
end)()
))
end)()
);
__f630_b["m_linearVelocity"]["y"] = __add(__f630_b["m_linearVelocity"]["y"], (function()
return (__f630_step["dt"] * __add(__f630_gravity["y"], (function()
return (__f630_b["m_invMass"] * __f630_b["m_force"]["y"])
end)()
))
end)()
);
__f630_b["m_angularVelocity"] = __add(__f630_b["m_angularVelocity"], (function()
return ((function()
return (__f630_step["dt"] * __f630_b["m_invI"])
end)()
 * __f630_b["m_torque"])
end)()
);
__f630_b["m_linearVelocity"]["Multiply"](__f630_b["m_linearVelocity"], __static_b2Math["Clamp"]((function()
return (1 - (function()
return (__f630_step["dt"] * __f630_b["m_linearDamping"])
end)()
)
end)()
, 0, 1));
__f630_b["m_angularVelocity"] = (function()
return (__f630_b["m_angularVelocity"] * __static_b2Math["Clamp"]((function()
return (1 - (function()
return (__f630_step["dt"] * __f630_b["m_angularDamping"])
end)()
)
end)()
, 0, 1))
end)()

return __f630_b["m_angularVelocity"]
end)()

end)()
;
return (function()
local __oak_cond = __r
if __oak_eq(__oak_cond, 'break') then return nil
else return (function()
(function()
__f630_i = __as_oak_string(__f630_i + 1)
return __f630_i
end)()
;
return __loop176()
end)()

end
end)()

end)()

else return nil
end
end)()

end;
return __loop176()
end)()
;
self["m_contactSolver"]["Initialize"](self["m_contactSolver"], __f630_step, self["m_contacts"], self["m_contactCount"], self["m_allocator"]);
local __f630_contactSolver = self["m_contactSolver"];
__f630_contactSolver["InitVelocityConstraints"](__f630_contactSolver, __f630_step);
(function()
__f630_i = 0;
local function __loop178()
return (function()
local __oak_cond = (function()
return (__f630_i < self["m_jointCount"])
end)()

if __oak_eq(__oak_cond, true) then return (function()
local __r = (function()
return (function()
__f630_joint = __oak_acc(self["m_joints"], (function()
return __f630_i
end)()
);
return __f630_joint["InitVelocityConstraints"](__f630_joint, __f630_step)
end)()

end)()
;
return (function()
local __oak_cond = __r
if __oak_eq(__oak_cond, 'break') then return nil
else return (function()
(function()
__f630_i = __as_oak_string(__f630_i + 1)
return __f630_i
end)()
;
return __loop178()
end)()

end
end)()

end)()

else return nil
end
end)()

end;
return __loop178()
end)()
;
(function()
__f630_i = 0;
local function __loop180()
return (function()
local __oak_cond = (function()
return (__f630_i < __f630_step["velocityIterations"])
end)()

if __oak_eq(__oak_cond, true) then return (function()
local __r = (function()
return (function()
(function()
__f630_j = 0;
local function __loop182()
return (function()
local __oak_cond = (function()
return (__f630_j < self["m_jointCount"])
end)()

if __oak_eq(__oak_cond, true) then return (function()
local __r = (function()
return (function()
__f630_joint = __oak_acc(self["m_joints"], (function()
return __f630_j
end)()
);
return __f630_joint["SolveVelocityConstraints"](__f630_joint, __f630_step)
end)()

end)()
;
return (function()
local __oak_cond = __r
if __oak_eq(__oak_cond, 'break') then return nil
else return (function()
(function()
__f630_j = __as_oak_string(__f630_j + 1)
return __f630_j
end)()
;
return __loop182()
end)()

end
end)()

end)()

else return nil
end
end)()

end;
return __loop182()
end)()
;
return __f630_contactSolver["SolveVelocityConstraints"](__f630_contactSolver)
end)()

end)()
;
return (function()
local __oak_cond = __r
if __oak_eq(__oak_cond, 'break') then return nil
else return (function()
(function()
__f630_i = __as_oak_string(__f630_i + 1)
return __f630_i
end)()
;
return __loop180()
end)()

end
end)()

end)()

else return nil
end
end)()

end;
return __loop180()
end)()
;
(function()
__f630_i = 0;
local function __loop184()
return (function()
local __oak_cond = (function()
return (__f630_i < self["m_jointCount"])
end)()

if __oak_eq(__oak_cond, true) then return (function()
local __r = (function()
return (function()
__f630_joint = __oak_acc(self["m_joints"], (function()
return __f630_i
end)()
);
return __f630_joint["FinalizeVelocityConstraints"](__f630_joint)
end)()

end)()
;
return (function()
local __oak_cond = __r
if __oak_eq(__oak_cond, 'break') then return nil
else return (function()
(function()
__f630_i = __as_oak_string(__f630_i + 1)
return __f630_i
end)()
;
return __loop184()
end)()

end
end)()

end)()

else return nil
end
end)()

end;
return __loop184()
end)()
;
__f630_contactSolver["FinalizeVelocityConstraints"](__f630_contactSolver);
(function()
__f630_i = 0;
local function __loop186()
return (function()
local __oak_cond = (function()
return (__f630_i < self["m_bodyCount"])
end)()

if __oak_eq(__oak_cond, true) then return (function()
local __r = (function()
return (function()
__f630_b = __oak_acc(self["m_bodies"], (function()
return __f630_i
end)()
);
(function()
local __oak_cond = __truthy((function()
return __oak_eq(__f630_b["GetType"](__f630_b), __static_b2Body["b2_staticBody"])
end)()
)
if __oak_eq(__oak_cond, true) then return 'continue'
else return __noop()
end
end)()
;
local __f630_translationX = (function()
return (__f630_step["dt"] * __f630_b["m_linearVelocity"]["x"])
end)()
;
local __f630_translationY = (function()
return (__f630_step["dt"] * __f630_b["m_linearVelocity"]["y"])
end)()
;
(function()
local __oak_cond = __truthy((function()
return (__add((function()
return (__f630_translationX * __f630_translationX)
end)()
, (function()
return (__f630_translationY * __f630_translationY)
end)()
) > __static_b2Settings["b2_maxTranslationSquared"])
end)()
)
if __oak_eq(__oak_cond, true) then return (function()
__f630_b["m_linearVelocity"]["Normalize"](__f630_b["m_linearVelocity"]);
__f630_b["m_linearVelocity"]["x"] = (function()
return (__f630_b["m_linearVelocity"]["x"] * (function()
return (__static_b2Settings["b2_maxTranslation"] * __f630_step["inv_dt"])
end)()
)
end)()
;
__f630_b["m_linearVelocity"]["y"] = (function()
return (__f630_b["m_linearVelocity"]["y"] * (function()
return (__static_b2Settings["b2_maxTranslation"] * __f630_step["inv_dt"])
end)()
)
end)()

return __f630_b["m_linearVelocity"]["y"]
end)()

else return __noop()
end
end)()
;
local __f630_rotation = (function()
return (__f630_step["dt"] * __f630_b["m_angularVelocity"])
end)()
;
(function()
local __oak_cond = __truthy((function()
return ((function()
return (__f630_rotation * __f630_rotation)
end)()
 > __static_b2Settings["b2_maxRotationSquared"])
end)()
)
if __oak_eq(__oak_cond, true) then return (function()
local __oak_cond = __truthy((function()
return (__f630_b["m_angularVelocity"] < 0)
end)()
)
if __oak_eq(__oak_cond, true) then __f630_b["m_angularVelocity"] = (function()
return ((function()
return (-__static_b2Settings["b2_maxRotation"])
end)()
 * __f630_step["inv_dt"])
end)()

return __f630_b["m_angularVelocity"]
else __f630_b["m_angularVelocity"] = (function()
return (__static_b2Settings["b2_maxRotation"] * __f630_step["inv_dt"])
end)()

return __f630_b["m_angularVelocity"]
end
end)()

else return __noop()
end
end)()
;
__f630_b["m_sweep"]["c0"]["SetV"](__f630_b["m_sweep"]["c0"], __f630_b["m_sweep"]["c"]);
__f630_b["m_sweep"]["a0"] = __f630_b["m_sweep"]["a"];
__f630_b["m_sweep"]["c"]["x"] = __add(__f630_b["m_sweep"]["c"]["x"], (function()
return (__f630_step["dt"] * __f630_b["m_linearVelocity"]["x"])
end)()
);
__f630_b["m_sweep"]["c"]["y"] = __add(__f630_b["m_sweep"]["c"]["y"], (function()
return (__f630_step["dt"] * __f630_b["m_linearVelocity"]["y"])
end)()
);
__f630_b["m_sweep"]["a"] = __add(__f630_b["m_sweep"]["a"], (function()
return (__f630_step["dt"] * __f630_b["m_angularVelocity"])
end)()
);
return __f630_b["SynchronizeTransform"](__f630_b)
end)()

end)()
;
return (function()
local __oak_cond = __r
if __oak_eq(__oak_cond, 'break') then return nil
else return (function()
(function()
__f630_i = __as_oak_string(__f630_i + 1)
return __f630_i
end)()
;
return __loop186()
end)()

end
end)()

end)()

else return nil
end
end)()

end;
return __loop186()
end)()
;
(function()
__f630_i = 0;
local function __loop188()
return (function()
local __oak_cond = (function()
return (__f630_i < __f630_step["positionIterations"])
end)()

if __oak_eq(__oak_cond, true) then return (function()
local __r = (function()
return (function()
local __f630_contactsOkay = __f630_contactSolver["SolvePositionConstraints"](__f630_contactSolver, __static_b2Settings["b2_contactBaumgarte"]);
local __f630_jointsOkay = true;
(function()
__f630_j = 0;
local function __loop190()
return (function()
local __oak_cond = (function()
return (__f630_j < self["m_jointCount"])
end)()

if __oak_eq(__oak_cond, true) then return (function()
local __r = (function()
return (function()
__f630_joint = __oak_acc(self["m_joints"], (function()
return __f630_j
end)()
);
local __f630_jointOkay = __f630_joint["SolvePositionConstraints"](__f630_joint, __static_b2Settings["b2_contactBaumgarte"]);
__f630_jointsOkay = __and(__f630_jointsOkay, __f630_jointOkay)
return __f630_jointsOkay
end)()

end)()
;
return (function()
local __oak_cond = __r
if __oak_eq(__oak_cond, 'break') then return nil
else return (function()
(function()
__f630_j = __as_oak_string(__f630_j + 1)
return __f630_j
end)()
;
return __loop190()
end)()

end
end)()

end)()

else return nil
end
end)()

end;
return __loop190()
end)()
;
return (function()
local __oak_cond = __truthy(__and(__f630_contactsOkay, __f630_jointsOkay))
if __oak_eq(__oak_cond, true) then return 'break'
else return __noop()
end
end)()

end)()

end)()
;
return (function()
local __oak_cond = __r
if __oak_eq(__oak_cond, 'break') then return nil
else return (function()
(function()
__f630_i = __as_oak_string(__f630_i + 1)
return __f630_i
end)()
;
return __loop188()
end)()

end
end)()

end)()

else return nil
end
end)()

end;
return __loop188()
end)()
;
self["Report"](self, __f630_contactSolver["m_constraints"]);
return (function()
local __oak_cond = __truthy(__f630_allowSleep)
if __oak_eq(__oak_cond, true) then return (function()
local __f630_minSleepTime = __Number["MAX_VALUE"];
local __f630_linTolSqr = (function()
return (__static_b2Settings["b2_linearSleepTolerance"] * __static_b2Settings["b2_linearSleepTolerance"])
end)()
;
local __f630_angTolSqr = (function()
return (__static_b2Settings["b2_angularSleepTolerance"] * __static_b2Settings["b2_angularSleepTolerance"])
end)()
;
(function()
__f630_i = 0;
local function __loop192()
return (function()
local __oak_cond = (function()
return (__f630_i < self["m_bodyCount"])
end)()

if __oak_eq(__oak_cond, true) then return (function()
local __r = (function()
return (function()
__f630_b = __oak_acc(self["m_bodies"], (function()
return __f630_i
end)()
);
(function()
local __oak_cond = __truthy((function()
return __oak_eq(__f630_b["GetType"](__f630_b), __static_b2Body["b2_staticBody"])
end)()
)
if __oak_eq(__oak_cond, true) then return 'continue'
else return __noop()
end
end)()
;
(function()
local __oak_cond = __truthy((function()
return __oak_eq(__band(__f630_b["m_flags"], __static_b2Body["e_allowSleepFlag"]), 0)
end)()
)
if __oak_eq(__oak_cond, true) then return (function()
__f630_b["m_sleepTime"] = 0;
__f630_minSleepTime = 0
return __f630_minSleepTime
end)()

else return __noop()
end
end)()
;
return (function()
local __oak_cond = __truthy(__or(__or((function()
return __oak_eq(__band(__f630_b["m_flags"], __static_b2Body["e_allowSleepFlag"]), 0)
end)()
, (function()
return ((function()
return (__f630_b["m_angularVelocity"] * __f630_b["m_angularVelocity"])
end)()
 > __f630_angTolSqr)
end)()
), (function()
return (__static_b2Math["Dot"](__f630_b["m_linearVelocity"], __f630_b["m_linearVelocity"]) > __f630_linTolSqr)
end)()
))
if __oak_eq(__oak_cond, true) then return (function()
__f630_b["m_sleepTime"] = 0;
__f630_minSleepTime = 0
return __f630_minSleepTime
end)()

else return (function()
__f630_b["m_sleepTime"] = __add(__f630_b["m_sleepTime"], __f630_step["dt"]);
__f630_minSleepTime = __static_b2Math["Min"](__f630_minSleepTime, __f630_b["m_sleepTime"])
return __f630_minSleepTime
end)()

end
end)()

end)()

end)()
;
return (function()
local __oak_cond = __r
if __oak_eq(__oak_cond, 'break') then return nil
else return (function()
(function()
__f630_i = __as_oak_string(__f630_i + 1)
return __f630_i
end)()
;
return __loop192()
end)()

end
end)()

end)()

else return nil
end
end)()

end;
return __loop192()
end)()
;
return (function()
local __oak_cond = __truthy((function()
return (__f630_minSleepTime >= __static_b2Settings["b2_timeToSleep"])
end)()
)
if __oak_eq(__oak_cond, true) then return (function()
__f630_i = 0;
local function __loop194()
return (function()
local __oak_cond = (function()
return (__f630_i < self["m_bodyCount"])
end)()

if __oak_eq(__oak_cond, true) then return (function()
local __r = (function()
return (function()
__f630_b = __oak_acc(self["m_bodies"], (function()
return __f630_i
end)()
);
return __f630_b["SetAwake"](__f630_b, false)
end)()

end)()
;
return (function()
local __oak_cond = __r
if __oak_eq(__oak_cond, 'break') then return nil
else return (function()
(function()
__f630_i = __as_oak_string(__f630_i + 1)
return __f630_i
end)()
;
return __loop194()
end)()

end
end)()

end)()

else return nil
end
end)()

end;
return __loop194()
end)()

else return __noop()
end
end)()

end)()

else return __noop()
end
end)()

end;
__proto_b2Island["SolveTOI"] = function(self, __f631_subStep)
local __f631_i = 0;
local __f631_j = 0;
self["m_contactSolver"]["Initialize"](self["m_contactSolver"], __f631_subStep, self["m_contacts"], self["m_contactCount"], self["m_allocator"]);
local __f631_contactSolver = self["m_contactSolver"];
(function()
__f631_i = 0;
local function __loop196()
return (function()
local __oak_cond = (function()
return (__f631_i < self["m_jointCount"])
end)()

if __oak_eq(__oak_cond, true) then return (function()
local __r = (function()
return __oak_acc(self["m_joints"], (function()
return __f631_i
end)()
)["InitVelocityConstraints"](__oak_acc(self["m_joints"], (function()
return __f631_i
end)()
), __f631_subStep)
end)()
;
return (function()
local __oak_cond = __r
if __oak_eq(__oak_cond, 'break') then return nil
else return (function()
(function()
__f631_i = __as_oak_string(__f631_i + 1)
return __f631_i
end)()
;
return __loop196()
end)()

end
end)()

end)()

else return nil
end
end)()

end;
return __loop196()
end)()
;
(function()
__f631_i = 0;
local function __loop198()
return (function()
local __oak_cond = (function()
return (__f631_i < __f631_subStep["velocityIterations"])
end)()

if __oak_eq(__oak_cond, true) then return (function()
local __r = (function()
return (function()
__f631_contactSolver["SolveVelocityConstraints"](__f631_contactSolver);
return (function()
__f631_j = 0;
local function __loop200()
return (function()
local __oak_cond = (function()
return (__f631_j < self["m_jointCount"])
end)()

if __oak_eq(__oak_cond, true) then return (function()
local __r = (function()
return __oak_acc(self["m_joints"], (function()
return __f631_j
end)()
)["SolveVelocityConstraints"](__oak_acc(self["m_joints"], (function()
return __f631_j
end)()
), __f631_subStep)
end)()
;
return (function()
local __oak_cond = __r
if __oak_eq(__oak_cond, 'break') then return nil
else return (function()
(function()
__f631_j = __as_oak_string(__f631_j + 1)
return __f631_j
end)()
;
return __loop200()
end)()

end
end)()

end)()

else return nil
end
end)()

end;
return __loop200()
end)()

end)()

end)()
;
return (function()
local __oak_cond = __r
if __oak_eq(__oak_cond, 'break') then return nil
else return (function()
(function()
__f631_i = __as_oak_string(__f631_i + 1)
return __f631_i
end)()
;
return __loop198()
end)()

end
end)()

end)()

else return nil
end
end)()

end;
return __loop198()
end)()
;
(function()
__f631_i = 0;
local function __loop202()
return (function()
local __oak_cond = (function()
return (__f631_i < self["m_bodyCount"])
end)()

if __oak_eq(__oak_cond, true) then return (function()
local __r = (function()
return (function()
local __f631_b = __oak_acc(self["m_bodies"], (function()
return __f631_i
end)()
);
(function()
local __oak_cond = __truthy((function()
return __oak_eq(__f631_b["GetType"](__f631_b), __static_b2Body["b2_staticBody"])
end)()
)
if __oak_eq(__oak_cond, true) then return 'continue'
else return __noop()
end
end)()
;
local __f631_translationX = (function()
return (__f631_subStep["dt"] * __f631_b["m_linearVelocity"]["x"])
end)()
;
local __f631_translationY = (function()
return (__f631_subStep["dt"] * __f631_b["m_linearVelocity"]["y"])
end)()
;
(function()
local __oak_cond = __truthy((function()
return (__add((function()
return (__f631_translationX * __f631_translationX)
end)()
, (function()
return (__f631_translationY * __f631_translationY)
end)()
) > __static_b2Settings["b2_maxTranslationSquared"])
end)()
)
if __oak_eq(__oak_cond, true) then return (function()
__f631_b["m_linearVelocity"]["Normalize"](__f631_b["m_linearVelocity"]);
__f631_b["m_linearVelocity"]["x"] = (function()
return (__f631_b["m_linearVelocity"]["x"] * (function()
return (__static_b2Settings["b2_maxTranslation"] * __f631_subStep["inv_dt"])
end)()
)
end)()
;
__f631_b["m_linearVelocity"]["y"] = (function()
return (__f631_b["m_linearVelocity"]["y"] * (function()
return (__static_b2Settings["b2_maxTranslation"] * __f631_subStep["inv_dt"])
end)()
)
end)()

return __f631_b["m_linearVelocity"]["y"]
end)()

else return __noop()
end
end)()
;
local __f631_rotation = (function()
return (__f631_subStep["dt"] * __f631_b["m_angularVelocity"])
end)()
;
(function()
local __oak_cond = __truthy((function()
return ((function()
return (__f631_rotation * __f631_rotation)
end)()
 > __static_b2Settings["b2_maxRotationSquared"])
end)()
)
if __oak_eq(__oak_cond, true) then return (function()
local __oak_cond = __truthy((function()
return (__f631_b["m_angularVelocity"] < 0)
end)()
)
if __oak_eq(__oak_cond, true) then __f631_b["m_angularVelocity"] = (function()
return ((function()
return (-__static_b2Settings["b2_maxRotation"])
end)()
 * __f631_subStep["inv_dt"])
end)()

return __f631_b["m_angularVelocity"]
else __f631_b["m_angularVelocity"] = (function()
return (__static_b2Settings["b2_maxRotation"] * __f631_subStep["inv_dt"])
end)()

return __f631_b["m_angularVelocity"]
end
end)()

else return __noop()
end
end)()
;
__f631_b["m_sweep"]["c0"]["SetV"](__f631_b["m_sweep"]["c0"], __f631_b["m_sweep"]["c"]);
__f631_b["m_sweep"]["a0"] = __f631_b["m_sweep"]["a"];
__f631_b["m_sweep"]["c"]["x"] = __add(__f631_b["m_sweep"]["c"]["x"], (function()
return (__f631_subStep["dt"] * __f631_b["m_linearVelocity"]["x"])
end)()
);
__f631_b["m_sweep"]["c"]["y"] = __add(__f631_b["m_sweep"]["c"]["y"], (function()
return (__f631_subStep["dt"] * __f631_b["m_linearVelocity"]["y"])
end)()
);
__f631_b["m_sweep"]["a"] = __add(__f631_b["m_sweep"]["a"], (function()
return (__f631_subStep["dt"] * __f631_b["m_angularVelocity"])
end)()
);
return __f631_b["SynchronizeTransform"](__f631_b)
end)()

end)()
;
return (function()
local __oak_cond = __r
if __oak_eq(__oak_cond, 'break') then return nil
else return (function()
(function()
__f631_i = __as_oak_string(__f631_i + 1)
return __f631_i
end)()
;
return __loop202()
end)()

end
end)()

end)()

else return nil
end
end)()

end;
return __loop202()
end)()
;
local __f631_k_toiBaumgarte = 0.75;
(function()
__f631_i = 0;
local function __loop204()
return (function()
local __oak_cond = (function()
return (__f631_i < __f631_subStep["positionIterations"])
end)()

if __oak_eq(__oak_cond, true) then return (function()
local __r = (function()
return (function()
local __f631_contactsOkay = __f631_contactSolver["SolvePositionConstraints"](__f631_contactSolver, __f631_k_toiBaumgarte);
local __f631_jointsOkay = true;
(function()
__f631_j = 0;
local function __loop206()
return (function()
local __oak_cond = (function()
return (__f631_j < self["m_jointCount"])
end)()

if __oak_eq(__oak_cond, true) then return (function()
local __r = (function()
return (function()
local __f631_jointOkay = __oak_acc(self["m_joints"], (function()
return __f631_j
end)()
)["SolvePositionConstraints"](__oak_acc(self["m_joints"], (function()
return __f631_j
end)()
), __static_b2Settings["b2_contactBaumgarte"]);
__f631_jointsOkay = __and(__f631_jointsOkay, __f631_jointOkay)
return __f631_jointsOkay
end)()

end)()
;
return (function()
local __oak_cond = __r
if __oak_eq(__oak_cond, 'break') then return nil
else return (function()
(function()
__f631_j = __as_oak_string(__f631_j + 1)
return __f631_j
end)()
;
return __loop206()
end)()

end
end)()

end)()

else return nil
end
end)()

end;
return __loop206()
end)()
;
return (function()
local __oak_cond = __truthy(__and(__f631_contactsOkay, __f631_jointsOkay))
if __oak_eq(__oak_cond, true) then return 'break'
else return __noop()
end
end)()

end)()

end)()
;
return (function()
local __oak_cond = __r
if __oak_eq(__oak_cond, 'break') then return nil
else return (function()
(function()
__f631_i = __as_oak_string(__f631_i + 1)
return __f631_i
end)()
;
return __loop204()
end)()

end
end)()

end)()

else return nil
end
end)()

end;
return __loop204()
end)()
;
return self["Report"](self, __f631_contactSolver["m_constraints"])
end;
__proto_b2Island["Report"] = function(self, __f632_constraints)
return (function()
local __oak_cond = __truthy((function()
return __oak_eq(self["m_listener"], nil)
end)()
)
if __oak_eq(__oak_cond, true) then return __noop()
else return (function()
local __f632_i = 0;
local function __loop208()
return (function()
local __oak_cond = (function()
return (__f632_i < self["m_contactCount"])
end)()

if __oak_eq(__oak_cond, true) then return (function()
local __r = (function()
return (function()
local __f632_c = __oak_acc(self["m_contacts"], (function()
return __f632_i
end)()
);
local __f632_cc = __oak_acc(__f632_constraints, (function()
return __f632_i
end)()
);
(function()
local __f632_j = 0;
local function __loop210()
return (function()
local __oak_cond = (function()
return (__f632_j < __f632_cc["pointCount"])
end)()

if __oak_eq(__oak_cond, true) then return (function()
local __r = (function()
return (function()
__static_b2Island["s_impulse"]["normalImpulses"][__add(__f632_j, 1)] = __oak_acc(__f632_cc["points"], (function()
return __f632_j
end)()
)["normalImpulse"];
__static_b2Island["s_impulse"]["tangentImpulses"][__add(__f632_j, 1)] = __oak_acc(__f632_cc["points"], (function()
return __f632_j
end)()
)["tangentImpulse"]
return __oak_acc(__static_b2Island["s_impulse"]["tangentImpulses"], (function()
return __add(__f632_j, 1)
end)()
)
end)()

end)()
;
return (function()
local __oak_cond = __r
if __oak_eq(__oak_cond, 'break') then return nil
else return (function()
(function()
__f632_j = __as_oak_string(__f632_j + 1)
return __f632_j
end)()
;
return __loop210()
end)()

end
end)()

end)()

else return nil
end
end)()

end;
return __loop210()
end)()
;
return self["m_listener"]["PostSolve"](self["m_listener"], __f632_c, __static_b2Island["s_impulse"])
end)()

end)()
;
return (function()
local __oak_cond = __r
if __oak_eq(__oak_cond, 'break') then return nil
else return (function()
(function()
__f632_i = __as_oak_string(__f632_i + 1)
return __f632_i
end)()
;
return __loop208()
end)()

end
end)()

end)()

else return nil
end
end)()

end;
return __loop208()
end)()

end
end)()

end;
__proto_b2Island["AddBody"] = function(self, __f633_body)
__f633_body["m_islandIndex"] = self["m_bodyCount"];
self["m_bodies"][__add((function()
local __tmp633_213 = self["m_bodyCount"];
self["m_bodyCount"] = __as_oak_string(self["m_bodyCount"] + 1);
return __tmp633_213
end)()
, 1)] = __f633_body
return __oak_acc(self["m_bodies"], (function()
return __add((function()
local __tmp633_213 = self["m_bodyCount"];
self["m_bodyCount"] = __as_oak_string(self["m_bodyCount"] + 1);
return __tmp633_213
end)()
, 1)
end)()
)
end;
__proto_b2Island["AddContact"] = function(self, __f634_contact)
self["m_contacts"][__add((function()
local __tmp634_215 = self["m_contactCount"];
self["m_contactCount"] = __as_oak_string(self["m_contactCount"] + 1);
return __tmp634_215
end)()
, 1)] = __f634_contact
return __oak_acc(self["m_contacts"], (function()
return __add((function()
local __tmp634_215 = self["m_contactCount"];
self["m_contactCount"] = __as_oak_string(self["m_contactCount"] + 1);
return __tmp634_215
end)()
, 1)
end)()
)
end;
__proto_b2Island["AddJoint"] = function(self, __f635_joint)
self["m_joints"][__add((function()
local __tmp635_217 = self["m_jointCount"];
self["m_jointCount"] = __as_oak_string(self["m_jointCount"] + 1);
return __tmp635_217
end)()
, 1)] = __f635_joint
return __oak_acc(self["m_joints"], (function()
return __add((function()
local __tmp635_217 = self["m_jointCount"];
self["m_jointCount"] = __as_oak_string(self["m_jointCount"] + 1);
return __tmp635_217
end)()
, 1)
end)()
)
end;
__static_b2Island = {};
b2Island = function()
local self = {["__type"]='b2Island', ["__types"]={'b2Island'}};
self["Initialize"] = __proto_b2Island["Initialize"];
self["Clear"] = __proto_b2Island["Clear"];
self["Solve"] = __proto_b2Island["Solve"];
self["SolveTOI"] = __proto_b2Island["SolveTOI"];
self["Report"] = __proto_b2Island["Report"];
self["AddBody"] = __proto_b2Island["AddBody"];
self["AddContact"] = __proto_b2Island["AddContact"];
self["AddJoint"] = __proto_b2Island["AddJoint"];
(function()
self["m_bodies"] = __newArray();
self["m_contacts"] = __newArray();
self["m_joints"] = __newArray()
return self["m_joints"]
end)()
;
return self
end;
Box2D["Dynamics"]["b2Island"] = b2Island;
__proto_b2World = {};
__proto_b2World["SetDestructionListener"] = function(self, __f637_listener)
self["m_destructionListener"] = __f637_listener
return self["m_destructionListener"]
end;
__proto_b2World["SetContactFilter"] = function(self, __f638_filter)
self["m_contactManager"]["m_contactFilter"] = __f638_filter
return self["m_contactManager"]["m_contactFilter"]
end;
__proto_b2World["SetContactListener"] = function(self, __f639_listener)
self["m_contactManager"]["m_contactListener"] = __f639_listener
return self["m_contactManager"]["m_contactListener"]
end;
__proto_b2World["SetDebugDraw"] = function(self, __f640_debugDraw)
self["m_debugDraw"] = __f640_debugDraw
return self["m_debugDraw"]
end;
__proto_b2World["SetBroadPhase"] = function(self, __f641_broadPhase)
local __f641_oldBroadPhase = self["m_contactManager"]["m_broadPhase"];
self["m_contactManager"]["m_broadPhase"] = __f641_broadPhase;
return (function()
local __f641_b = self["m_bodyList"];
local function __loop218()
return (function()
local __oak_cond = __f641_b
if __oak_eq(__oak_cond, true) then return (function()
local __r = (function()
return (function()
local __f641_f = __f641_b["m_fixtureList"];
local function __loop219()
return (function()
local __oak_cond = __f641_f
if __oak_eq(__oak_cond, true) then return (function()
local __r = (function()
__f641_f["m_proxy"] = __f641_broadPhase["CreateProxy"](__f641_broadPhase, __f641_oldBroadPhase["GetFatAABB"](__f641_oldBroadPhase, __f641_f["m_proxy"]), __f641_f)
return __f641_f["m_proxy"]
end)()
;
return (function()
local __oak_cond = __r
if __oak_eq(__oak_cond, 'break') then return nil
else return (function()
__f641_f = __f641_f["m_next"];
return __loop219()
end)()

end
end)()

end)()

else return nil
end
end)()

end;
return __loop219()
end)()

end)()
;
return (function()
local __oak_cond = __r
if __oak_eq(__oak_cond, 'break') then return nil
else return (function()
__f641_b = __f641_b["m_next"];
return __loop218()
end)()

end
end)()

end)()

else return nil
end
end)()

end;
return __loop218()
end)()

end;
__proto_b2World["Validate"] = function(self)
return self["m_contactManager"]["m_broadPhase"]["Validate"](self["m_contactManager"]["m_broadPhase"])
end;
__proto_b2World["GetProxyCount"] = function(self)
return self["m_contactManager"]["m_broadPhase"]["GetProxyCount"](self["m_contactManager"]["m_broadPhase"])
end;
__proto_b2World["CreateBody"] = function(self, __f644_def)
(function()
local __oak_cond = __truthy((function()
return __oak_eq(self["IsLocked"](self), true)
end)()
)
if __oak_eq(__oak_cond, true) then return nil
else return __noop()
end
end)()
;
local __f644_b = b2Body(__f644_def, self);
__f644_b["m_prev"] = nil;
__f644_b["m_next"] = self["m_bodyList"];
(function()
local __oak_cond = __truthy(self["m_bodyList"])
if __oak_eq(__oak_cond, true) then self["m_bodyList"]["m_prev"] = __f644_b
return self["m_bodyList"]["m_prev"]
else return __noop()
end
end)()
;
self["m_bodyList"] = __f644_b;
(function()
self["m_bodyCount"] = __as_oak_string(self["m_bodyCount"] + 1)
return self["m_bodyCount"]
end)()
;
return __f644_b
end;
__proto_b2World["DestroyBody"] = function(self, __f645_b)
return (function()
local __oak_cond = __truthy((function()
return __oak_eq(self["IsLocked"](self), true)
end)()
)
if __oak_eq(__oak_cond, true) then return __noop()
else return (function()
local __f645_jn = __f645_b["m_jointList"];
(function()
local function __loop221()
return (function()
local __oak_cond = __f645_jn
if __oak_eq(__oak_cond, true) then return (function()
local __r = (function()
return (function()
local __f645_jn0 = __f645_jn;
__f645_jn = __f645_jn["next"];
(function()
local __oak_cond = __truthy(self["m_destructionListener"])
if __oak_eq(__oak_cond, true) then return self["m_destructionListener"]["SayGoodbyeJoint"](self["m_destructionListener"], __f645_jn0["joint"])
else return __noop()
end
end)()
;
return self["DestroyJoint"](self, __f645_jn0["joint"])
end)()

end)()
;
return (function()
local __oak_cond = __r
if __oak_eq(__oak_cond, 'break') then return nil
else return __loop221()
end
end)()

end)()

else return nil
end
end)()

end;
return __loop221()
end)()
;
local __f645_coe = __f645_b["m_controllerList"];
(function()
local function __loop222()
return (function()
local __oak_cond = __f645_coe
if __oak_eq(__oak_cond, true) then return (function()
local __r = (function()
return (function()
local __f645_coe0 = __f645_coe;
__f645_coe = __f645_coe["nextController"];
return __f645_coe0["controller"]["RemoveBody"](__f645_coe0["controller"], __f645_b)
end)()

end)()
;
return (function()
local __oak_cond = __r
if __oak_eq(__oak_cond, 'break') then return nil
else return __loop222()
end
end)()

end)()

else return nil
end
end)()

end;
return __loop222()
end)()
;
local __f645_ce = __f645_b["m_contactList"];
(function()
local function __loop223()
return (function()
local __oak_cond = __f645_ce
if __oak_eq(__oak_cond, true) then return (function()
local __r = (function()
return (function()
local __f645_ce0 = __f645_ce;
__f645_ce = __f645_ce["next"];
return self["m_contactManager"]["Destroy"](self["m_contactManager"], __f645_ce0["contact"])
end)()

end)()
;
return (function()
local __oak_cond = __r
if __oak_eq(__oak_cond, 'break') then return nil
else return __loop223()
end
end)()

end)()

else return nil
end
end)()

end;
return __loop223()
end)()
;
__f645_b["m_contactList"] = nil;
local __f645_f = __f645_b["m_fixtureList"];
(function()
local function __loop224()
return (function()
local __oak_cond = __f645_f
if __oak_eq(__oak_cond, true) then return (function()
local __r = (function()
return (function()
local __f645_f0 = __f645_f;
__f645_f = __f645_f["m_next"];
(function()
local __oak_cond = __truthy(self["m_destructionListener"])
if __oak_eq(__oak_cond, true) then return self["m_destructionListener"]["SayGoodbyeFixture"](self["m_destructionListener"], __f645_f0)
else return __noop()
end
end)()
;
__f645_f0["DestroyProxy"](__f645_f0, self["m_contactManager"]["m_broadPhase"]);
return __f645_f0["Destroy"](__f645_f0)
end)()

end)()
;
return (function()
local __oak_cond = __r
if __oak_eq(__oak_cond, 'break') then return nil
else return __loop224()
end
end)()

end)()

else return nil
end
end)()

end;
return __loop224()
end)()
;
__f645_b["m_fixtureList"] = nil;
__f645_b["m_fixtureCount"] = 0;
(function()
local __oak_cond = __truthy(__f645_b["m_prev"])
if __oak_eq(__oak_cond, true) then __f645_b["m_prev"]["m_next"] = __f645_b["m_next"]
return __f645_b["m_prev"]["m_next"]
else return __noop()
end
end)()
;
(function()
local __oak_cond = __truthy(__f645_b["m_next"])
if __oak_eq(__oak_cond, true) then __f645_b["m_next"]["m_prev"] = __f645_b["m_prev"]
return __f645_b["m_next"]["m_prev"]
else return __noop()
end
end)()
;
(function()
local __oak_cond = __truthy((function()
return __oak_eq(__f645_b, self["m_bodyList"])
end)()
)
if __oak_eq(__oak_cond, true) then self["m_bodyList"] = __f645_b["m_next"]
return self["m_bodyList"]
else return __noop()
end
end)()
;
return (function()
self["m_bodyCount"] = __as_oak_string(self["m_bodyCount"] + (-1))
return self["m_bodyCount"]
end)()

end)()

end
end)()

end;
__proto_b2World["CreateJoint"] = function(self, __f646_def)
local __f646_j = __static_b2Joint["Create"](__f646_def, nil);
__f646_j["m_prev"] = nil;
__f646_j["m_next"] = self["m_jointList"];
(function()
local __oak_cond = __truthy(self["m_jointList"])
if __oak_eq(__oak_cond, true) then self["m_jointList"]["m_prev"] = __f646_j
return self["m_jointList"]["m_prev"]
else return __noop()
end
end)()
;
self["m_jointList"] = __f646_j;
(function()
self["m_jointCount"] = __as_oak_string(self["m_jointCount"] + 1)
return self["m_jointCount"]
end)()
;
__f646_j["m_edgeA"]["joint"] = __f646_j;
__f646_j["m_edgeA"]["other"] = __f646_j["m_bodyB"];
__f646_j["m_edgeA"]["prev"] = nil;
__f646_j["m_edgeA"]["next"] = __f646_j["m_bodyA"]["m_jointList"];
(function()
local __oak_cond = __truthy(__f646_j["m_bodyA"]["m_jointList"])
if __oak_eq(__oak_cond, true) then __f646_j["m_bodyA"]["m_jointList"]["prev"] = __f646_j["m_edgeA"]
return __f646_j["m_bodyA"]["m_jointList"]["prev"]
else return __noop()
end
end)()
;
__f646_j["m_bodyA"]["m_jointList"] = __f646_j["m_edgeA"];
__f646_j["m_edgeB"]["joint"] = __f646_j;
__f646_j["m_edgeB"]["other"] = __f646_j["m_bodyA"];
__f646_j["m_edgeB"]["prev"] = nil;
__f646_j["m_edgeB"]["next"] = __f646_j["m_bodyB"]["m_jointList"];
(function()
local __oak_cond = __truthy(__f646_j["m_bodyB"]["m_jointList"])
if __oak_eq(__oak_cond, true) then __f646_j["m_bodyB"]["m_jointList"]["prev"] = __f646_j["m_edgeB"]
return __f646_j["m_bodyB"]["m_jointList"]["prev"]
else return __noop()
end
end)()
;
__f646_j["m_bodyB"]["m_jointList"] = __f646_j["m_edgeB"];
local __f646_bodyA = __f646_def["bodyA"];
local __f646_bodyB = __f646_def["bodyB"];
(function()
local __oak_cond = __truthy((function()
return __oak_eq(__f646_def["collideConnected"], false)
end)()
)
if __oak_eq(__oak_cond, true) then return (function()
local __f646_edge = __f646_bodyB["GetContactList"](__f646_bodyB);
return (function()
local function __loop227()
return (function()
local __oak_cond = __f646_edge
if __oak_eq(__oak_cond, true) then return (function()
local __r = (function()
return (function()
(function()
local __oak_cond = __truthy((function()
return __oak_eq(__f646_edge["other"], __f646_bodyA)
end)()
)
if __oak_eq(__oak_cond, true) then return __f646_edge["contact"]["FlagForFiltering"](__f646_edge["contact"])
else return __noop()
end
end)()
;
__f646_edge = __f646_edge["next"]
return __f646_edge
end)()

end)()
;
return (function()
local __oak_cond = __r
if __oak_eq(__oak_cond, 'break') then return nil
else return __loop227()
end
end)()

end)()

else return nil
end
end)()

end;
return __loop227()
end)()

end)()

else return __noop()
end
end)()
;
return __f646_j
end;
__proto_b2World["DestroyJoint"] = function(self, __f647_j)
local __f647_collideConnected = __f647_j["m_collideConnected"];
(function()
local __oak_cond = __truthy(__f647_j["m_prev"])
if __oak_eq(__oak_cond, true) then __f647_j["m_prev"]["m_next"] = __f647_j["m_next"]
return __f647_j["m_prev"]["m_next"]
else return __noop()
end
end)()
;
(function()
local __oak_cond = __truthy(__f647_j["m_next"])
if __oak_eq(__oak_cond, true) then __f647_j["m_next"]["m_prev"] = __f647_j["m_prev"]
return __f647_j["m_next"]["m_prev"]
else return __noop()
end
end)()
;
(function()
local __oak_cond = __truthy((function()
return __oak_eq(__f647_j, self["m_jointList"])
end)()
)
if __oak_eq(__oak_cond, true) then self["m_jointList"] = __f647_j["m_next"]
return self["m_jointList"]
else return __noop()
end
end)()
;
local __f647_bodyA = __f647_j["m_bodyA"];
local __f647_bodyB = __f647_j["m_bodyB"];
__f647_bodyA["SetAwake"](__f647_bodyA, true);
__f647_bodyB["SetAwake"](__f647_bodyB, true);
(function()
local __oak_cond = __truthy(__f647_j["m_edgeA"]["prev"])
if __oak_eq(__oak_cond, true) then __f647_j["m_edgeA"]["prev"]["next"] = __f647_j["m_edgeA"]["next"]
return __f647_j["m_edgeA"]["prev"]["next"]
else return __noop()
end
end)()
;
(function()
local __oak_cond = __truthy(__f647_j["m_edgeA"]["next"])
if __oak_eq(__oak_cond, true) then __f647_j["m_edgeA"]["next"]["prev"] = __f647_j["m_edgeA"]["prev"]
return __f647_j["m_edgeA"]["next"]["prev"]
else return __noop()
end
end)()
;
(function()
local __oak_cond = __truthy((function()
return __oak_eq(__f647_j["m_edgeA"], __f647_bodyA["m_jointList"])
end)()
)
if __oak_eq(__oak_cond, true) then __f647_bodyA["m_jointList"] = __f647_j["m_edgeA"]["next"]
return __f647_bodyA["m_jointList"]
else return __noop()
end
end)()
;
__f647_j["m_edgeA"]["prev"] = nil;
__f647_j["m_edgeA"]["next"] = nil;
(function()
local __oak_cond = __truthy(__f647_j["m_edgeB"]["prev"])
if __oak_eq(__oak_cond, true) then __f647_j["m_edgeB"]["prev"]["next"] = __f647_j["m_edgeB"]["next"]
return __f647_j["m_edgeB"]["prev"]["next"]
else return __noop()
end
end)()
;
(function()
local __oak_cond = __truthy(__f647_j["m_edgeB"]["next"])
if __oak_eq(__oak_cond, true) then __f647_j["m_edgeB"]["next"]["prev"] = __f647_j["m_edgeB"]["prev"]
return __f647_j["m_edgeB"]["next"]["prev"]
else return __noop()
end
end)()
;
(function()
local __oak_cond = __truthy((function()
return __oak_eq(__f647_j["m_edgeB"], __f647_bodyB["m_jointList"])
end)()
)
if __oak_eq(__oak_cond, true) then __f647_bodyB["m_jointList"] = __f647_j["m_edgeB"]["next"]
return __f647_bodyB["m_jointList"]
else return __noop()
end
end)()
;
__f647_j["m_edgeB"]["prev"] = nil;
__f647_j["m_edgeB"]["next"] = nil;
__static_b2Joint["Destroy"](__f647_j, nil);
(function()
self["m_jointCount"] = __as_oak_string(self["m_jointCount"] + (-1))
return self["m_jointCount"]
end)()
;
return (function()
local __oak_cond = __truthy((function()
return __oak_eq(__f647_collideConnected, false)
end)()
)
if __oak_eq(__oak_cond, true) then return (function()
local __f647_edge = __f647_bodyB["GetContactList"](__f647_bodyB);
return (function()
local function __loop229()
return (function()
local __oak_cond = __f647_edge
if __oak_eq(__oak_cond, true) then return (function()
local __r = (function()
return (function()
(function()
local __oak_cond = __truthy((function()
return __oak_eq(__f647_edge["other"], __f647_bodyA)
end)()
)
if __oak_eq(__oak_cond, true) then return __f647_edge["contact"]["FlagForFiltering"](__f647_edge["contact"])
else return __noop()
end
end)()
;
__f647_edge = __f647_edge["next"]
return __f647_edge
end)()

end)()
;
return (function()
local __oak_cond = __r
if __oak_eq(__oak_cond, 'break') then return nil
else return __loop229()
end
end)()

end)()

else return nil
end
end)()

end;
return __loop229()
end)()

end)()

else return __noop()
end
end)()

end;
__proto_b2World["AddController"] = function(self, __f648_c)
__f648_c["m_next"] = self["m_controllerList"];
__f648_c["m_prev"] = nil;
self["m_controllerList"] = __f648_c;
__f648_c["m_world"] = self;
(function()
local __tmp648_230 = self["m_controllerCount"];
self["m_controllerCount"] = __as_oak_string(self["m_controllerCount"] + 1);
return __tmp648_230
end)()
;
return __f648_c
end;
__proto_b2World["RemoveController"] = function(self, __f649_c)
(function()
local __oak_cond = __truthy(__f649_c["m_prev"])
if __oak_eq(__oak_cond, true) then __f649_c["m_prev"]["m_next"] = __f649_c["m_next"]
return __f649_c["m_prev"]["m_next"]
else return __noop()
end
end)()
;
(function()
local __oak_cond = __truthy(__f649_c["m_next"])
if __oak_eq(__oak_cond, true) then __f649_c["m_next"]["m_prev"] = __f649_c["m_prev"]
return __f649_c["m_next"]["m_prev"]
else return __noop()
end
end)()
;
(function()
local __oak_cond = __truthy((function()
return __oak_eq(self["m_controllerList"], __f649_c)
end)()
)
if __oak_eq(__oak_cond, true) then self["m_controllerList"] = __f649_c["m_next"]
return self["m_controllerList"]
else return __noop()
end
end)()
;
return (function()
local __tmp649_231 = self["m_controllerCount"];
self["m_controllerCount"] = __as_oak_string(self["m_controllerCount"] + (-1));
return __tmp649_231
end)()

end;
__proto_b2World["CreateController"] = function(self, __f650_controller)
(function()
local __oak_cond = __truthy((function()
return (not __oak_eq(__f650_controller["m_world"], self))
end)()
)
if __oak_eq(__oak_cond, true) then return __throw(__Error('Controller can only be a member of one world'))
else return __noop()
end
end)()
;
__f650_controller["m_next"] = self["m_controllerList"];
__f650_controller["m_prev"] = nil;
(function()
local __oak_cond = __truthy(self["m_controllerList"])
if __oak_eq(__oak_cond, true) then self["m_controllerList"]["m_prev"] = __f650_controller
return self["m_controllerList"]["m_prev"]
else return __noop()
end
end)()
;
self["m_controllerList"] = __f650_controller;
(function()
self["m_controllerCount"] = __as_oak_string(self["m_controllerCount"] + 1)
return self["m_controllerCount"]
end)()
;
__f650_controller["m_world"] = self;
return __f650_controller
end;
__proto_b2World["DestroyController"] = function(self, __f651_controller)
__f651_controller["Clear"](__f651_controller);
(function()
local __oak_cond = __truthy(__f651_controller["m_next"])
if __oak_eq(__oak_cond, true) then __f651_controller["m_next"]["m_prev"] = __f651_controller["m_prev"]
return __f651_controller["m_next"]["m_prev"]
else return __noop()
end
end)()
;
(function()
local __oak_cond = __truthy(__f651_controller["m_prev"])
if __oak_eq(__oak_cond, true) then __f651_controller["m_prev"]["m_next"] = __f651_controller["m_next"]
return __f651_controller["m_prev"]["m_next"]
else return __noop()
end
end)()
;
(function()
local __oak_cond = __truthy((function()
return __oak_eq(__f651_controller, self["m_controllerList"])
end)()
)
if __oak_eq(__oak_cond, true) then self["m_controllerList"] = __f651_controller["m_next"]
return self["m_controllerList"]
else return __noop()
end
end)()
;
return (function()
self["m_controllerCount"] = __as_oak_string(self["m_controllerCount"] + (-1))
return self["m_controllerCount"]
end)()

end;
__proto_b2World["SetWarmStarting"] = function(self, __f652_flag)
return nil
end;
__proto_b2World["SetContinuousPhysics"] = function(self, __f653_flag)
return nil
end;
__proto_b2World["GetBodyCount"] = function(self)
return self["m_bodyCount"]
end;
__proto_b2World["GetJointCount"] = function(self)
return self["m_jointCount"]
end;
__proto_b2World["GetContactCount"] = function(self)
return self["m_contactCount"]
end;
__proto_b2World["SetGravity"] = function(self, __f657_gravity)
self["m_gravity"] = __f657_gravity
return self["m_gravity"]
end;
__proto_b2World["GetGravity"] = function(self)
return self["m_gravity"]
end;
__proto_b2World["GetGroundBody"] = function(self)
return self["m_groundBody"]
end;
__proto_b2World["Step"] = function(self, __f660_dt, __f660_velocityIterations, __f660_positionIterations)
(function()
local __oak_cond = __truthy((function()
return __oak_eq(__f660_dt, nil)
end)()
)
if __oak_eq(__oak_cond, true) then __f660_dt = 0
return __f660_dt
else return __noop()
end
end)()
;
(function()
local __oak_cond = __truthy((function()
return __oak_eq(__f660_velocityIterations, nil)
end)()
)
if __oak_eq(__oak_cond, true) then __f660_velocityIterations = 0
return __f660_velocityIterations
else return __noop()
end
end)()
;
(function()
local __oak_cond = __truthy((function()
return __oak_eq(__f660_positionIterations, nil)
end)()
)
if __oak_eq(__oak_cond, true) then __f660_positionIterations = 0
return __f660_positionIterations
else return __noop()
end
end)()
;
(function()
local __oak_cond = __truthy(__band(self["m_flags"], __static_b2World["e_newFixture"]))
if __oak_eq(__oak_cond, true) then return (function()
self["m_contactManager"]["FindNewContacts"](self["m_contactManager"]);
self["m_flags"] = __band(self["m_flags"], __bnot(__static_b2World["e_newFixture"]))
return self["m_flags"]
end)()

else return __noop()
end
end)()
;
self["m_flags"] = __bor(self["m_flags"], __static_b2World["e_locked"]);
local __f660_step = __static_b2World["s_timestep2"];
__f660_step["dt"] = __f660_dt;
__f660_step["velocityIterations"] = __f660_velocityIterations;
__f660_step["positionIterations"] = __f660_positionIterations;
(function()
local __oak_cond = __truthy((function()
return (__f660_dt > 0)
end)()
)
if __oak_eq(__oak_cond, true) then __f660_step["inv_dt"] = (function()
return (1 / __f660_dt)
end)()

return __f660_step["inv_dt"]
else __f660_step["inv_dt"] = 0
return __f660_step["inv_dt"]
end
end)()
;
__f660_step["dtRatio"] = (function()
return (self["m_inv_dt0"] * __f660_dt)
end)()
;
__f660_step["warmStarting"] = __static_b2World["m_warmStarting"];
self["m_contactManager"]["Collide"](self["m_contactManager"]);
(function()
local __oak_cond = __truthy((function()
return (__f660_step["dt"] > 0)
end)()
)
if __oak_eq(__oak_cond, true) then return self["Solve"](self, __f660_step)
else return __noop()
end
end)()
;
(function()
local __oak_cond = __truthy(__and(__static_b2World["m_continuousPhysics"], (function()
return (__f660_step["dt"] > 0)
end)()
))
if __oak_eq(__oak_cond, true) then return self["SolveTOI"](self, __f660_step)
else return __noop()
end
end)()
;
(function()
local __oak_cond = __truthy((function()
return (__f660_step["dt"] > 0)
end)()
)
if __oak_eq(__oak_cond, true) then self["m_inv_dt0"] = __f660_step["inv_dt"]
return self["m_inv_dt0"]
else return __noop()
end
end)()
;
self["m_flags"] = __band(self["m_flags"], __bnot(__static_b2World["e_locked"]))
return self["m_flags"]
end;
__proto_b2World["ClearForces"] = function(self)
local __f661_body = self["m_bodyList"];
local function __loop234()
return (function()
local __oak_cond = __f661_body
if __oak_eq(__oak_cond, true) then return (function()
local __r = (function()
return (function()
__f661_body["m_force"]["SetZero"](__f661_body["m_force"]);
__f661_body["m_torque"] = 0
return __f661_body["m_torque"]
end)()

end)()
;
return (function()
local __oak_cond = __r
if __oak_eq(__oak_cond, 'break') then return nil
else return (function()
__f661_body = __f661_body["m_next"];
return __loop234()
end)()

end
end)()

end)()

else return nil
end
end)()

end;
return __loop234()
end;
__proto_b2World["DrawDebugData"] = function(self)
return (function()
local __oak_cond = __truthy((function()
return __oak_eq(self["m_debugDraw"], nil)
end)()
)
if __oak_eq(__oak_cond, true) then return __noop()
else return (function()
self["m_debugDraw"]["m_sprite"]["graphics"]["clear"]();
local __f662_flags = self["m_debugDraw"]["GetFlags"](self["m_debugDraw"]);
local __f662_i = 0;
local __f662_b = __noop();
local __f662_f = __noop();
local __f662_s = __noop();
local __f662_j = __noop();
local __f662_bp = __noop();
local __f662_invQ = b2Vec2();
local __f662_x1 = b2Vec2();
local __f662_x2 = b2Vec2();
local __f662_xf = __noop();
local __f662_b1 = b2AABB();
local __f662_b2 = b2AABB();
local __f662_vs = {b2Vec2(), b2Vec2(), b2Vec2(), b2Vec2()};
local __f662_color = b2Color(0, 0, 0);
(function()
local __oak_cond = __truthy(__band(__f662_flags, __static_b2DebugDraw["e_shapeBit"]))
if __oak_eq(__oak_cond, true) then return (function()
__f662_b = self["m_bodyList"];
local function __loop235()
return (function()
local __oak_cond = __f662_b
if __oak_eq(__oak_cond, true) then return (function()
local __r = (function()
return (function()
__f662_xf = __f662_b["m_xf"];
return (function()
__f662_f = __f662_b["GetFixtureList"](__f662_b);
local function __loop236()
return (function()
local __oak_cond = __f662_f
if __oak_eq(__oak_cond, true) then return (function()
local __r = (function()
return (function()
__f662_s = __f662_f["GetShape"](__f662_f);
return (function()
local __oak_cond = __truthy((function()
return __oak_eq(__f662_b["IsActive"](__f662_b), false)
end)()
)
if __oak_eq(__oak_cond, true) then return (function()
__f662_color["Set"](__f662_color, 0.5, 0.5, 0.3);
return self["DrawShape"](self, __f662_s, __f662_xf, __f662_color)
end)()

else return (function()
local __oak_cond = __truthy((function()
return __oak_eq(__f662_b["GetType"](__f662_b), __static_b2Body["b2_staticBody"])
end)()
)
if __oak_eq(__oak_cond, true) then return (function()
__f662_color["Set"](__f662_color, 0.5, 0.9, 0.5);
return self["DrawShape"](self, __f662_s, __f662_xf, __f662_color)
end)()

else return (function()
local __oak_cond = __truthy((function()
return __oak_eq(__f662_b["GetType"](__f662_b), __static_b2Body["b2_kinematicBody"])
end)()
)
if __oak_eq(__oak_cond, true) then return (function()
__f662_color["Set"](__f662_color, 0.5, 0.5, 0.9);
return self["DrawShape"](self, __f662_s, __f662_xf, __f662_color)
end)()

else return (function()
local __oak_cond = __truthy((function()
return __oak_eq(__f662_b["IsAwake"](__f662_b), false)
end)()
)
if __oak_eq(__oak_cond, true) then return (function()
__f662_color["Set"](__f662_color, 0.6, 0.6, 0.6);
return self["DrawShape"](self, __f662_s, __f662_xf, __f662_color)
end)()

else return (function()
__f662_color["Set"](__f662_color, 0.9, 0.7, 0.7);
return self["DrawShape"](self, __f662_s, __f662_xf, __f662_color)
end)()

end
end)()

end
end)()

end
end)()

end
end)()

end)()

end)()
;
return (function()
local __oak_cond = __r
if __oak_eq(__oak_cond, 'break') then return nil
else return (function()
__f662_f = __f662_f["m_next"];
return __loop236()
end)()

end
end)()

end)()

else return nil
end
end)()

end;
return __loop236()
end)()

end)()

end)()
;
return (function()
local __oak_cond = __r
if __oak_eq(__oak_cond, 'break') then return nil
else return (function()
__f662_b = __f662_b["m_next"];
return __loop235()
end)()

end
end)()

end)()

else return nil
end
end)()

end;
return __loop235()
end)()

else return __noop()
end
end)()
;
(function()
local __oak_cond = __truthy(__band(__f662_flags, __static_b2DebugDraw["e_jointBit"]))
if __oak_eq(__oak_cond, true) then return (function()
__f662_j = self["m_jointList"];
local function __loop237()
return (function()
local __oak_cond = __f662_j
if __oak_eq(__oak_cond, true) then return (function()
local __r = (function()
return self["DrawJoint"](self, __f662_j)
end)()
;
return (function()
local __oak_cond = __r
if __oak_eq(__oak_cond, 'break') then return nil
else return (function()
__f662_j = __f662_j["m_next"];
return __loop237()
end)()

end
end)()

end)()

else return nil
end
end)()

end;
return __loop237()
end)()

else return __noop()
end
end)()
;
(function()
local __oak_cond = __truthy(__band(__f662_flags, __static_b2DebugDraw["e_controllerBit"]))
if __oak_eq(__oak_cond, true) then return (function()
local __f662_c = self["m_controllerList"];
local function __loop238()
return (function()
local __oak_cond = __f662_c
if __oak_eq(__oak_cond, true) then return (function()
local __r = (function()
return __f662_c["Draw"](__f662_c, self["m_debugDraw"])
end)()
;
return (function()
local __oak_cond = __r
if __oak_eq(__oak_cond, 'break') then return nil
else return (function()
__f662_c = __f662_c["m_next"];
return __loop238()
end)()

end
end)()

end)()

else return nil
end
end)()

end;
return __loop238()
end)()

else return __noop()
end
end)()
;
(function()
local __oak_cond = __truthy(__band(__f662_flags, __static_b2DebugDraw["e_pairBit"]))
if __oak_eq(__oak_cond, true) then return (function()
__f662_color["Set"](__f662_color, 0.3, 0.9, 0.9);
return (function()
local __f662_contact = self["m_contactManager"]["m_contactList"];
local function __loop239()
return (function()
local __oak_cond = __f662_contact
if __oak_eq(__oak_cond, true) then return (function()
local __r = (function()
return (function()
local __f662_fixtureA = __f662_contact["GetFixtureA"](__f662_contact);
local __f662_fixtureB = __f662_contact["GetFixtureB"](__f662_contact);
local __f662_cA = __f662_fixtureA["GetAABB"](__f662_fixtureA)["GetCenter"](__f662_fixtureA["GetAABB"](__f662_fixtureA));
local __f662_cB = __f662_fixtureB["GetAABB"](__f662_fixtureB)["GetCenter"](__f662_fixtureB["GetAABB"](__f662_fixtureB));
return self["m_debugDraw"]["DrawSegment"](self["m_debugDraw"], __f662_cA, __f662_cB, __f662_color)
end)()

end)()
;
return (function()
local __oak_cond = __r
if __oak_eq(__oak_cond, 'break') then return nil
else return (function()
__f662_contact = __f662_contact["GetNext"](__f662_contact);
return __loop239()
end)()

end
end)()

end)()

else return nil
end
end)()

end;
return __loop239()
end)()

end)()

else return __noop()
end
end)()
;
(function()
local __oak_cond = __truthy(__band(__f662_flags, __static_b2DebugDraw["e_aabbBit"]))
if __oak_eq(__oak_cond, true) then return (function()
__f662_bp = self["m_contactManager"]["m_broadPhase"];
__f662_vs = {b2Vec2(), b2Vec2(), b2Vec2(), b2Vec2()};
return (function()
__f662_b = self["m_bodyList"];
local function __loop240()
return (function()
local __oak_cond = __f662_b
if __oak_eq(__oak_cond, true) then return (function()
local __r = (function()
return (function()
(function()
local __oak_cond = __truthy((function()
return __oak_eq(__f662_b["IsActive"](__f662_b), false)
end)()
)
if __oak_eq(__oak_cond, true) then return 'continue'
else return __noop()
end
end)()
;
return (function()
__f662_f = __f662_b["GetFixtureList"](__f662_b);
local function __loop241()
return (function()
local __oak_cond = __f662_f
if __oak_eq(__oak_cond, true) then return (function()
local __r = (function()
return (function()
local __f662_aabb = __f662_bp["GetFatAABB"](__f662_bp, __f662_f["m_proxy"]);
__oak_acc(__f662_vs, (function()
return 0
end)()
)["Set"](__oak_acc(__f662_vs, (function()
return 0
end)()
), __f662_aabb["lowerBound"]["x"], __f662_aabb["lowerBound"]["y"]);
__oak_acc(__f662_vs, (function()
return 1
end)()
)["Set"](__oak_acc(__f662_vs, (function()
return 1
end)()
), __f662_aabb["upperBound"]["x"], __f662_aabb["lowerBound"]["y"]);
__oak_acc(__f662_vs, (function()
return 2
end)()
)["Set"](__oak_acc(__f662_vs, (function()
return 2
end)()
), __f662_aabb["upperBound"]["x"], __f662_aabb["upperBound"]["y"]);
__oak_acc(__f662_vs, (function()
return 3
end)()
)["Set"](__oak_acc(__f662_vs, (function()
return 3
end)()
), __f662_aabb["lowerBound"]["x"], __f662_aabb["upperBound"]["y"]);
return self["m_debugDraw"]["DrawPolygon"](self["m_debugDraw"], __f662_vs, 4, __f662_color)
end)()

end)()
;
return (function()
local __oak_cond = __r
if __oak_eq(__oak_cond, 'break') then return nil
else return (function()
__f662_f = __f662_f["GetNext"](__f662_f);
return __loop241()
end)()

end
end)()

end)()

else return nil
end
end)()

end;
return __loop241()
end)()

end)()

end)()
;
return (function()
local __oak_cond = __r
if __oak_eq(__oak_cond, 'break') then return nil
else return (function()
__f662_b = __f662_b["GetNext"](__f662_b);
return __loop240()
end)()

end
end)()

end)()

else return nil
end
end)()

end;
return __loop240()
end)()

end)()

else return __noop()
end
end)()
;
return (function()
local __oak_cond = __truthy(__band(__f662_flags, __static_b2DebugDraw["e_centerOfMassBit"]))
if __oak_eq(__oak_cond, true) then return (function()
__f662_b = self["m_bodyList"];
local function __loop242()
return (function()
local __oak_cond = __f662_b
if __oak_eq(__oak_cond, true) then return (function()
local __r = (function()
return (function()
__f662_xf = __static_b2World["s_xf"];
__f662_xf["R"] = __f662_b["m_xf"]["R"];
__f662_xf["position"] = __f662_b["GetWorldCenter"](__f662_b);
return self["m_debugDraw"]["DrawTransform"](self["m_debugDraw"], __f662_xf)
end)()

end)()
;
return (function()
local __oak_cond = __r
if __oak_eq(__oak_cond, 'break') then return nil
else return (function()
__f662_b = __f662_b["m_next"];
return __loop242()
end)()

end
end)()

end)()

else return nil
end
end)()

end;
return __loop242()
end)()

else return __noop()
end
end)()

end)()

end
end)()

end;
__proto_b2World["QueryAABB"] = function(self, __f663_callback, __f663_aabb)
local __f663___this = self;
local __f663_broadPhase = __f663___this["m_contactManager"]["m_broadPhase"];
local WorldQueryWrapper = function(__f664_proxy)
return __f663_callback(__f663_broadPhase["GetUserData"](__f663_broadPhase, __f664_proxy))
end;
return __f663_broadPhase["Query"](__f663_broadPhase, WorldQueryWrapper, __f663_aabb)
end;
__proto_b2World["QueryShape"] = function(self, __f665_callback, __f665_shape, __f665_transform)
local __f665___this = self;
(function()
local __oak_cond = __truthy((function()
return __oak_eq(__f665_transform, nil)
end)()
)
if __oak_eq(__oak_cond, true) then __f665_transform = nil
return __f665_transform
else return __noop()
end
end)()
;
(function()
local __oak_cond = __truthy((function()
return __oak_eq(__f665_transform, nil)
end)()
)
if __oak_eq(__oak_cond, true) then return (function()
__f665_transform = b2Transform();
return __f665_transform["SetIdentity"](__f665_transform)
end)()

else return __noop()
end
end)()
;
local __f665_broadPhase = __f665___this["m_contactManager"]["m_broadPhase"];
local WorldQueryWrapper = function(__f666_proxy)
local __f666_fixture = (function()
local __oak_cond = __truthy(__instanceof(__f665_broadPhase["GetUserData"](__f665_broadPhase, __f666_proxy), 'b2Fixture'))
if __oak_eq(__oak_cond, true) then return __f665_broadPhase["GetUserData"](__f665_broadPhase, __f666_proxy)
else return nil
end
end)()
;
(function()
local __oak_cond = __truthy(__static_b2Shape["TestOverlap"](__f665_shape, __f665_transform, __f666_fixture["GetShape"](__f666_fixture), __f666_fixture["GetBody"](__f666_fixture)["GetTransform"](__f666_fixture["GetBody"](__f666_fixture))))
if __oak_eq(__oak_cond, true) then return __f665_callback(__f666_fixture)
else return __noop()
end
end)()
;
return true
end;
local __f665_aabb = b2AABB();
__f665_shape["ComputeAABB"](__f665_shape, __f665_aabb, __f665_transform);
return __f665_broadPhase["Query"](__f665_broadPhase, WorldQueryWrapper, __f665_aabb)
end;
__proto_b2World["QueryPoint"] = function(self, __f667_callback, __f667_p)
local __f667___this = self;
local __f667_broadPhase = __f667___this["m_contactManager"]["m_broadPhase"];
local WorldQueryWrapper = function(__f668_proxy)
local __f668_fixture = (function()
local __oak_cond = __truthy(__instanceof(__f667_broadPhase["GetUserData"](__f667_broadPhase, __f668_proxy), 'b2Fixture'))
if __oak_eq(__oak_cond, true) then return __f667_broadPhase["GetUserData"](__f667_broadPhase, __f668_proxy)
else return nil
end
end)()
;
(function()
local __oak_cond = __truthy(__f668_fixture["TestPoint"](__f668_fixture, __f667_p))
if __oak_eq(__oak_cond, true) then return __f667_callback(__f668_fixture)
else return __noop()
end
end)()
;
return true
end;
local __f667_aabb = b2AABB();
__f667_aabb["lowerBound"]["Set"](__f667_aabb["lowerBound"], (function()
return (__f667_p["x"] - __static_b2Settings["b2_linearSlop"])
end)()
, (function()
return (__f667_p["y"] - __static_b2Settings["b2_linearSlop"])
end)()
);
__f667_aabb["upperBound"]["Set"](__f667_aabb["upperBound"], __add(__f667_p["x"], __static_b2Settings["b2_linearSlop"]), __add(__f667_p["y"], __static_b2Settings["b2_linearSlop"]));
return __f667_broadPhase["Query"](__f667_broadPhase, WorldQueryWrapper, __f667_aabb)
end;
__proto_b2World["RayCast"] = function(self, __f669_callback, __f669_point1, __f669_point2)
local __f669___this = self;
local __f669_broadPhase = __f669___this["m_contactManager"]["m_broadPhase"];
local __f669_output = b2RayCastOutput();
local RayCastWrapper = function(__f670_input, __f670_proxy)
local __f670_userData = __f669_broadPhase["GetUserData"](__f669_broadPhase, __f670_proxy);
local __f670_fixture = (function()
local __oak_cond = __truthy(__instanceof(__f670_userData, 'b2Fixture'))
if __oak_eq(__oak_cond, true) then return __f670_userData
else return nil
end
end)()
;
local __f670_hit = __f670_fixture["RayCast"](__f670_fixture, __f669_output, __f670_input);
(function()
local __oak_cond = __truthy(__f670_hit)
if __oak_eq(__oak_cond, true) then return (function()
local __f670_fraction = __f669_output["fraction"];
local __f670_point = b2Vec2(__add((function()
return ((function()
return (1 - __f670_fraction)
end)()
 * __f669_point1["x"])
end)()
, (function()
return (__f670_fraction * __f669_point2["x"])
end)()
), __add((function()
return ((function()
return (1 - __f670_fraction)
end)()
 * __f669_point1["y"])
end)()
, (function()
return (__f670_fraction * __f669_point2["y"])
end)()
));
return __f669_callback(__f670_fixture, __f670_point, __f669_output["normal"], __f670_fraction)
end)()

else return __noop()
end
end)()
;
return __f670_input["maxFraction"]
end;
local __f669_input = b2RayCastInput(__f669_point1, __f669_point2);
return __f669_broadPhase["RayCast"](__f669_broadPhase, RayCastWrapper, __f669_input)
end;
__proto_b2World["RayCastOne"] = function(self, __f671_point1, __f671_point2)
local __f671___this = self;
local __f671_result = __noop();
local RayCastOneWrapper = function(__f672_fixture, __f672_point, __f672_normal, __f672_fraction)
(function()
local __oak_cond = __truthy((function()
return __oak_eq(__f672_fraction, nil)
end)()
)
if __oak_eq(__oak_cond, true) then __f672_fraction = 0
return __f672_fraction
else return __noop()
end
end)()
;
local __f672_result = __f672_fixture;
return __f672_fraction
end;
__f671___this["RayCast"](__f671___this, RayCastOneWrapper, __f671_point1, __f671_point2);
return __f671_result
end;
__proto_b2World["RayCastAll"] = function(self, __f673_point1, __f673_point2)
local __f673___this = self;
local __f673_result = __newArray();
local RayCastAllWrapper = function(__f674_fixture, __f674_point, __f674_normal, __f674_fraction)
(function()
local __oak_cond = __truthy((function()
return __oak_eq(__f674_fraction, nil)
end)()
)
if __oak_eq(__oak_cond, true) then __f674_fraction = 0
return __f674_fraction
else return __noop()
end
end)()
;
__f673_result[__add(len(__f673_result), 1)] = __f674_fixture;
return 1
end;
__f673___this["RayCast"](__f673___this, RayCastAllWrapper, __f673_point1, __f673_point2);
return __f673_result
end;
__proto_b2World["GetBodyList"] = function(self)
return self["m_bodyList"]
end;
__proto_b2World["GetJointList"] = function(self)
return self["m_jointList"]
end;
__proto_b2World["GetContactList"] = function(self)
return self["m_contactList"]
end;
__proto_b2World["IsLocked"] = function(self)
return (__band(self["m_flags"], __static_b2World["e_locked"]) > 0)
end;
__proto_b2World["Solve"] = function(self, __f679_step)
local __f679_b = __noop();
(function()
local __f679_controller = self["m_controllerList"];
local function __loop243()
return (function()
local __oak_cond = __f679_controller
if __oak_eq(__oak_cond, true) then return (function()
local __r = (function()
return __f679_controller["Step"](__f679_controller, __f679_step)
end)()
;
return (function()
local __oak_cond = __r
if __oak_eq(__oak_cond, 'break') then return nil
else return (function()
__f679_controller = __f679_controller["m_next"];
return __loop243()
end)()

end
end)()

end)()

else return nil
end
end)()

end;
return __loop243()
end)()
;
local __f679_island = self["m_island"];
__f679_island["Initialize"](__f679_island, self["m_bodyCount"], self["m_contactCount"], self["m_jointCount"], nil, self["m_contactManager"]["m_contactListener"], self["m_contactSolver"]);
(function()
__f679_b = self["m_bodyList"];
local function __loop244()
return (function()
local __oak_cond = __f679_b
if __oak_eq(__oak_cond, true) then return (function()
local __r = (function()
__f679_b["m_flags"] = __band(__f679_b["m_flags"], __bnot(__static_b2Body["e_islandFlag"]))
return __f679_b["m_flags"]
end)()
;
return (function()
local __oak_cond = __r
if __oak_eq(__oak_cond, 'break') then return nil
else return (function()
__f679_b = __f679_b["m_next"];
return __loop244()
end)()

end
end)()

end)()

else return nil
end
end)()

end;
return __loop244()
end)()
;
(function()
local __f679_c = self["m_contactList"];
local function __loop245()
return (function()
local __oak_cond = __f679_c
if __oak_eq(__oak_cond, true) then return (function()
local __r = (function()
__f679_c["m_flags"] = __band(__f679_c["m_flags"], __bnot(__static_b2Contact["e_islandFlag"]))
return __f679_c["m_flags"]
end)()
;
return (function()
local __oak_cond = __r
if __oak_eq(__oak_cond, 'break') then return nil
else return (function()
__f679_c = __f679_c["m_next"];
return __loop245()
end)()

end
end)()

end)()

else return nil
end
end)()

end;
return __loop245()
end)()
;
(function()
local __f679_j = self["m_jointList"];
local function __loop246()
return (function()
local __oak_cond = __f679_j
if __oak_eq(__oak_cond, true) then return (function()
local __r = (function()
__f679_j["m_islandFlag"] = false
return __f679_j["m_islandFlag"]
end)()
;
return (function()
local __oak_cond = __r
if __oak_eq(__oak_cond, 'break') then return nil
else return (function()
__f679_j = __f679_j["m_next"];
return __loop246()
end)()

end
end)()

end)()

else return nil
end
end)()

end;
return __loop246()
end)()
;
local __f679_stackSize = __parseInt(self["m_bodyCount"]);
local __f679_stack = self["s_stack"];
(function()
local __f679_seed = self["m_bodyList"];
local function __loop247()
return (function()
local __oak_cond = __f679_seed
if __oak_eq(__oak_cond, true) then return (function()
local __r = (function()
return (function()
(function()
local __oak_cond = __truthy(__band(__f679_seed["m_flags"], __static_b2Body["e_islandFlag"]))
if __oak_eq(__oak_cond, true) then return 'continue'
else return __noop()
end
end)()
;
(function()
local __oak_cond = __truthy(__or((function()
return __oak_eq(__f679_seed["IsAwake"](__f679_seed), false)
end)()
, (function()
return __oak_eq(__f679_seed["IsActive"](__f679_seed), false)
end)()
))
if __oak_eq(__oak_cond, true) then return 'continue'
else return __noop()
end
end)()
;
(function()
local __oak_cond = __truthy((function()
return __oak_eq(__f679_seed["GetType"](__f679_seed), __static_b2Body["b2_staticBody"])
end)()
)
if __oak_eq(__oak_cond, true) then return 'continue'
else return __noop()
end
end)()
;
__f679_island["Clear"](__f679_island);
local __f679_stackCount = 0;
__f679_stack[__add((function()
local __tmp679_249 = __f679_stackCount;
__f679_stackCount = __as_oak_string(__f679_stackCount + 1);
return __tmp679_249
end)()
, 1)] = __f679_seed;
__f679_seed["m_flags"] = __bor(__f679_seed["m_flags"], __static_b2Body["e_islandFlag"]);
(function()
local function __loop250()
return (function()
local __oak_cond = (function()
return (__f679_stackCount > 0)
end)()

if __oak_eq(__oak_cond, true) then return (function()
local __r = (function()
return (function()
__f679_b = __oak_acc(__f679_stack, (function()
return (function()
__f679_stackCount = __as_oak_string(__f679_stackCount + (-1))
return __f679_stackCount
end)()

end)()
);
__f679_island["AddBody"](__f679_island, __f679_b);
(function()
local __oak_cond = __truthy((function()
return __oak_eq(__f679_b["IsAwake"](__f679_b), false)
end)()
)
if __oak_eq(__oak_cond, true) then return __f679_b["SetAwake"](__f679_b, true)
else return __noop()
end
end)()
;
(function()
local __oak_cond = __truthy((function()
return __oak_eq(__f679_b["GetType"](__f679_b), __static_b2Body["b2_staticBody"])
end)()
)
if __oak_eq(__oak_cond, true) then return 'continue'
else return __noop()
end
end)()
;
local __f679_other = __noop();
(function()
local __f679_ce = __f679_b["m_contactList"];
local function __loop252()
return (function()
local __oak_cond = __f679_ce
if __oak_eq(__oak_cond, true) then return (function()
local __r = (function()
return (function()
(function()
local __oak_cond = __truthy(__band(__f679_ce["contact"]["m_flags"], __static_b2Contact["e_islandFlag"]))
if __oak_eq(__oak_cond, true) then return 'continue'
else return __noop()
end
end)()
;
(function()
local __oak_cond = __truthy(__or(__or((function()
return __oak_eq(__f679_ce["contact"]["IsSensor"](__f679_ce["contact"]), true)
end)()
, (function()
return __oak_eq(__f679_ce["contact"]["IsEnabled"](__f679_ce["contact"]), false)
end)()
), (function()
return __oak_eq(__f679_ce["contact"]["IsTouching"](__f679_ce["contact"]), false)
end)()
))
if __oak_eq(__oak_cond, true) then return 'continue'
else return __noop()
end
end)()
;
__f679_island["AddContact"](__f679_island, __f679_ce["contact"]);
__f679_ce["contact"]["m_flags"] = __bor(__f679_ce["contact"]["m_flags"], __static_b2Contact["e_islandFlag"]);
__f679_other = __f679_ce["other"];
(function()
local __oak_cond = __truthy(__band(__f679_other["m_flags"], __static_b2Body["e_islandFlag"]))
if __oak_eq(__oak_cond, true) then return 'continue'
else return __noop()
end
end)()
;
__f679_stack[__add((function()
local __tmp679_254 = __f679_stackCount;
__f679_stackCount = __as_oak_string(__f679_stackCount + 1);
return __tmp679_254
end)()
, 1)] = __f679_other;
__f679_other["m_flags"] = __bor(__f679_other["m_flags"], __static_b2Body["e_islandFlag"])
return __f679_other["m_flags"]
end)()

end)()
;
return (function()
local __oak_cond = __r
if __oak_eq(__oak_cond, 'break') then return nil
else return (function()
__f679_ce = __f679_ce["next"];
return __loop252()
end)()

end
end)()

end)()

else return nil
end
end)()

end;
return __loop252()
end)()
;
return (function()
local __f679_jn = __f679_b["m_jointList"];
local function __loop255()
return (function()
local __oak_cond = __f679_jn
if __oak_eq(__oak_cond, true) then return (function()
local __r = (function()
return (function()
(function()
local __oak_cond = __truthy((function()
return __oak_eq(__f679_jn["joint"]["m_islandFlag"], true)
end)()
)
if __oak_eq(__oak_cond, true) then return 'continue'
else return __noop()
end
end)()
;
__f679_other = __f679_jn["other"];
(function()
local __oak_cond = __truthy((function()
return __oak_eq(__f679_other["IsActive"](__f679_other), false)
end)()
)
if __oak_eq(__oak_cond, true) then return 'continue'
else return __noop()
end
end)()
;
__f679_island["AddJoint"](__f679_island, __f679_jn["joint"]);
__f679_jn["joint"]["m_islandFlag"] = true;
(function()
local __oak_cond = __truthy(__band(__f679_other["m_flags"], __static_b2Body["e_islandFlag"]))
if __oak_eq(__oak_cond, true) then return 'continue'
else return __noop()
end
end)()
;
__f679_stack[__add((function()
local __tmp679_257 = __f679_stackCount;
__f679_stackCount = __as_oak_string(__f679_stackCount + 1);
return __tmp679_257
end)()
, 1)] = __f679_other;
__f679_other["m_flags"] = __bor(__f679_other["m_flags"], __static_b2Body["e_islandFlag"])
return __f679_other["m_flags"]
end)()

end)()
;
return (function()
local __oak_cond = __r
if __oak_eq(__oak_cond, 'break') then return nil
else return (function()
__f679_jn = __f679_jn["next"];
return __loop255()
end)()

end
end)()

end)()

else return nil
end
end)()

end;
return __loop255()
end)()

end)()

end)()
;
return (function()
local __oak_cond = __r
if __oak_eq(__oak_cond, 'break') then return nil
else return __loop250()
end
end)()

end)()

else return nil
end
end)()

end;
return __loop250()
end)()
;
__f679_island["Solve"](__f679_island, __f679_step, self["m_gravity"], self["m_allowSleep"]);
return (function()
local __f679_i = 0;
local function __loop258()
return (function()
local __oak_cond = (function()
return (__f679_i < __f679_island["m_bodyCount"])
end)()

if __oak_eq(__oak_cond, true) then return (function()
local __r = (function()
return (function()
__f679_b = __oak_acc(__f679_island["m_bodies"], (function()
return __f679_i
end)()
);
return (function()
local __oak_cond = __truthy((function()
return __oak_eq(__f679_b["GetType"](__f679_b), __static_b2Body["b2_staticBody"])
end)()
)
if __oak_eq(__oak_cond, true) then __f679_b["m_flags"] = __band(__f679_b["m_flags"], __bnot(__static_b2Body["e_islandFlag"]))
return __f679_b["m_flags"]
else return __noop()
end
end)()

end)()

end)()
;
return (function()
local __oak_cond = __r
if __oak_eq(__oak_cond, 'break') then return nil
else return (function()
(function()
__f679_i = __as_oak_string(__f679_i + 1)
return __f679_i
end)()
;
return __loop258()
end)()

end
end)()

end)()

else return nil
end
end)()

end;
return __loop258()
end)()

end)()

end)()
;
return (function()
local __oak_cond = __r
if __oak_eq(__oak_cond, 'break') then return nil
else return (function()
__f679_seed = __f679_seed["m_next"];
return __loop247()
end)()

end
end)()

end)()

else return nil
end
end)()

end;
return __loop247()
end)()
;
(function()
__f679_i = 0;
local function __loop260()
return (function()
local __oak_cond = (function()
return (__f679_i < len(__f679_stack))
end)()

if __oak_eq(__oak_cond, true) then return (function()
local __r = (function()
return (function()
(function()
local __oak_cond = __truthy(__not(__oak_acc(__f679_stack, (function()
return __f679_i
end)()
)))
if __oak_eq(__oak_cond, true) then return 'break'
else return __noop()
end
end)()
;
__f679_stack[__add(__f679_i, 1)] = nil
return __oak_acc(__f679_stack, (function()
return __add(__f679_i, 1)
end)()
)
end)()

end)()
;
return (function()
local __oak_cond = __r
if __oak_eq(__oak_cond, 'break') then return nil
else return (function()
(function()
__f679_i = __as_oak_string(__f679_i + 1)
return __f679_i
end)()
;
return __loop260()
end)()

end
end)()

end)()

else return nil
end
end)()

end;
return __loop260()
end)()
;
(function()
__f679_b = self["m_bodyList"];
local function __loop262()
return (function()
local __oak_cond = __f679_b
if __oak_eq(__oak_cond, true) then return (function()
local __r = (function()
return (function()
(function()
local __oak_cond = __truthy(__or((function()
return __oak_eq(__f679_b["IsAwake"](__f679_b), false)
end)()
, (function()
return __oak_eq(__f679_b["IsActive"](__f679_b), false)
end)()
))
if __oak_eq(__oak_cond, true) then return 'continue'
else return __noop()
end
end)()
;
(function()
local __oak_cond = __truthy((function()
return __oak_eq(__f679_b["GetType"](__f679_b), __static_b2Body["b2_staticBody"])
end)()
)
if __oak_eq(__oak_cond, true) then return 'continue'
else return __noop()
end
end)()
;
return __f679_b["SynchronizeFixtures"](__f679_b)
end)()

end)()
;
return (function()
local __oak_cond = __r
if __oak_eq(__oak_cond, 'break') then return nil
else return (function()
__f679_b = __f679_b["m_next"];
return __loop262()
end)()

end
end)()

end)()

else return nil
end
end)()

end;
return __loop262()
end)()
;
return self["m_contactManager"]["FindNewContacts"](self["m_contactManager"])
end;
__proto_b2World["SolveTOI"] = function(self, __f680_step)
local __f680_b = __noop();
local __f680_fA = __noop();
local __f680_fB = __noop();
local __f680_bA = __noop();
local __f680_bB = __noop();
local __f680_cEdge = __noop();
local __f680_j = __noop();
local __f680_island = self["m_island"];
__f680_island["Initialize"](__f680_island, self["m_bodyCount"], __static_b2Settings["b2_maxTOIContactsPerIsland"], __static_b2Settings["b2_maxTOIJointsPerIsland"], nil, self["m_contactManager"]["m_contactListener"], self["m_contactSolver"]);
local __f680_queue = __static_b2World["s_queue"];
(function()
__f680_b = self["m_bodyList"];
local function __loop263()
return (function()
local __oak_cond = __f680_b
if __oak_eq(__oak_cond, true) then return (function()
local __r = (function()
return (function()
__f680_b["m_flags"] = __band(__f680_b["m_flags"], __bnot(__static_b2Body["e_islandFlag"]));
__f680_b["m_sweep"]["t0"] = 0
return __f680_b["m_sweep"]["t0"]
end)()

end)()
;
return (function()
local __oak_cond = __r
if __oak_eq(__oak_cond, 'break') then return nil
else return (function()
__f680_b = __f680_b["m_next"];
return __loop263()
end)()

end
end)()

end)()

else return nil
end
end)()

end;
return __loop263()
end)()
;
local __f680_c = __noop();
(function()
__f680_c = self["m_contactList"];
local function __loop264()
return (function()
local __oak_cond = __f680_c
if __oak_eq(__oak_cond, true) then return (function()
local __r = (function()
__f680_c["m_flags"] = __band(__f680_c["m_flags"], __bnot(__bor(__static_b2Contact["e_toiFlag"], __static_b2Contact["e_islandFlag"])))
return __f680_c["m_flags"]
end)()
;
return (function()
local __oak_cond = __r
if __oak_eq(__oak_cond, 'break') then return nil
else return (function()
__f680_c = __f680_c["m_next"];
return __loop264()
end)()

end
end)()

end)()

else return nil
end
end)()

end;
return __loop264()
end)()
;
(function()
__f680_j = self["m_jointList"];
local function __loop265()
return (function()
local __oak_cond = __f680_j
if __oak_eq(__oak_cond, true) then return (function()
local __r = (function()
__f680_j["m_islandFlag"] = false
return __f680_j["m_islandFlag"]
end)()
;
return (function()
local __oak_cond = __r
if __oak_eq(__oak_cond, 'break') then return nil
else return (function()
__f680_j = __f680_j["m_next"];
return __loop265()
end)()

end
end)()

end)()

else return nil
end
end)()

end;
return __loop265()
end)()
;
return (function()
__noop();
local function __loop266()
return (function()
local __oak_cond = true
if __oak_eq(__oak_cond, true) then return (function()
local __r = (function()
return (function()
local __f680_minContact = nil;
local __f680_minTOI = 1;
(function()
__f680_c = self["m_contactList"];
local function __loop267()
return (function()
local __oak_cond = __f680_c
if __oak_eq(__oak_cond, true) then return (function()
local __r = (function()
return (function()
(function()
local __oak_cond = __truthy(__or(__or((function()
return __oak_eq(__f680_c["IsSensor"](__f680_c), true)
end)()
, (function()
return __oak_eq(__f680_c["IsEnabled"](__f680_c), false)
end)()
), (function()
return __oak_eq(__f680_c["IsContinuous"](__f680_c), false)
end)()
))
if __oak_eq(__oak_cond, true) then return 'continue'
else return __noop()
end
end)()
;
local __f680_toi = 1;
(function()
local __oak_cond = __truthy(__band(__f680_c["m_flags"], __static_b2Contact["e_toiFlag"]))
if __oak_eq(__oak_cond, true) then __f680_toi = __f680_c["m_toi"]
return __f680_toi
else return (function()
__f680_fA = __f680_c["m_fixtureA"];
__f680_fB = __f680_c["m_fixtureB"];
__f680_bA = __f680_fA["m_body"];
__f680_bB = __f680_fB["m_body"];
(function()
local __oak_cond = __truthy(__and(__or((function()
return (not __oak_eq(__f680_bA["GetType"](__f680_bA), __static_b2Body["b2_dynamicBody"]))
end)()
, (function()
return __oak_eq(__f680_bA["IsAwake"](__f680_bA), false)
end)()
), __or((function()
return (not __oak_eq(__f680_bB["GetType"](__f680_bB), __static_b2Body["b2_dynamicBody"]))
end)()
, (function()
return __oak_eq(__f680_bB["IsAwake"](__f680_bB), false)
end)()
)))
if __oak_eq(__oak_cond, true) then return 'continue'
else return __noop()
end
end)()
;
local __f680_t0 = __f680_bA["m_sweep"]["t0"];
(function()
local __oak_cond = __truthy((function()
return (__f680_bA["m_sweep"]["t0"] < __f680_bB["m_sweep"]["t0"])
end)()
)
if __oak_eq(__oak_cond, true) then return (function()
__f680_t0 = __f680_bB["m_sweep"]["t0"];
return __f680_bA["m_sweep"]["Advance"](__f680_bA["m_sweep"], __f680_t0)
end)()

else return (function()
local __oak_cond = __truthy((function()
return (__f680_bB["m_sweep"]["t0"] < __f680_bA["m_sweep"]["t0"])
end)()
)
if __oak_eq(__oak_cond, true) then return (function()
__f680_t0 = __f680_bA["m_sweep"]["t0"];
return __f680_bB["m_sweep"]["Advance"](__f680_bB["m_sweep"], __f680_t0)
end)()

else return __noop()
end
end)()

end
end)()
;
__f680_toi = __f680_c["ComputeTOI"](__f680_c, __f680_bA["m_sweep"], __f680_bB["m_sweep"]);
__static_b2Settings["b2Assert"](__and((function()
return (0 <= __f680_toi)
end)()
, (function()
return (__f680_toi <= 1)
end)()
));
(function()
local __oak_cond = __truthy(__and((function()
return (__f680_toi > 0)
end)()
, (function()
return (__f680_toi < 1)
end)()
))
if __oak_eq(__oak_cond, true) then return (function()
__f680_toi = __add((function()
return ((function()
return (1 - __f680_toi)
end)()
 * __f680_t0)
end)()
, __f680_toi);
return (function()
local __oak_cond = __truthy((function()
return (__f680_toi > 1)
end)()
)
if __oak_eq(__oak_cond, true) then __f680_toi = 1
return __f680_toi
else return __noop()
end
end)()

end)()

else return __noop()
end
end)()
;
__f680_c["m_toi"] = __f680_toi;
__f680_c["m_flags"] = __bor(__f680_c["m_flags"], __static_b2Contact["e_toiFlag"])
return __f680_c["m_flags"]
end)()

end
end)()
;
return (function()
local __oak_cond = __truthy(__and((function()
return (__Number["MIN_VALUE"] < __f680_toi)
end)()
, (function()
return (__f680_toi < __f680_minTOI)
end)()
))
if __oak_eq(__oak_cond, true) then return (function()
__f680_minContact = __f680_c;
__f680_minTOI = __f680_toi
return __f680_minTOI
end)()

else return __noop()
end
end)()

end)()

end)()
;
return (function()
local __oak_cond = __r
if __oak_eq(__oak_cond, 'break') then return nil
else return (function()
__f680_c = __f680_c["m_next"];
return __loop267()
end)()

end
end)()

end)()

else return nil
end
end)()

end;
return __loop267()
end)()
;
(function()
local __oak_cond = __truthy(__or((function()
return __oak_eq(__f680_minContact, nil)
end)()
, (function()
return ((function()
return (1 - (function()
return (100 * __Number["MIN_VALUE"])
end)()
)
end)()
 < __f680_minTOI)
end)()
))
if __oak_eq(__oak_cond, true) then return 'break'
else return __noop()
end
end)()
;
__f680_fA = __f680_minContact["m_fixtureA"];
__f680_fB = __f680_minContact["m_fixtureB"];
__f680_bA = __f680_fA["m_body"];
__f680_bB = __f680_fB["m_body"];
__static_b2World["s_backupA"]["Set"](__static_b2World["s_backupA"], __f680_bA["m_sweep"]);
__static_b2World["s_backupB"]["Set"](__static_b2World["s_backupB"], __f680_bB["m_sweep"]);
__f680_bA["Advance"](__f680_bA, __f680_minTOI);
__f680_bB["Advance"](__f680_bB, __f680_minTOI);
__f680_minContact["Update"](__f680_minContact, self["m_contactManager"]["m_contactListener"]);
__f680_minContact["m_flags"] = __band(__f680_minContact["m_flags"], __bnot(__static_b2Contact["e_toiFlag"]));
(function()
local __oak_cond = __truthy(__or((function()
return __oak_eq(__f680_minContact["IsSensor"](__f680_minContact), true)
end)()
, (function()
return __oak_eq(__f680_minContact["IsEnabled"](__f680_minContact), false)
end)()
))
if __oak_eq(__oak_cond, true) then return (function()
__f680_bA["m_sweep"]["Set"](__f680_bA["m_sweep"], __static_b2World["s_backupA"]);
__f680_bB["m_sweep"]["Set"](__f680_bB["m_sweep"], __static_b2World["s_backupB"]);
__f680_bA["SynchronizeTransform"](__f680_bA);
__f680_bB["SynchronizeTransform"](__f680_bB);
return 'continue'
end)()

else return __noop()
end
end)()
;
(function()
local __oak_cond = __truthy((function()
return __oak_eq(__f680_minContact["IsTouching"](__f680_minContact), false)
end)()
)
if __oak_eq(__oak_cond, true) then return 'continue'
else return __noop()
end
end)()
;
local __f680_seed = __f680_bA;
(function()
local __oak_cond = __truthy((function()
return (not __oak_eq(__f680_seed["GetType"](__f680_seed), __static_b2Body["b2_dynamicBody"]))
end)()
)
if __oak_eq(__oak_cond, true) then __f680_seed = __f680_bB
return __f680_seed
else return __noop()
end
end)()
;
__f680_island["Clear"](__f680_island);
local __f680_queueStart = 0;
local __f680_queueSize = 0;
__f680_queue[__add(__add(__f680_queueStart, (function()
local __tmp680_269 = __f680_queueSize;
__f680_queueSize = __as_oak_string(__f680_queueSize + 1);
return __tmp680_269
end)()
), 1)] = __f680_seed;
__f680_seed["m_flags"] = __bor(__f680_seed["m_flags"], __static_b2Body["e_islandFlag"]);
(function()
local function __loop270()
return (function()
local __oak_cond = (function()
return (__f680_queueSize > 0)
end)()

if __oak_eq(__oak_cond, true) then return (function()
local __r = (function()
return (function()
__f680_b = __oak_acc(__f680_queue, (function()
return (function()
local __tmp680_271 = __f680_queueStart;
__f680_queueStart = __as_oak_string(__f680_queueStart + 1);
return __tmp680_271
end)()

end)()
);
(function()
__f680_queueSize = __as_oak_string(__f680_queueSize + (-1))
return __f680_queueSize
end)()
;
__f680_island["AddBody"](__f680_island, __f680_b);
(function()
local __oak_cond = __truthy((function()
return __oak_eq(__f680_b["IsAwake"](__f680_b), false)
end)()
)
if __oak_eq(__oak_cond, true) then return __f680_b["SetAwake"](__f680_b, true)
else return __noop()
end
end)()
;
(function()
local __oak_cond = __truthy((function()
return (not __oak_eq(__f680_b["GetType"](__f680_b), __static_b2Body["b2_dynamicBody"]))
end)()
)
if __oak_eq(__oak_cond, true) then return 'continue'
else return __noop()
end
end)()
;
(function()
__f680_cEdge = __f680_b["m_contactList"];
local function __loop273()
return (function()
local __oak_cond = __f680_cEdge
if __oak_eq(__oak_cond, true) then return (function()
local __r = (function()
return (function()
(function()
local __oak_cond = __truthy((function()
return __oak_eq(__f680_island["m_contactCount"], __f680_island["m_contactCapacity"])
end)()
)
if __oak_eq(__oak_cond, true) then return 'break'
else return __noop()
end
end)()
;
(function()
local __oak_cond = __truthy(__band(__f680_cEdge["contact"]["m_flags"], __static_b2Contact["e_islandFlag"]))
if __oak_eq(__oak_cond, true) then return 'continue'
else return __noop()
end
end)()
;
(function()
local __oak_cond = __truthy(__or(__or((function()
return __oak_eq(__f680_cEdge["contact"]["IsSensor"](__f680_cEdge["contact"]), true)
end)()
, (function()
return __oak_eq(__f680_cEdge["contact"]["IsEnabled"](__f680_cEdge["contact"]), false)
end)()
), (function()
return __oak_eq(__f680_cEdge["contact"]["IsTouching"](__f680_cEdge["contact"]), false)
end)()
))
if __oak_eq(__oak_cond, true) then return 'continue'
else return __noop()
end
end)()
;
__f680_island["AddContact"](__f680_island, __f680_cEdge["contact"]);
__f680_cEdge["contact"]["m_flags"] = __bor(__f680_cEdge["contact"]["m_flags"], __static_b2Contact["e_islandFlag"]);
local __f680_other = __f680_cEdge["other"];
(function()
local __oak_cond = __truthy(__band(__f680_other["m_flags"], __static_b2Body["e_islandFlag"]))
if __oak_eq(__oak_cond, true) then return 'continue'
else return __noop()
end
end)()
;
(function()
local __oak_cond = __truthy((function()
return (not __oak_eq(__f680_other["GetType"](__f680_other), __static_b2Body["b2_staticBody"]))
end)()
)
if __oak_eq(__oak_cond, true) then return (function()
__f680_other["Advance"](__f680_other, __f680_minTOI);
return __f680_other["SetAwake"](__f680_other, true)
end)()

else return __noop()
end
end)()
;
__f680_queue[__add(__add(__f680_queueStart, __f680_queueSize), 1)] = __f680_other;
(function()
__f680_queueSize = __as_oak_string(__f680_queueSize + 1)
return __f680_queueSize
end)()
;
__f680_other["m_flags"] = __bor(__f680_other["m_flags"], __static_b2Body["e_islandFlag"])
return __f680_other["m_flags"]
end)()

end)()
;
return (function()
local __oak_cond = __r
if __oak_eq(__oak_cond, 'break') then return nil
else return (function()
__f680_cEdge = __f680_cEdge["next"];
return __loop273()
end)()

end
end)()

end)()

else return nil
end
end)()

end;
return __loop273()
end)()
;
return (function()
local __f680_jEdge = __f680_b["m_jointList"];
local function __loop275()
return (function()
local __oak_cond = __f680_jEdge
if __oak_eq(__oak_cond, true) then return (function()
local __r = (function()
return (function()
(function()
local __oak_cond = __truthy((function()
return __oak_eq(__f680_island["m_jointCount"], __f680_island["m_jointCapacity"])
end)()
)
if __oak_eq(__oak_cond, true) then return 'continue'
else return __noop()
end
end)()
;
(function()
local __oak_cond = __truthy((function()
return __oak_eq(__f680_jEdge["joint"]["m_islandFlag"], true)
end)()
)
if __oak_eq(__oak_cond, true) then return 'continue'
else return __noop()
end
end)()
;
__f680_other = __f680_jEdge["other"];
(function()
local __oak_cond = __truthy((function()
return __oak_eq(__f680_other["IsActive"](__f680_other), false)
end)()
)
if __oak_eq(__oak_cond, true) then return 'continue'
else return __noop()
end
end)()
;
__f680_island["AddJoint"](__f680_island, __f680_jEdge["joint"]);
__f680_jEdge["joint"]["m_islandFlag"] = true;
(function()
local __oak_cond = __truthy(__band(__f680_other["m_flags"], __static_b2Body["e_islandFlag"]))
if __oak_eq(__oak_cond, true) then return 'continue'
else return __noop()
end
end)()
;
(function()
local __oak_cond = __truthy((function()
return (not __oak_eq(__f680_other["GetType"](__f680_other), __static_b2Body["b2_staticBody"]))
end)()
)
if __oak_eq(__oak_cond, true) then return (function()
__f680_other["Advance"](__f680_other, __f680_minTOI);
return __f680_other["SetAwake"](__f680_other, true)
end)()

else return __noop()
end
end)()
;
__f680_queue[__add(__add(__f680_queueStart, __f680_queueSize), 1)] = __f680_other;
(function()
__f680_queueSize = __as_oak_string(__f680_queueSize + 1)
return __f680_queueSize
end)()
;
__f680_other["m_flags"] = __bor(__f680_other["m_flags"], __static_b2Body["e_islandFlag"])
return __f680_other["m_flags"]
end)()

end)()
;
return (function()
local __oak_cond = __r
if __oak_eq(__oak_cond, 'break') then return nil
else return (function()
__f680_jEdge = __f680_jEdge["next"];
return __loop275()
end)()

end
end)()

end)()

else return nil
end
end)()

end;
return __loop275()
end)()

end)()

end)()
;
return (function()
local __oak_cond = __r
if __oak_eq(__oak_cond, 'break') then return nil
else return __loop270()
end
end)()

end)()

else return nil
end
end)()

end;
return __loop270()
end)()
;
local __f680_subStep = __static_b2World["s_timestep"];
__f680_subStep["warmStarting"] = false;
__f680_subStep["dt"] = (function()
return ((function()
return (1 - __f680_minTOI)
end)()
 * __f680_step["dt"])
end)()
;
__f680_subStep["inv_dt"] = (function()
return (1 / __f680_subStep["dt"])
end)()
;
__f680_subStep["dtRatio"] = 0;
__f680_subStep["velocityIterations"] = __f680_step["velocityIterations"];
__f680_subStep["positionIterations"] = __f680_step["positionIterations"];
__f680_island["SolveTOI"](__f680_island, __f680_subStep);
local __f680_i = 0;
(function()
__f680_i = 0;
local function __loop277()
return (function()
local __oak_cond = (function()
return (__f680_i < __f680_island["m_bodyCount"])
end)()

if __oak_eq(__oak_cond, true) then return (function()
local __r = (function()
return (function()
__f680_b = __oak_acc(__f680_island["m_bodies"], (function()
return __f680_i
end)()
);
__f680_b["m_flags"] = __band(__f680_b["m_flags"], __bnot(__static_b2Body["e_islandFlag"]));
(function()
local __oak_cond = __truthy((function()
return __oak_eq(__f680_b["IsAwake"](__f680_b), false)
end)()
)
if __oak_eq(__oak_cond, true) then return 'continue'
else return __noop()
end
end)()
;
(function()
local __oak_cond = __truthy((function()
return (not __oak_eq(__f680_b["GetType"](__f680_b), __static_b2Body["b2_dynamicBody"]))
end)()
)
if __oak_eq(__oak_cond, true) then return 'continue'
else return __noop()
end
end)()
;
__f680_b["SynchronizeFixtures"](__f680_b);
return (function()
__f680_cEdge = __f680_b["m_contactList"];
local function __loop279()
return (function()
local __oak_cond = __f680_cEdge
if __oak_eq(__oak_cond, true) then return (function()
local __r = (function()
__f680_cEdge["contact"]["m_flags"] = __band(__f680_cEdge["contact"]["m_flags"], __bnot(__static_b2Contact["e_toiFlag"]))
return __f680_cEdge["contact"]["m_flags"]
end)()
;
return (function()
local __oak_cond = __r
if __oak_eq(__oak_cond, 'break') then return nil
else return (function()
__f680_cEdge = __f680_cEdge["next"];
return __loop279()
end)()

end
end)()

end)()

else return nil
end
end)()

end;
return __loop279()
end)()

end)()

end)()
;
return (function()
local __oak_cond = __r
if __oak_eq(__oak_cond, 'break') then return nil
else return (function()
(function()
__f680_i = __as_oak_string(__f680_i + 1)
return __f680_i
end)()
;
return __loop277()
end)()

end
end)()

end)()

else return nil
end
end)()

end;
return __loop277()
end)()
;
(function()
__f680_i = 0;
local function __loop280()
return (function()
local __oak_cond = (function()
return (__f680_i < __f680_island["m_contactCount"])
end)()

if __oak_eq(__oak_cond, true) then return (function()
local __r = (function()
return (function()
__f680_c = __oak_acc(__f680_island["m_contacts"], (function()
return __f680_i
end)()
);
__f680_c["m_flags"] = __band(__f680_c["m_flags"], __bnot(__bor(__static_b2Contact["e_toiFlag"], __static_b2Contact["e_islandFlag"])))
return __f680_c["m_flags"]
end)()

end)()
;
return (function()
local __oak_cond = __r
if __oak_eq(__oak_cond, 'break') then return nil
else return (function()
(function()
__f680_i = __as_oak_string(__f680_i + 1)
return __f680_i
end)()
;
return __loop280()
end)()

end
end)()

end)()

else return nil
end
end)()

end;
return __loop280()
end)()
;
(function()
__f680_i = 0;
local function __loop282()
return (function()
local __oak_cond = (function()
return (__f680_i < __f680_island["m_jointCount"])
end)()

if __oak_eq(__oak_cond, true) then return (function()
local __r = (function()
return (function()
__f680_j = __oak_acc(__f680_island["m_joints"], (function()
return __f680_i
end)()
);
__f680_j["m_islandFlag"] = false
return __f680_j["m_islandFlag"]
end)()

end)()
;
return (function()
local __oak_cond = __r
if __oak_eq(__oak_cond, 'break') then return nil
else return (function()
(function()
__f680_i = __as_oak_string(__f680_i + 1)
return __f680_i
end)()
;
return __loop282()
end)()

end
end)()

end)()

else return nil
end
end)()

end;
return __loop282()
end)()
;
return self["m_contactManager"]["FindNewContacts"](self["m_contactManager"])
end)()

end)()
;
return (function()
local __oak_cond = __r
if __oak_eq(__oak_cond, 'break') then return nil
else return (function()
__noop();
return __loop266()
end)()

end
end)()

end)()

else return nil
end
end)()

end;
return __loop266()
end)()

end;
__proto_b2World["DrawJoint"] = function(self, __f681_joint)
local __f681_b1 = __f681_joint["GetBodyA"](__f681_joint);
local __f681_b2 = __f681_joint["GetBodyB"](__f681_joint);
local __f681_xf1 = __f681_b1["m_xf"];
local __f681_xf2 = __f681_b2["m_xf"];
local __f681_x1 = __f681_xf1["position"];
local __f681_x2 = __f681_xf2["position"];
local __f681_p1 = __f681_joint["GetAnchorA"](__f681_joint);
local __f681_p2 = __f681_joint["GetAnchorB"](__f681_joint);
local __f681_color = __static_b2World["s_jointColor"];
return (function()
local __oak_cond = __f681_joint["m_type"]
if __oak_eq(__oak_cond, __static_b2Joint["e_distanceJoint"]) then return self["m_debugDraw"]["DrawSegment"](self["m_debugDraw"], __f681_p1, __f681_p2, __f681_color)
elseif __oak_eq(__oak_cond, __static_b2Joint["e_pulleyJoint"]) then return (function()
local __f681_pulley = (function()
local __oak_cond = __truthy(__instanceof(__f681_joint, 'b2PulleyJoint'))
if __oak_eq(__oak_cond, true) then return __f681_joint
else return nil
end
end)()
;
local __f681_s1 = __f681_pulley["GetGroundAnchorA"](__f681_pulley);
local __f681_s2 = __f681_pulley["GetGroundAnchorB"](__f681_pulley);
self["m_debugDraw"]["DrawSegment"](self["m_debugDraw"], __f681_s1, __f681_p1, __f681_color);
self["m_debugDraw"]["DrawSegment"](self["m_debugDraw"], __f681_s2, __f681_p2, __f681_color);
return self["m_debugDraw"]["DrawSegment"](self["m_debugDraw"], __f681_s1, __f681_s2, __f681_color)
end)()

elseif __oak_eq(__oak_cond, __static_b2Joint["e_mouseJoint"]) then return self["m_debugDraw"]["DrawSegment"](self["m_debugDraw"], __f681_p1, __f681_p2, __f681_color)
else return (function()
(function()
local __oak_cond = __truthy((function()
return (not __oak_eq(__f681_b1, self["m_groundBody"]))
end)()
)
if __oak_eq(__oak_cond, true) then return self["m_debugDraw"]["DrawSegment"](self["m_debugDraw"], __f681_x1, __f681_p1, __f681_color)
else return __noop()
end
end)()
;
self["m_debugDraw"]["DrawSegment"](self["m_debugDraw"], __f681_p1, __f681_p2, __f681_color);
return (function()
local __oak_cond = __truthy((function()
return (not __oak_eq(__f681_b2, self["m_groundBody"]))
end)()
)
if __oak_eq(__oak_cond, true) then return self["m_debugDraw"]["DrawSegment"](self["m_debugDraw"], __f681_x2, __f681_p2, __f681_color)
else return __noop()
end
end)()

end)()

end
end)()

end;
__proto_b2World["DrawShape"] = function(self, __f682_shape, __f682_xf, __f682_color)
return (function()
local __oak_cond = __f682_shape["m_type"]
if __oak_eq(__oak_cond, __static_b2Shape["e_circleShape"]) then return (function()
local __f682_circle = (function()
local __oak_cond = __truthy(__instanceof(__f682_shape, 'b2CircleShape'))
if __oak_eq(__oak_cond, true) then return __f682_shape
else return nil
end
end)()
;
local __f682_center = __static_b2Math["MulX"](__f682_xf, __f682_circle["m_p"]);
local __f682_radius = __f682_circle["m_radius"];
local __f682_axis = __f682_xf["R"]["col1"];
return self["m_debugDraw"]["DrawSolidCircle"](self["m_debugDraw"], __f682_center, __f682_radius, __f682_axis, __f682_color)
end)()

elseif __oak_eq(__oak_cond, __static_b2Shape["e_polygonShape"]) then return (function()
local __f682_i = 0;
local __f682_poly = (function()
local __oak_cond = __truthy(__instanceof(__f682_shape, 'b2PolygonShape'))
if __oak_eq(__oak_cond, true) then return __f682_shape
else return nil
end
end)()
;
local __f682_vertexCount = __parseInt(__f682_poly["GetVertexCount"](__f682_poly));
local __f682_localVertices = __f682_poly["GetVertices"](__f682_poly);
local __f682_vertices = __newArray(__f682_vertexCount);
(function()
__f682_i = 0;
local function __loop284()
return (function()
local __oak_cond = (function()
return (__f682_i < __f682_vertexCount)
end)()

if __oak_eq(__oak_cond, true) then return (function()
local __r = (function()
__f682_vertices[__add(__f682_i, 1)] = __static_b2Math["MulX"](__f682_xf, __oak_acc(__f682_localVertices, (function()
return __f682_i
end)()
))
return __oak_acc(__f682_vertices, (function()
return __add(__f682_i, 1)
end)()
)
end)()
;
return (function()
local __oak_cond = __r
if __oak_eq(__oak_cond, 'break') then return nil
else return (function()
(function()
__f682_i = __as_oak_string(__f682_i + 1)
return __f682_i
end)()
;
return __loop284()
end)()

end
end)()

end)()

else return nil
end
end)()

end;
return __loop284()
end)()
;
return self["m_debugDraw"]["DrawSolidPolygon"](self["m_debugDraw"], __f682_vertices, __f682_vertexCount, __f682_color)
end)()

elseif __oak_eq(__oak_cond, __static_b2Shape["e_edgeShape"]) then return (function()
local __f682_edge = (function()
local __oak_cond = __truthy(__instanceof(__f682_shape, 'b2EdgeShape'))
if __oak_eq(__oak_cond, true) then return __f682_shape
else return nil
end
end)()
;
return self["m_debugDraw"]["DrawSegment"](self["m_debugDraw"], __static_b2Math["MulX"](__f682_xf, __f682_edge["GetVertex1"](__f682_edge)), __static_b2Math["MulX"](__f682_xf, __f682_edge["GetVertex2"](__f682_edge)), __f682_color)
end)()

else return nil
end
end)()

end;
__static_b2World = {};
b2World = function()
local self = {["__type"]='b2World', ["__types"]={'b2World'}};
self["SetDestructionListener"] = __proto_b2World["SetDestructionListener"];
self["SetContactFilter"] = __proto_b2World["SetContactFilter"];
self["SetContactListener"] = __proto_b2World["SetContactListener"];
self["SetDebugDraw"] = __proto_b2World["SetDebugDraw"];
self["SetBroadPhase"] = __proto_b2World["SetBroadPhase"];
self["Validate"] = __proto_b2World["Validate"];
self["GetProxyCount"] = __proto_b2World["GetProxyCount"];
self["CreateBody"] = __proto_b2World["CreateBody"];
self["DestroyBody"] = __proto_b2World["DestroyBody"];
self["CreateJoint"] = __proto_b2World["CreateJoint"];
self["DestroyJoint"] = __proto_b2World["DestroyJoint"];
self["AddController"] = __proto_b2World["AddController"];
self["RemoveController"] = __proto_b2World["RemoveController"];
self["CreateController"] = __proto_b2World["CreateController"];
self["DestroyController"] = __proto_b2World["DestroyController"];
self["SetWarmStarting"] = __proto_b2World["SetWarmStarting"];
self["SetContinuousPhysics"] = __proto_b2World["SetContinuousPhysics"];
self["GetBodyCount"] = __proto_b2World["GetBodyCount"];
self["GetJointCount"] = __proto_b2World["GetJointCount"];
self["GetContactCount"] = __proto_b2World["GetContactCount"];
self["SetGravity"] = __proto_b2World["SetGravity"];
self["GetGravity"] = __proto_b2World["GetGravity"];
self["GetGroundBody"] = __proto_b2World["GetGroundBody"];
self["Step"] = __proto_b2World["Step"];
self["ClearForces"] = __proto_b2World["ClearForces"];
self["DrawDebugData"] = __proto_b2World["DrawDebugData"];
self["QueryAABB"] = __proto_b2World["QueryAABB"];
self["QueryShape"] = __proto_b2World["QueryShape"];
self["QueryPoint"] = __proto_b2World["QueryPoint"];
self["RayCast"] = __proto_b2World["RayCast"];
self["RayCastOne"] = __proto_b2World["RayCastOne"];
self["RayCastAll"] = __proto_b2World["RayCastAll"];
self["GetBodyList"] = __proto_b2World["GetBodyList"];
self["GetJointList"] = __proto_b2World["GetJointList"];
self["GetContactList"] = __proto_b2World["GetContactList"];
self["IsLocked"] = __proto_b2World["IsLocked"];
self["Solve"] = __proto_b2World["Solve"];
self["SolveTOI"] = __proto_b2World["SolveTOI"];
self["DrawJoint"] = __proto_b2World["DrawJoint"];
self["DrawShape"] = __proto_b2World["DrawShape"];
(function()
self["s_stack"] = __newArray();
self["m_contactManager"] = b2ContactManager();
self["m_contactSolver"] = b2ContactSolver();
self["m_island"] = b2Island();
self["m_destructionListener"] = nil;
self["m_debugDraw"] = nil;
self["m_bodyList"] = nil;
self["m_contactList"] = nil;
self["m_jointList"] = nil;
self["m_controllerList"] = nil;
self["m_bodyCount"] = 0;
self["m_contactCount"] = 0;
self["m_jointCount"] = 0;
self["m_controllerCount"] = 0;
self["m_allowSleep"] = doSleep;
self["m_gravity"] = gravity;
self["m_inv_dt0"] = 0;
self["m_contactManager"]["m_world"] = self;
local __f683_bd = b2BodyDef();
self["m_groundBody"] = self["CreateBody"](self, __f683_bd)
return self["m_groundBody"]
end)()
;
return self
end;
Box2D["Dynamics"]["b2World"] = b2World;
__proto_b2Contact = {};
__proto_b2Contact["GetManifold"] = function(self)
return self["m_manifold"]
end;
__proto_b2Contact["GetWorldManifold"] = function(self, __f685_worldManifold)
local __f685_bodyA = self["m_fixtureA"]["GetBody"](self["m_fixtureA"]);
local __f685_bodyB = self["m_fixtureB"]["GetBody"](self["m_fixtureB"]);
local __f685_shapeA = self["m_fixtureA"]["GetShape"](self["m_fixtureA"]);
local __f685_shapeB = self["m_fixtureB"]["GetShape"](self["m_fixtureB"]);
return __f685_worldManifold["Initialize"](__f685_worldManifold, self["m_manifold"], __f685_bodyA["GetTransform"](__f685_bodyA), __f685_shapeA["m_radius"], __f685_bodyB["GetTransform"](__f685_bodyB), __f685_shapeB["m_radius"])
end;
__proto_b2Contact["IsTouching"] = function(self)
return __oak_eq(__band(self["m_flags"], __static_b2Contact["e_touchingFlag"]), __static_b2Contact["e_touchingFlag"])
end;
__proto_b2Contact["IsContinuous"] = function(self)
return __oak_eq(__band(self["m_flags"], __static_b2Contact["e_continuousFlag"]), __static_b2Contact["e_continuousFlag"])
end;
__proto_b2Contact["SetSensor"] = function(self, __f688_sensor)
return (function()
local __oak_cond = __truthy(__f688_sensor)
if __oak_eq(__oak_cond, true) then self["m_flags"] = __bor(self["m_flags"], __static_b2Contact["e_sensorFlag"])
return self["m_flags"]
else self["m_flags"] = __band(self["m_flags"], __bnot(__static_b2Contact["e_sensorFlag"]))
return self["m_flags"]
end
end)()

end;
__proto_b2Contact["IsSensor"] = function(self)
return __oak_eq(__band(self["m_flags"], __static_b2Contact["e_sensorFlag"]), __static_b2Contact["e_sensorFlag"])
end;
__proto_b2Contact["SetEnabled"] = function(self, __f690_flag)
return (function()
local __oak_cond = __truthy(__f690_flag)
if __oak_eq(__oak_cond, true) then self["m_flags"] = __bor(self["m_flags"], __static_b2Contact["e_enabledFlag"])
return self["m_flags"]
else self["m_flags"] = __band(self["m_flags"], __bnot(__static_b2Contact["e_enabledFlag"]))
return self["m_flags"]
end
end)()

end;
__proto_b2Contact["IsEnabled"] = function(self)
return __oak_eq(__band(self["m_flags"], __static_b2Contact["e_enabledFlag"]), __static_b2Contact["e_enabledFlag"])
end;
__proto_b2Contact["GetNext"] = function(self)
return self["m_next"]
end;
__proto_b2Contact["GetFixtureA"] = function(self)
return self["m_fixtureA"]
end;
__proto_b2Contact["GetFixtureB"] = function(self)
return self["m_fixtureB"]
end;
__proto_b2Contact["FlagForFiltering"] = function(self)
self["m_flags"] = __bor(self["m_flags"], __static_b2Contact["e_filterFlag"])
return self["m_flags"]
end;
__proto_b2Contact["Reset"] = function(self, __f696_fixtureA, __f696_fixtureB)
(function()
local __oak_cond = __truthy((function()
return __oak_eq(__f696_fixtureA, nil)
end)()
)
if __oak_eq(__oak_cond, true) then __f696_fixtureA = nil
return __f696_fixtureA
else return __noop()
end
end)()
;
(function()
local __oak_cond = __truthy((function()
return __oak_eq(__f696_fixtureB, nil)
end)()
)
if __oak_eq(__oak_cond, true) then __f696_fixtureB = nil
return __f696_fixtureB
else return __noop()
end
end)()
;
self["m_flags"] = __static_b2Contact["e_enabledFlag"];
return (function()
local __oak_cond = __truthy(__or(__not(__f696_fixtureA), __not(__f696_fixtureB)))
if __oak_eq(__oak_cond, true) then return (function()
self["m_fixtureA"] = nil;
self["m_fixtureB"] = nil;
return __noop()
end)()

else return (function()
(function()
local __oak_cond = __truthy(__or(__f696_fixtureA["IsSensor"](__f696_fixtureA), __f696_fixtureB["IsSensor"](__f696_fixtureB)))
if __oak_eq(__oak_cond, true) then self["m_flags"] = __bor(self["m_flags"], __static_b2Contact["e_sensorFlag"])
return self["m_flags"]
else return __noop()
end
end)()
;
local __f696_bodyA = __f696_fixtureA["GetBody"](__f696_fixtureA);
local __f696_bodyB = __f696_fixtureB["GetBody"](__f696_fixtureB);
(function()
local __oak_cond = __truthy(__or(__or(__or((function()
return (not __oak_eq(__f696_bodyA["GetType"](__f696_bodyA), __static_b2Body["b2_dynamicBody"]))
end)()
, __f696_bodyA["IsBullet"](__f696_bodyA)), (function()
return (not __oak_eq(__f696_bodyB["GetType"](__f696_bodyB), __static_b2Body["b2_dynamicBody"]))
end)()
), __f696_bodyB["IsBullet"](__f696_bodyB)))
if __oak_eq(__oak_cond, true) then self["m_flags"] = __bor(self["m_flags"], __static_b2Contact["e_continuousFlag"])
return self["m_flags"]
else return __noop()
end
end)()
;
self["m_fixtureA"] = __f696_fixtureA;
self["m_fixtureB"] = __f696_fixtureB;
self["m_manifold"]["m_pointCount"] = 0;
self["m_prev"] = nil;
self["m_next"] = nil;
self["m_nodeA"]["contact"] = nil;
self["m_nodeA"]["prev"] = nil;
self["m_nodeA"]["next"] = nil;
self["m_nodeA"]["other"] = nil;
self["m_nodeB"]["contact"] = nil;
self["m_nodeB"]["prev"] = nil;
self["m_nodeB"]["next"] = nil;
self["m_nodeB"]["other"] = nil
return self["m_nodeB"]["other"]
end)()

end
end)()

end;
__proto_b2Contact["Update"] = function(self, __f697_listener)
local __f697_tManifold = self["m_oldManifold"];
self["m_oldManifold"] = self["m_manifold"];
self["m_manifold"] = __f697_tManifold;
self["m_flags"] = __bor(self["m_flags"], __static_b2Contact["e_enabledFlag"]);
local __f697_touching = false;
local __f697_wasTouching = (function()
return __oak_eq(__band(self["m_flags"], __static_b2Contact["e_touchingFlag"]), __static_b2Contact["e_touchingFlag"])
end)()
;
local __f697_bodyA = self["m_fixtureA"]["m_body"];
local __f697_bodyB = self["m_fixtureB"]["m_body"];
local __f697_aabbOverlap = self["m_fixtureA"]["m_aabb"]["TestOverlap"](self["m_fixtureA"]["m_aabb"], self["m_fixtureB"]["m_aabb"]);
(function()
local __oak_cond = __truthy(__band(self["m_flags"], __static_b2Contact["e_sensorFlag"]))
if __oak_eq(__oak_cond, true) then return (function()
(function()
local __oak_cond = __truthy(__f697_aabbOverlap)
if __oak_eq(__oak_cond, true) then return (function()
local __f697_shapeA = self["m_fixtureA"]["GetShape"](self["m_fixtureA"]);
local __f697_shapeB = self["m_fixtureB"]["GetShape"](self["m_fixtureB"]);
local __f697_xfA = __f697_bodyA["GetTransform"](__f697_bodyA);
local __f697_xfB = __f697_bodyB["GetTransform"](__f697_bodyB);
__f697_touching = __static_b2Shape["TestOverlap"](__f697_shapeA, __f697_xfA, __f697_shapeB, __f697_xfB)
return __f697_touching
end)()

else return __noop()
end
end)()
;
self["m_manifold"]["m_pointCount"] = 0
return self["m_manifold"]["m_pointCount"]
end)()

else return (function()
(function()
local __oak_cond = __truthy(__or(__or(__or((function()
return (not __oak_eq(__f697_bodyA["GetType"](__f697_bodyA), __static_b2Body["b2_dynamicBody"]))
end)()
, __f697_bodyA["IsBullet"](__f697_bodyA)), (function()
return (not __oak_eq(__f697_bodyB["GetType"](__f697_bodyB), __static_b2Body["b2_dynamicBody"]))
end)()
), __f697_bodyB["IsBullet"](__f697_bodyB)))
if __oak_eq(__oak_cond, true) then self["m_flags"] = __bor(self["m_flags"], __static_b2Contact["e_continuousFlag"])
return self["m_flags"]
else self["m_flags"] = __band(self["m_flags"], __bnot(__static_b2Contact["e_continuousFlag"]))
return self["m_flags"]
end
end)()
;
(function()
local __oak_cond = __truthy(__f697_aabbOverlap)
if __oak_eq(__oak_cond, true) then return (function()
self["Evaluate"](self);
__f697_touching = (function()
return (self["m_manifold"]["m_pointCount"] > 0)
end)()
;
return (function()
local __f697_i = 0;
local function __loop286()
return (function()
local __oak_cond = (function()
return (__f697_i < self["m_manifold"]["m_pointCount"])
end)()

if __oak_eq(__oak_cond, true) then return (function()
local __r = (function()
return (function()
local __f697_mp2 = __oak_acc(self["m_manifold"]["m_points"], (function()
return __f697_i
end)()
);
__f697_mp2["m_normalImpulse"] = 0;
__f697_mp2["m_tangentImpulse"] = 0;
local __f697_id2 = __f697_mp2["m_id"];
return (function()
local __f697_j = 0;
local function __loop288()
return (function()
local __oak_cond = (function()
return (__f697_j < self["m_oldManifold"]["m_pointCount"])
end)()

if __oak_eq(__oak_cond, true) then return (function()
local __r = (function()
return (function()
local __f697_mp1 = __oak_acc(self["m_oldManifold"]["m_points"], (function()
return __f697_j
end)()
);
return (function()
local __oak_cond = __truthy((function()
return __oak_eq(__f697_mp1["m_id"]["key"], __f697_id2["key"])
end)()
)
if __oak_eq(__oak_cond, true) then return (function()
__f697_mp2["m_normalImpulse"] = __f697_mp1["m_normalImpulse"];
__f697_mp2["m_tangentImpulse"] = __f697_mp1["m_tangentImpulse"];
return 'break'
end)()

else return __noop()
end
end)()

end)()

end)()
;
return (function()
local __oak_cond = __r
if __oak_eq(__oak_cond, 'break') then return nil
else return (function()
(function()
__f697_j = __as_oak_string(__f697_j + 1)
return __f697_j
end)()
;
return __loop288()
end)()

end
end)()

end)()

else return nil
end
end)()

end;
return __loop288()
end)()

end)()

end)()
;
return (function()
local __oak_cond = __r
if __oak_eq(__oak_cond, 'break') then return nil
else return (function()
(function()
__f697_i = __as_oak_string(__f697_i + 1)
return __f697_i
end)()
;
return __loop286()
end)()

end
end)()

end)()

else return nil
end
end)()

end;
return __loop286()
end)()

end)()

else self["m_manifold"]["m_pointCount"] = 0
return self["m_manifold"]["m_pointCount"]
end
end)()
;
return (function()
local __oak_cond = __truthy((function()
return (not __oak_eq(__f697_touching, __f697_wasTouching))
end)()
)
if __oak_eq(__oak_cond, true) then return (function()
__f697_bodyA["SetAwake"](__f697_bodyA, true);
return __f697_bodyB["SetAwake"](__f697_bodyB, true)
end)()

else return __noop()
end
end)()

end)()

end
end)()
;
(function()
local __oak_cond = __truthy(__f697_touching)
if __oak_eq(__oak_cond, true) then self["m_flags"] = __bor(self["m_flags"], __static_b2Contact["e_touchingFlag"])
return self["m_flags"]
else self["m_flags"] = __band(self["m_flags"], __bnot(__static_b2Contact["e_touchingFlag"]))
return self["m_flags"]
end
end)()
;
(function()
local __oak_cond = __truthy(__and((function()
return __oak_eq(__f697_wasTouching, false)
end)()
, (function()
return __oak_eq(__f697_touching, true)
end)()
))
if __oak_eq(__oak_cond, true) then return __f697_listener["BeginContact"](__f697_listener, self)
else return __noop()
end
end)()
;
(function()
local __oak_cond = __truthy(__and((function()
return __oak_eq(__f697_wasTouching, true)
end)()
, (function()
return __oak_eq(__f697_touching, false)
end)()
))
if __oak_eq(__oak_cond, true) then return __f697_listener["EndContact"](__f697_listener, self)
else return __noop()
end
end)()
;
return (function()
local __oak_cond = __truthy((function()
return __oak_eq(__band(self["m_flags"], __static_b2Contact["e_sensorFlag"]), 0)
end)()
)
if __oak_eq(__oak_cond, true) then return __f697_listener["PreSolve"](__f697_listener, self, self["m_oldManifold"])
else return __noop()
end
end)()

end;
__proto_b2Contact["Evaluate"] = function(self)
return nil
end;
__proto_b2Contact["ComputeTOI"] = function(self, __f699_sweepA, __f699_sweepB)
__static_b2Contact["s_input"]["proxyA"]["Set"](__static_b2Contact["s_input"]["proxyA"], self["m_fixtureA"]["GetShape"](self["m_fixtureA"]));
__static_b2Contact["s_input"]["proxyB"]["Set"](__static_b2Contact["s_input"]["proxyB"], self["m_fixtureB"]["GetShape"](self["m_fixtureB"]));
__static_b2Contact["s_input"]["sweepA"] = __f699_sweepA;
__static_b2Contact["s_input"]["sweepB"] = __f699_sweepB;
__static_b2Contact["s_input"]["tolerance"] = __static_b2Settings["b2_linearSlop"];
return __static_b2TimeOfImpact["TimeOfImpact"](__static_b2Contact["s_input"])
end;
__static_b2Contact = {};
b2Contact = function()
local self = {["__type"]='b2Contact', ["__types"]={'b2Contact'}};
self["GetManifold"] = __proto_b2Contact["GetManifold"];
self["GetWorldManifold"] = __proto_b2Contact["GetWorldManifold"];
self["IsTouching"] = __proto_b2Contact["IsTouching"];
self["IsContinuous"] = __proto_b2Contact["IsContinuous"];
self["SetSensor"] = __proto_b2Contact["SetSensor"];
self["IsSensor"] = __proto_b2Contact["IsSensor"];
self["SetEnabled"] = __proto_b2Contact["SetEnabled"];
self["IsEnabled"] = __proto_b2Contact["IsEnabled"];
self["GetNext"] = __proto_b2Contact["GetNext"];
self["GetFixtureA"] = __proto_b2Contact["GetFixtureA"];
self["GetFixtureB"] = __proto_b2Contact["GetFixtureB"];
self["FlagForFiltering"] = __proto_b2Contact["FlagForFiltering"];
self["Reset"] = __proto_b2Contact["Reset"];
self["Update"] = __proto_b2Contact["Update"];
self["Evaluate"] = __proto_b2Contact["Evaluate"];
self["ComputeTOI"] = __proto_b2Contact["ComputeTOI"];
(function()
self["m_nodeA"] = b2ContactEdge();
self["m_nodeB"] = b2ContactEdge();
self["m_manifold"] = b2Manifold();
self["m_oldManifold"] = b2Manifold()
return self["m_oldManifold"]
end)()
;
return self
end;
Box2D["Dynamics"]["Contacts"]["b2Contact"] = b2Contact;
__proto_b2ContactConstraint = {};
__static_b2ContactConstraint = {};
b2ContactConstraint = function()
local self = {["__type"]='b2ContactConstraint', ["__types"]={'b2ContactConstraint'}};
(function()
self["localPlaneNormal"] = b2Vec2();
self["localPoint"] = b2Vec2();
self["normal"] = b2Vec2();
self["normalMass"] = b2Mat22();
self["K"] = b2Mat22();
self["points"] = __newArray(__static_b2Settings["b2_maxManifoldPoints"]);
return (function()
local __f701_i = 0;
local function __loop290()
return (function()
local __oak_cond = (function()
return (__f701_i < __static_b2Settings["b2_maxManifoldPoints"])
end)()

if __oak_eq(__oak_cond, true) then return (function()
local __r = (function()
self["points"][__add(__f701_i, 1)] = b2ContactConstraintPoint()
return __oak_acc(self["points"], (function()
return __add(__f701_i, 1)
end)()
)
end)()
;
return (function()
local __oak_cond = __r
if __oak_eq(__oak_cond, 'break') then return nil
else return (function()
(function()
local __tmp701_291 = __f701_i;
__f701_i = __as_oak_string(__f701_i + 1);
return __tmp701_291
end)()
;
return __loop290()
end)()

end
end)()

end)()

else return nil
end
end)()

end;
return __loop290()
end)()

end)()
;
return self
end;
Box2D["Dynamics"]["Contacts"]["b2ContactConstraint"] = b2ContactConstraint;
__proto_b2ContactFactory = {};
__proto_b2ContactFactory["AddType"] = function(self, __f702_createFcn, __f702_destroyFcn, __f702_type1, __f702_type2)
(function()
local __oak_cond = __truthy((function()
return __oak_eq(__f702_type1, nil)
end)()
)
if __oak_eq(__oak_cond, true) then __f702_type1 = 0
return __f702_type1
else return __noop()
end
end)()
;
(function()
local __oak_cond = __truthy((function()
return __oak_eq(__f702_type2, nil)
end)()
)
if __oak_eq(__oak_cond, true) then __f702_type2 = 0
return __f702_type2
else return __noop()
end
end)()
;
__oak_acc(__oak_acc(self["m_registers"], (function()
return __f702_type1
end)()
), (function()
return __f702_type2
end)()
)["createFcn"] = __f702_createFcn;
__oak_acc(__oak_acc(self["m_registers"], (function()
return __f702_type1
end)()
), (function()
return __f702_type2
end)()
)["destroyFcn"] = __f702_destroyFcn;
__oak_acc(__oak_acc(self["m_registers"], (function()
return __f702_type1
end)()
), (function()
return __f702_type2
end)()
)["primary"] = true;
return (function()
local __oak_cond = __truthy((function()
return (not __oak_eq(__f702_type1, __f702_type2))
end)()
)
if __oak_eq(__oak_cond, true) then return (function()
__oak_acc(__oak_acc(self["m_registers"], (function()
return __f702_type2
end)()
), (function()
return __f702_type1
end)()
)["createFcn"] = __f702_createFcn;
__oak_acc(__oak_acc(self["m_registers"], (function()
return __f702_type2
end)()
), (function()
return __f702_type1
end)()
)["destroyFcn"] = __f702_destroyFcn;
__oak_acc(__oak_acc(self["m_registers"], (function()
return __f702_type2
end)()
), (function()
return __f702_type1
end)()
)["primary"] = false
return __oak_acc(__oak_acc(self["m_registers"], (function()
return __f702_type2
end)()
), (function()
return __f702_type1
end)()
)["primary"]
end)()

else return __noop()
end
end)()

end;
__proto_b2ContactFactory["InitializeRegisters"] = function(self)
self["m_registers"] = __newArray(__static_b2Shape["e_shapeTypeCount"]);
(function()
local __f703_i = 0;
local function __loop292()
return (function()
local __oak_cond = (function()
return (__f703_i < __static_b2Shape["e_shapeTypeCount"])
end)()

if __oak_eq(__oak_cond, true) then return (function()
local __r = (function()
return (function()
self["m_registers"][__add(__f703_i, 1)] = __newArray(__static_b2Shape["e_shapeTypeCount"]);
return (function()
local __f703_j = 0;
local function __loop294()
return (function()
local __oak_cond = (function()
return (__f703_j < __static_b2Shape["e_shapeTypeCount"])
end)()

if __oak_eq(__oak_cond, true) then return (function()
local __r = (function()
__oak_acc(self["m_registers"], (function()
return __f703_i
end)()
)[__add(__f703_j, 1)] = b2ContactRegister()
return __oak_acc(__oak_acc(self["m_registers"], (function()
return __f703_i
end)()
), (function()
return __add(__f703_j, 1)
end)()
)
end)()
;
return (function()
local __oak_cond = __r
if __oak_eq(__oak_cond, 'break') then return nil
else return (function()
(function()
local __tmp703_295 = __f703_j;
__f703_j = __as_oak_string(__f703_j + 1);
return __tmp703_295
end)()
;
return __loop294()
end)()

end
end)()

end)()

else return nil
end
end)()

end;
return __loop294()
end)()

end)()

end)()
;
return (function()
local __oak_cond = __r
if __oak_eq(__oak_cond, 'break') then return nil
else return (function()
(function()
local __tmp703_293 = __f703_i;
__f703_i = __as_oak_string(__f703_i + 1);
return __tmp703_293
end)()
;
return __loop292()
end)()

end
end)()

end)()

else return nil
end
end)()

end;
return __loop292()
end)()
;
self["AddType"](self, __static_b2CircleContact["Create"], __static_b2CircleContact["Destroy"], __static_b2Shape["e_circleShape"], __static_b2Shape["e_circleShape"]);
self["AddType"](self, __static_b2PolyAndCircleContact["Create"], __static_b2PolyAndCircleContact["Destroy"], __static_b2Shape["e_polygonShape"], __static_b2Shape["e_circleShape"]);
self["AddType"](self, __static_b2PolygonContact["Create"], __static_b2PolygonContact["Destroy"], __static_b2Shape["e_polygonShape"], __static_b2Shape["e_polygonShape"]);
self["AddType"](self, __static_b2EdgeAndCircleContact["Create"], __static_b2EdgeAndCircleContact["Destroy"], __static_b2Shape["e_edgeShape"], __static_b2Shape["e_circleShape"]);
return self["AddType"](self, __static_b2PolyAndEdgeContact["Create"], __static_b2PolyAndEdgeContact["Destroy"], __static_b2Shape["e_polygonShape"], __static_b2Shape["e_edgeShape"])
end;
__proto_b2ContactFactory["Create"] = function(self, __f704_fixtureA, __f704_fixtureB)
local __f704_type1 = __parseInt(__f704_fixtureA["GetType"](__f704_fixtureA));
local __f704_type2 = __parseInt(__f704_fixtureB["GetType"](__f704_fixtureB));
local __f704_reg = __oak_acc(__oak_acc(self["m_registers"], (function()
return __f704_type1
end)()
), (function()
return __f704_type2
end)()
);
local __f704_c = __noop();
return (function()
local __oak_cond = __truthy(__f704_reg["pool"])
if __oak_eq(__oak_cond, true) then return (function()
__f704_c = __f704_reg["pool"];
__f704_reg["pool"] = __f704_c["m_next"];
(function()
local __tmp704_296 = __f704_reg["poolCount"];
__f704_reg["poolCount"] = __as_oak_string(__f704_reg["poolCount"] + (-1));
return __tmp704_296
end)()
;
__f704_c["Reset"](__f704_c, __f704_fixtureA, __f704_fixtureB);
return __f704_c
end)()

else return (function()
local __f704_createFcn = __f704_reg["createFcn"];
return (function()
local __oak_cond = __truthy((function()
return (not __oak_eq(__f704_createFcn, nil))
end)()
)
if __oak_eq(__oak_cond, true) then return (function()
local __oak_cond = __truthy(__f704_reg["primary"])
if __oak_eq(__oak_cond, true) then return (function()
__f704_c = __f704_createFcn(self["m_allocator"]);
__f704_c["Reset"](__f704_c, __f704_fixtureA, __f704_fixtureB);
return __f704_c
end)()

else return (function()
__f704_c = __f704_createFcn(self["m_allocator"]);
__f704_c["Reset"](__f704_c, __f704_fixtureB, __f704_fixtureA);
return __f704_c
end)()

end
end)()

else return nil
end
end)()

end)()

end
end)()

end;
__proto_b2ContactFactory["Destroy"] = function(self, __f705_contact)
(function()
local __oak_cond = __truthy((function()
return (__f705_contact["m_manifold"]["m_pointCount"] > 0)
end)()
)
if __oak_eq(__oak_cond, true) then return (function()
__f705_contact["m_fixtureA"]["m_body"]["SetAwake"](__f705_contact["m_fixtureA"]["m_body"], true);
return __f705_contact["m_fixtureB"]["m_body"]["SetAwake"](__f705_contact["m_fixtureB"]["m_body"], true)
end)()

else return __noop()
end
end)()
;
local __f705_type1 = __parseInt(__f705_contact["m_fixtureA"]["GetType"](__f705_contact["m_fixtureA"]));
local __f705_type2 = __parseInt(__f705_contact["m_fixtureB"]["GetType"](__f705_contact["m_fixtureB"]));
local __f705_reg = __oak_acc(__oak_acc(self["m_registers"], (function()
return __f705_type1
end)()
), (function()
return __f705_type2
end)()
);
(function()
local __oak_cond = __truthy(true)
if __oak_eq(__oak_cond, true) then return (function()
(function()
local __tmp705_297 = __f705_reg["poolCount"];
__f705_reg["poolCount"] = __as_oak_string(__f705_reg["poolCount"] + 1);
return __tmp705_297
end)()
;
__f705_contact["m_next"] = __f705_reg["pool"];
__f705_reg["pool"] = __f705_contact
return __f705_reg["pool"]
end)()

else return __noop()
end
end)()
;
local __f705_destroyFcn = __f705_reg["destroyFcn"];
return __f705_destroyFcn(__f705_contact, self["m_allocator"])
end;
__static_b2ContactFactory = {};
b2ContactFactory = function(__f706_allocator)
local self = {["__type"]='b2ContactFactory', ["__types"]={'b2ContactFactory'}};
self["AddType"] = __proto_b2ContactFactory["AddType"];
self["InitializeRegisters"] = __proto_b2ContactFactory["InitializeRegisters"];
self["Create"] = __proto_b2ContactFactory["Create"];
self["Destroy"] = __proto_b2ContactFactory["Destroy"];
(function()
self["m_allocator"] = __f706_allocator;
return self["InitializeRegisters"](self)
end)()
;
return self
end;
Box2D["Dynamics"]["Contacts"]["b2ContactFactory"] = b2ContactFactory;
__proto_b2ContactSolver = {};
__proto_b2ContactSolver["Initialize"] = function(self, __f707_step, __f707_contacts, __f707_contactCount, __f707_allocator)
(function()
local __oak_cond = __truthy((function()
return __oak_eq(__f707_contactCount, nil)
end)()
)
if __oak_eq(__oak_cond, true) then __f707_contactCount = 0
return __f707_contactCount
else return __noop()
end
end)()
;
local __f707_contact = __noop();
self["m_step"]["Set"](self["m_step"], __f707_step);
self["m_allocator"] = __f707_allocator;
local __f707_i = 0;
local __f707_tVec = __noop();
local __f707_tMat = __noop();
self["m_constraintCount"] = __f707_contactCount;
(function()
local function __loop298()
return (function()
local __oak_cond = (function()
return (len(self["m_constraints"]) < self["m_constraintCount"])
end)()

if __oak_eq(__oak_cond, true) then return (function()
local __r = (function()
self["m_constraints"][__add(len(self["m_constraints"]), 1)] = b2ContactConstraint()
return __oak_acc(self["m_constraints"], (function()
return __add(len(self["m_constraints"]), 1)
end)()
)
end)()
;
return (function()
local __oak_cond = __r
if __oak_eq(__oak_cond, 'break') then return nil
else return __loop298()
end
end)()

end)()

else return nil
end
end)()

end;
return __loop298()
end)()
;
return (function()
__f707_i = 0;
local function __loop299()
return (function()
local __oak_cond = (function()
return (__f707_i < __f707_contactCount)
end)()

if __oak_eq(__oak_cond, true) then return (function()
local __r = (function()
return (function()
__f707_contact = __oak_acc(__f707_contacts, (function()
return __f707_i
end)()
);
local __f707_fixtureA = __f707_contact["m_fixtureA"];
local __f707_fixtureB = __f707_contact["m_fixtureB"];
local __f707_shapeA = __f707_fixtureA["m_shape"];
local __f707_shapeB = __f707_fixtureB["m_shape"];
local __f707_radiusA = __f707_shapeA["m_radius"];
local __f707_radiusB = __f707_shapeB["m_radius"];
local __f707_bodyA = __f707_fixtureA["m_body"];
local __f707_bodyB = __f707_fixtureB["m_body"];
local __f707_manifold = __f707_contact["GetManifold"](__f707_contact);
local __f707_friction = __static_b2Settings["b2MixFriction"](__f707_fixtureA["GetFriction"](__f707_fixtureA), __f707_fixtureB["GetFriction"](__f707_fixtureB));
local __f707_restitution = __static_b2Settings["b2MixRestitution"](__f707_fixtureA["GetRestitution"](__f707_fixtureA), __f707_fixtureB["GetRestitution"](__f707_fixtureB));
local __f707_vAX = __f707_bodyA["m_linearVelocity"]["x"];
local __f707_vAY = __f707_bodyA["m_linearVelocity"]["y"];
local __f707_vBX = __f707_bodyB["m_linearVelocity"]["x"];
local __f707_vBY = __f707_bodyB["m_linearVelocity"]["y"];
local __f707_wA = __f707_bodyA["m_angularVelocity"];
local __f707_wB = __f707_bodyB["m_angularVelocity"];
__static_b2Settings["b2Assert"]((function()
return (__f707_manifold["m_pointCount"] > 0)
end)()
);
__static_b2ContactSolver["s_worldManifold"]["Initialize"](__static_b2ContactSolver["s_worldManifold"], __f707_manifold, __f707_bodyA["m_xf"], __f707_radiusA, __f707_bodyB["m_xf"], __f707_radiusB);
local __f707_normalX = __static_b2ContactSolver["s_worldManifold"]["m_normal"]["x"];
local __f707_normalY = __static_b2ContactSolver["s_worldManifold"]["m_normal"]["y"];
local __f707_cc = __oak_acc(self["m_constraints"], (function()
return __f707_i
end)()
);
__f707_cc["bodyA"] = __f707_bodyA;
__f707_cc["bodyB"] = __f707_bodyB;
__f707_cc["manifold"] = __f707_manifold;
__f707_cc["normal"]["x"] = __f707_normalX;
__f707_cc["normal"]["y"] = __f707_normalY;
__f707_cc["pointCount"] = __f707_manifold["m_pointCount"];
__f707_cc["friction"] = __f707_friction;
__f707_cc["restitution"] = __f707_restitution;
__f707_cc["localPlaneNormal"]["x"] = __f707_manifold["m_localPlaneNormal"]["x"];
__f707_cc["localPlaneNormal"]["y"] = __f707_manifold["m_localPlaneNormal"]["y"];
__f707_cc["localPoint"]["x"] = __f707_manifold["m_localPoint"]["x"];
__f707_cc["localPoint"]["y"] = __f707_manifold["m_localPoint"]["y"];
__f707_cc["radius"] = __add(__f707_radiusA, __f707_radiusB);
__f707_cc["type"] = __f707_manifold["m_type"];
(function()
local __f707_k = 0;
local function __loop301()
return (function()
local __oak_cond = (function()
return (__f707_k < __f707_cc["pointCount"])
end)()

if __oak_eq(__oak_cond, true) then return (function()
local __r = (function()
return (function()
local __f707_cp = __oak_acc(__f707_manifold["m_points"], (function()
return __f707_k
end)()
);
local __f707_ccp = __oak_acc(__f707_cc["points"], (function()
return __f707_k
end)()
);
__f707_ccp["normalImpulse"] = __f707_cp["m_normalImpulse"];
__f707_ccp["tangentImpulse"] = __f707_cp["m_tangentImpulse"];
__f707_ccp["localPoint"]["SetV"](__f707_ccp["localPoint"], __f707_cp["m_localPoint"]);
(function()
__f707_ccp["rA"]["x"] = (function()
return (__oak_acc(__static_b2ContactSolver["s_worldManifold"]["m_points"], (function()
return __f707_k
end)()
)["x"] - __f707_bodyA["m_sweep"]["c"]["x"])
end)()
;
local __f707_rAX = __f707_ccp["rA"]["x"]
return __f707_rAX
end)()
;
(function()
__f707_ccp["rA"]["y"] = (function()
return (__oak_acc(__static_b2ContactSolver["s_worldManifold"]["m_points"], (function()
return __f707_k
end)()
)["y"] - __f707_bodyA["m_sweep"]["c"]["y"])
end)()
;
local __f707_rAY = __f707_ccp["rA"]["y"]
return __f707_rAY
end)()
;
(function()
__f707_ccp["rB"]["x"] = (function()
return (__oak_acc(__static_b2ContactSolver["s_worldManifold"]["m_points"], (function()
return __f707_k
end)()
)["x"] - __f707_bodyB["m_sweep"]["c"]["x"])
end)()
;
local __f707_rBX = __f707_ccp["rB"]["x"]
return __f707_rBX
end)()
;
(function()
__f707_ccp["rB"]["y"] = (function()
return (__oak_acc(__static_b2ContactSolver["s_worldManifold"]["m_points"], (function()
return __f707_k
end)()
)["y"] - __f707_bodyB["m_sweep"]["c"]["y"])
end)()
;
local __f707_rBY = __f707_ccp["rB"]["y"]
return __f707_rBY
end)()
;
local __f707_rnA = (function()
return ((function()
return (__f707_rAX * __f707_normalY)
end)()
 - (function()
return (__f707_rAY * __f707_normalX)
end)()
)
end)()
;
local __f707_rnB = (function()
return ((function()
return (__f707_rBX * __f707_normalY)
end)()
 - (function()
return (__f707_rBY * __f707_normalX)
end)()
)
end)()
;
__f707_rnA = (function()
return (__f707_rnA * __f707_rnA)
end)()
;
__f707_rnB = (function()
return (__f707_rnB * __f707_rnB)
end)()
;
local __f707_kNormal = __add(__add(__add(__f707_bodyA["m_invMass"], __f707_bodyB["m_invMass"]), (function()
return (__f707_bodyA["m_invI"] * __f707_rnA)
end)()
), (function()
return (__f707_bodyB["m_invI"] * __f707_rnB)
end)()
);
__f707_ccp["normalMass"] = (function()
return (1 / __f707_kNormal)
end)()
;
local __f707_kEqualized = __add((function()
return (__f707_bodyA["m_mass"] * __f707_bodyA["m_invMass"])
end)()
, (function()
return (__f707_bodyB["m_mass"] * __f707_bodyB["m_invMass"])
end)()
);
__f707_kEqualized = __add(__f707_kEqualized, __add((function()
return ((function()
return (__f707_bodyA["m_mass"] * __f707_bodyA["m_invI"])
end)()
 * __f707_rnA)
end)()
, (function()
return ((function()
return (__f707_bodyB["m_mass"] * __f707_bodyB["m_invI"])
end)()
 * __f707_rnB)
end)()
));
__f707_ccp["equalizedMass"] = (function()
return (1 / __f707_kEqualized)
end)()
;
local __f707_tangentX = __f707_normalY;
local __f707_tangentY = (function()
return (-__f707_normalX)
end)()
;
local __f707_rtA = (function()
return ((function()
return (__f707_rAX * __f707_tangentY)
end)()
 - (function()
return (__f707_rAY * __f707_tangentX)
end)()
)
end)()
;
local __f707_rtB = (function()
return ((function()
return (__f707_rBX * __f707_tangentY)
end)()
 - (function()
return (__f707_rBY * __f707_tangentX)
end)()
)
end)()
;
__f707_rtA = (function()
return (__f707_rtA * __f707_rtA)
end)()
;
__f707_rtB = (function()
return (__f707_rtB * __f707_rtB)
end)()
;
local __f707_kTangent = __add(__add(__add(__f707_bodyA["m_invMass"], __f707_bodyB["m_invMass"]), (function()
return (__f707_bodyA["m_invI"] * __f707_rtA)
end)()
), (function()
return (__f707_bodyB["m_invI"] * __f707_rtB)
end)()
);
__f707_ccp["tangentMass"] = (function()
return (1 / __f707_kTangent)
end)()
;
__f707_ccp["velocityBias"] = 0;
local __f707_tX = (function()
return ((function()
return (__add(__f707_vBX, (function()
return ((function()
return (-__f707_wB)
end)()
 * __f707_rBY)
end)()
) - __f707_vAX)
end)()
 - (function()
return ((function()
return (-__f707_wA)
end)()
 * __f707_rAY)
end)()
)
end)()
;
local __f707_tY = (function()
return ((function()
return (__add(__f707_vBY, (function()
return (__f707_wB * __f707_rBX)
end)()
) - __f707_vAY)
end)()
 - (function()
return (__f707_wA * __f707_rAX)
end)()
)
end)()
;
local __f707_vRel = __add((function()
return (__f707_cc["normal"]["x"] * __f707_tX)
end)()
, (function()
return (__f707_cc["normal"]["y"] * __f707_tY)
end)()
);
return (function()
local __oak_cond = __truthy((function()
return (__f707_vRel < (function()
return (-__static_b2Settings["b2_velocityThreshold"])
end)()
)
end)()
)
if __oak_eq(__oak_cond, true) then __f707_ccp["velocityBias"] = __add(__f707_ccp["velocityBias"], (function()
return ((function()
return (-__f707_cc["restitution"])
end)()
 * __f707_vRel)
end)()
)
return __f707_ccp["velocityBias"]
else return __noop()
end
end)()

end)()

end)()
;
return (function()
local __oak_cond = __r
if __oak_eq(__oak_cond, 'break') then return nil
else return (function()
(function()
__f707_k = __as_oak_string(__f707_k + 1)
return __f707_k
end)()
;
return __loop301()
end)()

end
end)()

end)()

else return nil
end
end)()

end;
return __loop301()
end)()
;
return (function()
local __oak_cond = __truthy((function()
return __oak_eq(__f707_cc["pointCount"], 2)
end)()
)
if __oak_eq(__oak_cond, true) then return (function()
local __f707_ccp1 = __oak_acc(__f707_cc["points"], (function()
return 0
end)()
);
local __f707_ccp2 = __oak_acc(__f707_cc["points"], (function()
return 1
end)()
);
local __f707_invMassA = __f707_bodyA["m_invMass"];
local __f707_invIA = __f707_bodyA["m_invI"];
local __f707_invMassB = __f707_bodyB["m_invMass"];
local __f707_invIB = __f707_bodyB["m_invI"];
local __f707_rn1A = (function()
return ((function()
return (__f707_ccp1["rA"]["x"] * __f707_normalY)
end)()
 - (function()
return (__f707_ccp1["rA"]["y"] * __f707_normalX)
end)()
)
end)()
;
local __f707_rn1B = (function()
return ((function()
return (__f707_ccp1["rB"]["x"] * __f707_normalY)
end)()
 - (function()
return (__f707_ccp1["rB"]["y"] * __f707_normalX)
end)()
)
end)()
;
local __f707_rn2A = (function()
return ((function()
return (__f707_ccp2["rA"]["x"] * __f707_normalY)
end)()
 - (function()
return (__f707_ccp2["rA"]["y"] * __f707_normalX)
end)()
)
end)()
;
local __f707_rn2B = (function()
return ((function()
return (__f707_ccp2["rB"]["x"] * __f707_normalY)
end)()
 - (function()
return (__f707_ccp2["rB"]["y"] * __f707_normalX)
end)()
)
end)()
;
local __f707_k11 = __add(__add(__add(__f707_invMassA, __f707_invMassB), (function()
return ((function()
return (__f707_invIA * __f707_rn1A)
end)()
 * __f707_rn1A)
end)()
), (function()
return ((function()
return (__f707_invIB * __f707_rn1B)
end)()
 * __f707_rn1B)
end)()
);
local __f707_k22 = __add(__add(__add(__f707_invMassA, __f707_invMassB), (function()
return ((function()
return (__f707_invIA * __f707_rn2A)
end)()
 * __f707_rn2A)
end)()
), (function()
return ((function()
return (__f707_invIB * __f707_rn2B)
end)()
 * __f707_rn2B)
end)()
);
local __f707_k12 = __add(__add(__add(__f707_invMassA, __f707_invMassB), (function()
return ((function()
return (__f707_invIA * __f707_rn1A)
end)()
 * __f707_rn2A)
end)()
), (function()
return ((function()
return (__f707_invIB * __f707_rn1B)
end)()
 * __f707_rn2B)
end)()
);
local __f707_k_maxConditionNumber = 100;
return (function()
local __oak_cond = __truthy((function()
return ((function()
return (__f707_k11 * __f707_k11)
end)()
 < (function()
return (__f707_k_maxConditionNumber * (function()
return ((function()
return (__f707_k11 * __f707_k22)
end)()
 - (function()
return (__f707_k12 * __f707_k12)
end)()
)
end)()
)
end)()
)
end)()
)
if __oak_eq(__oak_cond, true) then return (function()
__f707_cc["K"]["col1"]["Set"](__f707_cc["K"]["col1"], __f707_k11, __f707_k12);
__f707_cc["K"]["col2"]["Set"](__f707_cc["K"]["col2"], __f707_k12, __f707_k22);
return __f707_cc["K"]["GetInverse"](__f707_cc["K"], __f707_cc["normalMass"])
end)()

else __f707_cc["pointCount"] = 1
return __f707_cc["pointCount"]
end
end)()

end)()

else return __noop()
end
end)()

end)()

end)()
;
return (function()
local __oak_cond = __r
if __oak_eq(__oak_cond, 'break') then return nil
else return (function()
(function()
__f707_i = __as_oak_string(__f707_i + 1)
return __f707_i
end)()
;
return __loop299()
end)()

end
end)()

end)()

else return nil
end
end)()

end;
return __loop299()
end)()

end;
__proto_b2ContactSolver["InitVelocityConstraints"] = function(self, __f708_step)
local __f708_tVec = __noop();
local __f708_tVec2 = __noop();
local __f708_tMat = __noop();
return (function()
local __f708_i = 0;
local function __loop303()
return (function()
local __oak_cond = (function()
return (__f708_i < self["m_constraintCount"])
end)()

if __oak_eq(__oak_cond, true) then return (function()
local __r = (function()
return (function()
local __f708_c = __oak_acc(self["m_constraints"], (function()
return __f708_i
end)()
);
local __f708_bodyA = __f708_c["bodyA"];
local __f708_bodyB = __f708_c["bodyB"];
local __f708_invMassA = __f708_bodyA["m_invMass"];
local __f708_invIA = __f708_bodyA["m_invI"];
local __f708_invMassB = __f708_bodyB["m_invMass"];
local __f708_invIB = __f708_bodyB["m_invI"];
local __f708_normalX = __f708_c["normal"]["x"];
local __f708_normalY = __f708_c["normal"]["y"];
local __f708_tangentX = __f708_normalY;
local __f708_tangentY = (function()
return (-__f708_normalX)
end)()
;
local __f708_tX = 0;
local __f708_j = 0;
local __f708_tCount = 0;
return (function()
local __oak_cond = __truthy(__f708_step["warmStarting"])
if __oak_eq(__oak_cond, true) then return (function()
__f708_tCount = __f708_c["pointCount"];
return (function()
__f708_j = 0;
local function __loop305()
return (function()
local __oak_cond = (function()
return (__f708_j < __f708_tCount)
end)()

if __oak_eq(__oak_cond, true) then return (function()
local __r = (function()
return (function()
local __f708_ccp = __oak_acc(__f708_c["points"], (function()
return __f708_j
end)()
);
__f708_ccp["normalImpulse"] = (function()
return (__f708_ccp["normalImpulse"] * __f708_step["dtRatio"])
end)()
;
__f708_ccp["tangentImpulse"] = (function()
return (__f708_ccp["tangentImpulse"] * __f708_step["dtRatio"])
end)()
;
local __f708_PX = __add((function()
return (__f708_ccp["normalImpulse"] * __f708_normalX)
end)()
, (function()
return (__f708_ccp["tangentImpulse"] * __f708_tangentX)
end)()
);
local __f708_PY = __add((function()
return (__f708_ccp["normalImpulse"] * __f708_normalY)
end)()
, (function()
return (__f708_ccp["tangentImpulse"] * __f708_tangentY)
end)()
);
__f708_bodyA["m_angularVelocity"] = (function()
return (__f708_bodyA["m_angularVelocity"] - (function()
return (__f708_invIA * (function()
return ((function()
return (__f708_ccp["rA"]["x"] * __f708_PY)
end)()
 - (function()
return (__f708_ccp["rA"]["y"] * __f708_PX)
end)()
)
end)()
)
end)()
)
end)()
;
__f708_bodyA["m_linearVelocity"]["x"] = (function()
return (__f708_bodyA["m_linearVelocity"]["x"] - (function()
return (__f708_invMassA * __f708_PX)
end)()
)
end)()
;
__f708_bodyA["m_linearVelocity"]["y"] = (function()
return (__f708_bodyA["m_linearVelocity"]["y"] - (function()
return (__f708_invMassA * __f708_PY)
end)()
)
end)()
;
__f708_bodyB["m_angularVelocity"] = __add(__f708_bodyB["m_angularVelocity"], (function()
return (__f708_invIB * (function()
return ((function()
return (__f708_ccp["rB"]["x"] * __f708_PY)
end)()
 - (function()
return (__f708_ccp["rB"]["y"] * __f708_PX)
end)()
)
end)()
)
end)()
);
__f708_bodyB["m_linearVelocity"]["x"] = __add(__f708_bodyB["m_linearVelocity"]["x"], (function()
return (__f708_invMassB * __f708_PX)
end)()
);
__f708_bodyB["m_linearVelocity"]["y"] = __add(__f708_bodyB["m_linearVelocity"]["y"], (function()
return (__f708_invMassB * __f708_PY)
end)()
)
return __f708_bodyB["m_linearVelocity"]["y"]
end)()

end)()
;
return (function()
local __oak_cond = __r
if __oak_eq(__oak_cond, 'break') then return nil
else return (function()
(function()
__f708_j = __as_oak_string(__f708_j + 1)
return __f708_j
end)()
;
return __loop305()
end)()

end
end)()

end)()

else return nil
end
end)()

end;
return __loop305()
end)()

end)()

else return (function()
__f708_tCount = __f708_c["pointCount"];
return (function()
__f708_j = 0;
local function __loop307()
return (function()
local __oak_cond = (function()
return (__f708_j < __f708_tCount)
end)()

if __oak_eq(__oak_cond, true) then return (function()
local __r = (function()
return (function()
local __f708_ccp2 = __oak_acc(__f708_c["points"], (function()
return __f708_j
end)()
);
__f708_ccp2["normalImpulse"] = 0;
__f708_ccp2["tangentImpulse"] = 0
return __f708_ccp2["tangentImpulse"]
end)()

end)()
;
return (function()
local __oak_cond = __r
if __oak_eq(__oak_cond, 'break') then return nil
else return (function()
(function()
__f708_j = __as_oak_string(__f708_j + 1)
return __f708_j
end)()
;
return __loop307()
end)()

end
end)()

end)()

else return nil
end
end)()

end;
return __loop307()
end)()

end)()

end
end)()

end)()

end)()
;
return (function()
local __oak_cond = __r
if __oak_eq(__oak_cond, 'break') then return nil
else return (function()
(function()
__f708_i = __as_oak_string(__f708_i + 1)
return __f708_i
end)()
;
return __loop303()
end)()

end
end)()

end)()

else return nil
end
end)()

end;
return __loop303()
end)()

end;
__proto_b2ContactSolver["SolveVelocityConstraints"] = function(self)
local __f709_j = 0;
local __f709_ccp = __noop();
local __f709_rAX = 0;
local __f709_rAY = 0;
local __f709_rBX = 0;
local __f709_rBY = 0;
local __f709_dvX = 0;
local __f709_dvY = 0;
local __f709_vn = 0;
local __f709_vt = 0;
local __f709_lambda = 0;
local __f709_maxFriction = 0;
local __f709_newImpulse = 0;
local __f709_PX = 0;
local __f709_PY = 0;
local __f709_dX = 0;
local __f709_dY = 0;
local __f709_P1X = 0;
local __f709_P1Y = 0;
local __f709_P2X = 0;
local __f709_P2Y = 0;
local __f709_tMat = __noop();
local __f709_tVec = __noop();
return (function()
local __f709_i = 0;
local function __loop309()
return (function()
local __oak_cond = (function()
return (__f709_i < self["m_constraintCount"])
end)()

if __oak_eq(__oak_cond, true) then return (function()
local __r = (function()
return (function()
local __f709_c = __oak_acc(self["m_constraints"], (function()
return __f709_i
end)()
);
local __f709_bodyA = __f709_c["bodyA"];
local __f709_bodyB = __f709_c["bodyB"];
local __f709_wA = __f709_bodyA["m_angularVelocity"];
local __f709_wB = __f709_bodyB["m_angularVelocity"];
local __f709_vA = __f709_bodyA["m_linearVelocity"];
local __f709_vB = __f709_bodyB["m_linearVelocity"];
local __f709_invMassA = __f709_bodyA["m_invMass"];
local __f709_invIA = __f709_bodyA["m_invI"];
local __f709_invMassB = __f709_bodyB["m_invMass"];
local __f709_invIB = __f709_bodyB["m_invI"];
local __f709_normalX = __f709_c["normal"]["x"];
local __f709_normalY = __f709_c["normal"]["y"];
local __f709_tangentX = __f709_normalY;
local __f709_tangentY = (function()
return (-__f709_normalX)
end)()
;
local __f709_friction = __f709_c["friction"];
local __f709_tX = 0;
(function()
__f709_j = 0;
local function __loop311()
return (function()
local __oak_cond = (function()
return (__f709_j < __f709_c["pointCount"])
end)()

if __oak_eq(__oak_cond, true) then return (function()
local __r = (function()
return (function()
__f709_ccp = __oak_acc(__f709_c["points"], (function()
return __f709_j
end)()
);
__f709_dvX = __add((function()
return ((function()
return (__f709_vB["x"] - (function()
return (__f709_wB * __f709_ccp["rB"]["y"])
end)()
)
end)()
 - __f709_vA["x"])
end)()
, (function()
return (__f709_wA * __f709_ccp["rA"]["y"])
end)()
);
__f709_dvY = (function()
return ((function()
return (__add(__f709_vB["y"], (function()
return (__f709_wB * __f709_ccp["rB"]["x"])
end)()
) - __f709_vA["y"])
end)()
 - (function()
return (__f709_wA * __f709_ccp["rA"]["x"])
end)()
)
end)()
;
__f709_vt = __add((function()
return (__f709_dvX * __f709_tangentX)
end)()
, (function()
return (__f709_dvY * __f709_tangentY)
end)()
);
__f709_lambda = (function()
return (__f709_ccp["tangentMass"] * (function()
return (-__f709_vt)
end)()
)
end)()
;
__f709_maxFriction = (function()
return (__f709_friction * __f709_ccp["normalImpulse"])
end)()
;
__f709_newImpulse = __static_b2Math["Clamp"](__add(__f709_ccp["tangentImpulse"], __f709_lambda), (function()
return (-__f709_maxFriction)
end)()
, __f709_maxFriction);
__f709_lambda = (function()
return (__f709_newImpulse - __f709_ccp["tangentImpulse"])
end)()
;
__f709_PX = (function()
return (__f709_lambda * __f709_tangentX)
end)()
;
__f709_PY = (function()
return (__f709_lambda * __f709_tangentY)
end)()
;
__f709_vA["x"] = (function()
return (__f709_vA["x"] - (function()
return (__f709_invMassA * __f709_PX)
end)()
)
end)()
;
__f709_vA["y"] = (function()
return (__f709_vA["y"] - (function()
return (__f709_invMassA * __f709_PY)
end)()
)
end)()
;
__f709_wA = (function()
return (__f709_wA - (function()
return (__f709_invIA * (function()
return ((function()
return (__f709_ccp["rA"]["x"] * __f709_PY)
end)()
 - (function()
return (__f709_ccp["rA"]["y"] * __f709_PX)
end)()
)
end)()
)
end)()
)
end)()
;
__f709_vB["x"] = __add(__f709_vB["x"], (function()
return (__f709_invMassB * __f709_PX)
end)()
);
__f709_vB["y"] = __add(__f709_vB["y"], (function()
return (__f709_invMassB * __f709_PY)
end)()
);
__f709_wB = __add(__f709_wB, (function()
return (__f709_invIB * (function()
return ((function()
return (__f709_ccp["rB"]["x"] * __f709_PY)
end)()
 - (function()
return (__f709_ccp["rB"]["y"] * __f709_PX)
end)()
)
end)()
)
end)()
);
__f709_ccp["tangentImpulse"] = __f709_newImpulse
return __f709_ccp["tangentImpulse"]
end)()

end)()
;
return (function()
local __oak_cond = __r
if __oak_eq(__oak_cond, 'break') then return nil
else return (function()
(function()
local __tmp709_312 = __f709_j;
__f709_j = __as_oak_string(__f709_j + 1);
return __tmp709_312
end)()
;
return __loop311()
end)()

end
end)()

end)()

else return nil
end
end)()

end;
return __loop311()
end)()
;
local __f709_tCount = __parseInt(__f709_c["pointCount"]);
(function()
local __oak_cond = __truthy((function()
return __oak_eq(__f709_c["pointCount"], 1)
end)()
)
if __oak_eq(__oak_cond, true) then return (function()
__f709_ccp = __oak_acc(__f709_c["points"], (function()
return 0
end)()
);
__f709_dvX = (function()
return ((function()
return (__add(__f709_vB["x"], (function()
return ((function()
return (-__f709_wB)
end)()
 * __f709_ccp["rB"]["y"])
end)()
) - __f709_vA["x"])
end)()
 - (function()
return ((function()
return (-__f709_wA)
end)()
 * __f709_ccp["rA"]["y"])
end)()
)
end)()
;
__f709_dvY = (function()
return ((function()
return (__add(__f709_vB["y"], (function()
return (__f709_wB * __f709_ccp["rB"]["x"])
end)()
) - __f709_vA["y"])
end)()
 - (function()
return (__f709_wA * __f709_ccp["rA"]["x"])
end)()
)
end)()
;
__f709_vn = __add((function()
return (__f709_dvX * __f709_normalX)
end)()
, (function()
return (__f709_dvY * __f709_normalY)
end)()
);
__f709_lambda = (function()
return ((function()
return (-__f709_ccp["normalMass"])
end)()
 * (function()
return (__f709_vn - __f709_ccp["velocityBias"])
end)()
)
end)()
;
__f709_newImpulse = __add(__f709_ccp["normalImpulse"], __f709_lambda);
__f709_newImpulse = (function()
local __oak_cond = __truthy((function()
return (__f709_newImpulse > 0)
end)()
)
if __oak_eq(__oak_cond, true) then return __f709_newImpulse
else return 0
end
end)()
;
__f709_lambda = (function()
return (__f709_newImpulse - __f709_ccp["normalImpulse"])
end)()
;
__f709_PX = (function()
return (__f709_lambda * __f709_normalX)
end)()
;
__f709_PY = (function()
return (__f709_lambda * __f709_normalY)
end)()
;
__f709_vA["x"] = (function()
return (__f709_vA["x"] - (function()
return (__f709_invMassA * __f709_PX)
end)()
)
end)()
;
__f709_vA["y"] = (function()
return (__f709_vA["y"] - (function()
return (__f709_invMassA * __f709_PY)
end)()
)
end)()
;
__f709_wA = (function()
return (__f709_wA - (function()
return (__f709_invIA * (function()
return ((function()
return (__f709_ccp["rA"]["x"] * __f709_PY)
end)()
 - (function()
return (__f709_ccp["rA"]["y"] * __f709_PX)
end)()
)
end)()
)
end)()
)
end)()
;
__f709_vB["x"] = __add(__f709_vB["x"], (function()
return (__f709_invMassB * __f709_PX)
end)()
);
__f709_vB["y"] = __add(__f709_vB["y"], (function()
return (__f709_invMassB * __f709_PY)
end)()
);
__f709_wB = __add(__f709_wB, (function()
return (__f709_invIB * (function()
return ((function()
return (__f709_ccp["rB"]["x"] * __f709_PY)
end)()
 - (function()
return (__f709_ccp["rB"]["y"] * __f709_PX)
end)()
)
end)()
)
end)()
);
__f709_ccp["normalImpulse"] = __f709_newImpulse
return __f709_ccp["normalImpulse"]
end)()

else return (function()
local __f709_cp1 = __oak_acc(__f709_c["points"], (function()
return 0
end)()
);
local __f709_cp2 = __oak_acc(__f709_c["points"], (function()
return 1
end)()
);
local __f709_aX = __f709_cp1["normalImpulse"];
local __f709_aY = __f709_cp2["normalImpulse"];
local __f709_dv1X = __add((function()
return ((function()
return (__f709_vB["x"] - (function()
return (__f709_wB * __f709_cp1["rB"]["y"])
end)()
)
end)()
 - __f709_vA["x"])
end)()
, (function()
return (__f709_wA * __f709_cp1["rA"]["y"])
end)()
);
local __f709_dv1Y = (function()
return ((function()
return (__add(__f709_vB["y"], (function()
return (__f709_wB * __f709_cp1["rB"]["x"])
end)()
) - __f709_vA["y"])
end)()
 - (function()
return (__f709_wA * __f709_cp1["rA"]["x"])
end)()
)
end)()
;
local __f709_dv2X = __add((function()
return ((function()
return (__f709_vB["x"] - (function()
return (__f709_wB * __f709_cp2["rB"]["y"])
end)()
)
end)()
 - __f709_vA["x"])
end)()
, (function()
return (__f709_wA * __f709_cp2["rA"]["y"])
end)()
);
local __f709_dv2Y = (function()
return ((function()
return (__add(__f709_vB["y"], (function()
return (__f709_wB * __f709_cp2["rB"]["x"])
end)()
) - __f709_vA["y"])
end)()
 - (function()
return (__f709_wA * __f709_cp2["rA"]["x"])
end)()
)
end)()
;
local __f709_vn1 = __add((function()
return (__f709_dv1X * __f709_normalX)
end)()
, (function()
return (__f709_dv1Y * __f709_normalY)
end)()
);
local __f709_vn2 = __add((function()
return (__f709_dv2X * __f709_normalX)
end)()
, (function()
return (__f709_dv2Y * __f709_normalY)
end)()
);
local __f709_bX = (function()
return (__f709_vn1 - __f709_cp1["velocityBias"])
end)()
;
local __f709_bY = (function()
return (__f709_vn2 - __f709_cp2["velocityBias"])
end)()
;
__f709_tMat = __f709_c["K"];
__f709_bX = (function()
return (__f709_bX - __add((function()
return (__f709_tMat["col1"]["x"] * __f709_aX)
end)()
, (function()
return (__f709_tMat["col2"]["x"] * __f709_aY)
end)()
))
end)()
;
__f709_bY = (function()
return (__f709_bY - __add((function()
return (__f709_tMat["col1"]["y"] * __f709_aX)
end)()
, (function()
return (__f709_tMat["col2"]["y"] * __f709_aY)
end)()
))
end)()
;
local __f709_k_errorTol = 0.001;
return (function()
__noop();
local function __loop313()
return (function()
local __oak_cond = true
if __oak_eq(__oak_cond, true) then return (function()
local __r = (function()
return (function()
__f709_tMat = __f709_c["normalMass"];
local __f709_xX = (function()
return (-__add((function()
return (__f709_tMat["col1"]["x"] * __f709_bX)
end)()
, (function()
return (__f709_tMat["col2"]["x"] * __f709_bY)
end)()
))
end)()
;
local __f709_xY = (function()
return (-__add((function()
return (__f709_tMat["col1"]["y"] * __f709_bX)
end)()
, (function()
return (__f709_tMat["col2"]["y"] * __f709_bY)
end)()
))
end)()
;
(function()
local __oak_cond = __truthy(__and((function()
return (__f709_xX >= 0)
end)()
, (function()
return (__f709_xY >= 0)
end)()
))
if __oak_eq(__oak_cond, true) then return (function()
__f709_dX = (function()
return (__f709_xX - __f709_aX)
end)()
;
__f709_dY = (function()
return (__f709_xY - __f709_aY)
end)()
;
__f709_P1X = (function()
return (__f709_dX * __f709_normalX)
end)()
;
__f709_P1Y = (function()
return (__f709_dX * __f709_normalY)
end)()
;
__f709_P2X = (function()
return (__f709_dY * __f709_normalX)
end)()
;
__f709_P2Y = (function()
return (__f709_dY * __f709_normalY)
end)()
;
__f709_vA["x"] = (function()
return (__f709_vA["x"] - (function()
return (__f709_invMassA * __add(__f709_P1X, __f709_P2X))
end)()
)
end)()
;
__f709_vA["y"] = (function()
return (__f709_vA["y"] - (function()
return (__f709_invMassA * __add(__f709_P1Y, __f709_P2Y))
end)()
)
end)()
;
__f709_wA = (function()
return (__f709_wA - (function()
return (__f709_invIA * (function()
return (__add((function()
return ((function()
return (__f709_cp1["rA"]["x"] * __f709_P1Y)
end)()
 - (function()
return (__f709_cp1["rA"]["y"] * __f709_P1X)
end)()
)
end)()
, (function()
return (__f709_cp2["rA"]["x"] * __f709_P2Y)
end)()
) - (function()
return (__f709_cp2["rA"]["y"] * __f709_P2X)
end)()
)
end)()
)
end)()
)
end)()
;
__f709_vB["x"] = __add(__f709_vB["x"], (function()
return (__f709_invMassB * __add(__f709_P1X, __f709_P2X))
end)()
);
__f709_vB["y"] = __add(__f709_vB["y"], (function()
return (__f709_invMassB * __add(__f709_P1Y, __f709_P2Y))
end)()
);
__f709_wB = __add(__f709_wB, (function()
return (__f709_invIB * (function()
return (__add((function()
return ((function()
return (__f709_cp1["rB"]["x"] * __f709_P1Y)
end)()
 - (function()
return (__f709_cp1["rB"]["y"] * __f709_P1X)
end)()
)
end)()
, (function()
return (__f709_cp2["rB"]["x"] * __f709_P2Y)
end)()
) - (function()
return (__f709_cp2["rB"]["y"] * __f709_P2X)
end)()
)
end)()
)
end)()
);
__f709_cp1["normalImpulse"] = __f709_xX;
__f709_cp2["normalImpulse"] = __f709_xY;
return 'break'
end)()

else return __noop()
end
end)()
;
__f709_xX = (function()
return ((function()
return (-__f709_cp1["normalMass"])
end)()
 * __f709_bX)
end)()
;
__f709_xY = 0;
__f709_vn1 = 0;
__f709_vn2 = __add((function()
return (__f709_c["K"]["col1"]["y"] * __f709_xX)
end)()
, __f709_bY);
(function()
local __oak_cond = __truthy(__and((function()
return (__f709_xX >= 0)
end)()
, (function()
return (__f709_vn2 >= 0)
end)()
))
if __oak_eq(__oak_cond, true) then return (function()
__f709_dX = (function()
return (__f709_xX - __f709_aX)
end)()
;
__f709_dY = (function()
return (__f709_xY - __f709_aY)
end)()
;
__f709_P1X = (function()
return (__f709_dX * __f709_normalX)
end)()
;
__f709_P1Y = (function()
return (__f709_dX * __f709_normalY)
end)()
;
__f709_P2X = (function()
return (__f709_dY * __f709_normalX)
end)()
;
__f709_P2Y = (function()
return (__f709_dY * __f709_normalY)
end)()
;
__f709_vA["x"] = (function()
return (__f709_vA["x"] - (function()
return (__f709_invMassA * __add(__f709_P1X, __f709_P2X))
end)()
)
end)()
;
__f709_vA["y"] = (function()
return (__f709_vA["y"] - (function()
return (__f709_invMassA * __add(__f709_P1Y, __f709_P2Y))
end)()
)
end)()
;
__f709_wA = (function()
return (__f709_wA - (function()
return (__f709_invIA * (function()
return (__add((function()
return ((function()
return (__f709_cp1["rA"]["x"] * __f709_P1Y)
end)()
 - (function()
return (__f709_cp1["rA"]["y"] * __f709_P1X)
end)()
)
end)()
, (function()
return (__f709_cp2["rA"]["x"] * __f709_P2Y)
end)()
) - (function()
return (__f709_cp2["rA"]["y"] * __f709_P2X)
end)()
)
end)()
)
end)()
)
end)()
;
__f709_vB["x"] = __add(__f709_vB["x"], (function()
return (__f709_invMassB * __add(__f709_P1X, __f709_P2X))
end)()
);
__f709_vB["y"] = __add(__f709_vB["y"], (function()
return (__f709_invMassB * __add(__f709_P1Y, __f709_P2Y))
end)()
);
__f709_wB = __add(__f709_wB, (function()
return (__f709_invIB * (function()
return (__add((function()
return ((function()
return (__f709_cp1["rB"]["x"] * __f709_P1Y)
end)()
 - (function()
return (__f709_cp1["rB"]["y"] * __f709_P1X)
end)()
)
end)()
, (function()
return (__f709_cp2["rB"]["x"] * __f709_P2Y)
end)()
) - (function()
return (__f709_cp2["rB"]["y"] * __f709_P2X)
end)()
)
end)()
)
end)()
);
__f709_cp1["normalImpulse"] = __f709_xX;
__f709_cp2["normalImpulse"] = __f709_xY;
return 'break'
end)()

else return __noop()
end
end)()
;
__f709_xX = 0;
__f709_xY = (function()
return ((function()
return (-__f709_cp2["normalMass"])
end)()
 * __f709_bY)
end)()
;
__f709_vn1 = __add((function()
return (__f709_c["K"]["col2"]["x"] * __f709_xY)
end)()
, __f709_bX);
__f709_vn2 = 0;
(function()
local __oak_cond = __truthy(__and((function()
return (__f709_xY >= 0)
end)()
, (function()
return (__f709_vn1 >= 0)
end)()
))
if __oak_eq(__oak_cond, true) then return (function()
__f709_dX = (function()
return (__f709_xX - __f709_aX)
end)()
;
__f709_dY = (function()
return (__f709_xY - __f709_aY)
end)()
;
__f709_P1X = (function()
return (__f709_dX * __f709_normalX)
end)()
;
__f709_P1Y = (function()
return (__f709_dX * __f709_normalY)
end)()
;
__f709_P2X = (function()
return (__f709_dY * __f709_normalX)
end)()
;
__f709_P2Y = (function()
return (__f709_dY * __f709_normalY)
end)()
;
__f709_vA["x"] = (function()
return (__f709_vA["x"] - (function()
return (__f709_invMassA * __add(__f709_P1X, __f709_P2X))
end)()
)
end)()
;
__f709_vA["y"] = (function()
return (__f709_vA["y"] - (function()
return (__f709_invMassA * __add(__f709_P1Y, __f709_P2Y))
end)()
)
end)()
;
__f709_wA = (function()
return (__f709_wA - (function()
return (__f709_invIA * (function()
return (__add((function()
return ((function()
return (__f709_cp1["rA"]["x"] * __f709_P1Y)
end)()
 - (function()
return (__f709_cp1["rA"]["y"] * __f709_P1X)
end)()
)
end)()
, (function()
return (__f709_cp2["rA"]["x"] * __f709_P2Y)
end)()
) - (function()
return (__f709_cp2["rA"]["y"] * __f709_P2X)
end)()
)
end)()
)
end)()
)
end)()
;
__f709_vB["x"] = __add(__f709_vB["x"], (function()
return (__f709_invMassB * __add(__f709_P1X, __f709_P2X))
end)()
);
__f709_vB["y"] = __add(__f709_vB["y"], (function()
return (__f709_invMassB * __add(__f709_P1Y, __f709_P2Y))
end)()
);
__f709_wB = __add(__f709_wB, (function()
return (__f709_invIB * (function()
return (__add((function()
return ((function()
return (__f709_cp1["rB"]["x"] * __f709_P1Y)
end)()
 - (function()
return (__f709_cp1["rB"]["y"] * __f709_P1X)
end)()
)
end)()
, (function()
return (__f709_cp2["rB"]["x"] * __f709_P2Y)
end)()
) - (function()
return (__f709_cp2["rB"]["y"] * __f709_P2X)
end)()
)
end)()
)
end)()
);
__f709_cp1["normalImpulse"] = __f709_xX;
__f709_cp2["normalImpulse"] = __f709_xY;
return 'break'
end)()

else return __noop()
end
end)()
;
__f709_xX = 0;
__f709_xY = 0;
__f709_vn1 = __f709_bX;
__f709_vn2 = __f709_bY;
(function()
local __oak_cond = __truthy(__and((function()
return (__f709_vn1 >= 0)
end)()
, (function()
return (__f709_vn2 >= 0)
end)()
))
if __oak_eq(__oak_cond, true) then return (function()
__f709_dX = (function()
return (__f709_xX - __f709_aX)
end)()
;
__f709_dY = (function()
return (__f709_xY - __f709_aY)
end)()
;
__f709_P1X = (function()
return (__f709_dX * __f709_normalX)
end)()
;
__f709_P1Y = (function()
return (__f709_dX * __f709_normalY)
end)()
;
__f709_P2X = (function()
return (__f709_dY * __f709_normalX)
end)()
;
__f709_P2Y = (function()
return (__f709_dY * __f709_normalY)
end)()
;
__f709_vA["x"] = (function()
return (__f709_vA["x"] - (function()
return (__f709_invMassA * __add(__f709_P1X, __f709_P2X))
end)()
)
end)()
;
__f709_vA["y"] = (function()
return (__f709_vA["y"] - (function()
return (__f709_invMassA * __add(__f709_P1Y, __f709_P2Y))
end)()
)
end)()
;
__f709_wA = (function()
return (__f709_wA - (function()
return (__f709_invIA * (function()
return (__add((function()
return ((function()
return (__f709_cp1["rA"]["x"] * __f709_P1Y)
end)()
 - (function()
return (__f709_cp1["rA"]["y"] * __f709_P1X)
end)()
)
end)()
, (function()
return (__f709_cp2["rA"]["x"] * __f709_P2Y)
end)()
) - (function()
return (__f709_cp2["rA"]["y"] * __f709_P2X)
end)()
)
end)()
)
end)()
)
end)()
;
__f709_vB["x"] = __add(__f709_vB["x"], (function()
return (__f709_invMassB * __add(__f709_P1X, __f709_P2X))
end)()
);
__f709_vB["y"] = __add(__f709_vB["y"], (function()
return (__f709_invMassB * __add(__f709_P1Y, __f709_P2Y))
end)()
);
__f709_wB = __add(__f709_wB, (function()
return (__f709_invIB * (function()
return (__add((function()
return ((function()
return (__f709_cp1["rB"]["x"] * __f709_P1Y)
end)()
 - (function()
return (__f709_cp1["rB"]["y"] * __f709_P1X)
end)()
)
end)()
, (function()
return (__f709_cp2["rB"]["x"] * __f709_P2Y)
end)()
) - (function()
return (__f709_cp2["rB"]["y"] * __f709_P2X)
end)()
)
end)()
)
end)()
);
__f709_cp1["normalImpulse"] = __f709_xX;
__f709_cp2["normalImpulse"] = __f709_xY;
return 'break'
end)()

else return __noop()
end
end)()
;
return 'break'
end)()

end)()
;
return (function()
local __oak_cond = __r
if __oak_eq(__oak_cond, 'break') then return nil
else return (function()
__noop();
return __loop313()
end)()

end
end)()

end)()

else return nil
end
end)()

end;
return __loop313()
end)()

end)()

end
end)()
;
__f709_bodyA["m_angularVelocity"] = __f709_wA;
__f709_bodyB["m_angularVelocity"] = __f709_wB
return __f709_bodyB["m_angularVelocity"]
end)()

end)()
;
return (function()
local __oak_cond = __r
if __oak_eq(__oak_cond, 'break') then return nil
else return (function()
(function()
__f709_i = __as_oak_string(__f709_i + 1)
return __f709_i
end)()
;
return __loop309()
end)()

end
end)()

end)()

else return nil
end
end)()

end;
return __loop309()
end)()

end;
__proto_b2ContactSolver["FinalizeVelocityConstraints"] = function(self)
local __f710_i = 0;
local function __loop314()
return (function()
local __oak_cond = (function()
return (__f710_i < self["m_constraintCount"])
end)()

if __oak_eq(__oak_cond, true) then return (function()
local __r = (function()
return (function()
local __f710_c = __oak_acc(self["m_constraints"], (function()
return __f710_i
end)()
);
local __f710_m = __f710_c["manifold"];
return (function()
local __f710_j = 0;
local function __loop316()
return (function()
local __oak_cond = (function()
return (__f710_j < __f710_c["pointCount"])
end)()

if __oak_eq(__oak_cond, true) then return (function()
local __r = (function()
return (function()
local __f710_point1 = __oak_acc(__f710_m["m_points"], (function()
return __f710_j
end)()
);
local __f710_point2 = __oak_acc(__f710_c["points"], (function()
return __f710_j
end)()
);
__f710_point1["m_normalImpulse"] = __f710_point2["normalImpulse"];
__f710_point1["m_tangentImpulse"] = __f710_point2["tangentImpulse"]
return __f710_point1["m_tangentImpulse"]
end)()

end)()
;
return (function()
local __oak_cond = __r
if __oak_eq(__oak_cond, 'break') then return nil
else return (function()
(function()
__f710_j = __as_oak_string(__f710_j + 1)
return __f710_j
end)()
;
return __loop316()
end)()

end
end)()

end)()

else return nil
end
end)()

end;
return __loop316()
end)()

end)()

end)()
;
return (function()
local __oak_cond = __r
if __oak_eq(__oak_cond, 'break') then return nil
else return (function()
(function()
__f710_i = __as_oak_string(__f710_i + 1)
return __f710_i
end)()
;
return __loop314()
end)()

end
end)()

end)()

else return nil
end
end)()

end;
return __loop314()
end;
__proto_b2ContactSolver["SolvePositionConstraints"] = function(self, __f711_baumgarte)
(function()
local __oak_cond = __truthy((function()
return __oak_eq(__f711_baumgarte, nil)
end)()
)
if __oak_eq(__oak_cond, true) then __f711_baumgarte = 0
return __f711_baumgarte
else return __noop()
end
end)()
;
local __f711_minSeparation = 0;
(function()
local __f711_i = 0;
local function __loop318()
return (function()
local __oak_cond = (function()
return (__f711_i < self["m_constraintCount"])
end)()

if __oak_eq(__oak_cond, true) then return (function()
local __r = (function()
return (function()
local __f711_c = __oak_acc(self["m_constraints"], (function()
return __f711_i
end)()
);
local __f711_bodyA = __f711_c["bodyA"];
local __f711_bodyB = __f711_c["bodyB"];
local __f711_invMassA = (function()
return (__f711_bodyA["m_mass"] * __f711_bodyA["m_invMass"])
end)()
;
local __f711_invIA = (function()
return (__f711_bodyA["m_mass"] * __f711_bodyA["m_invI"])
end)()
;
local __f711_invMassB = (function()
return (__f711_bodyB["m_mass"] * __f711_bodyB["m_invMass"])
end)()
;
local __f711_invIB = (function()
return (__f711_bodyB["m_mass"] * __f711_bodyB["m_invI"])
end)()
;
__static_b2ContactSolver["s_psm"]["Initialize"](__static_b2ContactSolver["s_psm"], __f711_c);
local __f711_normal = __static_b2ContactSolver["s_psm"]["m_normal"];
return (function()
local __f711_j = 0;
local function __loop320()
return (function()
local __oak_cond = (function()
return (__f711_j < __f711_c["pointCount"])
end)()

if __oak_eq(__oak_cond, true) then return (function()
local __r = (function()
return (function()
local __f711_ccp = __oak_acc(__f711_c["points"], (function()
return __f711_j
end)()
);
local __f711_point = __oak_acc(__static_b2ContactSolver["s_psm"]["m_points"], (function()
return __f711_j
end)()
);
local __f711_separation = __oak_acc(__static_b2ContactSolver["s_psm"]["m_separations"], (function()
return __f711_j
end)()
);
local __f711_rAX = (function()
return (__f711_point["x"] - __f711_bodyA["m_sweep"]["c"]["x"])
end)()
;
local __f711_rAY = (function()
return (__f711_point["y"] - __f711_bodyA["m_sweep"]["c"]["y"])
end)()
;
local __f711_rBX = (function()
return (__f711_point["x"] - __f711_bodyB["m_sweep"]["c"]["x"])
end)()
;
local __f711_rBY = (function()
return (__f711_point["y"] - __f711_bodyB["m_sweep"]["c"]["y"])
end)()
;
__f711_minSeparation = (function()
local __oak_cond = __truthy((function()
return (__f711_minSeparation < __f711_separation)
end)()
)
if __oak_eq(__oak_cond, true) then return __f711_minSeparation
else return __f711_separation
end
end)()
;
local __f711_C = __static_b2Math["Clamp"]((function()
return (__f711_baumgarte * __add(__f711_separation, __static_b2Settings["b2_linearSlop"]))
end)()
, (function()
return (-__static_b2Settings["b2_maxLinearCorrection"])
end)()
, 0);
local __f711_impulse = (function()
return ((function()
return (-__f711_ccp["equalizedMass"])
end)()
 * __f711_C)
end)()
;
local __f711_PX = (function()
return (__f711_impulse * __f711_normal["x"])
end)()
;
local __f711_PY = (function()
return (__f711_impulse * __f711_normal["y"])
end)()
;
__f711_bodyA["m_sweep"]["c"]["x"] = (function()
return (__f711_bodyA["m_sweep"]["c"]["x"] - (function()
return (__f711_invMassA * __f711_PX)
end)()
)
end)()
;
__f711_bodyA["m_sweep"]["c"]["y"] = (function()
return (__f711_bodyA["m_sweep"]["c"]["y"] - (function()
return (__f711_invMassA * __f711_PY)
end)()
)
end)()
;
__f711_bodyA["m_sweep"]["a"] = (function()
return (__f711_bodyA["m_sweep"]["a"] - (function()
return (__f711_invIA * (function()
return ((function()
return (__f711_rAX * __f711_PY)
end)()
 - (function()
return (__f711_rAY * __f711_PX)
end)()
)
end)()
)
end)()
)
end)()
;
__f711_bodyA["SynchronizeTransform"](__f711_bodyA);
__f711_bodyB["m_sweep"]["c"]["x"] = __add(__f711_bodyB["m_sweep"]["c"]["x"], (function()
return (__f711_invMassB * __f711_PX)
end)()
);
__f711_bodyB["m_sweep"]["c"]["y"] = __add(__f711_bodyB["m_sweep"]["c"]["y"], (function()
return (__f711_invMassB * __f711_PY)
end)()
);
__f711_bodyB["m_sweep"]["a"] = __add(__f711_bodyB["m_sweep"]["a"], (function()
return (__f711_invIB * (function()
return ((function()
return (__f711_rBX * __f711_PY)
end)()
 - (function()
return (__f711_rBY * __f711_PX)
end)()
)
end)()
)
end)()
);
return __f711_bodyB["SynchronizeTransform"](__f711_bodyB)
end)()

end)()
;
return (function()
local __oak_cond = __r
if __oak_eq(__oak_cond, 'break') then return nil
else return (function()
(function()
local __tmp711_321 = __f711_j;
__f711_j = __as_oak_string(__f711_j + 1);
return __tmp711_321
end)()
;
return __loop320()
end)()

end
end)()

end)()

else return nil
end
end)()

end;
return __loop320()
end)()

end)()

end)()
;
return (function()
local __oak_cond = __r
if __oak_eq(__oak_cond, 'break') then return nil
else return (function()
(function()
local __tmp711_319 = __f711_i;
__f711_i = __as_oak_string(__f711_i + 1);
return __tmp711_319
end)()
;
return __loop318()
end)()

end
end)()

end)()

else return nil
end
end)()

end;
return __loop318()
end)()
;
return (function()
return (__f711_minSeparation > (function()
return ((function()
return (-1.5)
end)()
 * __static_b2Settings["b2_linearSlop"])
end)()
)
end)()

end;
__static_b2ContactSolver = {};
b2ContactSolver = function()
local self = {["__type"]='b2ContactSolver', ["__types"]={'b2ContactSolver'}};
self["Initialize"] = __proto_b2ContactSolver["Initialize"];
self["InitVelocityConstraints"] = __proto_b2ContactSolver["InitVelocityConstraints"];
self["SolveVelocityConstraints"] = __proto_b2ContactSolver["SolveVelocityConstraints"];
self["FinalizeVelocityConstraints"] = __proto_b2ContactSolver["FinalizeVelocityConstraints"];
self["SolvePositionConstraints"] = __proto_b2ContactSolver["SolvePositionConstraints"];
(function()
self["m_step"] = b2TimeStep();
self["m_constraints"] = __newArray()
return self["m_constraints"]
end)()
;
return self
end;
Box2D["Dynamics"]["Contacts"]["b2ContactSolver"] = b2ContactSolver;
__proto_b2PositionSolverManifold = {};
__proto_b2PositionSolverManifold["Initialize"] = function(self, __f713_cc)
__static_b2Settings["b2Assert"]((function()
return (__f713_cc["pointCount"] > 0)
end)()
);
local __f713_i = 0;
local __f713_clipPointX = 0;
local __f713_clipPointY = 0;
local __f713_tMat = __noop();
local __f713_tVec = __noop();
local __f713_planePointX = 0;
local __f713_planePointY = 0;
return (function()
local __oak_cond = __f713_cc["type"]
if __oak_eq(__oak_cond, __static_b2Manifold["e_circles"]) then return (function()
__f713_tMat = __f713_cc["bodyA"]["m_xf"]["R"];
__f713_tVec = __f713_cc["localPoint"];
local __f713_pointAX = __add(__f713_cc["bodyA"]["m_xf"]["position"]["x"], __add((function()
return (__f713_tMat["col1"]["x"] * __f713_tVec["x"])
end)()
, (function()
return (__f713_tMat["col2"]["x"] * __f713_tVec["y"])
end)()
));
local __f713_pointAY = __add(__f713_cc["bodyA"]["m_xf"]["position"]["y"], __add((function()
return (__f713_tMat["col1"]["y"] * __f713_tVec["x"])
end)()
, (function()
return (__f713_tMat["col2"]["y"] * __f713_tVec["y"])
end)()
));
__f713_tMat = __f713_cc["bodyB"]["m_xf"]["R"];
__f713_tVec = __oak_acc(__f713_cc["points"], (function()
return 0
end)()
)["localPoint"];
local __f713_pointBX = __add(__f713_cc["bodyB"]["m_xf"]["position"]["x"], __add((function()
return (__f713_tMat["col1"]["x"] * __f713_tVec["x"])
end)()
, (function()
return (__f713_tMat["col2"]["x"] * __f713_tVec["y"])
end)()
));
local __f713_pointBY = __add(__f713_cc["bodyB"]["m_xf"]["position"]["y"], __add((function()
return (__f713_tMat["col1"]["y"] * __f713_tVec["x"])
end)()
, (function()
return (__f713_tMat["col2"]["y"] * __f713_tVec["y"])
end)()
));
local __f713_dX = (function()
return (__f713_pointBX - __f713_pointAX)
end)()
;
local __f713_dY = (function()
return (__f713_pointBY - __f713_pointAY)
end)()
;
local __f713_d2 = __add((function()
return (__f713_dX * __f713_dX)
end)()
, (function()
return (__f713_dY * __f713_dY)
end)()
);
(function()
local __oak_cond = __truthy((function()
return (__f713_d2 > (function()
return (__Number["MIN_VALUE"] * __Number["MIN_VALUE"])
end)()
)
end)()
)
if __oak_eq(__oak_cond, true) then return (function()
local __f713_d = __Math["sqrt"](__f713_d2);
self["m_normal"]["x"] = (function()
return (__f713_dX / __f713_d)
end)()
;
self["m_normal"]["y"] = (function()
return (__f713_dY / __f713_d)
end)()

return self["m_normal"]["y"]
end)()

else return (function()
self["m_normal"]["x"] = 1;
self["m_normal"]["y"] = 0
return self["m_normal"]["y"]
end)()

end
end)()
;
__oak_acc(self["m_points"], (function()
return 0
end)()
)["x"] = (function()
return (0.5 * __add(__f713_pointAX, __f713_pointBX))
end)()
;
__oak_acc(self["m_points"], (function()
return 0
end)()
)["y"] = (function()
return (0.5 * __add(__f713_pointAY, __f713_pointBY))
end)()
;
self["m_separations"][__add(0, 1)] = (function()
return (__add((function()
return (__f713_dX * self["m_normal"]["x"])
end)()
, (function()
return (__f713_dY * self["m_normal"]["y"])
end)()
) - __f713_cc["radius"])
end)()

return __oak_acc(self["m_separations"], (function()
return __add(0, 1)
end)()
)
end)()

elseif __oak_eq(__oak_cond, __static_b2Manifold["e_faceA"]) then return (function()
__f713_tMat = __f713_cc["bodyA"]["m_xf"]["R"];
__f713_tVec = __f713_cc["localPlaneNormal"];
self["m_normal"]["x"] = __add((function()
return (__f713_tMat["col1"]["x"] * __f713_tVec["x"])
end)()
, (function()
return (__f713_tMat["col2"]["x"] * __f713_tVec["y"])
end)()
);
self["m_normal"]["y"] = __add((function()
return (__f713_tMat["col1"]["y"] * __f713_tVec["x"])
end)()
, (function()
return (__f713_tMat["col2"]["y"] * __f713_tVec["y"])
end)()
);
__f713_tMat = __f713_cc["bodyA"]["m_xf"]["R"];
__f713_tVec = __f713_cc["localPoint"];
__f713_planePointX = __add(__f713_cc["bodyA"]["m_xf"]["position"]["x"], __add((function()
return (__f713_tMat["col1"]["x"] * __f713_tVec["x"])
end)()
, (function()
return (__f713_tMat["col2"]["x"] * __f713_tVec["y"])
end)()
));
__f713_planePointY = __add(__f713_cc["bodyA"]["m_xf"]["position"]["y"], __add((function()
return (__f713_tMat["col1"]["y"] * __f713_tVec["x"])
end)()
, (function()
return (__f713_tMat["col2"]["y"] * __f713_tVec["y"])
end)()
));
__f713_tMat = __f713_cc["bodyB"]["m_xf"]["R"];
return (function()
__f713_i = 0;
local function __loop322()
return (function()
local __oak_cond = (function()
return (__f713_i < __f713_cc["pointCount"])
end)()

if __oak_eq(__oak_cond, true) then return (function()
local __r = (function()
return (function()
__f713_tVec = __oak_acc(__f713_cc["points"], (function()
return __f713_i
end)()
)["localPoint"];
__f713_clipPointX = __add(__f713_cc["bodyB"]["m_xf"]["position"]["x"], __add((function()
return (__f713_tMat["col1"]["x"] * __f713_tVec["x"])
end)()
, (function()
return (__f713_tMat["col2"]["x"] * __f713_tVec["y"])
end)()
));
__f713_clipPointY = __add(__f713_cc["bodyB"]["m_xf"]["position"]["y"], __add((function()
return (__f713_tMat["col1"]["y"] * __f713_tVec["x"])
end)()
, (function()
return (__f713_tMat["col2"]["y"] * __f713_tVec["y"])
end)()
));
self["m_separations"][__add(__f713_i, 1)] = (function()
return (__add((function()
return ((function()
return (__f713_clipPointX - __f713_planePointX)
end)()
 * self["m_normal"]["x"])
end)()
, (function()
return ((function()
return (__f713_clipPointY - __f713_planePointY)
end)()
 * self["m_normal"]["y"])
end)()
) - __f713_cc["radius"])
end)()
;
__oak_acc(self["m_points"], (function()
return __f713_i
end)()
)["x"] = __f713_clipPointX;
__oak_acc(self["m_points"], (function()
return __f713_i
end)()
)["y"] = __f713_clipPointY
return __oak_acc(self["m_points"], (function()
return __f713_i
end)()
)["y"]
end)()

end)()
;
return (function()
local __oak_cond = __r
if __oak_eq(__oak_cond, 'break') then return nil
else return (function()
(function()
__f713_i = __as_oak_string(__f713_i + 1)
return __f713_i
end)()
;
return __loop322()
end)()

end
end)()

end)()

else return nil
end
end)()

end;
return __loop322()
end)()

end)()

elseif __oak_eq(__oak_cond, __static_b2Manifold["e_faceB"]) then return (function()
__f713_tMat = __f713_cc["bodyB"]["m_xf"]["R"];
__f713_tVec = __f713_cc["localPlaneNormal"];
self["m_normal"]["x"] = __add((function()
return (__f713_tMat["col1"]["x"] * __f713_tVec["x"])
end)()
, (function()
return (__f713_tMat["col2"]["x"] * __f713_tVec["y"])
end)()
);
self["m_normal"]["y"] = __add((function()
return (__f713_tMat["col1"]["y"] * __f713_tVec["x"])
end)()
, (function()
return (__f713_tMat["col2"]["y"] * __f713_tVec["y"])
end)()
);
__f713_tMat = __f713_cc["bodyB"]["m_xf"]["R"];
__f713_tVec = __f713_cc["localPoint"];
__f713_planePointX = __add(__f713_cc["bodyB"]["m_xf"]["position"]["x"], __add((function()
return (__f713_tMat["col1"]["x"] * __f713_tVec["x"])
end)()
, (function()
return (__f713_tMat["col2"]["x"] * __f713_tVec["y"])
end)()
));
__f713_planePointY = __add(__f713_cc["bodyB"]["m_xf"]["position"]["y"], __add((function()
return (__f713_tMat["col1"]["y"] * __f713_tVec["x"])
end)()
, (function()
return (__f713_tMat["col2"]["y"] * __f713_tVec["y"])
end)()
));
__f713_tMat = __f713_cc["bodyA"]["m_xf"]["R"];
(function()
__f713_i = 0;
local function __loop324()
return (function()
local __oak_cond = (function()
return (__f713_i < __f713_cc["pointCount"])
end)()

if __oak_eq(__oak_cond, true) then return (function()
local __r = (function()
return (function()
__f713_tVec = __oak_acc(__f713_cc["points"], (function()
return __f713_i
end)()
)["localPoint"];
__f713_clipPointX = __add(__f713_cc["bodyA"]["m_xf"]["position"]["x"], __add((function()
return (__f713_tMat["col1"]["x"] * __f713_tVec["x"])
end)()
, (function()
return (__f713_tMat["col2"]["x"] * __f713_tVec["y"])
end)()
));
__f713_clipPointY = __add(__f713_cc["bodyA"]["m_xf"]["position"]["y"], __add((function()
return (__f713_tMat["col1"]["y"] * __f713_tVec["x"])
end)()
, (function()
return (__f713_tMat["col2"]["y"] * __f713_tVec["y"])
end)()
));
self["m_separations"][__add(__f713_i, 1)] = (function()
return (__add((function()
return ((function()
return (__f713_clipPointX - __f713_planePointX)
end)()
 * self["m_normal"]["x"])
end)()
, (function()
return ((function()
return (__f713_clipPointY - __f713_planePointY)
end)()
 * self["m_normal"]["y"])
end)()
) - __f713_cc["radius"])
end)()
;
return __oak_acc(self["m_points"], (function()
return __f713_i
end)()
)["Set"](__oak_acc(self["m_points"], (function()
return __f713_i
end)()
), __f713_clipPointX, __f713_clipPointY)
end)()

end)()
;
return (function()
local __oak_cond = __r
if __oak_eq(__oak_cond, 'break') then return nil
else return (function()
(function()
__f713_i = __as_oak_string(__f713_i + 1)
return __f713_i
end)()
;
return __loop324()
end)()

end
end)()

end)()

else return nil
end
end)()

end;
return __loop324()
end)()
;
self["m_normal"]["x"] = (function()
return (self["m_normal"]["x"] * (function()
return (-1)
end)()
)
end)()
;
self["m_normal"]["y"] = (function()
return (self["m_normal"]["y"] * (function()
return (-1)
end)()
)
end)()

return self["m_normal"]["y"]
end)()

else return nil
end
end)()

end;
__static_b2PositionSolverManifold = {};
b2PositionSolverManifold = function()
local self = {["__type"]='b2PositionSolverManifold', ["__types"]={'b2PositionSolverManifold'}};
self["Initialize"] = __proto_b2PositionSolverManifold["Initialize"];
(function()
self["m_normal"] = b2Vec2();
self["m_separations"] = Vector_a2j_Number(__static_b2Settings["b2_maxManifoldPoints"]);
self["m_points"] = __newArray(__static_b2Settings["b2_maxManifoldPoints"]);
return (function()
local __f714_i = 0;
local function __loop326()
return (function()
local __oak_cond = (function()
return (__f714_i < __static_b2Settings["b2_maxManifoldPoints"])
end)()

if __oak_eq(__oak_cond, true) then return (function()
local __r = (function()
self["m_points"][__add(__f714_i, 1)] = b2Vec2()
return __oak_acc(self["m_points"], (function()
return __add(__f714_i, 1)
end)()
)
end)()
;
return (function()
local __oak_cond = __r
if __oak_eq(__oak_cond, 'break') then return nil
else return (function()
(function()
local __tmp714_327 = __f714_i;
__f714_i = __as_oak_string(__f714_i + 1);
return __tmp714_327
end)()
;
return __loop326()
end)()

end
end)()

end)()

else return nil
end
end)()

end;
return __loop326()
end)()

end)()
;
return self
end;
Box2D["Dynamics"]["Contacts"]["b2PositionSolverManifold"] = b2PositionSolverManifold;
__proto_b2Joint = {};
__proto_b2Joint["GetType"] = function(self)
return self["m_type"]
end;
__proto_b2Joint["GetAnchorA"] = function(self)
return nil
end;
__proto_b2Joint["GetAnchorB"] = function(self)
return nil
end;
__proto_b2Joint["GetReactionForce"] = function(self, __f718_inv_dt)
(function()
local __oak_cond = __truthy((function()
return __oak_eq(__f718_inv_dt, nil)
end)()
)
if __oak_eq(__oak_cond, true) then __f718_inv_dt = 0
return __f718_inv_dt
else return __noop()
end
end)()
;
return nil
end;
__proto_b2Joint["GetReactionTorque"] = function(self, __f719_inv_dt)
(function()
local __oak_cond = __truthy((function()
return __oak_eq(__f719_inv_dt, nil)
end)()
)
if __oak_eq(__oak_cond, true) then __f719_inv_dt = 0
return __f719_inv_dt
else return __noop()
end
end)()
;
return 0
end;
__proto_b2Joint["GetBodyA"] = function(self)
return self["m_bodyA"]
end;
__proto_b2Joint["GetBodyB"] = function(self)
return self["m_bodyB"]
end;
__proto_b2Joint["GetNext"] = function(self)
return self["m_next"]
end;
__proto_b2Joint["GetUserData"] = function(self)
return self["m_userData"]
end;
__proto_b2Joint["SetUserData"] = function(self, __f724_data)
self["m_userData"] = __f724_data
return self["m_userData"]
end;
__proto_b2Joint["IsActive"] = function(self)
return __and(self["m_bodyA"]["IsActive"](self["m_bodyA"]), self["m_bodyB"]["IsActive"](self["m_bodyB"]))
end;
__proto_b2Joint["InitVelocityConstraints"] = function(self, __f726_step)
return nil
end;
__proto_b2Joint["SolveVelocityConstraints"] = function(self, __f727_step)
return nil
end;
__proto_b2Joint["FinalizeVelocityConstraints"] = function(self)
return nil
end;
__proto_b2Joint["SolvePositionConstraints"] = function(self, __f729_baumgarte)
(function()
local __oak_cond = __truthy((function()
return __oak_eq(__f729_baumgarte, nil)
end)()
)
if __oak_eq(__oak_cond, true) then __f729_baumgarte = 0
return __f729_baumgarte
else return __noop()
end
end)()
;
return false
end;
__static_b2Joint = {};
__static_b2Joint["Create"] = function(__f730_def, __f730_allocator)
local __f730_joint = nil;
(function()
local __oak_cond = __f730_def["type"]
if __oak_eq(__oak_cond, __static_b2Joint["e_distanceJoint"]) then __f730_joint = b2DistanceJoint((function()
local __oak_cond = __truthy(__instanceof(__f730_def, 'b2DistanceJointDef'))
if __oak_eq(__oak_cond, true) then return __f730_def
else return nil
end
end)()
)
return __f730_joint
elseif __oak_eq(__oak_cond, __static_b2Joint["e_mouseJoint"]) then __f730_joint = b2MouseJoint((function()
local __oak_cond = __truthy(__instanceof(__f730_def, 'b2MouseJointDef'))
if __oak_eq(__oak_cond, true) then return __f730_def
else return nil
end
end)()
)
return __f730_joint
elseif __oak_eq(__oak_cond, __static_b2Joint["e_prismaticJoint"]) then __f730_joint = b2PrismaticJoint((function()
local __oak_cond = __truthy(__instanceof(__f730_def, 'b2PrismaticJointDef'))
if __oak_eq(__oak_cond, true) then return __f730_def
else return nil
end
end)()
)
return __f730_joint
elseif __oak_eq(__oak_cond, __static_b2Joint["e_revoluteJoint"]) then __f730_joint = b2RevoluteJoint((function()
local __oak_cond = __truthy(__instanceof(__f730_def, 'b2RevoluteJointDef'))
if __oak_eq(__oak_cond, true) then return __f730_def
else return nil
end
end)()
)
return __f730_joint
elseif __oak_eq(__oak_cond, __static_b2Joint["e_pulleyJoint"]) then __f730_joint = b2PulleyJoint((function()
local __oak_cond = __truthy(__instanceof(__f730_def, 'b2PulleyJointDef'))
if __oak_eq(__oak_cond, true) then return __f730_def
else return nil
end
end)()
)
return __f730_joint
elseif __oak_eq(__oak_cond, __static_b2Joint["e_gearJoint"]) then __f730_joint = b2GearJoint((function()
local __oak_cond = __truthy(__instanceof(__f730_def, 'b2GearJointDef'))
if __oak_eq(__oak_cond, true) then return __f730_def
else return nil
end
end)()
)
return __f730_joint
elseif __oak_eq(__oak_cond, __static_b2Joint["e_lineJoint"]) then __f730_joint = b2LineJoint((function()
local __oak_cond = __truthy(__instanceof(__f730_def, 'b2LineJointDef'))
if __oak_eq(__oak_cond, true) then return __f730_def
else return nil
end
end)()
)
return __f730_joint
elseif __oak_eq(__oak_cond, __static_b2Joint["e_weldJoint"]) then __f730_joint = b2WeldJoint((function()
local __oak_cond = __truthy(__instanceof(__f730_def, 'b2WeldJointDef'))
if __oak_eq(__oak_cond, true) then return __f730_def
else return nil
end
end)()
)
return __f730_joint
elseif __oak_eq(__oak_cond, __static_b2Joint["e_frictionJoint"]) then __f730_joint = b2FrictionJoint((function()
local __oak_cond = __truthy(__instanceof(__f730_def, 'b2FrictionJointDef'))
if __oak_eq(__oak_cond, true) then return __f730_def
else return nil
end
end)()
)
return __f730_joint
else return nil
end
end)()
;
return __f730_joint
end;
__static_b2Joint["Destroy"] = function(__f731_joint, __f731_allocator)
return nil
end;
b2Joint = function()
local self = {["__type"]='b2Joint', ["__types"]={'b2Joint'}};
self["GetType"] = __proto_b2Joint["GetType"];
self["GetAnchorA"] = __proto_b2Joint["GetAnchorA"];
self["GetAnchorB"] = __proto_b2Joint["GetAnchorB"];
self["GetReactionForce"] = __proto_b2Joint["GetReactionForce"];
self["GetReactionTorque"] = __proto_b2Joint["GetReactionTorque"];
self["GetBodyA"] = __proto_b2Joint["GetBodyA"];
self["GetBodyB"] = __proto_b2Joint["GetBodyB"];
self["GetNext"] = __proto_b2Joint["GetNext"];
self["GetUserData"] = __proto_b2Joint["GetUserData"];
self["SetUserData"] = __proto_b2Joint["SetUserData"];
self["IsActive"] = __proto_b2Joint["IsActive"];
self["InitVelocityConstraints"] = __proto_b2Joint["InitVelocityConstraints"];
self["SolveVelocityConstraints"] = __proto_b2Joint["SolveVelocityConstraints"];
self["FinalizeVelocityConstraints"] = __proto_b2Joint["FinalizeVelocityConstraints"];
self["SolvePositionConstraints"] = __proto_b2Joint["SolvePositionConstraints"];
(function()
self["m_edgeA"] = b2JointEdge();
self["m_edgeB"] = b2JointEdge();
self["m_localCenterA"] = b2Vec2();
self["m_localCenterB"] = b2Vec2();
__static_b2Settings["b2Assert"]((function()
return (not __oak_eq(def["bodyA"], def["bodyB"]))
end)()
);
self["m_type"] = def["type"];
self["m_prev"] = nil;
self["m_next"] = nil;
self["m_bodyA"] = def["bodyA"];
self["m_bodyB"] = def["bodyB"];
self["m_collideConnected"] = def["collideConnected"];
self["m_islandFlag"] = false;
self["m_userData"] = def["userData"]
return self["m_userData"]
end)()
;
return self
end;
Box2D["Dynamics"]["Joints"]["b2Joint"] = b2Joint;
__proto_b2JointDef = {};
__static_b2JointDef = {};
b2JointDef = function()
local self = {["__type"]='b2JointDef', ["__types"]={'b2JointDef'}};
(function()
self["type"] = __static_b2Joint["e_unknownJoint"];
self["userData"] = nil;
self["bodyA"] = nil;
self["bodyB"] = nil;
self["collideConnected"] = false
return self["collideConnected"]
end)()
;
return self
end;
Box2D["Dynamics"]["Joints"]["b2JointDef"] = b2JointDef;
__static_b2PolygonShape["s_mat"] = b2Mat22();
__static_b2PulleyJoint["b2_minPulleyLength"] = 2;
__static_b2RevoluteJoint["tImpulse"] = b2Vec2();
__static_b2Collision["s_incidentEdge"] = __static_b2Collision["MakeClipPointVector"]();
__static_b2Collision["s_clipPoints1"] = __static_b2Collision["MakeClipPointVector"]();
__static_b2Collision["s_clipPoints2"] = __static_b2Collision["MakeClipPointVector"]();
__static_b2Collision["s_edgeAO"] = Vector_a2j_Number(1);
__static_b2Collision["s_edgeBO"] = Vector_a2j_Number(1);
__static_b2Collision["s_localTangent"] = b2Vec2();
__static_b2Collision["s_localNormal"] = b2Vec2();
__static_b2Collision["s_planePoint"] = b2Vec2();
__static_b2Collision["s_normal"] = b2Vec2();
__static_b2Collision["s_tangent"] = b2Vec2();
__static_b2Collision["s_tangent2"] = b2Vec2();
__static_b2Collision["s_v11"] = b2Vec2();
__static_b2Collision["s_v12"] = b2Vec2();
__static_b2Collision["b2CollidePolyTempVec"] = b2Vec2();
__static_b2Collision["b2_nullFeature"] = 255;
__static_b2Distance["b2_gjkMaxIters"] = __static_b2Math["Max"](__static_b2Distance["b2_gjkMaxIters"], iter);
__static_b2Distance["s_simplex"] = b2Simplex();
__static_b2Distance["s_saveA"] = Vector_a2j_Number(3);
__static_b2Distance["s_saveB"] = Vector_a2j_Number(3);
__static_b2DynamicTreeBroadPhase["__implements"] = {};
__static_b2SeparationFunction["e_points"] = 1;
__static_b2SeparationFunction["e_faceA"] = 2;
__static_b2SeparationFunction["e_faceB"] = 4;
__static_b2TimeOfImpact["b2_toiMaxRootIters"] = __static_b2Math["Max"](__static_b2TimeOfImpact["b2_toiMaxRootIters"], rootIterCount);
__static_b2TimeOfImpact["b2_toiMaxIters"] = __static_b2Math["Max"](__static_b2TimeOfImpact["b2_toiMaxIters"], iter);
__static_b2TimeOfImpact["b2_toiCalls"] = 0;
__static_b2TimeOfImpact["b2_toiIters"] = 0;
__static_b2TimeOfImpact["b2_toiRootIters"] = 0;
__static_b2TimeOfImpact["s_cache"] = b2SimplexCache();
__static_b2TimeOfImpact["s_distanceInput"] = b2DistanceInput();
__static_b2TimeOfImpact["s_xfA"] = b2Transform();
__static_b2TimeOfImpact["s_xfB"] = b2Transform();
__static_b2TimeOfImpact["s_fcn"] = b2SeparationFunction();
__static_b2TimeOfImpact["s_distanceOutput"] = b2DistanceOutput();
__static_b2Settings["VERSION"] = '2.1alpha';
__static_b2Settings["USHRT_MAX"] = 65535;
__static_b2Settings["b2_pi"] = __Math["PI"];
__static_b2Settings["b2_maxManifoldPoints"] = 2;
__static_b2Settings["b2_aabbExtension"] = 0.1;
__static_b2Settings["b2_aabbMultiplier"] = 2;
__static_b2Settings["b2_linearSlop"] = 0.005;
__static_b2Settings["b2_polygonRadius"] = (function()
return (2 * __static_b2Settings["b2_linearSlop"])
end)()
;
__static_b2Settings["b2_angularSlop"] = (function()
return ((function()
return (2 / 180)
end)()
 * __static_b2Settings["b2_pi"])
end)()
;
__static_b2Settings["b2_toiSlop"] = (function()
return (8 * __static_b2Settings["b2_linearSlop"])
end)()
;
__static_b2Settings["b2_maxTOIContactsPerIsland"] = 32;
__static_b2Settings["b2_maxTOIJointsPerIsland"] = 32;
__static_b2Settings["b2_velocityThreshold"] = 1;
__static_b2Settings["b2_maxLinearCorrection"] = 0.2;
__static_b2Settings["b2_maxAngularCorrection"] = (function()
return ((function()
return (8 / 180)
end)()
 * __static_b2Settings["b2_pi"])
end)()
;
__static_b2Settings["b2_maxTranslation"] = 2;
__static_b2Settings["b2_maxTranslationSquared"] = (function()
return (__static_b2Settings["b2_maxTranslation"] * __static_b2Settings["b2_maxTranslation"])
end)()
;
__static_b2Settings["b2_maxRotation"] = (function()
return (0.5 * __static_b2Settings["b2_pi"])
end)()
;
__static_b2Settings["b2_maxRotationSquared"] = (function()
return (__static_b2Settings["b2_maxRotation"] * __static_b2Settings["b2_maxRotation"])
end)()
;
__static_b2Settings["b2_contactBaumgarte"] = 0.2;
__static_b2Settings["b2_timeToSleep"] = 0.5;
__static_b2Settings["b2_linearSleepTolerance"] = 0.01;
__static_b2Settings["b2_angularSleepTolerance"] = (function()
return ((function()
return (2 / 180)
end)()
 * __static_b2Settings["b2_pi"])
end)()
;
__static_b2Math["b2Vec2_zero"] = b2Vec2(0, 0);
__static_b2Math["b2Mat22_identity"] = __static_b2Mat22["FromVV"](b2Vec2(1, 0), b2Vec2(0, 1));
__static_b2Math["b2Transform_identity"] = b2Transform(__static_b2Math["b2Vec2_zero"], __static_b2Math["b2Mat22_identity"]);
__static_b2ContactFilter["b2_defaultFilter"] = b2ContactFilter();
__static_b2ContactListener["b2_defaultListener"] = b2ContactListener();
__static_b2Manifold["e_circles"] = 1;
__static_b2Manifold["e_faceA"] = 2;
__static_b2Manifold["e_faceB"] = 4;
__static_b2Shape["e_unknownShape"] = __parseInt((function()
return (-1)
end)()
);
__static_b2Shape["e_circleShape"] = 0;
__static_b2Shape["e_polygonShape"] = 1;
__static_b2Shape["e_edgeShape"] = 2;
__static_b2Shape["e_shapeTypeCount"] = 3;
__static_b2Shape["e_hitCollide"] = 1;
__static_b2Shape["e_missCollide"] = 0;
__static_b2Shape["e_startsInsideCollide"] = __parseInt((function()
return (-1)
end)()
);
__static_b2Body["s_xf1"] = b2Transform();
__static_b2Body["e_islandFlag"] = 1;
__static_b2Body["e_awakeFlag"] = 2;
__static_b2Body["e_allowSleepFlag"] = 4;
__static_b2Body["e_bulletFlag"] = 8;
__static_b2Body["e_fixedRotationFlag"] = 16;
__static_b2Body["e_activeFlag"] = 32;
__static_b2Body["b2_staticBody"] = 0;
__static_b2Body["b2_kinematicBody"] = 1;
__static_b2Body["b2_dynamicBody"] = 2;
__static_b2ContactManager["s_evalCP"] = b2ContactPoint();
__static_b2DebugDraw["e_shapeBit"] = 1;
__static_b2DebugDraw["e_jointBit"] = 2;
__static_b2DebugDraw["e_aabbBit"] = 4;
__static_b2DebugDraw["e_pairBit"] = 8;
__static_b2DebugDraw["e_centerOfMassBit"] = 16;
__static_b2DebugDraw["e_controllerBit"] = 32;
__static_b2Island["s_impulse"] = b2ContactImpulse();
__static_b2World["m_warmStarting"] = true;
__static_b2World["m_continuousPhysics"] = true;
__static_b2World["s_timestep2"] = b2TimeStep();
__static_b2World["s_xf"] = b2Transform();
__static_b2World["s_backupA"] = b2Sweep();
__static_b2World["s_backupB"] = b2Sweep();
__static_b2World["s_timestep"] = b2TimeStep();
__static_b2World["s_queue"] = __newArray();
__static_b2World["s_jointColor"] = b2Color(0.5, 0.8, 0.8);
__static_b2World["e_newFixture"] = 1;
__static_b2World["e_locked"] = 2;
__static_b2Contact["e_sensorFlag"] = 1;
__static_b2Contact["e_continuousFlag"] = 2;
__static_b2Contact["e_islandFlag"] = 4;
__static_b2Contact["e_toiFlag"] = 8;
__static_b2Contact["e_touchingFlag"] = 16;
__static_b2Contact["e_enabledFlag"] = 32;
__static_b2Contact["e_filterFlag"] = 64;
__static_b2Contact["s_input"] = b2TOIInput();
__static_b2ContactSolver["s_worldManifold"] = b2WorldManifold();
__static_b2ContactSolver["s_psm"] = b2PositionSolverManifold();
__static_b2PositionSolverManifold["circlePointA"] = b2Vec2();
__static_b2PositionSolverManifold["circlePointB"] = b2Vec2();
__static_b2Joint["e_unknownJoint"] = 0;
__static_b2Joint["e_revoluteJoint"] = 1;
__static_b2Joint["e_prismaticJoint"] = 2;
__static_b2Joint["e_distanceJoint"] = 3;
__static_b2Joint["e_pulleyJoint"] = 4;
__static_b2Joint["e_mouseJoint"] = 5;
__static_b2Joint["e_gearJoint"] = 6;
__static_b2Joint["e_lineJoint"] = 7;
__static_b2Joint["e_weldJoint"] = 8;
__static_b2Joint["e_frictionJoint"] = 9;
__static_b2Joint["e_inactiveLimit"] = 0;
__static_b2Joint["e_atLowerLimit"] = 1;
__static_b2Joint["e_atUpperLimit"] = 2;
__static_b2Joint["e_equalLimits"] = 3;
(function()
local __oak_cond = __truthy((function()
return __oak_eq(__typeof(Box2D), 'undefined')
end)()
)
if __oak_eq(__oak_cond, true) then Box2D = {}
return Box2D
else return __noop()
end
end)()
;
(function()
local __oak_cond = __truthy((function()
return __oak_eq(__typeof(Box2D["Collision"]), 'undefined')
end)()
)
if __oak_eq(__oak_cond, true) then Box2D["Collision"] = {}
return Box2D["Collision"]
else return __noop()
end
end)()
;
(function()
local __oak_cond = __truthy((function()
return __oak_eq(__typeof(Box2D["Collision"]["Shapes"]), 'undefined')
end)()
)
if __oak_eq(__oak_cond, true) then Box2D["Collision"]["Shapes"] = {}
return Box2D["Collision"]["Shapes"]
else return __noop()
end
end)()
;
(function()
local __oak_cond = __truthy((function()
return __oak_eq(__typeof(Box2D["Common"]), 'undefined')
end)()
)
if __oak_eq(__oak_cond, true) then Box2D["Common"] = {}
return Box2D["Common"]
else return __noop()
end
end)()
;
(function()
local __oak_cond = __truthy((function()
return __oak_eq(__typeof(Box2D["Common"]["Math"]), 'undefined')
end)()
)
if __oak_eq(__oak_cond, true) then Box2D["Common"]["Math"] = {}
return Box2D["Common"]["Math"]
else return __noop()
end
end)()
;
(function()
local __oak_cond = __truthy((function()
return __oak_eq(__typeof(Box2D["Dynamics"]), 'undefined')
end)()
)
if __oak_eq(__oak_cond, true) then Box2D["Dynamics"] = {}
return Box2D["Dynamics"]
else return __noop()
end
end)()
;
(function()
local __oak_cond = __truthy((function()
return __oak_eq(__typeof(Box2D["Dynamics"]["Contacts"]), 'undefined')
end)()
)
if __oak_eq(__oak_cond, true) then Box2D["Dynamics"]["Contacts"] = {}
return Box2D["Dynamics"]["Contacts"]
else return __noop()
end
end)()
;
(function()
local __oak_cond = __truthy((function()
return __oak_eq(__typeof(Box2D["Dynamics"]["Controllers"]), 'undefined')
end)()
)
if __oak_eq(__oak_cond, true) then Box2D["Dynamics"]["Controllers"] = {}
return Box2D["Dynamics"]["Controllers"]
else return __noop()
end
end)()
;
(function()
local __oak_cond = __truthy((function()
return __oak_eq(__typeof(Box2D["Dynamics"]["Joints"]), 'undefined')
end)()
)
if __oak_eq(__oak_cond, true) then Box2D["Dynamics"]["Joints"] = {}
return Box2D["Dynamics"]["Joints"]
else return __noop()
end
end)()
;
Box2D["postDefs"] = {};
i = __noop();
(function()
i = 0;
__loop328 = function()
return (function()
local __oak_cond = (function()
return (i < len(Box2D["postDefs"]))
end)()

if __oak_eq(__oak_cond, true) then return (function()
local __r = (function()
return __oak_acc(Box2D["postDefs"], (function()
return i
end)()
)()
end)()
;
return (function()
local __oak_cond = __r
if __oak_eq(__oak_cond, 'break') then return nil
else return (function()
(function()
i = __as_oak_string(i + 1)
return i
end)()
;
return __loop328()
end)()

end
end)()

end)()

else return nil
end
end)()

end;
return __loop328()
end)()
;
__noop();
return {["Box2D"]=Box2D, ["ClipVertex"]=ClipVertex, ["Features"]=Features, ["Object"]=Object, ["Vector"]=Vector, ["Vector_a2j_Number"]=Vector_a2j_Number, ["__Error"]=__Error, ["__Number"]=__Number, ["__apply"]=__apply, ["__in"]=__in, ["__isFinite"]=__isFinite, ["__isNaN"]=__isNaN, ["__proto_ClipVertex"]=__proto_ClipVertex, ["__proto_Features"]=__proto_Features, ["__proto_b2AABB"]=__proto_b2AABB, ["__proto_b2Body"]=__proto_b2Body, ["__proto_b2BodyDef"]=__proto_b2BodyDef, ["__proto_b2Bound"]=__proto_b2Bound, ["__proto_b2BoundValues"]=__proto_b2BoundValues, ["__proto_b2BuoyancyController"]=__proto_b2BuoyancyController, ["__proto_b2CircleContact"]=__proto_b2CircleContact, ["__proto_b2CircleShape"]=__proto_b2CircleShape, ["__proto_b2Color"]=__proto_b2Color, ["__proto_b2ConstantAccelController"]=__proto_b2ConstantAccelController, ["__proto_b2ConstantForceController"]=__proto_b2ConstantForceController, ["__proto_b2Contact"]=__proto_b2Contact, ["__proto_b2ContactConstraint"]=__proto_b2ContactConstraint, ["__proto_b2ContactConstraintPoint"]=__proto_b2ContactConstraintPoint, ["__proto_b2ContactEdge"]=__proto_b2ContactEdge, ["__proto_b2ContactFactory"]=__proto_b2ContactFactory, ["__proto_b2ContactFilter"]=__proto_b2ContactFilter, ["__proto_b2ContactID"]=__proto_b2ContactID, ["__proto_b2ContactImpulse"]=__proto_b2ContactImpulse, ["__proto_b2ContactListener"]=__proto_b2ContactListener, ["__proto_b2ContactManager"]=__proto_b2ContactManager, ["__proto_b2ContactPoint"]=__proto_b2ContactPoint, ["__proto_b2ContactRegister"]=__proto_b2ContactRegister, ["__proto_b2ContactResult"]=__proto_b2ContactResult, ["__proto_b2ContactSolver"]=__proto_b2ContactSolver, ["__proto_b2Controller"]=__proto_b2Controller, ["__proto_b2ControllerEdge"]=__proto_b2ControllerEdge, ["__proto_b2DebugDraw"]=__proto_b2DebugDraw, ["__proto_b2DestructionListener"]=__proto_b2DestructionListener, ["__proto_b2DistanceInput"]=__proto_b2DistanceInput, ["__proto_b2DistanceJoint"]=__proto_b2DistanceJoint, ["__proto_b2DistanceJointDef"]=__proto_b2DistanceJointDef, ["__proto_b2DistanceOutput"]=__proto_b2DistanceOutput, ["__proto_b2DistanceProxy"]=__proto_b2DistanceProxy, ["__proto_b2DynamicTree"]=__proto_b2DynamicTree, ["__proto_b2DynamicTreeBroadPhase"]=__proto_b2DynamicTreeBroadPhase, ["__proto_b2DynamicTreeNode"]=__proto_b2DynamicTreeNode, ["__proto_b2DynamicTreePair"]=__proto_b2DynamicTreePair, ["__proto_b2EdgeAndCircleContact"]=__proto_b2EdgeAndCircleContact, ["__proto_b2EdgeChainDef"]=__proto_b2EdgeChainDef, ["__proto_b2EdgeShape"]=__proto_b2EdgeShape, ["__proto_b2FilterData"]=__proto_b2FilterData, ["__proto_b2Fixture"]=__proto_b2Fixture, ["__proto_b2FixtureDef"]=__proto_b2FixtureDef, ["__proto_b2FrictionJoint"]=__proto_b2FrictionJoint, ["__proto_b2FrictionJointDef"]=__proto_b2FrictionJointDef, ["__proto_b2GearJoint"]=__proto_b2GearJoint, ["__proto_b2GearJointDef"]=__proto_b2GearJointDef, ["__proto_b2GravityController"]=__proto_b2GravityController, ["__proto_b2Island"]=__proto_b2Island, ["__proto_b2Jacobian"]=__proto_b2Jacobian, ["__proto_b2Joint"]=__proto_b2Joint, ["__proto_b2JointDef"]=__proto_b2JointDef, ["__proto_b2JointEdge"]=__proto_b2JointEdge, ["__proto_b2LineJoint"]=__proto_b2LineJoint, ["__proto_b2LineJointDef"]=__proto_b2LineJointDef, ["__proto_b2Manifold"]=__proto_b2Manifold, ["__proto_b2ManifoldPoint"]=__proto_b2ManifoldPoint, ["__proto_b2MassData"]=__proto_b2MassData, ["__proto_b2Mat22"]=__proto_b2Mat22, ["__proto_b2Mat33"]=__proto_b2Mat33, ["__proto_b2MouseJoint"]=__proto_b2MouseJoint, ["__proto_b2MouseJointDef"]=__proto_b2MouseJointDef, ["__proto_b2NullContact"]=__proto_b2NullContact, ["__proto_b2Point"]=__proto_b2Point, ["__proto_b2PolyAndCircleContact"]=__proto_b2PolyAndCircleContact, ["__proto_b2PolyAndEdgeContact"]=__proto_b2PolyAndEdgeContact, ["__proto_b2PolygonContact"]=__proto_b2PolygonContact, ["__proto_b2PolygonShape"]=__proto_b2PolygonShape, ["__proto_b2PositionSolverManifold"]=__proto_b2PositionSolverManifold, ["__proto_b2PrismaticJoint"]=__proto_b2PrismaticJoint, ["__proto_b2PrismaticJointDef"]=__proto_b2PrismaticJointDef, ["__proto_b2PulleyJoint"]=__proto_b2PulleyJoint, ["__proto_b2PulleyJointDef"]=__proto_b2PulleyJointDef, ["__proto_b2RayCastInput"]=__proto_b2RayCastInput, ["__proto_b2RayCastOutput"]=__proto_b2RayCastOutput, ["__proto_b2RevoluteJoint"]=__proto_b2RevoluteJoint, ["__proto_b2RevoluteJointDef"]=__proto_b2RevoluteJointDef, ["__proto_b2Segment"]=__proto_b2Segment, ["__proto_b2SeparationFunction"]=__proto_b2SeparationFunction, ["__proto_b2Shape"]=__proto_b2Shape, ["__proto_b2Simplex"]=__proto_b2Simplex, ["__proto_b2SimplexCache"]=__proto_b2SimplexCache, ["__proto_b2SimplexVertex"]=__proto_b2SimplexVertex, ["__proto_b2Sweep"]=__proto_b2Sweep, ["__proto_b2TOIInput"]=__proto_b2TOIInput, ["__proto_b2TensorDampingController"]=__proto_b2TensorDampingController, ["__proto_b2TimeStep"]=__proto_b2TimeStep, ["__proto_b2Transform"]=__proto_b2Transform, ["__proto_b2Vec2"]=__proto_b2Vec2, ["__proto_b2Vec3"]=__proto_b2Vec3, ["__proto_b2WeldJoint"]=__proto_b2WeldJoint, ["__proto_b2WeldJointDef"]=__proto_b2WeldJointDef, ["__proto_b2World"]=__proto_b2World, ["__proto_b2WorldManifold"]=__proto_b2WorldManifold, ["__static_ClipVertex"]=__static_ClipVertex, ["__static_Features"]=__static_Features, ["__static_Object"]=__static_Object, ["__static_a2j"]=__static_a2j, ["__static_b2AABB"]=__static_b2AABB, ["__static_b2Body"]=__static_b2Body, ["__static_b2BodyDef"]=__static_b2BodyDef, ["__static_b2Bound"]=__static_b2Bound, ["__static_b2BoundValues"]=__static_b2BoundValues, ["__static_b2BuoyancyController"]=__static_b2BuoyancyController, ["__static_b2CircleContact"]=__static_b2CircleContact, ["__static_b2CircleShape"]=__static_b2CircleShape, ["__static_b2Collision"]=__static_b2Collision, ["__static_b2Color"]=__static_b2Color, ["__static_b2ConstantAccelController"]=__static_b2ConstantAccelController, ["__static_b2ConstantForceController"]=__static_b2ConstantForceController, ["__static_b2Contact"]=__static_b2Contact, ["__static_b2ContactConstraint"]=__static_b2ContactConstraint, ["__static_b2ContactConstraintPoint"]=__static_b2ContactConstraintPoint, ["__static_b2ContactEdge"]=__static_b2ContactEdge, ["__static_b2ContactFactory"]=__static_b2ContactFactory, ["__static_b2ContactFilter"]=__static_b2ContactFilter, ["__static_b2ContactID"]=__static_b2ContactID, ["__static_b2ContactImpulse"]=__static_b2ContactImpulse, ["__static_b2ContactListener"]=__static_b2ContactListener, ["__static_b2ContactManager"]=__static_b2ContactManager, ["__static_b2ContactPoint"]=__static_b2ContactPoint, ["__static_b2ContactRegister"]=__static_b2ContactRegister, ["__static_b2ContactResult"]=__static_b2ContactResult, ["__static_b2ContactSolver"]=__static_b2ContactSolver, ["__static_b2Controller"]=__static_b2Controller, ["__static_b2ControllerEdge"]=__static_b2ControllerEdge, ["__static_b2DebugDraw"]=__static_b2DebugDraw, ["__static_b2DestructionListener"]=__static_b2DestructionListener, ["__static_b2Distance"]=__static_b2Distance, ["__static_b2DistanceInput"]=__static_b2DistanceInput, ["__static_b2DistanceJoint"]=__static_b2DistanceJoint, ["__static_b2DistanceJointDef"]=__static_b2DistanceJointDef, ["__static_b2DistanceOutput"]=__static_b2DistanceOutput, ["__static_b2DistanceProxy"]=__static_b2DistanceProxy, ["__static_b2DynamicTree"]=__static_b2DynamicTree, ["__static_b2DynamicTreeBroadPhase"]=__static_b2DynamicTreeBroadPhase, ["__static_b2DynamicTreeNode"]=__static_b2DynamicTreeNode, ["__static_b2DynamicTreePair"]=__static_b2DynamicTreePair, ["__static_b2EdgeAndCircleContact"]=__static_b2EdgeAndCircleContact, ["__static_b2EdgeChainDef"]=__static_b2EdgeChainDef, ["__static_b2EdgeShape"]=__static_b2EdgeShape, ["__static_b2FilterData"]=__static_b2FilterData, ["__static_b2Fixture"]=__static_b2Fixture, ["__static_b2FixtureDef"]=__static_b2FixtureDef, ["__static_b2FrictionJoint"]=__static_b2FrictionJoint, ["__static_b2FrictionJointDef"]=__static_b2FrictionJointDef, ["__static_b2GearJoint"]=__static_b2GearJoint, ["__static_b2GearJointDef"]=__static_b2GearJointDef, ["__static_b2GravityController"]=__static_b2GravityController, ["__static_b2Island"]=__static_b2Island, ["__static_b2Jacobian"]=__static_b2Jacobian, ["__static_b2Joint"]=__static_b2Joint, ["__static_b2JointDef"]=__static_b2JointDef, ["__static_b2JointEdge"]=__static_b2JointEdge, ["__static_b2LineJoint"]=__static_b2LineJoint, ["__static_b2LineJointDef"]=__static_b2LineJointDef, ["__static_b2Manifold"]=__static_b2Manifold, ["__static_b2ManifoldPoint"]=__static_b2ManifoldPoint, ["__static_b2MassData"]=__static_b2MassData, ["__static_b2Mat22"]=__static_b2Mat22, ["__static_b2Mat33"]=__static_b2Mat33, ["__static_b2Math"]=__static_b2Math, ["__static_b2MouseJoint"]=__static_b2MouseJoint, ["__static_b2MouseJointDef"]=__static_b2MouseJointDef, ["__static_b2NullContact"]=__static_b2NullContact, ["__static_b2Point"]=__static_b2Point, ["__static_b2PolyAndCircleContact"]=__static_b2PolyAndCircleContact, ["__static_b2PolyAndEdgeContact"]=__static_b2PolyAndEdgeContact, ["__static_b2PolygonContact"]=__static_b2PolygonContact, ["__static_b2PolygonShape"]=__static_b2PolygonShape, ["__static_b2PositionSolverManifold"]=__static_b2PositionSolverManifold, ["__static_b2PrismaticJoint"]=__static_b2PrismaticJoint, ["__static_b2PrismaticJointDef"]=__static_b2PrismaticJointDef, ["__static_b2PulleyJoint"]=__static_b2PulleyJoint, ["__static_b2PulleyJointDef"]=__static_b2PulleyJointDef, ["__static_b2RayCastInput"]=__static_b2RayCastInput, ["__static_b2RayCastOutput"]=__static_b2RayCastOutput, ["__static_b2RevoluteJoint"]=__static_b2RevoluteJoint, ["__static_b2RevoluteJointDef"]=__static_b2RevoluteJointDef, ["__static_b2Segment"]=__static_b2Segment, ["__static_b2SeparationFunction"]=__static_b2SeparationFunction, ["__static_b2Settings"]=__static_b2Settings, ["__static_b2Shape"]=__static_b2Shape, ["__static_b2Simplex"]=__static_b2Simplex, ["__static_b2SimplexCache"]=__static_b2SimplexCache, ["__static_b2SimplexVertex"]=__static_b2SimplexVertex, ["__static_b2Sweep"]=__static_b2Sweep, ["__static_b2TOIInput"]=__static_b2TOIInput, ["__static_b2TensorDampingController"]=__static_b2TensorDampingController, ["__static_b2TimeOfImpact"]=__static_b2TimeOfImpact, ["__static_b2TimeStep"]=__static_b2TimeStep, ["__static_b2Transform"]=__static_b2Transform, ["__static_b2Vec2"]=__static_b2Vec2, ["__static_b2Vec3"]=__static_b2Vec3, ["__static_b2WeldJoint"]=__static_b2WeldJoint, ["__static_b2WeldJointDef"]=__static_b2WeldJointDef, ["__static_b2World"]=__static_b2World, ["__static_b2WorldManifold"]=__static_b2WorldManifold, ["__throw"]=__throw, ["a2j"]=a2j, ["b2AABB"]=b2AABB, ["b2Body"]=b2Body, ["b2BodyDef"]=b2BodyDef, ["b2Bound"]=b2Bound, ["b2BoundValues"]=b2BoundValues, ["b2BuoyancyController"]=b2BuoyancyController, ["b2CircleContact"]=b2CircleContact, ["b2CircleShape"]=b2CircleShape, ["b2Collision"]=b2Collision, ["b2Color"]=b2Color, ["b2ConstantAccelController"]=b2ConstantAccelController, ["b2ConstantForceController"]=b2ConstantForceController, ["b2Contact"]=b2Contact, ["b2ContactConstraint"]=b2ContactConstraint, ["b2ContactConstraintPoint"]=b2ContactConstraintPoint, ["b2ContactEdge"]=b2ContactEdge, ["b2ContactFactory"]=b2ContactFactory, ["b2ContactFilter"]=b2ContactFilter, ["b2ContactID"]=b2ContactID, ["b2ContactImpulse"]=b2ContactImpulse, ["b2ContactListener"]=b2ContactListener, ["b2ContactManager"]=b2ContactManager, ["b2ContactPoint"]=b2ContactPoint, ["b2ContactRegister"]=b2ContactRegister, ["b2ContactResult"]=b2ContactResult, ["b2ContactSolver"]=b2ContactSolver, ["b2Controller"]=b2Controller, ["b2ControllerEdge"]=b2ControllerEdge, ["b2DebugDraw"]=b2DebugDraw, ["b2DestructionListener"]=b2DestructionListener, ["b2Distance"]=b2Distance, ["b2DistanceInput"]=b2DistanceInput, ["b2DistanceJoint"]=b2DistanceJoint, ["b2DistanceJointDef"]=b2DistanceJointDef, ["b2DistanceOutput"]=b2DistanceOutput, ["b2DistanceProxy"]=b2DistanceProxy, ["b2DynamicTree"]=b2DynamicTree, ["b2DynamicTreeBroadPhase"]=b2DynamicTreeBroadPhase, ["b2DynamicTreeNode"]=b2DynamicTreeNode, ["b2DynamicTreePair"]=b2DynamicTreePair, ["b2EdgeAndCircleContact"]=b2EdgeAndCircleContact, ["b2EdgeChainDef"]=b2EdgeChainDef, ["b2EdgeShape"]=b2EdgeShape, ["b2FilterData"]=b2FilterData, ["b2Fixture"]=b2Fixture, ["b2FixtureDef"]=b2FixtureDef, ["b2FrictionJoint"]=b2FrictionJoint, ["b2FrictionJointDef"]=b2FrictionJointDef, ["b2GearJoint"]=b2GearJoint, ["b2GearJointDef"]=b2GearJointDef, ["b2GravityController"]=b2GravityController, ["b2Island"]=b2Island, ["b2Jacobian"]=b2Jacobian, ["b2Joint"]=b2Joint, ["b2JointDef"]=b2JointDef, ["b2JointEdge"]=b2JointEdge, ["b2LineJoint"]=b2LineJoint, ["b2LineJointDef"]=b2LineJointDef, ["b2Manifold"]=b2Manifold, ["b2ManifoldPoint"]=b2ManifoldPoint, ["b2MassData"]=b2MassData, ["b2Mat22"]=b2Mat22, ["b2Mat33"]=b2Mat33, ["b2Math"]=b2Math, ["b2MouseJoint"]=b2MouseJoint, ["b2MouseJointDef"]=b2MouseJointDef, ["b2NullContact"]=b2NullContact, ["b2Point"]=b2Point, ["b2PolyAndCircleContact"]=b2PolyAndCircleContact, ["b2PolyAndEdgeContact"]=b2PolyAndEdgeContact, ["b2PolygonContact"]=b2PolygonContact, ["b2PolygonShape"]=b2PolygonShape, ["b2PositionSolverManifold"]=b2PositionSolverManifold, ["b2PrismaticJoint"]=b2PrismaticJoint, ["b2PrismaticJointDef"]=b2PrismaticJointDef, ["b2PulleyJoint"]=b2PulleyJoint, ["b2PulleyJointDef"]=b2PulleyJointDef, ["b2RayCastInput"]=b2RayCastInput, ["b2RayCastOutput"]=b2RayCastOutput, ["b2RevoluteJoint"]=b2RevoluteJoint, ["b2RevoluteJointDef"]=b2RevoluteJointDef, ["b2Segment"]=b2Segment, ["b2SeparationFunction"]=b2SeparationFunction, ["b2Settings"]=b2Settings, ["b2Shape"]=b2Shape, ["b2Simplex"]=b2Simplex, ["b2SimplexCache"]=b2SimplexCache, ["b2SimplexVertex"]=b2SimplexVertex, ["b2Sweep"]=b2Sweep, ["b2TOIInput"]=b2TOIInput, ["b2TensorDampingController"]=b2TensorDampingController, ["b2TimeOfImpact"]=b2TimeOfImpact, ["b2TimeStep"]=b2TimeStep, ["b2Transform"]=b2Transform, ["b2Vec2"]=b2Vec2, ["b2Vec3"]=b2Vec3, ["b2WeldJoint"]=b2WeldJoint, ["b2WeldJointDef"]=b2WeldJointDef, ["b2World"]=b2World, ["b2WorldManifold"]=b2WorldManifold, ["i"]=i}
end);
__Oak_Import_Aliases = {};
return __oak_module_import('/home/user/box2d-lua/oak/box2d.oak')
end)()

