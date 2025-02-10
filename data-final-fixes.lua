require("tin-recipe-final-stacking")
-- require("tin-recipe-final-5d")
require("tin-recipe-final-rrr")

local util = require("data-util");

util.add_product("jellynut-processing", util.item("jellyskin", 1, .25))  -- in case of clobbering

util.replace_some_ingredient("se-glass-vulcanite", "sand", 1, "tin-plate", 1)
util.add_product("se-glass-vulcanite", {type="item", name="tin-plate", amount=1, catalyst_amount=1, probability=0.8})
util.set_main_product("se-glass-vulcanite", "glass")

-- core mining balancing
util.add_to_product("se-core-fragment-omni", "tin-ore", -4)

-- Electronic circuits need final fixes
local amt_ec = util.get_amount("electronic-circuit-stone", "electronic-circuit")
if amt_ec == 1 then
  util.multiply_recipe("electronic-circuit-stone", 2)
  util.set_recipe_time("electronic-circuit-stone", 0.5) -- faster but more complex
end
util.replace_some_ingredient("electronic-circuit-stone", "copper-cable", 1, "solder", 1)

amt_ec = util.get_amount("electronic-circuit")
if amt_ec == 1 then
  util.multiply_recipe("electronic-circuit", 2)
  util.set_recipe_time("electronic-circuit-stone", 0.5) -- faster but more complex
end
util.replace_some_ingredient("electronic-circuit", "copper-cable", 1, "solder", 1)

if mods.RenaiTransportation then
  for i, recipe in pairs(data.raw.recipe) do
    if recipe.result and data.raw.item[recipe.result] and
    data.raw.item[recipe.result].subgroup == "throwers" and
    recipe.result ~= "RTThrower-burner-inserter"
    then
      util.add_ingredient(recipe.name, "bronze-plate", 1)
    end
  end
end

util.size_recycler_output()
util.redo_recycling()
require("alloy-separation")  -- should be after final redo_recycling



-- Must be last
util.create_list()
