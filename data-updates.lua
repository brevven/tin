require("tin-recipe-updates")
require("tin-matter")
-- require("omni")
require("map-gen-preset-updates")
require("strange-matter")
require("compatibility/248k")
require("compatibility/sciencecosttweakerm")

local util = require("data-util");

if mods.Asteroid_Mining then
  require("__Asteroid_Mining__.scripts.addmodule")
  amfunc.addtype("tin-ore", {a = 0,r = 0.55,g = 0.45,b = 0.3})
end

-- Must be last
util.create_list()
