local ls = require("luasnip")
local s = ls.snippet
local i = ls.insert_node
local t = ls.text_node

local snippets = {
  -- TODO: change this to log out the variable name as well as the variable
  s({ trig = "cl", name = "console.log" }, {
    t("console.log("), i(1, "var"), t(")")
  }),
  s({ trig = "desc", name = "test:describe" }, {
    t("describe(\""), i(1, "description"), t({ "\", () => {", "\t" }), i(0), t({ "", "})" })
  }),
  s({ trig = "desca", name = "test:async describe" }, {
    t("describe(\""), i(1, "description"), t({ "\", async () => {", "\t" }), i(0), t({ "", "})" })
  }),
  s({ trig = "it", name = "test:it" }, {
    t("it(\"should "), i(1, "be x y z"), t({ "\", () => {", "\t" }), i(0), t({ "", "})" })
  }),
  s({ trig = "ita", name = "test:async it" }, {
    t("it(\"should "), i(1, "be x y z"), t({ "\", async () => {", "\t" }), i(0), t({ "", "})" })
  }),
  s({ trig = "imp", name = "module:import" }, {
    t("import {"), i(2), t("} from \""), i(1), t("\"")
  }),
  s({ trig = "rq", name = "module:require" }, {
    t("const {"), i(2), t("} = require(\""), i(1), t("\")")
  }),
  s({ trig = "map", name = "array:map" }, {
    i(1, "arr"), t(".map(("), i(2, "item"), t(") => {"), i(3), t("})")
  }),
  s({ trig = "filter", name = "array:filter" }, {
    i(1, "arr"), t(".filter(("), i(2, "item"), t(") => {"), i(3), t("})")
  }),
  s({ trig = "find", name = "array:find" }, {
    i(1, "arr"), t(".find(("), i(2, "item"), t(") => {"), i(3), t("})")
  }),
  s({ trig = "fd", name = "function:declaration" }, {
    t("const "), i(1, "func"), t(" = ("), i(2, "arg"), t({ ") => {", "\t" }), i(3), t({ "", "}" })
  }),
  s({ trig = "fn", name = "function:definition" }, {
    t("function "), i(1, "func"), t(" ("), i(2, "arg"), t({ ") {", "\t" }), i(3), t({ "", "}" })
  }),
  -- TODO: js JSON.stringify()
  -- TODO: jp JSON.parse()
  -- TODO: trycatch
  -- TODO: settimeout
  -- TODO: setinterval
}

ls.add_snippets("javascript", snippets);
