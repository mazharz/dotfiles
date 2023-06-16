local nls = require('null-ls');

nls.setup({
    sources = {
        nls.builtins.formatting.prettier,
        nls.builtins.formatting.gofumpt,
    },
})

-- auto format on save
local augroup = vim.api.nvim_create_augroup('fmt', { clear = true })

vim.api.nvim_create_autocmd('BufWritePre', {
    pattern = '*',
    group = augroup,
    command = 'lua vim.lsp.buf.format()'
})
