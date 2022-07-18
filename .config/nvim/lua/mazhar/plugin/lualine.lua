local custom_gruvbox = require'lualine.themes.gruvbox'

-- Change the background of lualine_c section for normal mode
custom_gruvbox.normal.c.bg = '#00000000'
custom_gruvbox.insert.c.bg = '#00000000'
custom_gruvbox.visual.c.bg = '#00000000'
custom_gruvbox.replace.c.bg = '#00000000'
custom_gruvbox.command.c.bg = '#00000000'
custom_gruvbox.inactive.c.bg = '#00000000'

require('lualine').setup {
  options = {
    icons_enabled = true,
    theme  = custom_gruvbox,
    section_separators = { left = '', right = '' },
    component_separators = { left = '', right = ''},
    disabled_filetypes = {},
    always_divide_middle = true,
    globalstatus = true, -- aka: vim.opt.laststatus = 3
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff', 'diagnostics'},
    lualine_c = {{'filename', path = 1}},
    lualine_x = {'encoding', 'filetype'},
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

