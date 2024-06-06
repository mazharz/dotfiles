local ls = require("luasnip")
local s = ls.snippet
local i = ls.insert_node
local fmt = require("luasnip.extras.fmt").fmt

ls.filetype_extend("javascriptreact", { "javascript", "html" })

local snippets = {
  s("us", fmt("const [{}, set{}] = useState({})",
    { i(1, "state"), i(2, "State"), i(3, "init") }
  )),

  s("ue", fmt([[
    useEffect(() => {
      qp
    }, [qp])
    ]],
    { i(2), i(1, "dep") },
    { delimiters = "qp" }
  )),

  s("uc", fmt("const {} = useContext({})",
    { i(1, "ctx"), i(2, "Ctx") }
  )),

  s("ucb", fmt([[
    const qp = useCallback(() => {
      qp
    }, [qp])
    ]],
    { i(1, "fn"), i(3), i(2, "dep") },
    { delimiters = "qp" }
  )),

  s("ume", fmt([[
    const qp = useMemo(() => {
      qp
    }, [qp])
    ]],
    { i(1, "memoized"), i(3), i(2, "dep") },
    { delimiters = "qp" }
  )),
}

ls.add_snippets("javascriptreact", snippets);
