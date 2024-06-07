return {
  'tpope/vim-fugitive',
  keys = {
    { '<leader>gs',   ':Git<CR><C-w>_<C-w>|' },
    { '<leader>gvd',  ':Gvdiffsplit<CR>' },
    { '<leader>gv3d', ':Gvdiffsplit!<CR>' },
    { '<leader>ghd',  ':Gdiffsplit<CR>' },
    { '<leader>gh3d', ':Gdiffsplit!<CR>' }
  },
  config = true
}
