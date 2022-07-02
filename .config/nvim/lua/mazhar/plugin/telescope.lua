local layout = require("telescope.actions.layout")
local actions = require('telescope.actions')
local builtin = require('telescope.builtin')

require('telescope').setup {
  defaults = {
    prompt_prefix = "$ ",
    layout_strategy = 'flex',
    layout_config = {
      height = 0.95,
      width = 0.95
    },
    mappings = {
      n = {
        ["<M-p>"] = layout.toggle_preview,
        ["<C-h>"] = actions.file_split
      },
      i = {
        ["<M-p>"] = layout.toggle_preview,
        ["<C-h>"] = actions.file_split
      }
    }
  }
}
-- make sure telescope uses fzf plugin
require('telescope').load_extension('fzf')

vim.keymap.set('n', '<C-p>', builtin.find_files)
vim.keymap.set('n', '<C-M-p>', builtin.buffers)
vim.keymap.set('n', '<C-s>', builtin.live_grep)
vim.keymap.set('n', '<C-;>', builtin.commands)
vim.keymap.set('n', '<C-e>', builtin.diagnostics)

vim.cmd('highlight TelescopeSelection guifg=#b16286 gui=bold')
vim.cmd('highlight TelescopePromptPrefix guifg=#458588')
