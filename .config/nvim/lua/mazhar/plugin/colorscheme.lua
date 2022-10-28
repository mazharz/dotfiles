-- setup must be called before loading the colorscheme
require("gruvbox").setup({
  undercurl = true,
  underline = true,
  bold = false,
  italic = false,
  strikethrough = true,
  invert_selection = false,
  invert_signs = false,
  invert_tabline = false,
  invert_intend_guides = false,
  inverse = true, -- invert background for search, diffs, statuslines and errors
  contrast = "", -- can be "hard", "soft" or empty string
  overrides = {
    Normal = { bg = "NONE" },
    LineNr = { bg = "NONE" },
    SignColumn = { bg = "NONE" },
    WinSeparator = { bg = "NONE", fg = "#504945" },
    -- apparently, nvim-tree uses vertsplit (still?!)
    VertSplit = { bg = "NONE", fg = "#504945" },
  }
})

-- set colorscheme
vim.cmd("colorscheme gruvbox")
