local ls = require("luasnip")
local s = ls.snippet
local i = ls.insert_node
local fmt = require("luasnip.extras.fmt").fmt

local snippets = {
  s("div", fmt("<div>{}</div>",
    { i(1) }
  )),

  s("span", fmt("<span>{}</span>",
    { i(1) }
  )),

  s("h1", fmt("<h1>{}</h1>",
    { i(1) }
  )),

  s("h2", fmt("<h2>{}</h2>",
    { i(1) }
  )),

  s("h3", fmt("<h3>{}</h3>",
    { i(1) }
  )),

  s("p", fmt("<p>{}</p>",
    { i(1) }
  )),
}

ls.add_snippets("html", snippets);
