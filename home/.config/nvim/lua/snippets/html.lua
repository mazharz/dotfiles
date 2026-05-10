local ls = require("luasnip")
local s = ls.snippet
local i = ls.insert_node
local fmt = require("luasnip.extras.fmt").fmt
local extras = require("luasnip.extras")

local snippets = {
	s(
		"t",
		fmt("<{}>{}</{}>", {
			i(1, "tag"),
			i(2, "content"),
			extras.rep(1),
		})
	),
}

ls.add_snippets("html", snippets)
