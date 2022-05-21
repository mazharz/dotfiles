vim.g.session_autosave = 'no'
vim.g.session_autoload = 'no'

vim.keymap.set('n', '<leader>O', ':SaveSession<CR>:qa<CR>')
vim.keymap.set('n', '<leader>o', ':OpenSession<CR>')

vim.g.session_persist_font = 0 -- don't include font in sessions
vim.g.session_persist_colors = 0 -- don't include colorscheme in sessions

