" ======================================================================
" Usability configuration
" ======================================================================

" set incompatible with vi
set nocompatible

" required
filetype off

" syntax
syntax on

" set mouse compatibility
set mouse=a

" encoding utf 8
set encoding=utf-8
set fileencoding=utf-8

" line number
set number relativenumber

" set splits on bottom and right
set splitbelow splitright

" enable matchit plugin which ships with vim and greatly enhances '%'
runtime macros/matchit.vim

" by default, in insert mode backspace won't delete over line breaks, or
" automatically-inserted indentation, let's change that
set backspace=indent,eol,start

" ======================================================================
" Customization
" ======================================================================

" set leader to comma
let mapleader = ","

" search
" find next match as typing
set incsearch
" highlight searches
set hlsearch

" indentation
set autoindent
set tabstop=2
set shiftwidth=2
set expandtab

" tab replacement
set list
set listchars=tab:\|-
set clipboard=unnamed
set clipboard=unnamedplus
set ignorecase

" keep the cursor visible within 3 lines when scrolling
set scrolloff=3

" center cursor in file
:nnoremap <Leader>zz :let &scrolloff=999-&scrolloff+3<CR>

" paste mode
set pastetoggle=<f9>

" select all with <leader>a
noremap <leader>A ggVG

" next file
noremap <leader>n :bn<CR>
" prev file
noremap <leader>N :bp<CR>

" maximize current window without closing the others (unlike <C-W><C-O>)
map <C-W><C-F> <C-W>_<C-W><Bar>

" shortcut for vimgrep
noremap <C-k> :cprevious<CR>
noremap <C-j> :cnext<CR>
noremap <C-x> :cclose<CR>

" unhighlight search results using <Ctrl-l>
nnoremap <silent> <C-l> :nohl<CR><C-l>

" put a vertical line at column 80
set colorcolumn=80

" =============================================================================
" Plugin configuration
" uses https://github.com/junegunn/vim-plug to manage plugins
" =============================================================================
call plug#begin(stdpath('data') . '/plugged')
Plug 'preservim/nerdtree', { 'on':  ['NERDTreeToggle', 'NERDTreeMirror', 'NERDTreeFind'] }

" colorscheme
Plug 'ellisonleao/gruvbox.nvim'

" Telescope
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
" plugin for better sort
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
" plugin for devicons
Plug 'kyazdani42/nvim-web-devicons'

" lsp
Plug 'neovim/nvim-lspconfig'
" lsp autocomplete
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'L3MON4D3/LuaSnip'
Plug 'saadparwaiz1/cmp_luasnip'

" lualine
Plug 'nvim-lualine/lualine.nvim'

Plug 'pangloss/vim-javascript'
" Plug 'neoclide/coc.nvim', {'branch': 'release'}
" coc plugins: coc-tsserver coc-yaml coc-tailwindcss coc-swagger coc-svg coc-sql coc-sh coc-python coc-prettier coc-json coc-html-css-support coc-html coc-highlight coc-graphql coc-git coc-eslint coc-emmet coc-cssmodules coc-css coc-angular coc-sumneko-lua
Plug 'wesQ3/vim-windowswap'
Plug 'mattn/emmet-vim'
Plug 'terryma/vim-multiple-cursors'
Plug 'airblade/vim-gitgutter'
Plug 'qpkorr/vim-bufkill'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-sleuth'
Plug 'Yggdroot/indentLine'
Plug 'sbdchd/neoformat'
Plug 'jiangmiao/auto-pairs'
Plug 'easymotion/vim-easymotion'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'JoosepAlviste/nvim-ts-context-commentstring' " support for tsx commenting

" managing session
Plug 'xolox/vim-misc' " required for vim-session
Plug 'xolox/vim-session'
" bash c comment cpp css dockerfile go graphql html http javascript json jsdoc python regex scss tsx typescript
call plug#end()

" colorscheme
colorscheme gruvbox
set termguicolors

" transparent background
highlight Normal          ctermbg=NONE guibg=NONE
highlight LineNr          ctermbg=NONE guibg=NONE
highlight SignColumn      ctermbg=NONE guibg=NONE

" nerdtree
map <C-b> :NERDTreeToggle<CR>
map <leader>/ :NERDTreeFind<cr>
let NERDTreeMapOpenSplit='<C-h>'
let NERDTreeMapOpenVSplit='<C-v>'

" conceal
set conceallevel=1
" and to toggle concealing use <leader>l
map <leader>l :exec &conceallevel ? "set conceallevel=0" : "set conceallevel=1"<CR>

lua require('basic')
lua require('plugin')

