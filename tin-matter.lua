-- Matter recipes for Krastorio2
-- removed the use of the lib function, K2 function is not universal anymore
-- if mods["Krastorio2"] then
--   local util = require("data-util");
--   util.k2matter({
--     k2matter = {
--       item_name = "tin-ore",
--       matter_value = 5,
--       energy_required = 1,
--       need_stabilizer = false,
--       unlocked_by_technology = "tin-matter-processing",
--     },
--     k2baseicon = "stone",
--     icon = { icon = "__bztin__/graphics/icons/tin-ore.png", icon_size = 64, scale = 1.4}
--   })

--   util.k2matter({
--     k2matter = {
--       item_name = "tin-plate",
--       minimum_conversion_quantity = 10,
--       matter_value = 10,
--       energy_required = 3,
--       only_deconversion = true,
--       need_stabilizer = true,
--       unlocked_by_technology = "tin-matter-processing",
--     },
--   })
-- end

if mods["Krastorio2"] then
  local util = require("__bztin__.data-util");
  local matter = require("__Krastorio2__/prototypes/libraries/matter")
  
  data:extend(
  {
    {
      type = "technology",
      name = "tin-matter-processing",
      icons =
      {
        {
          icon = util.k2assets().."/technologies/backgrounds/matter.png",
          icon_size = 256,
        },
        {
          icon = "__bztin__/graphics/icons/tin-ore.png",
          icon_size = 64,
          scale = 0.9,
        }
      },
      prerequisites = {"kr-matter-processing"},
      unit =
      {
        count = 350,
        ingredients =
        {
          {"production-science-pack", 1},
          {"utility-science-pack", 1},
          {"kr-matter-tech-card", 1}
        },
        time = 45
      },
      effects = {}
    },
  })
  
  local tin_ore_matter = 
    {
      material = { type = "item", name = "tin-ore", amount = 10 },
      matter_count = 5,
      energy_required = 1,
      need_stabilizer = false,
      unlocked_by = "tin-matter-processing"
    }
  matter.make_recipes(tin_ore_matter)
  
  
  local tin_plate_matter = 
    {
      material = { type = "item", name = "tin-plate", amount = 10 },
      matter_count = 10,
      energy_required = 3,
      -- only_deconversion = true,
      need_stabilizer = true,
      unlocked_by = "tin-matter-processing"
    }
  matter.make_deconversion_recipe(tin_plate_matter)
  
  end
