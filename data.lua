require("cables")
require("tin-ore")
require("tin-recipe")
require("tin-enriched")   -- Enriched Al for Krastorio 2
require("tin-recipe-se")         -- Space Exploration
require("compatibility.data.hot-metals")

local util = require("data-util");

util.prepare_recycling_helper()


-- Must be last
util.create_list()
