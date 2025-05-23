return {
	"tpope/vim-fugitive",
	keys = {
		{ "<leader>gs", ":Git<CR><C-w>_<C-w>|" },
		{ "<leader>gvd", ":Gvdiffsplit<CR>" },
		{ "<leader>gv3d", ":Gvdiffsplit!<CR>" },
		{ "<leader>ghd", ":Gdiffsplit<CR>" },
		{ "<leader>gh3d", ":Gdiffsplit!<CR>" },
		{ "<leader>gmm", ":Git mergetool<CR>" },
		{ "<leader>gmy", ":Git mergetool -y<CR>" },
		{ "<leader>gdd", ":Git difftool<CR>" },
		{ "<leader>gdy", ":Git difftool -y<CR>" },
		{ "<leader>gg", ":Git log<CR><C-w>_<C-w>|" },
		{ "<leader>gb", ":Git blame<CR>" },
	},
	-- for some reason, using `config = true` results
	-- in an error
	config = function() end,
	lazy = false,
}
