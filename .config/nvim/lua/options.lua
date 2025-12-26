local options = {
	-- always show signcolumn to avoid layout shift
	signcolumn = "yes",
	-- make updates more frequent/faster
	updatetime = 1000,
	-- make sure to enable hidden if off, vim will not let you have files
	-- with unsaved changes in abandoned buffers
	hidden = true,
	-- some servers (ts_ls) have issue with backup files so disable them
	backup = false,
	writebackup = false,
	-- make sure to show one line for cmd to avoid 'hit-enter' for all commands
	cmdheight = 1,
	-- use system clipboard
	clipboard = "unnamedplus",
	-- make sure to show everything
	conceallevel = 0,
	-- file encoding
	encoding = "utf-8",
	fileencoding = "utf-8",
	-- highlight searches
	hlsearch = true,
	-- case insensitive search
	ignorecase = true,
	-- enable mouse support for everything
	mouse = "a",
	-- split below and right, the default is stupid
	splitbelow = true,
	splitright = true,
	-- set term gui colors
	termguicolors = true,
	-- time to wait for a mapped sequence to complete
	timeoutlen = 1000,
	-- convert tabs to spaces
	expandtab = true,
	-- the number of spaces inserted for each indentation
	shiftwidth = 2,
	-- insert 2 spaces for a tab
	tabstop = 2,
	-- set numbered lines
	number = true,
	-- set relative numbered lines
	relativenumber = true,
	-- is one of my favorite
	scrolloff = 1,
	-- customize spaces and tabs
	list = true,
	listchars = "tab:  ",
	-- find next match as typing for search
	incsearch = true,
	-- auto indent
	autoindent = true,
	-- mouse right button extends selection
	mousemodel = "extend",
	spell = true,
}

for key, value in pairs(options) do
	vim.opt[key] = value
end

vim.o.foldmethod = "expr"
vim.wo.foldenable = false
vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"

-- highlight on yank
vim.api.nvim_create_autocmd("TextYankPost", {
	pattern = "*",
	group = vim.api.nvim_create_augroup("highlight-yank", { clear = true }),
	command = "lua vim.highlight.on_yank()",
})
