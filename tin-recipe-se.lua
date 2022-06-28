-- Additional recipes if Space Exploration mod is enabled
local util = require("data-util");

if mods["space-exploration"] then
  se_delivery_cannon_recipes["tin-ore"] = {name= "tin-ore"}
  se_delivery_cannon_recipes["alumina"] = {name= "alumina"}
  se_delivery_cannon_recipes["tin-plate"] = {name= "tin-plate"}

  data:extend({
  {
    type = "recipe",
    icons = {
      { icon = "__base__/graphics/icons/landfill.png", icon_size = 64, icon_mipmaps = 3 },
      { icon = "__bztin__/graphics/icons/tin-ore.png", icon_size = 64, scale = 0.25},
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
    type = "recipe",
    icons = {
      { icon = "__base__/graphics/icons/landfill.png", icon_size = 64, icon_mipmaps = 3 },
      { icon = "__bztin__/graphics/icons/tin-ore.png", icon_size = 64, scale = 0.25},
    },
    name = "landfill-tin-ore",
    category = "hard-recycling",
    order = "z-b-tin",
    subgroup = "terrain",
    result = "landfill",
    ingredients = {{"tin-ore", 50}},
  }
  })

  if mods["Krastorio2"] then
    data:extend({
    {
      type = "recipe",
      name = "enriched-alumina-smelting-vulcanite",
      category = "smelting",
      order = "d[alumina]",
      energy_required = 24,
      enabled = false,
      always_show_made_in = true,
      allow_as_intermediate = false,
      ingredients = {
        {name = "enriched-tin", amount = 8},
        {name = "se-vulcanite-block", amount = 1},
      },
      results = {
        {name = "alumina", amount = 12},
      },
      icons =
      {
        { icon = "__bztin__/graphics/icons/alumina.png", icon_size = 128 },
        { icon = "__space-exploration-graphics__/graphics/icons/vulcanite-block.png", icon_size = 64, scale=0.25, shift= {-10, -10}},
      },
      
    },
    })
    table.insert(data.raw.technology["se-processing-vulcanite"].effects, 
        {type = "unlock-recipe", recipe= "enriched-alumina-smelting-vulcanite"})
    data.raw.recipe["enriched-alumina"].order= "d[alumina]"
    se_delivery_cannon_recipes["enriched-tin"] = {name= "enriched-tin"}
  else
    data:extend({
    {
      type = "recipe",
      name = "alumina-smelting-vulcanite",
      category = "smelting",
      subgroup = "plates",
      order = "d[alumina]",
      energy_required = 24,
      enabled = false,
      always_show_made_in = true,
      allow_as_intermediate = false,
      ingredients = {
        {name = "tin-ore", amount = 8},
        {name = "se-vulcanite-block", amount = 1},
      },
      results = {
        {name = "alumina", amount = 10},
        {name = "silica", amount = 2},
      },
      icons =
      {
        { icon = "__bztin__/graphics/icons/alumina.png", icon_size = 128},
        { icon = "__space-exploration-graphics__/graphics/icons/vulcanite-block.png", icon_size = 64, icon_mipmaps = 3, scale=0.25, shift= {-10, -10}},
      },

      
    },
    })
    table.insert(data.raw.technology["se-processing-vulcanite"].effects, 
        {type = "unlock-recipe", recipe= "alumina-smelting-vulcanite"})
  end
  data:extend({
    {
      type = "recipe",
      name = "tin-plate-smelting-vulcanite",
      category = "smelting",
      subgroup = "plates",
      order = "d[tin-plate]",
      energy_required = 24,
      enabled = false,
      always_show_made_in = true,
      allow_as_intermediate = false,
      ingredients = {
        {name = "alumina", amount = 8},
        {name = "se-vulcanite-block", amount = 1},
      },
      results = {
        {name = "tin-plate", amount = 12},
      },
      icons =
      {
        { icon = "__bztin__/graphics/icons/tin-plate.png", icon_size = 128},
        { icon = "__space-exploration-graphics__/graphics/icons/vulcanite-block.png", icon_size = 64, icon_mipmaps = 3, scale=0.25, shift= {-10, -10}},
      },


    },
  })
  table.insert(data.raw.technology["se-processing-vulcanite"].effects, 
               {type = "unlock-recipe", recipe= "tin-plate-smelting-vulcanite"})
end
