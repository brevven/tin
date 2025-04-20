require("tin-recipe-updates")
require("tin-matter")
-- require("omni")
require("map-gen-preset-updates")
require("strange-matter")
require("compatibility/248k")
require("compatibility/sciencecosttweakerm")

require("ruins")
local util = require("data-util");

if mods.Asteroid_Mining and not data.raw.item["asteroid-tin-ore"] then
  util.addtype("tin-ore", {a = 0,r = 0.55,g = 0.45,b = 0.3})
end

util.redo_recycling()


util.add_shiftite_recipe("tin-plate", {"delta"}, 1)
-- Must be last
util.create_list()
