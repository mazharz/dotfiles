require("nvim-tree").setup({
  sort_by = "case_sensitive",
  view = {
    adaptive_size = true,
    mappings = {
      list = {
        { key = "u", action = "dir_up" },
        { key = "<C-h>", action = "split" }, -- override <C-x>
      },
    },
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = false, -- false means show dotfiles (hidden)
  },
  git = {
    ignore = false -- false means show .gitignore files
  }
})

vim.keymap.set('n', '<leader>m', '<cmd>NvimTreeToggle<CR>')
vim.keymap.set('n', '<leader>M', '<cmd>NvimTreeFindFile<CR>')
