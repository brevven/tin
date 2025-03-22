local resource_autoplace = require('resource-autoplace');
local item_sounds = require('__base__.prototypes.item_sounds')
local util = require("data-util");

resource_autoplace.initialize_patch_set("tin-ore", true)
data.raw.planet.nauvis.map_gen_settings.autoplace_controls["tin-ore"] = {}
data.raw.planet.nauvis.map_gen_settings.autoplace_settings.entity.settings["tin-ore"] = {}
if mods.tenebris then
  data.raw.planet.tenebris.map_gen_settings.autoplace_controls["tin-ore"] = {}
  data.raw.planet.tenebris.map_gen_settings.autoplace_settings.entity.settings["tin-ore"] = {}
end

data:extend({
	{
    type = "autoplace-control",
    category = "resource",
    name = "tin-ore",
    richness = true,
    order = "a-t"
	},
	-- {
  --   type = "noise-layer",
  --   name = "tin-ore"
	-- },
	{
    type = "resource",
    icon_size = 64, icon_mipmaps = 3,
    name = "tin-ore",
    icon = "__bztin__/graphics/icons/tin-ore.png",
    flags = {"placeable-neutral"},
    order="a-b-a",
    map_color = {r=0.90, g=1.00, b=0.10},
    minable =
    {
      hardness = 1,
      mining_particle = "copper-ore-particle",
      mining_time = .75,
      result = "tin-ore"
    },
    collision_box = {{ -0.1, -0.1}, {0.1, 0.1}},
    selection_box = {{ -0.5, -0.5}, {0.5, 0.5}},

    autoplace = resource_autoplace.resource_autoplace_settings{
      name = "tin-ore",
      order = "a-t",
      base_density = 3,
      base_spots_per_km2 = 1,
      has_starting_area_placement = true,
      regular_rq_factor_multiplier = 1.0,
      starting_rq_factor_multiplier = 1.0,
    },

    stage_counts = {15000, 9500, 5500, 2900, 1300, 400, 150, 80},
    stages = {
      sheet = {
        filename = "__bztin__/graphics/entity/ores/hr-tin-ore.png",
        priority = "extra-high",
        size = 128,
        frame_count = 8,
        variation_count = 8,
        scale = 0.5
      }
    },
  },
  {
      type = "item",
      name = "tin-ore",
      icon_size = 64, icon_mipmaps = 3,
      icon = "__bztin__/graphics/icons/tin-ore.png",
      pictures = {
        {filename="__bztin__/graphics/icons/tin-ore.png", size=64, scale=0.5},
        {filename="__bztin__/graphics/icons/tin-ore-1.png", size=64, scale=0.5},
        {filename="__bztin__/graphics/icons/tin-ore-2.png", size=64, scale=0.5},
        {filename="__bztin__/graphics/icons/tin-ore-3.png", size=64, scale=0.5},
      },
      inventory_move_sound = item_sounds.resource_inventory_move,
      pick_sound = item_sounds.resource_inventory_pickup,
      drop_sound = item_sounds.resource_inventory_move,
      subgroup = "raw-resource",
      order = "t-c-a",
      stack_size = util.get_stack_size(50)
  },
})
