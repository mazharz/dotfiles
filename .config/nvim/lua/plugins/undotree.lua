return {
  'mbbill/undotree',
  config = function()
    local keymap = vim.keymap.set
    local opts = { noremap = true, silent = true }

    keymap("n", "<leader>u", ":UndotreeToggle<CR>", opts)
  end
}
