-- Additional recipes if Space Exploration mod is enabled
local util = require("data-util");

if mods["space-exploration"] then
  se_delivery_cannon_recipes["tin-ore"] = {name= "tin-ore"}
  se_delivery_cannon_recipes[util.me.titanium_plate] = {name= util.me.titanium_plate}
  data:extend({
  {
    type = "recipe",
    icons = {
      { icon = "__base__/graphics/icons/landfill.png", icon_size = 64, icon_mipmaps = 3 },
      { icon = "__bztitanium__/graphics/icons/tin-ore.png", icon_size = 64, scale = 0.25},
    },
    name = "landfill-tin-ore",
    category = "hard-recycling",
    order = "z-b-tin",
    subgroup = "terrain",
    result = "landfill",
    ingredients = {{"tin-ore", 50}},
  }
  })

  data:extend({
  {
    type = "item-subgroup",
    name = "tin",
    group = "resources",
    order = "a-h-z-a",
  }
  })
  util.set_item_subgroup("tin-plate", "tin")
  data:extend({
  {
    type = "item",
    name = "tin-ingot",
    icons = {{icon = "__bztitanium__/graphics/icons/tin-ingot.png", icon_size = 128}},
    order = "b-b",
    stack_size = 50,
    subgroup = "tin",
  },
  {
    type = "fluid",
    name = "molten-tin",
    default_temperature = 232,
    max_temperature = 232,
    base_color = {r=191, g=219, b=233},
    flow_color = {r=191, g=219, b=233},
    icons = {{icon = "__bztitanium__/graphics/icons/molten-tin.png", icon_size = 128}},
    order = "a[molten]-a",
    pressure_to_speed_ratio = 0.4,
    flow_to_energy_ratio = 0.59,
    auto_barrel = false,
    subgroup = "fluid",
  },
  {
    type = "recipe",
    category = "smelting",
    name = "molten-tin",
    subgroup = "tin",
    results = {
      {type = "fluid", name = "molten-tin", amount = mods.Krastorio2 and 750 or 900},
    },
    energy_required = 60,
    ingredients = {
      {name = mods.Krastorio2 and "enriched-tin" or "tin-ore", amount = 24},
      {type = "fluid", name = "se-pyroflux", amount = 10},
    },
    enabled = false,
    always_show_made_in = true,
    allow_as_intermediate = false,
    order = "a-a"
  },
  {
    type = "recipe",
    name = "tin-ingot",
    category = "casting",
    results = {{"tin-ingot", 1}},
    energy_required = 18.75,
    ingredients = {
      {type = "fluid", name = "molten-tin", amount = 250},
    },
    enabled = false,
    always_show_made_in = true,
    allow_as_intermediate = false,
  },
  {
    type = "recipe",
    category = "crafting",
    name = "tin-ingot-to-plate",

    icons = {
      {icon = "__bztitanium__/graphics/icons/tin-plate.png", icon_size = 64, icon_mipmaps = 3},
      {icon = "__bztitanium__/graphics/icons/tin-ingot.png", icon_size = 128, scale = 0.25, shift = {-8, -8}},
    },
    results = {
      {name = "tin-plate", amount = 10},
    },
    energy_required = 3.75,
    ingredients = {
      {name = "tin-ingot", amount = 1}
    },
    enabled = false,
    always_show_made_in = true,
    allow_decomposition = false,
    order = "a-c-b"
  },
  })
  util.add_effect("se-vulcanite-smelting", {type = "unlock-recipe", recipe= "molten-tin"})
  util.add_effect("se-vulcanite-smelting", {type = "unlock-recipe", recipe= "tin-ingot"})
  util.add_effect("se-vulcanite-smelting", {type = "unlock-recipe", recipe= "tin-ingot-to-plate"})
  if mods["Krastorio2"] then
    data.raw.recipe["enriched-tin-plate"].order= "d[tin-plate]"
    se_delivery_cannon_recipes["enriched-tin"] = {name= "enriched-tin"}
  end
end
