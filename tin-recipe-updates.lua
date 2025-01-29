local util = require("data-util");


-- Space Age

if mods.bzlead and data.raw.item["lead-expansion-bolt"] then
  util.replace_product("scrap-recycling", "lead-expansion-bolt", "solder")
else
  util.add_product("scrap-recycling", util.item("solder", 1, .01))
end

if mods["space-age"] then
  util.replace_product("scrap-recycling", "copper-cable", "tinned-cable")
  util.set_product_probability("scrap-recycling", "tinned-cable", 0.12)
  util.add_to_ingredient("tinned-cable", "tin-plate", 1)
end

if mods.bztitanium then
  util.replace_ingredient("superconductor", "titanium-plate", "tin-plate")
else
  util.add_ingredient("superconductor", "tin-plate", 1)
end


-- Main vanilla changes

local organotins_quant = mods.Krastorio2 and 10 or 5
util.replace_some_ingredient("plastic-bar", "petroleum-gas", organotins_quant, "organotins", organotins_quant)
util.add_ingredient("poison-capsule", "organotins", 10)
util.add_ingredient("slowdown-capsule", "organotins", 5)
util.set_category("poison-capsule", "crafting-with-fluid")
util.set_category("slowdown-capsule", "crafting-with-fluid")

util.replace_ingredient("pipe-to-ground", mods.bzlead and "lead-plate" or "iron-plate", "solder", 4)
util.remove_ingredient("chemical-plant", "tungsten-plate")   -- keep ingredients managable

util.replace_some_ingredient("advanced-circuit", "copper-cable", 1, "solder", 1)
util.add_ingredient("chemical-plant", "solder", 5)
util.add_ingredient("oil-refinery", "solder", 5)
util.add_ingredient("assembling-machine-2", "solder", 5)
util.add_ingredient("rocket-silo", "solder", 100)
util.add_ingredient("accumulator", "solder", 2)
util.add_ingredient("se-space-accumulator", "solder", 2)
util.add_ingredient("storage-tank", "solder", 4)
util.add_ingredient("kr-fluid-storage-1", "solder", 4)
util.add_ingredient("kr-fluid-storage-2", "solder", 12)
util.add_ingredient("substation", "solder", 2)
util.add_ingredient("kr-substation-mk2", "solder", 2)
util.add_ingredient("se-pylon-substation", "solder", 2)
util.add_ingredient("se-pylon", "solder", 2)
util.add_ingredient("se-holmium-solenoid", "solder", 2)

-- --  Elecrontics circuit recipes are updated in final fixes:
-- util.multiply_recipe("electronic-circuit", 2)
-- util.replace_some_ingredient("electronic-circuit", "copper-cable", 1, "solder", 1)
-- util.multiply_recipe("electronic-circuit-stone", 2)
-- util.replace_some_ingredient("electronic-circuit-stone", "copper-cable", 1, "solder", 1)

-- glass
if mods.Krastorio2 then
  util.replace_some_ingredient("glass", "sand", 1, "tin-plate", 1)
  util.add_product("glass", {type="item", name="tin-plate", amount=1, catalyst_amount=1, probability=0.8})
  util.set_main_product("glass", "glass")
else 
  if mods.bzfoundry then
    if not mods.bzaluminum then
      util.multiply_recipe("glass-from-sand", 4) -- aai
      util.multiply_recipe("sng-glass-plate", 4) -- sand and glass
    end

    -- aai
    util.replace_some_ingredient("glass-from-sand", "sand", 1, "tin-plate", 1)
    util.add_product("glass-from-sand", {type="item", name="tin-plate", amount=1, catalyst_amount=1, probability=0.8})
    util.set_main_product("glass-from-sand", "glass")
    util.set_category("glass-from-sand", "basic-founding")

    -- sand and glass
    util.replace_some_ingredient("sng-glass-plate", "sng-sand", 1, "tin-plate", 1)
    util.add_product("sng-glass-plate", {type="item", name="tin-plate", amount=1, catalyst_amount=1, probability=0.8})
    util.set_main_product("sng-glass-plate", "sng-glass-plate")
    util.set_category("sng-glass-plate", "basic-founding")
  end
end
-- -- NOTE: K2 seems to reset this recipe, so moved to final fixes:
-- util.replace_some_ingredient("se-glass-vulcanite", "sand", 1, "tin-plate", 1)
-- util.add_product("se-glass-vulcanite", {type="item", name="tin-plate", amount=1, probability=0.8})
-- util.set_main_product("se-glass-vulcanite", "glass")
--
-- 248k in /compatibility dir
-- end glass

util.add_ingredient("kr-fuel-refinery", "solder", 5)
util.add_ingredient("kr-electrolysis-plant", "solder", 10)
util.replace_some_ingredient("kr-steel-pipe-to-ground", "steel-plate", 3, "solder", 8)
util.replace_ingredient("kr-biomass-growing", "petroleum-gas", "organotins")


util.add_product("se-scrap-recycling", {type="item", name="tin-ore", amount=1, probability=0.05})
util.add_ingredient("se-experimental-alloys-data", "tin-plate", 1)
util.add_to_product("se-experimental-alloys-data", "se-experimental-alloys-data", 1)
util.add_to_product("se-experimental-alloys-data", "se-scrap", 1)
util.add_to_ingredient("se-experimental-alloys-data", "se-empty-data", 1)
util.add_ingredient("se-biochemical-data", "organotins", 10)
util.add_ingredient("se-corrosion-resistance-data", "tin-plate", 1)
util.replace_some_ingredient("se-superconductivity-data", "se-holmium-cable", 1, "tin-plate", 1)
util.replace_some_ingredient("se-superconductive-cable", "se-holmium-cable", 1, "tin-plate", 1)

