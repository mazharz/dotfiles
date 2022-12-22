local lspconfig = require('lspconfig');
local capabilities = require('cmp_nvim_lsp').default_capabilities()

local on_attach = function(client, bufnr)
  local bufopts = { noremap = true, silent = true, buffer = bufnr }
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
  vim.keymap.set('n', '<leader>K', vim.lsp.buf.signature_help, bufopts)

  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  vim.keymap.set('n', 'gvd', ':vsplit | lua vim.lsp.buf.definition()<CR>', bufopts)
  vim.keymap.set('n', 'ghd', ':split | lua vim.lsp.buf.definition()<CR>', bufopts)
  vim.keymap.set('n', 'gtd', ':tab split | lua vim.lsp.buf.definition()<CR>', bufopts)

  vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
  vim.keymap.set('n', 'gvr', ':vsplit | lua vim.lsp.buf.references()<CR>', bufopts)
  vim.keymap.set('n', 'ghr', ':split | lua vim.lsp.buf.references()<CR>', bufopts)
  vim.keymap.set('n', 'gtr', ':tab split | lua vim.lsp.buf.references()<CR>', bufopts)

  vim.keymap.set('n', 'gD', vim.lsp.buf.type_definition, bufopts)
  vim.keymap.set('n', 'gvD', ':vsplit | lua vim.lsp.buf.type_definition()<CR>', bufopts)
  vim.keymap.set('n', 'ghD', ':split | lua vim.lsp.buf.type_definition()<CR>', bufopts)
  vim.keymap.set('n', 'gtD', ':tab split | lua vim.lsp.buf.type_definition()<CR>', bufopts)

  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
  vim.keymap.set('n', 'gvi', ':vsplit | lua vim.lsp.buf.implementation()<CR>', bufopts)
  vim.keymap.set('n', 'ghi', ':split | lua vim.lsp.buf.implementation()<CR>', bufopts)
  vim.keymap.set('n', 'gti', ':tab split | lua vim.lsp.buf.implementation()<CR>', bufopts)

  vim.keymap.set('n', '<leader>j', vim.diagnostic.goto_next, bufopts)
  vim.keymap.set('n', '<leader>k', vim.diagnostic.goto_prev, bufopts)
  vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, bufopts)

  vim.keymap.set('n', '<leader>r', vim.lsp.buf.rename, bufopts)
  vim.keymap.set('n', '<leader>a', vim.lsp.buf.code_action, bufopts)

  -- prevent tsserver from formatting, let null-ls handle it
  if client.name == "tsserver" then
    client.server_capabilities.document_formatting = false
  end
end

require("mason").setup()
require("mason-lspconfig").setup({
  automatic_installation = true
})

lspconfig.tsserver.setup {
  capabilities = capabilities,
  on_attach = on_attach
}

lspconfig.sumneko_lua.setup {
  capabilities = capabilities,
  on_attach = on_attach,
  settings = {
    Lua = {
      diagnostics = {
        -- prevent getting lots of global var undefined warnings
        globals = { 'vim' }
      }
    }
  }
}
lspconfig.graphql.setup {
  capabilities = capabilities,
  on_attach = on_attach,
}
lspconfig.eslint.setup {
  capabilities = capabilities,
  on_attach = on_attach,
}
lspconfig.tailwindcss.setup {
  capabilities = capabilities,
  on_attach = on_attach,
}
lspconfig.html.setup {
  capabilities = capabilities,
  on_attach = on_attach,
}
lspconfig.cssls.setup {
  capabilities = capabilities,
  on_attach = on_attach,
}
lspconfig.cssmodules_ls.setup {
  capabilities = capabilities,
  on_attach = on_attach,
}
lspconfig.angularls.setup {
  capabilities = capabilities,
  on_attach = on_attach,
}
lspconfig.bashls.setup {
  capabilities = capabilities,
  on_attach = on_attach,
}
lspconfig.rust_analyzer.setup {
  capabilities = capabilities,
  on_attach = on_attach,
}
