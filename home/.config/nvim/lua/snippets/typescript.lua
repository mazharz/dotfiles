local ls = require("luasnip")
local s = ls.snippet
local i = ls.insert_node
local fmt = require("luasnip.extras.fmt").fmt

ls.filetype_extend("typescript", { "javascript" })

local snippets = {
	s(
		"i",
		fmt(
			[[
    interface [] {
      []
    }
    ]],
			{ i(1, "IName"), i(0) },
			{ delimiters = "[]" }
		)
	),
}

ls.add_snippets("typescript", snippets)
