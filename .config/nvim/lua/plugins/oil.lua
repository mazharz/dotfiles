local setupOil = function()
  local oil = require('oil');
  local actions = require('oil.actions')

  oil.setup({
    keymaps = {
      -- use C-v instead of C-s to split vertically
      ["<C-s>"] = false,
      ["<C-v>"] = "actions.select_vsplit",
    },
    view_options = {
      show_hidden = true,
    }
  })

  vim.keymap.set("n", "-", ":Oil<CR>", { desc = "Open parent directory via oil.nvim" })
  vim.keymap.set("n", "_", actions.open_cwd.callback, { desc = "Open current working directory via oil.nvim" })
end

return {
  'stevearc/oil.nvim',
  config = setupOil
}
