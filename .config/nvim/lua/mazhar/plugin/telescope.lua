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
    },
    file_ignore_patterns = {
      "%.git",
    }
  }
}
-- make sure telescope uses fzf plugin
require('telescope').load_extension('fzf')

local find_files = function()
  builtin.find_files({ hidden = true })
end

local live_grep = function()
  builtin.live_grep({
    additional_args = {
      '--hidden',
    }
  })
end

vim.keymap.set('n', '<leader>sf', find_files)
vim.keymap.set('n', '<leader>sb', builtin.buffers)
vim.keymap.set('n', '<leader>ss', live_grep)
vim.keymap.set('n', '<leader>sc', builtin.commands)
vim.keymap.set('n', '<leader>sd', builtin.diagnostics)

vim.cmd('highlight TelescopeSelection guifg=#b16286 gui=bold')
vim.cmd('highlight TelescopePromptPrefix guifg=#458588')
