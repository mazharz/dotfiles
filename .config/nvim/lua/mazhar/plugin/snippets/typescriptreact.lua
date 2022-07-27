local ls = require("luasnip")
local s = ls.snippet
local i = ls.insert_node
local t = ls.text_node

ls.filetype_extend("typescriptreact", { "javascript", "javascriptreact", "html" })

local snippets = {
  s({ trig = "us", name = "react:useState" }, {
    t("const ["), i(1, "state"), t(", set"), i(2, "State"), t("] = useState<"), i(3, "type"), t(">("), i(4, "init"),
    t(")")
  }),
}

ls.add_snippets("typescriptreact", snippets);
