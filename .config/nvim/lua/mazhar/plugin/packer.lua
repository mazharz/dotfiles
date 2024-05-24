local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer..."
  vim.cmd [[packadd packer.nvim]]
end

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  print("Packer is not found! Please fix it mate.")
  return
end

return packer.startup(function(use)
  -- packer itself
  use 'wbthomason/packer.nvim'
  -- colorscheme
  use 'sainnhe/gruvbox-material'

  -- file explorer
  use 'stevearc/oil.nvim'

  -- Telescope
  use 'nvim-lua/plenary.nvim'
  use 'nvim-telescope/telescope.nvim'
  -- plugin for better sort
  use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }

  -- lsp
  use 'neovim/nvim-lspconfig'
  use 'williamboman/mason.nvim'
  use 'williamboman/mason-lspconfig.nvim'
  use 'jose-elias-alvarez/null-ls.nvim'
  -- lsp autocomplete
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'L3MON4D3/LuaSnip'
  use 'saadparwaiz1/cmp_luasnip'
  -- project specific settings
  use 'folke/neoconf.nvim'
  use 'folke/neodev.nvim'

  -- lualine
  use 'nvim-lualine/lualine.nvim'
  use 'arkav/lualine-lsp-progress'

  -- comment
  use 'numToStr/Comment.nvim'
  -- support for tsx commenting
  use 'JoosepAlviste/nvim-ts-context-commentstring'

  -- undo tree
  use 'mbbill/undotree'

  -- git
  use 'tpope/vim-fugitive'
  use 'lewis6991/gitsigns.nvim'

  use 'terryma/vim-multiple-cursors'
  use 'tpope/vim-surround'
  use 'tpope/vim-repeat'
  use 'tpope/vim-sleuth'
  use 'jiangmiao/auto-pairs'

  -- task runner
  use 'tpope/vim-dispatch'

  -- highlighting
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
  use 'nvim-treesitter/nvim-treesitter-textobjects'
  use 'RRethy/vim-illuminate'
  use 'nvim-treesitter/playground'

  -- typst
  use { 'kaarmu/typst.vim', ft = { 'typst' } }

  -- debugger
  use 'mfussenegger/nvim-dap'
  use { 'rcarriga/nvim-dap-ui', requires = 'nvim-neotest/nvim-nio' }
  use 'mxsdev/nvim-dap-vscode-js'
  use {
    "microsoft/vscode-js-debug",
    opt = true,
    run = "npm install --legacy-peer-deps && npx gulp vsDebugServerBundle && mv dist out"
  }

  -- db client
  use 'tpope/vim-dadbod'
  use 'kristijanhusak/vim-dadbod-ui'
  use 'kristijanhusak/vim-dadbod-completion'

  -- Automatically set up configuration after cloning packer.nvim
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
