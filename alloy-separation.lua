local util = require("data-util");
local recycling = require("__quality__.prototypes.recycling")

if mods["space-age"] then

function recipe_is_separable(recipe)
  for _, category in pairs(not_separable) do
    if recipe.category == category then return false end
  end
  return true
end

function generate_alloy_separation_recipe(alloy, recipe)
  local result =
  {
    type = "recipe",
    subgroup = "alloy-separation",
    category = "recycling"
  }

  if recipe.result or recipe.results then
    if not add_recipe_values(result, recipe, result) then return end
  end

  if result.name then
    -- We (re)generate the self-recycling recipe, because we need it until the tech is discovered
    recycling.generate_self_recycling_recipe(data.raw.item[alloy])

    result.name = result.name.."-separation"
    result.enabled = false
    result.hidden = false
    result.hide_from_player_crafting = true
    result.energy_required = 5 * result.energy_required / util.get_amount(recipe.name, alloy)
    result.localised_name = {"recipe-name.separation", {"item-name."..alloy}}
    data.raw.recipe[result.name] = result
    util.add_unlock("alloy-separation", result.name)
  end
end

for _, alloy in pairs(alloys_to_separate) do
  if data.raw.item[alloy] then
    local fewest_fluids = 100
    local best_recipe = ""
    for _, recipe in pairs(data.raw.recipe) do
      if util.get_amount(recipe.name, alloy) > 0 and recipe_is_separable(recipe) then
        local fluids = 0
        if recipe.ingredients then
          for _, ingredient in pairs(recipe.ingredients) do
            if ingredient.type == "fluid" then fluids = fluids + 1 end
          end
        end
        if fluids < fewest_fluids then
          fewest_fluids = fluids
          best_recipe = recipe
        end
      end
    end
    -- TODO: If there are fluids in the recipe, create a fake recipe without fluids, generate the separation recipe, and then remove it
    if best_recipe then
      -- log("Creating alloy separation recipe for "..best_recipe.name.." with category "..(best_recipe.category or "nil"))
      generate_alloy_separation_recipe(alloy, best_recipe)
    end
  end
end

end
