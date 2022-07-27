local ls = require("luasnip")
local s = ls.snippet
local i = ls.insert_node
local t = ls.text_node

ls.filetype_extend("javascriptreact", { "javascript", "html" })

local snippets = {
  s({ trig = "l", name = "markdown:link" }, {
    t("["), i(1, "name"), t("]("), i(2, "link"), t(")")
  }),
  s({ trig = "t", name = "markdown:task" }, {
    t("- ["), i(2, "-"), t("] "), i(1, "task")
  }),
  s({ trig = "x1", name = "markdown:1x1 table" }, {
    t("| "), i(1, "column 1"), t({ " |", "" }),
    t({ "| -------- |", "" }),
    t("| "), i(2, " item  1"), t({ " |", "" }),
  }),
  s({ trig = "x2", name = "markdown:1x2 table" }, {
    t("| "), i(1, "column 1"), t(" | "), i(2, "column 2"), t({ " |", "" }),
    t({ "| -------- | -------- |", "" }),
    t("| "), i(3, " item  1"), t(" | "), i(4, " item  2"), t({ " |", "" }),
  }),
  s({ trig = "x3", name = "markdown:1x3 table" }, {
    t("| "), i(1, "column 1"), t(" | "), i(2, "column 2"), t(" | "), i(3, "column 3"), t({ " |", "" }),
    t({ "| -------- | -------- | -------- |", "" }),
    t("| "), i(4, " item  1"), t(" | "), i(5, " item  2"), t(" | "), i(6, " item  3"), t({ " |", "" }),
  })
}

ls.add_snippets("markdown", snippets);
