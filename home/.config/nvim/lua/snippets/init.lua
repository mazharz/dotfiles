local ls = require("luasnip")

-- to jump between snippet sections
local opts = { noremap = true, silent = true }

vim.keymap.set({ "i", "s" }, "<C-A-j>", function()
	if ls.expand_or_jumpable() then
		ls.expand_or_jump()
	end
end, opts)

vim.keymap.set({ "i", "s" }, "<C-A-k>", function()
	if ls.jumpable(-1) then
		ls.jump(-1)
	end
end, opts)

vim.keymap.set({ "i", "s" }, "<C-A-l>", function()
	if ls.choice_active() then
		ls.change_choice(1)
	end
end, opts)

vim.keymap.set({ "i", "s" }, "<C-A-h>", function()
	if ls.choice_active() then
		ls.change_choice(-1)
	end
end, opts)

ls.config.set_config({
	updateevents = "TextChanged,TextChangedI",
})

require("snippets.javascript")
require("snippets.typescript")
require("snippets.javascriptreact")
require("snippets.typescriptreact")
require("snippets.html")
require("snippets.markdown")
require("snippets.gitcommit")
require("snippets.ledger")
