call plug#begin(stdpath('data') . '/plugged')
" colorscheme
Plug 'ellisonleao/gruvbox.nvim'

" file-tree explorer
Plug 'kyazdani42/nvim-tree.lua'

" Telescope
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
" plugin for better sort
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
" plugin for devicons
Plug 'kyazdani42/nvim-web-devicons'

" lsp
Plug 'neovim/nvim-lspconfig'
Plug 'williamboman/nvim-lsp-installer'
" lsp autocomplete
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'L3MON4D3/LuaSnip'
Plug 'saadparwaiz1/cmp_luasnip'
Plug 'rafamadriz/friendly-snippets'

" lualine
Plug 'nvim-lualine/lualine.nvim'

" comment
Plug 'numToStr/Comment.nvim'
Plug 'JoosepAlviste/nvim-ts-context-commentstring' " support for tsx commenting

Plug 'wesQ3/vim-windowswap'
Plug 'terryma/vim-multiple-cursors'
Plug 'airblade/vim-gitgutter'
Plug 'qpkorr/vim-bufkill'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-sleuth'
Plug 'sbdchd/neoformat'
Plug 'jiangmiao/auto-pairs'
Plug 'easymotion/vim-easymotion'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" managing session
Plug 'xolox/vim-misc' " required for vim-session
Plug 'xolox/vim-session'
call plug#end()

lua require('mazhar.options')
lua require('mazhar.keymaps')
lua require('mazhar.plugin')

