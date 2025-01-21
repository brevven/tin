-- Aluminum smelting

local util = require("data-util");
local futil = require("util");

if (not mods["pyrawores"] and not mods["bobplates"] and not mods["angelssmelting"] ) then
data:extend({
  {
    type = "recipe",
    name = "tin-plate",
    category = "smelting",
    order = "d[tin-plate]",
    icons = (mods["Krastorio2"] and
        {
          { icon = "__bztin__/graphics/icons/tin-plate.png", icon_size = 128},
          { icon = "__bztin__/graphics/icons/tin-ore.png", icon_size = 64, scale=0.125, shift= {-8, -8}},
        } or {
          { icon = "__bztin__/graphics/icons/tin-plate.png", icon_size = 128},
        }
),
    -- (mods["Krastorio2"] and
    --    {
    --      main_product = "tin-plate",
    --      enabled = true,
    --      energy_required = 12,
    --      ingredients = {{"tin-ore", 10}},
    --      results = {
    --        {type="item", name = "tin-plate", amount=5}
    --      }
    --    } or
          main_product = "tin-plate",
          enabled = true,
          energy_required = 2.4,
          ingredients = {util.item("tin-ore", 1)},
          results = {
            {type="item", name = "tin-plate", amount=1}
          },
    -- expensive =
    -- {
    --   main_product = "tin-plate",
    --   enabled = true,
    --   energy_required = 4.8,
    --   ingredients = {{"tin-ore", 1}},
    --   results = {
    --     {type="item", name = "tin-plate", amount=1},
    --   }
    -- }
  },
  {
    type = "item",
    name = "tin-plate",
    icon = "__bztin__/graphics/icons/tin-plate.png",
    icon_size = 128,
    subgroup = "raw-material",
    order = "b[tin-plate]",
    stack_size = util.get_stack_size(100),
    weight = 1*kg,
  },
})

local solder_ingredients = {util.item("tin-plate", 4), util.item("copper-plate", 1)}
local solder_casting = {util.fluid("molten-tin", 40), util.fluid("molten-copper", 10)}
if mods.bzlead then
  solder_ingredients = {util.item("tin-plate", 3), util.item("lead-plate", 2)}
  solder_casting = {util.fluid("molten-tin", 30), util.fluid("molten-lead", 20)}
end
data:extend({
  {
    type = "item",
    name = "solder",
    icon = "__bztin__/graphics/icons/solder.png",
    icon_size = 128,
    subgroup = "intermediate-product",
    order = "b[solder]",
    stack_size = util.get_stack_size(100),
    weight = 1*kg,
  },
  {
    type = "recipe",
    name = "solder",
    category = mods["space-age"] and "electronics" or "crafting",
    order = "d[solder]",
    enabled = true,
    energy_required = 1,
    ingredients = solder_ingredients, 
    results = {util.item("solder", 4)},
  }
})

if mods["space-age"] then
data:extend({
  {
    type = "recipe",
    name = "casting-solder",
    category = "metallurgy",
    subgroup = "vulcanus-processes",
    order = "z[casting]-d[casting-solder]",
    icons = {
      {icon = "__bztin__/graphics/icons/solder.png", icon_size = 128, shift={-4,4}},
      {icon = "__bztin__/graphics/icons/molten-tin-sa.png", icon_size = 64, shift={4,-4}},
    },
    enabled = false,
    ingredients = solder_casting,
    energy_required = 10,
    allow_decomposition = false,
    results = {{type = "item", name = "solder", amount = 40}},
    allow_productivity = true
  },
  {
    type = "item-subgroup",
    name = "alloy-separation",
    group = "intermediate-products",
  },
  {
    type = "technology",
    name = "alloy-separation",
    icons = {
      {icon = "__bztin__/graphics/icons/solder.png", icon_size = 128, scale = 0.33, shift = {0,-6}},
      {icon = "__bztin__/graphics/icons/tin-plate.png", icon_size = 128, scale = 0.25, shift = {-6,4}},
      mods.bzlead and {icon = "__bzlead__/graphics/icons/lead-plate.png", icon_size = 64, scale = 0.5, shift = {6,4}} or
      {icon = "__base__/graphics/icons/copper-plate.png", icon_size = 64, scale = 0.5, shift = {6,4}},
    },
    effects = {},
    prerequisites = {"metallurgic-science-pack", "electromagnetic-science-pack"},
    unit = {
      count = 250, time = 30,
      ingredients = {
        {"chemical-science-pack", 1},
        {"electromagnetic-science-pack", 1},
        {"metallurgic-science-pack", 1},
      }
    }
  },
})
util.add_effect("foundry", { type = "unlock-recipe", recipe = "casting-solder" })
end
if mods.bzaluminum and not mods.bzlead then
  data:extend({
  {
    type = "technology",
    name = "solder",
    icon = "__bztin__/graphics/icons/solder.png",
    icon_size = 128,
    effects = {
      { type = "unlock-recipe", recipe = "solder" },
    },
    unit = {
      count = 10, time = 15,
      ingredients = {{"automation-science-pack", 1}},
    },
    prerequisites = {"copper-processing"},
  },
  })
  util.add_unlock_force("solder", "solder")
  util.add_prerequisite("electronics", "solder")
  if mods["aai-industry"] or mods.Krastorio2 then
    util.add_prerequisite("basic-fluid-handling", "solder")
    util.add_prerequisite("kr-basic-fluid-handling", "solder")
  else
    util.add_unlock_force("solder", "pipe-to-ground")
  end
  if mods.Krastorio2 then
    util.set_tech_recipe("solder", {{"basic-tech-card", 1}})
  end
end

data:extend({
  {
    type = "fluid",
    name = "organotins",
    subgroup = "fluid",
    default_temperature = 25,
    heat_capacity = "0.1kJ",
    base_color = {r=0.75, g=0.65, b=0.1},
    flow_color = {r=0.7, g=1, b=0.1},
    icon = "__bztin__/graphics/icons/organotins.png",
    icon_size = 64,
    order = "a[fluid]-f[organotins]"
  },
  {
    type = "recipe",
    name = "organotins",
    category = "chemistry",
    subgroup = "fluid-recipes",
    order = "h[organotins]",
    enabled = false,
    energy_required = 5,
    ingredients = {util.item("tin-plate", 3), {type="fluid", name="petroleum-gas", amount=20}},
    results = {{type="fluid", name="organotins", amount=50}},
    crafting_machine_tint = {
      primary = {r = 1.000, g = 0.995, b = 0.089, a = 1.000}, 
      secondary = {r = 1.000, g = 0.975, b = 0.890, a = 1.000}, 
      tertiary = {r = 0.825, g = 0.740, b = 0.810, a = 1.000}, 
      quaternary = {r = 0.950, g = 1.000, b = 0.350, a = 1.000}, 
    }
  },
  {
    type = "technology",
    name = "organotin-chemistry",
    icon = "__bztin__/graphics/technology/organotins.png",
    icon_size = 256,
    effects = {
      { type = "unlock-recipe", recipe = "organotins" },
    },
    unit = {
      count = 50, time = 30,
      ingredients = {{"automation-science-pack", 1}, {"logistic-science-pack", 1}},
    },
    prerequisites = {"oil-processing"},
    order = "b-b",
  },
})

util.add_prerequisite("plastics", "organotin-chemistry")

if util.me.use_cable() then
data:extend({
  {
    type = "item",
    name = "tinned-cable",
    icon = "__bztin__/graphics/icons/tinned-cable.png",
    icon_size = 64, icon_mipmaps = 4,
    subgroup = util.cablesg,
    order = "b[tinned-cable]",
    stack_size = util.get_stack_size(100),
    weight = 1*kg,
  },
  {
    type = "recipe",
    name = "tinned-cable",
    category = "crafting",
    order = "d[tinned-cable]",
    enabled = false,
    energy_required = 1.5,
    ingredients = {util.item("tin-plate", 1), util.item("copper-cable", 8)},
    results = {util.item("tinned-cable", 8)},
  },
  {
    type = "technology",
    name = "tinned-cable",
    icon = "__bztin__/graphics/icons/tinned-cable.png",
    icon_size = 64, icon_mipmaps = 4,
    effects = {
      { type = "unlock-recipe", recipe = "tinned-cable" },
    },
    unit = {
      count = 50, time = 15,
      ingredients = {{"automation-science-pack", 1}, {"logistic-science-pack", 1}},
    },
    prerequisites = {"logistic-science-pack"},
    order = "b-b",
  },
})
util.add_prerequisite("tinned-cable", "copper-processing")
end

if util.me.use_bronze() then
local bronze_i = {}
bronze_i["copper-plate"] = 17
bronze_i["tin-plate"] = 3
 
data:extend({
  {
    type = "item",
    name = "bronze-plate",
    icon = "__bztin__/graphics/icons/bronze-plate.png",
    icon_size = 128,
    subgroup = "intermediate-product",
    order = "b[bronze-plate]",
    stack_size = util.get_stack_size(100),
    weight = 1*kg,
  },
  {
    type = "recipe",
    name = "bronze-plate",
    category = "advanced-crafting",
    order = "d[bronze-plate]",
    enabled = false,
    energy_required = 60,
    ingredients = {},
    results = {util.item("bronze-plate", 20)},
  },
})
for item, count in pairs(bronze_i) do
  util.add_ingredient("bronze-plate", item, count, {force=true})
end
if mods.bzfoundry and data.raw.item["foundry"] then
  util.add_effect("foundry", { type = "unlock-recipe", recipe = "bronze-plate" })
  util.add_prerequisite("fast-inserter", "foundry")
  util.set_to_founding("bronze-plate", {force=true})
elseif mods["space-age"] then
data:extend({
  {
    type = "recipe",
    name = "casting-bronze",
    category = "metallurgy",
    subgroup = "vulcanus-processes",
    order = "b[casting]-d[casting-tin-bronze]",
    icons = {
      {icon = "__bztin__/graphics/icons/bronze-plate.png", icon_size = 128, shift={-4,4}},
      {icon = "__space-age__/graphics/icons/fluid/molten-copper.png", icon_size = 64, shift={4,-4}},
    },
    enabled = false,
    ingredients =
    {
      {type = "fluid", name = "molten-copper", amount = bronze_i["copper-plate"], fluidbox_multiplier = 10},
      {type = "fluid", name = "molten-tin", amount = bronze_i["tin-plate"], fluidbox_multiplier = 10},
    },
    energy_required = 2.4,
    allow_decomposition = false,
    results = {{type = "item", name = "bronze-plate", amount = 2}},
    allow_productivity = true
  },
})
util.add_effect("foundry", { type = "unlock-recipe", recipe = "casting-bronze" })
util.add_effect("automation", { type = "unlock-recipe", recipe = "bronze-plate" })
else
  util.add_effect("automation", { type = "unlock-recipe", recipe = "bronze-plate" })
end
end
if mods["space-age"] then
data:extend({
  {
    type = "fluid",
    name = "tin-sulfides",
    icons = {{ icon="__base__/graphics/icons/fluid/steam.png", icon_size=64, tint={r=.9, g=.9, b=.1, a=.7}}},
    subgroup = "fluid",
    order = "b[new-fluid]-b[vulcanus]-t[tin-sulfides]",
    default_temperature = 315,
    max_temperature = 2000,
    gas_temperature = 300,
    heat_capacity = ".1kJ",
    base_color = {1,1,0},
    flow_color = {.95,.99,.1},
  },
  {
    type = "recipe",
    name = "tin-sulfides",
    subgroup = "vulcanus-processes",
    category = "chemistry",
    main_product = "tin-sulfides",
    enabled = false,
    allow_productivity = true,
    energy_required = 1,
    ingredients = {
      util.fluid("steam", 10),
      util.fluid("sulfuric-acid", 20),
    },
    results = {
      util.fluid("tin-sulfides", 20),
      util.fluid("sulfuric-acid", 10),
    },
    surface_conditions =
    {
      {
        property = "pressure",
        min = 4000,
        max = 4000
      }
    },
  },
  {
    type = "recipe",
    name = "tin-sulfide-processing",
    subgroup = "vulcanus-processes",
    category = "chemistry",
    main_product = "tin-ore",
    enabled = false,
    allow_productivity = true,
    energy_required = 2,
    icons = {
      { icon="__bztin__/graphics/icons/tin-ore.png", icon_size=64},
      { icon="__base__/graphics/icons/fluid/steam.png", icon_size=64, tint={r=.9, g=.9, b=.1, a=.7}, scale=0.5, shift={-8,-8}},
    },
    ingredients = mods.bztitanium and {
      util.fluid("tin-sulfides", 40),
      util.fluid("vacuum", 1),
    } or {
      util.fluid("tin-sulfides", 40),
    },
    results = {
      util.item("tin-ore", 2),
      util.item("sulfur", 1),
    }
  },
  {
    type = "fluid",
    name = "molten-tin",
    icon = "__bztin__/graphics/icons/molten-tin-sa.png",
    subgroup = "fluid",
    order = "b[new-fluid]-b[vulcanus]-d[molten-tin]",
    default_temperature = 1500,
    max_temperature = 2000,
    heat_capacity = "0.01kJ",
    base_color = {.6, 0.4, 0.23},
    flow_color = {0.6, 0.4, 0.23},
    auto_barrel = false
  },
  {
    type = "recipe",
    name = "molten-tin",
    category = "metallurgy",
    subgroup = "vulcanus-processes",
    order = "a[melting]-d[molten-tin]",
    auto_recycle = false,
    enabled = false,
    ingredients =
    {
      {type = "item", name = "tin-ore", amount = 100},
      {type = "item", name = "calcite", amount = 1},
    },
    energy_required = 48,
    results = {{type = "fluid", name = "molten-tin", amount = 1000}},
    allow_productivity = true,
    hide_from_signal_gui = false,
    main_product =  "molten-tin",
  },
  {
    type = "recipe",
    name = "casting-tin",
    category = "metallurgy",
    subgroup = "vulcanus-processes",
    order = "b[casting]-d[casting-tin]",
    icons = {
      {icon = "__bztin__/graphics/icons/tin-plate.png", icon_size = 128, shift={-4,4}},
      {icon = "__bztin__/graphics/icons/molten-tin-sa.png", icon_size = 64, shift={4,-4}},
    },
    enabled = false,
    ingredients =
    {
      {type = "fluid", name = "molten-tin", amount = 20, fluidbox_multiplier = 10},
    },
    energy_required = 2.4,
    allow_decomposition = false,
    results = {{type = "item", name = "tin-plate", amount = 2}},
    allow_productivity = true
  },
  
})
util.add_unlock("foundry", "casting-tin")
util.add_unlock("foundry", "molten-tin")
util.add_unlock("foundry", "tin-sulfides")
util.add_unlock("foundry", "tin-sulfide-processing")
local space_age_item_sounds = require("__space-age__.prototypes.item_sounds")

data:extend({
  {
    type = "item",
    name = "jellyskin",
    icon = "__bztin__/graphics/icons/jellyskin.png",
    icon_size = 64,
    subgroup = "agriculture-processes",
    order = "b[agriulture]-d[tin]",
    stack_size = util.get_stack_size(100),
    spoil_result = "spoilage",
    spoil_ticks = 54000,
    fuel_category = "chemical",
    fuel_value = "1MJ",
    inventory_move_sound = space_age_item_sounds.agriculture_inventory_move,
    pick_sound = space_age_item_sounds.agriculture_inventory_pickup,
    drop_sound = space_age_item_sounds.agriculture_inventory_move,
    stack_size = 100,
    default_import_location = "gleba",
    weight = 1*kg,
  },
  {
    type = "recipe",
    name = "jellyskin-processing",
    category = "organic",
    subgroup = "agriculture-processes",
    order = "e[agriculture]-a[tin]",
    icons = {
      {icon = "__bztin__/graphics/icons/organotins.png", icon_size = 64},
      {icon = "__bztin__/graphics/icons/jellyskin.png", icon_size=64, shift={0,-8}},
    },
    enabled = false,
    allow_productivity = true,
    ingredients =
    {
      util.item("jellyskin", 1),
    },
    energy_required = 8/3,
    allow_decomposition = false,
    results = {
      util.fluid("organotins", 100),
    },
    main_product="organotins",
  },
  {
    type = "recipe",
    name = "tin-from-organotins",
    category = "organic",
    subgroup = "agriculture-processes",
    order = "e[agriculture]-a[tin]",
    icons = {
      {icon = "__bztin__/graphics/icons/organotins.png", icon_size = 64},
      {icon = "__bztin__/graphics/icons/tin-ore.png", icon_size=64, scale=0.333, shift={0,8}},
    },
    enabled = false,
    allow_productivity = true,
    ingredients =
    {
      util.fluid("organotins", 100),
      util.item("pentapod-egg"),
    },
    energy_required = 16/3,
    allow_decomposition = false,
    results = {
      util.item("tin-ore", 6),
    },
    main_product="tin-ore",
  },

})
util.add_product("jellynut-processing", util.item("jellyskin", 1, .25))
util.add_ingredient("bioplastic", "organotins", 7.5)
util.set_icons("bioplastic", {
  {icon = "__space-age__/graphics/icons/bioplastic.png", icon_size = 64},
  {icon = "__bztin__/graphics/icons/organotins.png", icon_size = 64, scale=.25, shift={0,-8}},
})
util.add_unlock("biochamber", "jellyskin-processing")
util.add_unlock("biochamber", "tin-from-organotins")
end

if mods["planet-muluna"] then -- moon where you get resources from crushing on the surface
data:extend({
  {
    type = "recipe",
    name = "metallic-asteroid-crushing-tin",
    icons =  {
      {icon = "__space-age__/graphics/icons/metallic-asteroid-crushing.png", icon_size=64},
      {icon="__bztin__/graphics/icons/tin-ore.png", icon_size=64, scale =0.25, shift = {0,4}},
    },
    category = "crushing",
    subgroup="space-crushing",
    order = "b-a-a",
    auto_recycle = false,
    enabled = false,
    ingredients =
    {
      {type = "item", name = "metallic-asteroid-chunk", amount = 1},
    },
    energy_required = 2,
    results =
    {
      {type = "item", name = "tin-ore", amount = 15},
      {type = "item", name = "metallic-asteroid-chunk", amount = 1, probability = 0.2}
    },
    allow_productivity = true,
    allow_decomposition = false
  },
})
util.add_unlock("space-platform-thruster", "metallic-asteroid-crushing-tin")
end
end