util.add_ingredient("se-space-biochemical-laboratory", "solder", 8)
util.add_ingredient("se-decontamination-facility", "solder", 10)
util.add_ingredient("se-life-support-facility", "solder", 40)

util.multiply_recipe("lithium-sulfur-battery", 2)
util.replace_some_ingredient("lithium-sulfur-battery", "copper-plate", 1, "tin-plate", 1)

util.add_ingredient("roboport", "solder", 20)
util.add_ingredient("kr-large-roboport", "solder", 20)
util.add_ingredient("kr-small-roboport", "solder", 10)
util.add_ingredient("se-supercharger", "solder", 15)
util.add_ingredient("kr-filtration-plant", "solder", 4)
util.replace_some_ingredient("kr-shelter", "iron-plate", 10, "tin-plate", 10)


util.replace_some_ingredient("lab", "copper-plate", 5, "tin-plate", 5)
util.add_ingredient("lab", "tin-plate", 5)



if util.me.use_cable() then

  util.add_prerequisite("oil-gathering", "tinned-cable")
  util.add_ingredient("pumpjack", "tinned-cable", 5)

  util.remove_ingredient("se-delivery-cannon-capsule", "copper-cable") --10
  util.add_ingredient("se-delivery-cannon-capsule", "tinned-cable", 8)


  util.add_prerequisite("circuit-network", "tinned-cable")
  util.replace_ingredient("arithmetic-combinator", "copper-cable", "tinned-cable")
  util.replace_ingredient("decider-combinator", "copper-cable", "tinned-cable")
  util.replace_ingredient("constant-combinator", "copper-cable", "tinned-cable")
  util.replace_ingredient("power-switch", "copper-cable", "tinned-cable")
  util.replace_ingredient("programmable-speaker", "copper-cable", "tinned-cable")
  util.replace_ingredient("beacon", "copper-cable", "tinned-cable")

  local modded_combinators = {"timer-combinator", "counting-combinator", "random-combinator",
    "power-combinator", "max-combinator", "min-combinator", "and-gate-combinator",
    "nand-gate-combinator", "nor-gate-combinator", "not-gate-combinator", "or-gate-combinator",
    "xnor-gate-combinator", "xor-gate-combinator", "converter-combinator", "detector-combinator",
    "sensor-combinator", "railway-combinator", "color-combinator", "daytime-combinator",
    "statistic-combinator", "pollution-combinator", "emitter-combinator", "receiver-combinator",
    "crafting_combinator:crafting-combinator",
    "crafting_combinator:recipe-combinator",
    "clock-combinator",
    "power-meter-combinator",
    "ghost-scanner",
    "item-sensor",
    "bi-pollution-sensor",
  }
  for i, v in pairs(modded_combinators) do
    util.replace_ingredient(v, "copper-cable", "tinned-cable")
  end

  -- k2
  util.replace_ingredient("buisart-lab", "copper-cable", "tinned-cable")
  util.replace_ingredient("energy-absorber", "copper-cable", "tinned-cable")
end

if util.me.use_bronze() then
  util.add_ingredient("recycler", "bronze-plate", 10)
  util.add_ingredient("maraxsis-diesel-submarine", "bronze-plate", 10)
  util.add_ingredient("maraxsis-nuclear-submarine", "bronze-plate", 10)
  util.add_ingredient("maraxsis-salt-reactor", "bronze-plate", 10)
  util.add_ingredient("maraxsis-hydro-plant", "bronze-plate", 10)
  local fast_i = mods.bzaluminum and "aluminum-plate" or "iron-plate"
  util.replace_some_ingredient("fast-inserter", fast_i, 1, "bronze-plate", 1)
  if mods.Krastorio2 then
    util.replace_some_ingredient("filter-inserter", fast_i, 1, "bronze-plate", 1)
    util.replace_ingredient("kr-steel-pump", "steel-beam", "bronze-plate", 4)
  end

  util.replace_ingredient("pump", "steel-plate", "bronze-plate", 2)
  util.replace_ingredient("storage-tank", "steel-plate", "bronze-plate", 10)

  util.add_ingredient("electric-engine-unit", "bronze-plate", 1)

  util.replace_some_ingredient("se-heavy-bearing", "se-iridium-plate", 1, "bronze-plate", 1)

end


if mods.bztungsten and not mods.bzaluminum then
  util.replace_ingredient("small-lamp", "copper-cable", "tinned-cable")
  util.add_prerequisite("optics", "tinned-cable")
end

if mods.bobassembly then
  util.add_ingredient("steam-assembling-machine", "solder", 1)
  util.add_ingredient("fluid-furnace", "solder", 1)
  util.add_ingredient("chemical-plant-2", "solder", 1)
end

util.add_minable_result("simple-entity", "huge-volcanic-rock", {type="item", name="tin-ore", amount_min=5, amount_max=10})
util.add_gleba_rock("tin-ore")


-- Maraxsis
util.add_ingredient("maraxsis-glass-panes", "tin-plate", 1)
util.add_minable_result("simple-entity", "big-sand-rock-underwater", {type="item", name="tin-ore", amount_min=5, amount_max=10})
