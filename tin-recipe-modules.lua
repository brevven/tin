-- Enable prod modules for all tin plate and ore recipes

recipes = {"tin-plate", "solder", "organotins"}
if mods["Krastorio2"] then
  table.insert(recipes, "enriched-tin")
  table.insert(recipes, "enriched-tin-plate")
end
if mods["space-exploration"] then
  table.insert(recipes, "tin-smelting-vulcanite")
  table.insert(recipes, "molten-tin")
  if mods["Krastorio2"] then
    table.insert(recipes, "enriched-tin-smelting-vulcanite")
  end
end

for i, recipe in pairs(recipes) do
  if data.raw.recipe[recipe] then
    for j, module in pairs(data.raw.module) do
      if module.effect then
        for effect_name, effect in pairs(module.effect) do
          if effect_name == "productivity" and effect.bonus > 0 and module.limitation and #module.limitation > 0 then
            table.insert(module.limitation, recipe)
          end
        end
      end
    end
  end
end
