return {
  'tpope/vim-fugitive',
  cmd = { "Git", "Gclog" },
  keys = {
    { '<leader>gs',   ':Git<CR><C-w>_<C-w>|' },
    { '<leader>gvd',  ':Gvdiffsplit<CR>' },
    { '<leader>gv3d', ':Gvdiffsplit!<CR>' },
    { '<leader>ghd',  ':Gdiffsplit<CR>' },
    { '<leader>gh3d', ':Gdiffsplit!<CR>' },
    { '<leader>gm',   ':Git mergetool<CR>' },
    { '<leader>gd',   ':Git difftool<CR>' },
  },
  -- for some reason, using `config = true` results
  -- in an error
  config = function() end
}
