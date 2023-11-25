local gruvbox = require("gruvbox")
-- setup must be called before loading the colorscheme
gruvbox.setup({
  undercurl = true,
  underline = true,
  bold = false,
  italic = {
    strings = false,
    comments = false,
    operators = false,
    folds = false,
  },
  strikethrough = true,
  invert_selection = false,
  invert_signs = false,
  invert_tabline = false,
  invert_intend_guides = false,
  inverse = true, -- invert background for search, diffs, statuslines and errors
  contrast = "",  -- can be "hard", "soft" or empty string
  overrides = {
    SignColumn = { bg = "NONE" },
    WinSeparator = { bg = "NONE", fg = "#3c3836" },
    GitSignsAdd = { bg = "#282828", fg = "#98971a" },
    GitSignsChange = { bg = "#282828", fg = "#689d6a" },
    GitSignsDelete = { bg = "#282828", fg = "#cc241d" },
    GitSignsUntracked = { bg = "#282828", fg = "#d79921" },
  },
  -- transparent_mode = true,
})

-- set colorscheme
vim.cmd("colorscheme gruvbox")
