local util = require("data-util");

if mods["248k"] then
  util.add_ingredient("gr_circuit_recipe", "solder", 2)

  -- glass
  util.replace_some_ingredient("fi_cast_glass_recipe", "fi_arc_glass", 5, "tin-plate", 1)
  util.add_product("fi_cast_glass_recipe", {type="item", name="tin-plate", amount=1, probability=0.8})
  util.set_main_product("fi_cast_glass_recipe", "fi_materials_glass")
end
