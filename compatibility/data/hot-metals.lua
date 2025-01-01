local util = require("data-util");

util.add_hot_metals({
  {name="tin-plate", spoilTicks=20*60, icons={
    { icon = "__bztin__/graphics/icons/tin-plate.png", icon_size = 128},
    { icon = "__bztin__/graphics/icons/tin-plate.png", icon_size = 128, tint={.9,.2,0, .5}},
  }},
  {name="bronze-plate", spoilTicks=20*60, icons={
    { icon = "__bztin__/graphics/icons/bronze-plate.png", icon_size = 128},
    { icon = "__bztin__/graphics/icons/bronze-plate.png", icon_size = 128, tint={.9,.2,0, .5}},
  }},
  {name="tinned-cable", spoilTicks=20*60, icons={
    { icon = "__bztin__/graphics/icons/tinned-cable.png", icon_size = 64},
    { icon = "__bztin__/graphics/icons/tinned-cable.png", icon_size = 64, tint={.9,.2,0, .5}},
  }},
  {name="solder", spoilTicks=5*60, icons={
    { icon = "__bztin__/graphics/icons/solder.png", icon_size = 128},
    { icon = "__bztin__/graphics/icons/solder.png", icon_size = 128, tint={.9,.2,0, .5}},
  }},
})

if HotMetals then
  if not data.raw["recipe-category"]["advanced-crafting-hot"] then
    data:extend({{
      type="recipe-category",
      name="advanced-crafting-hot",
    }})
    table.insert(HotMetals.craftingCategories, "advanced-crafting-hot")
    util.add_crafting_category_if("assembling-machine", "advanced-crafting-hot", "advanced-crafting")
  end
  util.set_category("bronze-plate", "advanced-crafting-hot")
end
