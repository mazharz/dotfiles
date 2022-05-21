require'nvim-treesitter.configs'.setup {
  ensure_installed = { 
    "bash",
    "c",
    "comment",
    "cpp",
    "css",
    "dockerfile",
    "go",
    "graphql",
    "html",
    "http",
    "javascript",
    "json",
    "jsdoc",
    "python",
    "regex",
    "scss",
    "tsx",
    "typescript"
  },

  sync_install = false,

  highlight = {
    enable = true,
    throttle = true,
    additional_vim_regex_highlighting = false,
  },

  textobjects = {
    enable = true,
  },

  indent = {
    enable = true,
  },

  -- provided by JoosepAlviste/nvim-ts-context-commentstring
  context_commentstring = {
    enable = true
  }
}

vim.o.foldmethod = 'expr'
vim.o.foldexpr = 'nvim_treesitter#foldexpr()'

