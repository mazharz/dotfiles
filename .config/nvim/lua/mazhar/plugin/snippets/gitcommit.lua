local ls = require("luasnip")
local s = ls.snippet
local i = ls.insert_node
local t = ls.text_node

local snippets = {
  s({ trig = "t", name = "gitcommit:feat" }, {
    t("feat("), i(1, "scope"), t("): "), i(2, "message"), t({ "", "", "" })
  }),
  s({ trig = "x", name = "gitcommit:fix" }, {
    t("fix("), i(1, "scope"), t("): "), i(2, "message"), t({ "", "", "" })
  }),
  s({ trig = "r", name = "gitcommit:refactor" }, {
    t("refactor("), i(1, "scope"), t("): "), i(2, "message"), t({ "", "", "" })
  }),
  s({ trig = "p", name = "gitcommit:performance" }, {
    t("perf("), i(1, "scope"), t("): "), i(2, "message"), t({ "", "", "" })
  }),
  s({ trig = "s", name = "gitcommit:test" }, {
    t("test("), i(1, "scope"), t("): "), i(2, "message"), t({ "", "", "" })
  }),
  s({ trig = "b", name = "gitcommit:breaking change" }, {
    t("BREAKING CHANGE: "), i(1, "message")
  }),
}

ls.add_snippets("gitcommit", snippets);
