require 'nvim-treesitter.configs'.setup {
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
    "typescript",
    "markdown",
    "markdown_inline"
  },

  sync_install = false,

  highlight = {
    enable = true,
    throttle = true,
    additional_vim_regex_highlighting = false,
  },

  incremental_selection = {
    enable = true
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

-- use treesitter folding expressions (better folding in a nutshell!)
vim.o.foldmethod = 'expr'
vim.o.foldexpr = 'nvim_treesitter#foldexpr()'

-- disable folding by default since it can get annoying
-- for instance quickly skimming through usages of a symbol
vim.wo.foldenable = false
