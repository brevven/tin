-- Matter recipes for Krastorio2
if mods["Krastorio2"] then
  local util = require("data-util");
  util.k2matter({
    k2matter = {
      material = {
        name = "tin-ore",
        type = "item",
        amount = 10,
      },
      matter_count = 5,
      energy_required = 1,
      need_stabilizer = false,
      allow_productivity = true,
      unlocked_by = "tin-matter-processing",
    },
    k2baseicon = "stone",
    icon = { icon = "__bztin__/graphics/icons/tin-ore.png", icon_size = 64, scale = 1.4}
  })

  util.k2matter({
    k2matter = {
      material = {
        name = "tin-plate",
        type = "item",
        amount = 10,
      },
      matter_count = 7.5,
      energy_required = 2,
      only_deconversion = true,
      allow_productivity = true,
      need_stabilizer = true,
      unlocked_by = "tin-matter-processing",
    },
  })
end
