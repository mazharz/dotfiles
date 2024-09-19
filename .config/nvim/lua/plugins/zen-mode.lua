return {
	"folke/zen-mode.nvim",
	keys = {
		{ "<leader>z", ":ZenMode<CR>" },
	},
	enabled = true,
	opts = {
		window = {
			width = 100,
		},
		plugins = {
			options = {
				enabled = true,
				showcmd = true,
				laststatus = 0,
			},
			tmux = { enabled = true },
		},
	},
}
