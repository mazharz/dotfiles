return {
	"folke/zen-mode.nvim",
	keys = {
		{ "<leader>zz", ":ZenMode<CR>" },
	},
	opts = {
		window = {
			backdrop = 1, -- don't shade backdrop
		},
		plugins = {
			options = { laststatus = 0 },
			tmux = { enabled = true },
		},
		on_open = function()
			os.execute("hyprctl dispatch 'hl.dsp.window.fullscreen()'")
		end,
		on_close = function()
			os.execute("hyprctl dispatch 'hl.dsp.window.fullscreen()'")
		end,
	},
}
