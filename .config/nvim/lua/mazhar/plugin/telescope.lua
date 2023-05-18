local layout = require("telescope.actions.layout")
local actions = require('telescope.actions')
local builtin = require('telescope.builtin')

require('telescope').setup {
  defaults = {
    prompt_prefix = "$ ",
    layout_strategy = 'flex',
    layout_config = {
      height = { padding = 0 },
      width = { padding = 0 }
    },
    mappings = {
      n = {
        ["<M-p>"] = layout.toggle_preview,
        ["<C-h>"] = actions.file_split,
      },
      i = {
        ["<M-p>"] = layout.toggle_preview,
        ["<C-h>"] = actions.file_split,
        ["<C-k>"] = actions.move_selection_previous,
        ["<C-j>"] = actions.move_selection_next,
      }
    }
  }
}
-- make sure telescope uses fzf plugin
require('telescope').load_extension('fzf')

vim.keymap.set('n', '<leader>sf', builtin.find_files)
vim.keymap.set('n', '<leader>sb', builtin.buffers)
vim.keymap.set('n', '<leader>ss', builtin.live_grep)
vim.keymap.set('n', '<leader>sc', builtin.commands)
vim.keymap.set('n', '<leader>sd', builtin.diagnostics)

vim.cmd('highlight TelescopeSelection guifg=#b16286 gui=bold')
vim.cmd('highlight TelescopePromptPrefix guifg=#458588')
