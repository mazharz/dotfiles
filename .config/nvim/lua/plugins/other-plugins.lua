return {
  'tpope/vim-surround',
  'tpope/vim-repeat',
  'tpope/vim-sleuth',

  {
    'windwp/nvim-autopairs',
    event = "InsertEnter",
    config = true
  },
  {
    'windwp/nvim-ts-autotag',
    event = {"BufReadPre", "BufNewFile"},
    config = true
  },

  -- task runner
  {
    'tpope/vim-dispatch',
    keys = {
      { "<leader>Dt", ":Dispatch tsc --pretty false<CR>" }
    }
  },

  -- icons
  'nvim-tree/nvim-web-devicons'
}
