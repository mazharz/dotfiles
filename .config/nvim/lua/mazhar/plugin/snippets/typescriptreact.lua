local ls = require("luasnip")
local s = ls.snippet
local i = ls.insert_node
local fmt = require("luasnip.extras.fmt").fmt

ls.filetype_extend("typescriptreact", { "javascript", "javascriptreact", "html" })

local snippets = {
  s("us", fmt("const [{}, set{}] = useState<{}>({})",
    { i(1, "state"), i(2, "State"), i(3, "type"), i(4, "init") }
  )),
}

ls.add_snippets("typescriptreact", snippets);
