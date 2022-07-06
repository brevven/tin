data:extend({
  {
		type = "string-setting",
		name = "bztin-recipe-bypass",
		setting_type = "startup",
		default_value = "",
    allow_blank = true,
	},
  {
		type = "bool-setting",
		name = "bztin-list",
		setting_type = "startup",
    default_value = false,
	},
  {
		type = "string-setting",
		name = "bztin-more-intermediates",
		setting_type = "startup",
		default_value = (mods.Krastorio2 or mods["space-exploration"]) and "cable" or "no",
    allowed_values = {"bronze", "cable", "no"},
	},
})
