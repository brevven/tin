-- Deadlock stacking recipes

local util = require("data-util");

if deadlock then
  deadlock.add_stack("tin-ore",  "__bztin__/graphics/icons/stacked/tin-ore-stacked.png", "deadlock-stacking-1", 64)
  deadlock.add_stack("tin-plate",  "__bztin__/graphics/icons/stacked/tin-plate-stacked.png", "deadlock-stacking-1", 128)
  deadlock.add_stack("solder",  "__bztin__/graphics/icons/stacked/solder-stacked.png", "deadlock-stacking-1", 128)

  if mods.Krastorio2 then
    deadlock.add_stack("enriched-tin", "__bztin__/graphics/icons/stacked/enriched-tin-ore-stacked.png" , "deadlock-stacking-3", 128)
  end
end

-- Deadlock crating recipes
if deadlock_crating then
  deadlock_crating.add_crate("tin-ore", "deadlock-crating-1")
  deadlock_crating.add_crate("tin-plate", "deadlock-crating-1")
  deadlock_crating.add_crate("solder", "deadlock-crating-1")
end

