local setupOil = function()
  local oil = require('oil');

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
end

return {
  'stevearc/oil.nvim',
  keys = {
    { "-", ":Oil<CR>" },
    {
      "_", function()
      require('oil.actions').open_cwd.callback()
    end
    }
  },
  -- so it correctly replaces netrw on starting up with directory argument
  lazy = false,
  config = setupOil
}
