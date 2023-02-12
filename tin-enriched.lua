-- Enriched Lead for Krastorio2
local util = require("data-util");

if mods["Krastorio2"] then
data:extend(
{
  {
    type = "item",
    name = "enriched-tin",
    icon_size = 128,
    icon = "__bztin__/graphics/icons/enriched-tin.png",
    pictures = {
      {filename="__bztin__/graphics/icons/enriched-tin.png", size=128, scale=0.125},
      {filename="__bztin__/graphics/icons/enriched-tin-1.png", size=128, scale=0.125},
      {filename="__bztin__/graphics/icons/enriched-tin-2.png", size=128, scale=0.125},
      {filename="__bztin__/graphics/icons/enriched-tin-3.png", size=128, scale=0.125},
    },
    subgroup = "raw-material",
    order = "e05-a[enriched-ores]-a1[enriched-tin]",
    stack_size = util.get_stack_size(100)
  },
  {
    type = "recipe",
    name = "enriched-tin",
    main_product="enriched-tin",
    icon = "__bztin__/graphics/icons/enriched-tin.png",
    icon_size = 128,
    category = "chemistry",
    energy_required = 3,
    enabled = false,
    always_show_made_in = true,
    always_show_products = true,
    allow_productivity = true,
	subgroup = "raw-material",
    ingredients =
    {
      mods.bzcarbon and {type = "item", name = "graphite", amount = 1}
      or {type = "fluid", name = "sulfuric-acid", amount = 3},
      {type = "fluid", name = "water", amount = 25, catalyst_amount = 25},
      {type = "item",  name = "tin-ore", amount = 9}
    },
    results =
    { 
      {type = "item",  name = "enriched-tin", amount = 6},
      {type = "fluid", name = "dirty-water", amount = 25, catalyst_amount = 25}
    },
    crafting_machine_tint =
    {
      primary = {r = 0.721, g = 0.525, b = 0.043, a = 0.000},
      secondary = {r = 0.200, g = 0.680, b = 0.300, a = 0.357},
      tertiary = {r = 0.690, g = 0.768, b = 0.870, a = 0.000}, 
      quaternary = {r = 0.0, g = 0.980, b = 0.603, a = 0.900}
    },
    order = "e03[enriched-tin]"
  },
  {
      type = "recipe",
      name = "enriched-tin-plate",
      icons =
      {
        { icon = "__bztin__/graphics/icons/tin-plate.png", icon_size = 128 },
        { icon = "__bztin__/graphics/icons/enriched-tin.png", icon_size = 128, scale=0.125, shift= {-8, -8}},
      },
      category = "smelting",
      energy_required = 16,
      enabled = false,
      always_show_made_in = true,
      always_show_products = true,
      allow_productivity = true,
      ingredients = { {"enriched-tin", 5} },
      results = { {"tin-plate", 5} },
      order = "b[tin-plate]-b[enriched-tin-plate]",
  },	
	{
		type = "recipe",
		name = "dirty-water-filtration-tin",
		category = "fluid-filtration",
		icons =
		{
			{
				icon = data.raw.fluid["dirty-water"].icon,
				icon_size = data.raw.fluid["dirty-water"].icon_size
			},
			{
				icon = data.raw.item["tin-ore"].icon,
				icon_size =	data.raw.item["tin-ore"].icon_size,
				scale = 0.20 * (data.raw.fluid["dirty-water"].icon_size/data.raw.item["tin-ore"].icon_size),
				shift = {0, 4}
			}
		},
		icon_size = data.raw.fluid["dirty-water"].icon_size,
		energy_required = 2,
		enabled = false,
		allow_as_intermediate = false,
		always_show_made_in = true,
		always_show_products = true,
		ingredients =
		{
			{type = "fluid", name = "dirty-water", amount = 100, catalyst_amount = 100},
		},
		results =
		{
			{type = "fluid", name = "water", amount = 90, catalyst_amount = 90},
			{type = "item",  name = "stone", probability = 0.40, amount = 1},
			{type = "item",  name = "tin-ore", probability = 0.10, amount = 1},
		},
		crafting_machine_tint =
		{
			primary = {r = 0.60, g = 0.20, b = 0, a = 0.6},
			secondary = {r = 1.0, g = 0.843, b = 0.0, a = 0.9}
		},
		subgroup = "raw-material",
		order = "w013[dirty-water-filtration-tin]"
	}
}
)
util.add_effect("kr-enriched-ores", { type = "unlock-recipe", recipe = "enriched-tin" })
util.add_effect("kr-enriched-ores", { type = "unlock-recipe", recipe = "enriched-tin-plate" })
util.add_effect("kr-enriched-ores", { type = "unlock-recipe", recipe = "dirty-water-filtration-tin" })
end
