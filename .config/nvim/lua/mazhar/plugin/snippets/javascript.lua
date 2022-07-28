local ls = require("luasnip")
local s = ls.snippet
local i = ls.insert_node
local rep = require("luasnip.extras").rep
local fmt = require("luasnip.extras.fmt").fmt

local snippets = {
  s("cl", fmt("console.log('{}:', {})",
    { rep(1), i(1, "var") }
  )),

  s("ds", fmt([[
    describe("[]", () => {
      []
    })
    ]],
    { i(1, "description"), i(0) },
    { delimiters = "[]" }
  )),

  s("dsa", fmt([[
    describe("[]", async () => {
      []
    })
    ]],
    { i(1, "description"), i(0) },
    { delimiters = "[]" }
  )),

  s("it", fmt([[
    it("should []", () => {
      []
    })
    ]],
    { i(1, "be x y z"), i(0) },
    { delimiters = "[]" }
  )),

  s("ita", fmt([[
    it("should []", async () => {
      []
    })
    ]],
    { i(1, "be x y z"), i(0) },
    { delimiters = "[]" }
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

  s("js", fmt("JSON.stringify({})",
    { i(1) }
  )),

  s("jp", fmt("JSON.parse({})",
    { i(1) }
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
