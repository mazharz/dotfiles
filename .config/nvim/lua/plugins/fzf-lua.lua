local setup = function()
	require("fzf-lua").setup({
		winopts = {
			fullscreen = true,
			border = false,
			preview = {
				wrap = "wrap",
				title = false,
				scrollbar = false,
				winopts = {
					number = false,
				},
			},
		},
		keymap = {
			builtin = {
				false,
				["<M-p>"] = "toggle-preview",
				["<M-d>"] = "preview-page-down",
				["<M-u>"] = "preview-page-up",
			},
			fzf = {
				false,
				["ctrl-a"] = "beginning-of-line",
				["ctrl-e"] = "end-of-line",
				["alt-g"] = "first",
				["alt-G"] = "last",
				["ctrl-d"] = "half-page-down",
				["ctrl-u"] = "half-page-up",
				["alt-a"] = "toggle-all",
			},
		},
		actions = {
			files = {
				false,
				["enter"] = require("fzf-lua.actions").file_edit_or_qf,
				["ctrl-h"] = require("fzf-lua.actions").file_split,
				["ctrl-v"] = require("fzf-lua.actions").file_vsplit,
				["ctrl-t"] = require("fzf-lua.actions").file_tabedit,
				["alt-h"] = require("fzf-lua.actions").toggle_hidden,
				["alt-i"] = require("fzf-lua.actions").toggle_ignore,
			},
		},
		files = {
			git_icons = true,
		},
		grep = {
			git_icons = true,
			rg_glob = true,
			glob_flag = "--iglob",
			glob_separator = "%s%-%-", -- query separator pattern (lua): ' --'
		},
		oldfiles = {
			cwd_only = true,
		},
		-- TODO: explore fzf options and either set them globally or here
		fzf_opts = {
			-- options are sent as `<left>=<right>`
			-- set to `false` to remove a flag
			-- set to `true` for a no-value flag
			-- for raw args use `fzf_args` instead
			-- ["--ansi"]           = true,
			-- ["--info"]           = "inline-right", -- fzf < v0.42 = "inline"
			-- ["--height"]         = "100%",
			-- ["--layout"]         = "reverse",
			-- ["--border"]         = "none",
			-- ["--highlight-line"] = true,           -- fzf >= v0.53
		},
	})
	require("fzf-lua").register_ui_select()
end

return {
	{
		"ibhagwan/fzf-lua",
		config = setup,
		keys = {
			{
				"<leader>sf",
				function()
					require("fzf-lua").files()
				end,
			},
			{
				"<leader>sF",
				function()
					require("fzf-lua").oldfiles()
				end,
			},
			{
				"<leader>s.",
				function()
					require("fzf-lua").resume()
				end,
			},
			{
				"<leader>sb",
				function()
					require("fzf-lua").buffers()
				end,
			},
			{
				"<leader>ss",
				function()
					require("fzf-lua").live_grep()
				end,
			},
			{
				"<leader>s/",
				function()
					require("fzf-lua").search_history()
				end,
			},
			{
				"<leader>sc",
				function()
					require("fzf-lua").commands()
				end,
			},
			{
				"<leader>sC",
				function()
					require("fzf-lua").command_history()
				end,
			},
			{
				"<leader>sd",
				function()
					require("fzf-lua").diagnostics_workspace()
				end,
			},
			{
				"<leader>sm",
				function()
					require("fzf-lua").marks()
				end,
			},
			{
				"<leader>sr",
				function()
					require("fzf-lua").registers()
				end,
			},
			{
				"<leader>sh",
				function()
					require("fzf-lua").helptags()
				end,
			},
			{
				"<leader>so",
				function()
					require("fzf-lua").jumps()
				end,
			},
			{
				"<leader>sp",
				function()
					require("fzf-lua").spell_suggest()
				end,
			},
			{
				"<leader>a",
				function()
					require("fzf-lua").lsp_code_actions()
				end,
				mode = { "n", "v" },
			},
		},
	},
}
