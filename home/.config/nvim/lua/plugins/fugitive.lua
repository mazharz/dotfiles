return {
	"tpope/vim-fugitive",
	keys = {
		{ "<leader>gs", ":Git<CR><C-w>_<C-w>|" },
		{ "<leader>gm", ":Git mergetool<CR>" },
		{ "<leader>gb", ":Git blame<CR>" },
	},
	-- for some reason, using `config = true` results
	-- in an error
	config = function() end,
	lazy = false,
}
