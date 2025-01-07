require("tin-recipe-updates")
require("tin-matter")
-- require("omni")
require("map-gen-preset-updates")
require("strange-matter")
require("compatibility/248k")
require("compatibility/sciencecosttweakerm")
require("compatibility/crafting-efficiency")

local util = require("data-util");

if mods.Asteroid_Mining then
  require("__Asteroid_Mining__.scripts.addmodule")
  amfunc.addtype("tin-ore", {a = 0,r = 0.55,g = 0.45,b = 0.3})
end
if mods["any-planet-start"] and util.me.get_setting("aps-planet") == "fulgora" then
  -- In order to craft the first recycler, if bronze is enabled
  util.add_product("scrap-recycling", util.item("bronze-plate", 1, 0.01))
  util.set_product_amount("recycler", "bronze-plate", 2)
end
util.redo_recycling()

-- Must be last
util.create_list()
