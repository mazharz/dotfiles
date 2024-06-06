return {
  'tpope/vim-surround',
  'tpope/vim-repeat',
  'tpope/vim-sleuth',

  -- use 'jiangmiao/auto-pairs'
  {
    'altermo/ultimate-autopair.nvim',
    event = { 'InsertEnter', 'CmdlineEnter' },
    branch = 'v0.6', --recommended as each new version will have breaking changes
    config = function()
      require('ultimate-autopair').setup()
    end,
  },

  -- task runner
  'tpope/vim-dispatch'
}
