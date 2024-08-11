local ls = require("luasnip")
local s = ls.snippet
local i = ls.insert_node
local c = ls.choice_node
local t = ls.text_node
local fmt = require("luasnip.extras.fmt").fmt

local snippets = {
	s(
		"f",
		fmt(
			[[
    {}({}): {}


    ]],
			{
				c(1, { t("feat"), t("fix"), t("refactor"), t("perf"), t("test") }),
				i(2, "scope"),
				i(3, "message"),
			}
		)
	),

	s("b", fmt("BREAKING CHANGE: {}", { i(1, "message") })),
}

ls.add_snippets("gitcommit", snippets)
