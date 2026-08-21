local ls = require("luasnip")
local s = ls.snippet
local i = ls.insert_node
local c = ls.choice_node
local t = ls.text_node
local fmt = require("luasnip.extras.fmt").fmt

local snippets = {
	s(
		"errch",
		fmt(
			[[
    if [] != nil {
      []
    }
    ]],
			{ i(1, "err"), i(2, "panic(err)") },
			{ delimiters = "[]" }
		)
	),
	s(
		"p",
		fmt(
			[[
			fmt.[]([])
			]],
			{ c(1, { t("Print"), t("Println"), t("Printf") }), i(2, "var") },
			{ delimiters = "[]" }
		)
	),
}

ls.add_snippets("go", snippets)
