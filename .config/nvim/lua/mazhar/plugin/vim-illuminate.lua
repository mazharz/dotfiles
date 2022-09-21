require('illuminate').configure({
  under_cursor = false,
  filetypes_denylist = {
    'NvimTree'
  }
})

vim.cmd [[
  hi def IlluminatedWordText gui=bold,underline
  hi def IlluminatedWordRead gui=bold,underline
  hi def IlluminatedWordWrite gui=bold,underline
]]
