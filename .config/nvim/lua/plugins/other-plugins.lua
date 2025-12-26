return {
	"nvim-lua/plenary.nvim",
	{ "kylechui/nvim-surround", version = "*", event = "VeryLazy", config = true },
	"tpope/vim-repeat",
	"tpope/vim-sleuth",
	"nvim-tree/nvim-web-devicons",

	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = true,
	},

	-- task runner
	{
		"tpope/vim-dispatch",
		keys = {
			{ "<leader>Dt", ":Dispatch tsc --pretty false<CR>" },
		},
	},
}
