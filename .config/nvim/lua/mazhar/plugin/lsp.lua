local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

local on_attach = function(client, bufnr)
  local bufopts = { noremap=true, silent=true, buffer=bufnr }
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
  vim.keymap.set('n', '<leader>K', vim.lsp.buf.signature_help, bufopts)

  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  vim.keymap.set('n', 'gvd', ':vsplit | lua vim.lsp.buf.definition()<CR>', bufopts)
  vim.keymap.set('n', 'ghd', ':split | lua vim.lsp.buf.definition()<CR>', bufopts)

  vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
  vim.keymap.set('n', 'gvr', ':vsplit | lua vim.lsp.buf.references()<CR>', bufopts)
  vim.keymap.set('n', 'ghr', ':split | lua vim.lsp.buf.references()<CR>', bufopts)

  vim.keymap.set('n', 'gD', vim.lsp.buf.type_definition, bufopts)
  vim.keymap.set('n', 'gvD', ':vsplit | lua vim.lsp.buf.type_definition()<CR>', bufopts)
  vim.keymap.set('n', 'ghD', ':split | lua vim.lsp.buf.type_definition()<CR>', bufopts)

  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
  vim.keymap.set('n', 'gvi', ':vsplit | lua vim.lsp.buf.implementation()<CR>', bufopts)
  vim.keymap.set('n', 'ghi', ':split | lua vim.lsp.buf.implementation()<CR>', bufopts)

  vim.keymap.set('n', '<leader>j', vim.diagnostic.goto_next, bufopts)
  vim.keymap.set('n', '<leader>k', vim.diagnostic.goto_prev, bufopts)
  vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, bufopts)

  vim.keymap.set('n', '<leader>r', vim.lsp.buf.rename, bufopts)
  vim.keymap.set('n', '<leader>a', vim.lsp.buf.code_action, bufopts)

  -- under cursor symbol highlighting
  -- from: https://sbulav.github.io/til/til-neovim-highlight-references/
  if client.server_capabilities.documentHighlightProvider then
    vim.api.nvim_create_augroup("lsp_document_highlight", { clear = true })
    vim.api.nvim_clear_autocmds { buffer = bufnr, group = "lsp_document_highlight" }
    vim.api.nvim_create_autocmd("CursorHold", {
        callback = vim.lsp.buf.document_highlight,
        buffer = bufnr,
        group = "lsp_document_highlight",
        desc = "Document Highlight",
    })
    vim.api.nvim_create_autocmd("CursorMoved", {
        callback = vim.lsp.buf.clear_references,
        buffer = bufnr,
        group = "lsp_document_highlight",
        desc = "Clear All the References",
    })
  end

end

require("nvim-lsp-installer").setup {
  automatic_installation = true
}

require("lspconfig").tsserver.setup {
  capabilities = capabilities,
  on_attach = on_attach
}

require("lspconfig").sumneko_lua.setup {
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
require("lspconfig").graphql.setup {
  capabilities = capabilities,
  on_attach = on_attach,
}
require("lspconfig").eslint.setup {
  capabilities = capabilities,
  on_attach = on_attach,
}
require("lspconfig").tailwindcss.setup {
  capabilities = capabilities,
  on_attach = on_attach,
}
require("lspconfig").html.setup {
  capabilities = capabilities,
  on_attach = on_attach,
}
require("lspconfig").cssls.setup {
  capabilities = capabilities,
  on_attach = on_attach,
}
require("lspconfig").cssmodules_ls.setup {
  capabilities = capabilities,
  on_attach = on_attach,
}
require("lspconfig").hls.setup {
  capabilities = capabilities,
  on_attach = on_attach,
}
require("lspconfig").angularls.setup {
  capabilities = capabilities,
  on_attach = on_attach,
}
require("lspconfig").bashls.setup {
  capabilities = capabilities,
  on_attach = on_attach,
}
