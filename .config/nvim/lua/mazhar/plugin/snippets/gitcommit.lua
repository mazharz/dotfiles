local ls = require("luasnip")
local s = ls.snippet
local i = ls.insert_node
local fmt = require("luasnip.extras.fmt").fmt

local snippets = {
  s("t", fmt([[
    feat({}): {}


    ]],
    { i(1, "scope"), i(2, "message") }
  )),

  s("x", fmt([[
    fix({}): {}


    ]],
    { i(1, "scope"), i(2, "message") }
  )),

  s("r", fmt([[
    refactor({}): {}


    ]],
    { i(1, "scope"), i(2, "message") }
  )),

  s("p", fmt([[
    perf({}): {}


    ]],
    { i(1, "scope"), i(2, "message") }
  )),

  s("s", fmt([[
    test({}): {}


    ]],
    { i(1, "scope"), i(2, "message") }
  )),

  s("b", fmt("BREAKING CHANGE: {}",
    { i(1, "message") }
  )),
}

ls.add_snippets("gitcommit", snippets);
