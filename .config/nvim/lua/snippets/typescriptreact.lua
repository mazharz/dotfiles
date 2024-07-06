local ls = require("luasnip")
local s = ls.snippet
local i = ls.insert_node
local fmt = require("luasnip.extras.fmt").fmt

ls.filetype_extend("typescriptreact", { "javascript", "javascriptreact", "html" })

local snippets = {
  s("us", fmt("const [{}, set{}] = useState<{}>({})",
    { i(1, "state"), i(2, "State"), i(3, "type"), i(4, "init") }
  )),

  s("fd", fmt([[
    type Props = {
      []
    }

    const [] = ({[]}: Props) => {
      []
    }

    export { [] }
    ]],
    { i(3), i(1, "func"), i(4), i(0), i(2, "func") },
    { delimiters = "[]" }
  )),

  s("fdd", fmt([[
    type Props = {
      []
    }

    const [] = ({[]}: Props) => {
      []
    }

    export default []
    ]],
    { i(3), i(1, "func"), i(4), i(0), i(2, "func") },
    { delimiters = "[]" }
  )),
}

ls.add_snippets("typescriptreact", snippets);
