local ls = require("luasnip")
local s = ls.snippet
local i = ls.insert_node
local t = ls.text_node
local c = ls.choice_node
local fmt = require("luasnip.extras.fmt").fmt

local snippets = {
  s("cl", fmt("console.{}({})",
    {
      c(2, { t "log", t "warn", t "error" }),
      i(1, "var")
    }
  )),

  s("ds", fmt([[
    describe("{}", {} () => {{
      {}
    }})
    ]],
    {
      i(1, "description"),
      c(2, { t "", t "async" }),
      i(0)
    }
  )),

  s("it", fmt([[
    it("should {}", {} () => {{
      {}
    }})
    ]],
    {
      i(1, "be x y z"),
      c(2, { t "", t "async" }),
      i(0)
    }
  )),

  s("imp", fmt("import { [] } from \"[]\"",
    { i(2), i(1) },
    { delimiters = "[]" }
  )),

  s("rq", fmt("const { [] } = require(\"[]\")",
    { i(2), i(1) },
    { delimiters = "[]" }
  )),

  s("map", fmt("[].map(([]) => { [] })",
    { i(1, "xs"), i(2, "x"), i(3) },
    { delimiters = "[]" }
  )),

  s("filter", fmt("[].filter(([]) => { [] })",
    { i(1, "xs"), i(2, "x"), i(3) },
    { delimiters = "[]" }
  )),

  s("find", fmt("[].find(([]) => { [] })",
    { i(1, "xs"), i(2, "x"), i(3) },
    { delimiters = "[]" }
  )),

  s("fd", fmt([[
    const [] = ([]) => {
      []
    }
    ]],
    { i(1, "func"), i(2, "arg"), i(3) },
    { delimiters = "[]" }
  )),

  s("fn", fmt([[
    function [] ([]) {
      []
    }
    ]],
    { i(1, "func"), i(2, "arg"), i(3) },
    { delimiters = "[]" }
  )),

  s("js", fmt("JSON.{}({})",
    {
      c(1, { t "stringify", t "parse" }),
      i(2)
    }
  )),

  s("tc", fmt([[
    try {
      []
    } catch(error) {
      console.log([]);
    }
    ]],
    { i(2), i(1, "error") },
    { delimiters = "[]" }
  )),

  s("st", fmt([[
    setTimeout(() => {
      []
    }, [])
    ]],
    { i(2), i(1, "1000") },
    { delimiters = "[]" }
  )),

  s("si", fmt([[
    setInterval(() => {
      []
    }, [])
    ]],
    { i(2), i(1, "1000") },
    { delimiters = "[]" }
  ))
}

ls.add_snippets("javascript", snippets);
