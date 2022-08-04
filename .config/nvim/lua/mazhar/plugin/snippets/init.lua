local ls = require("luasnip")

-- to jump between snippet sections
local opts = { noremap = true, silent = true }

vim.keymap.set({ "i", "s" }, "<c-j>", function()
  ls.jump(1)
end, opts)

vim.keymap.set({ "i", "s" }, "<c-k>", function()
  ls.jump(-1)
end, opts)

vim.keymap.set({ "i", "s" }, "<C-l>", function()
  if ls.choice_active() then
    ls.change_choice(1)
  end
end, opts)

vim.keymap.set({ "i", "s" }, "<C-h>", function()
  if ls.choice_active() then
    ls.change_choice(-1)
  end
end, opts)

ls.config.set_config {
  updateevents = "TextChanged,TextChangedI"
}

require('mazhar.plugin.snippets.javascript')
require('mazhar.plugin.snippets.typescript')
require('mazhar.plugin.snippets.javascriptreact')
require('mazhar.plugin.snippets.typescriptreact')
require('mazhar.plugin.snippets.html')
require('mazhar.plugin.snippets.markdown')
require('mazhar.plugin.snippets.gitcommit')
