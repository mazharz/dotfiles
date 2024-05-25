local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

keymap('n', '<leader>Q', ':DBUIToggle<CR>', opts)

vim.cmd [[
  " use neovim's notify api instead of the default horrible notification mechanism
  let g:db_ui_use_nvim_notify = 1
]]
