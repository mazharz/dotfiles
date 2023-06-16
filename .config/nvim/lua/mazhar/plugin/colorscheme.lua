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
    Normal = { bg = "NONE" },
    LineNr = { bg = "NONE" },
    SignColumn = { bg = "NONE" },
    WinSeparator = { bg = "NONE", fg = "#504945" },
    -- apparently, nvim-tree uses vertsplit (still?!)
    VertSplit = { bg = "NONE", fg = "#504945" },
    GitSignsAdd = { bg = "NONE" },
    GitSignsChange = { bg = "NONE" },
    GitSignsDelete = { bg = "NONE" },
    -- lsp diagnostics in sign column
    DiagnosticSignError = { bg = "NONE", fg = "#fb4934" },
    DiagnosticSignWarn = { bg = "NONE", fg = "#fabd2f" },
    DiagnosticSignInfo = { bg = "NONE", fg = "#83a598" },
    DiagnosticSignHint = { bg = "NONE", fg = "#8ec07c" },
  },
  -- transparent_mode = true,
})

-- set colorscheme
vim.cmd("colorscheme gruvbox")
