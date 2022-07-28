local ls = require("luasnip")
local s = ls.snippet
local i = ls.insert_node
local fmt = require("luasnip.extras.fmt").fmt

ls.filetype_extend("javascriptreact", { "javascript", "html" })

local snippets = {
  s("l", fmt("[{}]({})",
    { i(1, "name"), i(2, "link") }
  )),

  s("t", fmt("- [{}] {}",
    { i(2, " "), i(1, "task") }
  )),

  s("x1", fmt([[
    | {} |
    | -------- |
    | {} |
    ]],
    {
      i(1, "column 1"),
      i(2, " item  1")
    }
  )),

  s("x2", fmt([[
    | {} | {} |
    | -------- | -------- |
    | {} | {} |
    ]],
    {
      i(1, "column 1"), i(2, "column 2"),
      i(3, " item  1"), i(4, " item  2")
    }
  )),

  s("x3", fmt([[
    | {} | {} | {} |
    | -------- | -------- | -------- |
    | {} | {} | {} |
    ]],
    {
      i(1, "column 1"), i(2, "column 2"), i(3, "column 3"),
      i(4, " item  1"), i(5, " item  2"), i(6, " item  3")
    }
  )),
}

ls.add_snippets("markdown", snippets);
