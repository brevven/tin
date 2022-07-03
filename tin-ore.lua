local resource_autoplace = require('resource-autoplace');
local noise = require('noise');

local util = require("data-util");

data:extend({
	{
    type = "autoplace-control",
    category = "resource",
    name = "tin-ore",
    richness = true,
    order = "b-e"
	},
	{
    type = "noise-layer",
    name = "tin-ore"
	},
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
      mining_time = 1,
      result = "tin-ore"
    },
    collision_box = {{ -0.1, -0.1}, {0.1, 0.1}},
    selection_box = {{ -0.5, -0.5}, {0.5, 0.5}},

    autoplace = resource_autoplace.resource_autoplace_settings{
      name = "tin-ore",
      order = "b-z",
      base_density = 3,
      base_spots_per_km2 = 1,
      has_starting_area_placement = true,
      regular_rq_factor_multiplier = 1.0,
      starting_rq_factor_multiplier = 1.0,
    },

    stage_counts = {15000, 9500, 5500, 2900, 1300, 400, 150, 80},
        stages =
        {
          sheet =
          {
      filename = "__bztin__/graphics/entity/ores/tin-ore.png",
      priority = "extra-high",
      size = 64,
      frame_count = 8,
      variation_count = 8,
      hr_version =
      {
      filename = "__bztin__/graphics/entity/ores/hr-tin-ore.png",
        priority = "extra-high",
        size = 128,
        frame_count = 8,
        variation_count = 8,
        scale = 0.5
      }
          }
    },
  },
  {
      type = "item",
      name = "tin-ore",
      icon_size = 64, icon_mipmaps = 3,
      icon = "__bztin__/graphics/icons/tin-ore.png",
      pictures = {
        {filename="__bztin__/graphics/icons/tin-ore.png", size=64, scale=0.25},
        {filename="__bztin__/graphics/icons/tin-ore-1.png", size=64, scale=0.25},
        {filename="__bztin__/graphics/icons/tin-ore-2.png", size=64, scale=0.25},
        {filename="__bztin__/graphics/icons/tin-ore-3.png", size=64, scale=0.25},
      },
      subgroup = "raw-resource",
      order = "t-c-a",
      stack_size = util.get_stack_size(50)
  },
})
