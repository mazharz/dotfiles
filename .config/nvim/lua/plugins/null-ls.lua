local setupNullLs = function()
  local nls = require('null-ls');
  local keymap = vim.keymap.set
  local opts = { noremap = true, silent = true }

  nls.setup({
    sources = {
      nls.builtins.formatting.prettier,
      nls.builtins.formatting.gofumpt,
    },
  })

  -- auto format on save
  local augroup = vim.api.nvim_create_augroup('fmt', { clear = true })
  local shouldFormat = true

  vim.api.nvim_create_autocmd('BufWritePre', {
    pattern = '*',
    group = augroup,
    callback = function()
      if shouldFormat then
        vim.lsp.buf.format()
      end
    end
  })

  keymap("n", "<C-f>", function()
    shouldFormat = not shouldFormat
  end, opts)
end

return {
  'jose-elias-alvarez/null-ls.nvim',
  event = "VeryLazy",
  config = setupNullLs
}
