require("cables")
require("tin-ore")
require("tin-recipe")
require("tin-enriched")   -- Enriched Al for Krastorio 2
require("tin-recipe-se")         -- Space Exploration
require("compatibility.data.hot-metals")

local util = require("data-util");

util.prepare_recycling_helper()

-- Global to determine which alloys to provide separation (recycling) recipes for
alloys_to_separate = {
  "solder",
  "bronze-plate",
  "zircaloy-4",
  "lead-lithium-eutectic",
}
-- Global of which recipe categories should not be treated as separable
-- (Things like metallurgy, chemistry, smelting should all be treated as separable)
not_separable = {
  "recycling", "recycling-or-hand-crafting",
  "stacking", "crating",
}
  

-- Must be last
util.create_list()
