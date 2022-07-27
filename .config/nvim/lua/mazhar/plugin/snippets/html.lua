local ls = require("luasnip")
local s = ls.snippet
local i = ls.insert_node
local t = ls.text_node

local snippets = {
  -- TODO: add div.class once u learn how to
  s({ trig = "div", name = "html:div" }, {
    t("<div>"), i(1), t("</div>")
  }),
  s({ trig = "span", name = "html:span" }, {
    t("<span>"), i(1), t("</span>")
  }),
  s({ trig = "h1", name = "html:h1" }, {
    t("<h1>"), i(1), t("</h1>")
  }),
  s({ trig = "h2", name = "html:h2" }, {
    t("<h2>"), i(1), t("</h2>")
  }),
  s({ trig = "h3", name = "html:h3" }, {
    t("<h3>"), i(1), t("</h3>")
  }),
  s({ trig = "p", name = "html:p" }, {
    t("<p>"), i(1), t("</p>")
  }),
}

ls.add_snippets("html", snippets);
