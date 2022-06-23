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

local curr_buff = function()
  builtin.current_buffer_fuzzy_find({
    prompt_position = "top",
    sorting_strategy = "ascending"
  })
end

vim.keymap.set('n', '<C-p>', builtin.find_files)
vim.keymap.set('n', '<C-M-p>', builtin.buffers)
-- vim.keymap.set('n', '<C-m>', builtin.marks)
vim.keymap.set('n', '<C-s>', builtin.live_grep)
vim.keymap.set('n', '<C-;>', builtin.commands)
vim.keymap.set('n', '<C-f>', curr_buff)
vim.keymap.set('n', '<C-e>', builtin.diagnostics)

vim.cmd('highlight TelescopeSelection guifg=#C678DD gui=bold')
vim.cmd('highlight TelescopePromptPrefix guifg=#61AFEF')
