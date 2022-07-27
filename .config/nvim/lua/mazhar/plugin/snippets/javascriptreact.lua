local ls = require("luasnip")
local s = ls.snippet
local i = ls.insert_node
local t = ls.text_node

ls.filetype_extend("javascriptreact", { "javascript", "html" })

local snippets = {
  s({ trig = "us", name = "react:useState" }, {
    t("const ["), i(1, "state"), t(", set"), i(2, "State"), t("] = useState("), i(3, "init"), t(")")
  }),
  s({ trig = "ue", name = "react:useEffect" }, {
    t({ "useEffect(() => {", "\t" }), i(2), t({ "", "}, [" }), i(1, "dep"), t("])")
  }),
  s({ trig = "uc", name = "react:useContext" }, {
    t("const "), i(1, "ctx"), t(" = useContext("), i(2, "Ctx"), t(")")
  }),
  s({ trig = "ucb", name = "react:useCallback" }, {
    t("const "), i(1, "fn"), t({ " = useCallback(() => {", "\t" }), i(3), t({ "", "}, [" }), i(2, "dep"), t("])")
  }),
  s({ trig = "ume", name = "react:useMemo" }, {
    t("const "), i(1, "memoized"), t({ " = useMemo(() => {", "\t" }), i(3), t({ "", "}, [" }), i(2, "dep"), t("])")
  }),
}

ls.add_snippets("javascriptreact", snippets);
