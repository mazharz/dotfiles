local ls = require("luasnip")
local s = ls.snippet
local i = ls.insert_node
local c = ls.choice_node
local t = ls.text_node
local fmt = require("luasnip.extras.fmt").fmt

local function getToday()
  return os.date("%Y-%m-%d")
end

local snippets = {
  s("t", fmt([[
    {} {}
        {}         IRR {}
        {}        IRR -{}
    ]],
    {
      i(1, getToday()),
      i(2, "<description>"),
      i(3, "<account>"),
      i(4),
      i(5, "<account>"),
      i(6),
    })),
  s("e", fmt([[
    {} {}
        expenses:{}         IRR {}
        assets:checking

    ]],
    {
      i(1, getToday()),
      i(2, "<description>"),
      i(3, "groceries"),
      i(4),
    })),
  s("se", fmt([[
    {} {}
        expenses:{}                IRR {}
        assets:reimbursements:{}        IRR {}
        assets:checking             IRR -{}
    ]],
    {
      i(1, getToday()),
      i(2, "<description>"),
      i(3, "meal"),
      i(4),
      i(5, "person"),
      i(6),
      i(7),
    })),
  s("r", fmt([[
    {} {}
        assets:checking                IRR {}
        assets:reimbursements:{}

    ]],
    {
      i(1, getToday()),
      i(2, "<description>"),
      i(3),
      i(4, "person"),
    })),
  s("ap", fmt([[
    {} {}
        assets:checking            IRR {}
        revenues:profit

    ]],
    {
      i(1, getToday()),
      i(2, "account profit"),
      i(3),
    })),
}

ls.add_snippets("ledger", snippets);
