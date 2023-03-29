-- Matter recipes for Krastorio2
if mods["Krastorio2"] then
  local util = require("data-util");
  util.k2matter({
    k2matter = {
      item_name = "tin-ore",
      matter_value = 5,
      energy_required = 1,
      need_stabilizer = false,
      unlocked_by_technology = "tin-matter-processing",
    },
    k2baseicon = "stone",
    icon = { icon = "__bztin__/graphics/icons/tin-ore.png", icon_size = 64, scale = 1.4}
  })

  util.k2matter({
    k2matter = {
      item_name = "tin-plate",
      minimum_conversion_quantity = 10,
      matter_value = 10,
      energy_required = 3,
      only_deconversion = true,
      need_stabilizer = true,
      unlocked_by_technology = "tin-matter-processing",
    },
  })
end
