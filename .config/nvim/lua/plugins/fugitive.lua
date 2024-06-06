return {
  'tpope/vim-fugitive',
  config = function()
    vim.keymap.set('n', '<leader>gs', ':Git<CR><C-w>_<C-w>|')
    vim.keymap.set('n', '<leader>gvd', ':Gvdiffsplit<CR>')
    vim.keymap.set('n', '<leader>gv3d', ':Gvdiffsplit!<CR>')
    vim.keymap.set('n', '<leader>ghd', ':Gdiffsplit<CR>')
    vim.keymap.set('n', '<leader>gh3d', ':Gdiffsplit!<CR>')
  end
}
