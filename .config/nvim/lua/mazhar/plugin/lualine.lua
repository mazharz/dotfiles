require('lualine').setup {
  options = {
    icons_enabled        = false,
    theme                = 'gruvbox-material',
    section_separators   = { left = '', right = '' },
    component_separators = { left = '', right = '' },
    disabled_filetypes   = {},
    always_divide_middle = true,
    globalstatus         = true, -- aka: vim.opt.laststatus = 3
  },
  sections = {
    lualine_a = { 'mode' },
    lualine_b = { 'branch', 'diagnostics' },
    lualine_c = { { 'filename', path = 1 }, 'lsp_progress' },
    lualine_x = {},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {
    lualine_a = {
      {
        'tabs',
        max_length = vim.o.columns, -- defaults to init terminal length
        mode = 1
      }
    }
  },
  extensions = {}
}
