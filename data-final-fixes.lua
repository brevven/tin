-- require("tin-recipe-final-stacking")
require("tin-recipe-modules")
-- require("tin-recipe-final-5d")
require("tin-recipe-final-rrr")

local util = require("data-util");
util.replace_some_ingredient("se-glass-vulcanite", "sand", 1, "tin-plate", 1)
util.add_product("se-glass-vulcanite", {type="item", name="tin-plate", amount=1, probability=0.8})
util.set_main_product("se-glass-vulcanite", "glass")


-- Must be last
util.create_list()
