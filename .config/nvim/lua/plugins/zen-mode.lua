return {
	"folke/zen-mode.nvim",
	keys = {
		{ "<leader>z", ":ZenMode<CR>" },
	},
	enabled = true,
	opts = {
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
