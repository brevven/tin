require("tin-recipe-updates")
require("tin-matter")
-- require("omni")
require("map-gen-preset-updates")
require("strange-matter")
require("compatibility/248k")
require("compatibility/sciencecosttweakerm")

local util = require("data-util");

if mods.Asteroid_Mining and not data.raw.item["asteroid-tin-ore"] then
  util.addtype("tin-ore", {a = 0,r = 0.55,g = 0.45,b = 0.3})
end

util.redo_recycling()

-- Helps with fulgora clean starts
util.add_minable_result("simple-entity", "fulgoran-ruin-vault", {type="item", name="bronze-plate", amount_min=79, amount_max=103})
util.add_minable_result("simple-entity", "fulgoran-ruin-colossal", {type="item", name="bronze-plate", amount_min=15, amount_max=41})
util.add_minable_result("simple-entity", "fulgoran-ruin-huge", {type="item", name="bronze-plate", amount_min=7, amount_max=31})
util.add_minable_result("simple-entity", "fulgoran-ruin-big", {type="item", name="bronze-plate", amount_min=7, amount_max=15})
util.add_minable_result("simple-entity", "fulgoran-ruin-stonehenge", {type="item", name="bronze-plate", amount_min=7, amount_max=13})
util.add_minable_result("simple-entity", "fulgoran-ruin-medium", {type="item", name="bronze-plate", amount_min=1, amount_max=7})
util.add_minable_result("simple-entity", "fulgoran-ruin-small", {type="item", name="bronze-plate", amount_min=0, amount_max=2})

util.add_minable_result("simple-entity", "fulgoran-ruin-vault", {type="item", name="lead-expansion-bolt", amount_min=69, amount_max=93})
util.add_minable_result("simple-entity", "fulgoran-ruin-colossal", {type="item", name="lead-expansion-bolt", amount_min=15, amount_max=25})
util.add_minable_result("simple-entity", "fulgoran-ruin-huge", {type="item", name="lead-expansion-bolt", amount_min=7, amount_max=17})
util.add_minable_result("simple-entity", "fulgoran-ruin-big", {type="item", name="lead-expansion-bolt", amount_min=3, amount_max=9})
util.add_minable_result("simple-entity", "fulgoran-ruin-stonehenge", {type="item", name="lead-expansion-bolt", amount_min=2, amount_max=6})
util.add_minable_result("simple-entity", "fulgoran-ruin-medium", {type="item", name="lead-expansion-bolt", amount_min=1, amount_max=3})
util.add_minable_result("simple-entity", "fulgoran-ruin-small", {type="item", name="lead-expansion-bolt", amount_min=0, amount_max=2})

util.add_minable_result("simple-entity", "big-fulgora-rock", {type="item", name="tin-ore", amount_min=10, amount_max=22})
util.add_minable_result("simple-entity", "big-fulgora-rock", {type="item", name="lead-ore", amount_min=10, amount_max=22})


util.add_shiftite_recipe("tin-plate", {"delta"}, 1)
-- Must be last
util.create_list()
