-- auto format on save
local augroup = vim.api.nvim_create_augroup('fmt', {clear = true})

vim.api.nvim_create_autocmd('BufWritePre', {
  pattern = '*',
  group = augroup,
  command = 'Neoformat'
})

-- used to be like this in case you want it in future:
--
-- augroup fmt
--   autocmd!
--   autocmd BufWritePre * Neoformat
-- augroup END
