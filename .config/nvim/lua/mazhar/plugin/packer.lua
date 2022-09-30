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

-- Autocommand that reloads neovim whenever you save this file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost packer.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  print("Packer is not found! Please fix it mate.")
  return
end

return packer.startup(function(use)
  -- almighty packer himself!
  use 'wbthomason/packer.nvim'
  -- colorscheme
  use 'ellisonleao/gruvbox.nvim'

  -- file-tree explorer
  use 'kyazdani42/nvim-tree.lua'

  -- Telescope
  use 'nvim-lua/plenary.nvim'
  use 'nvim-telescope/telescope.nvim'
  -- plugin for better sort
  use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
  -- plugin for devicons
  use 'kyazdani42/nvim-web-devicons'

  -- lsp
  use 'neovim/nvim-lspconfig'
  use 'williamboman/nvim-lsp-installer'
  use 'jose-elias-alvarez/null-ls.nvim'
  -- lsp autocomplete
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'L3MON4D3/LuaSnip'
  use 'saadparwaiz1/cmp_luasnip'

  -- lualine
  use 'nvim-lualine/lualine.nvim'
  use 'arkav/lualine-lsp-progress'

  -- comment
  use 'numToStr/Comment.nvim'
  -- support for tsx commenting
  use 'JoosepAlviste/nvim-ts-context-commentstring'

  -- undo tree
  use 'mbbill/undotree'

  use 'terryma/vim-multiple-cursors'
  use 'airblade/vim-gitgutter'
  use 'qpkorr/vim-bufkill'
  use 'tpope/vim-surround'
  use 'tpope/vim-fugitive'
  use 'tpope/vim-repeat'
  use 'tpope/vim-sleuth'
  use 'jiangmiao/auto-pairs'
  use 'easymotion/vim-easymotion'

  -- highlighting
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
  use 'RRethy/vim-illuminate'

  -- managing session
  use {
    'xolox/vim-session',
    requires = { 'xolox/vim-misc' }
  }

  -- Automatically set up configuration after cloning packer.nvim
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
