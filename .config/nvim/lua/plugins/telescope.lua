local telescope = require("telescope")

local setupTelescope = function()
	local layout = require("telescope.actions.layout")
	local actions = require("telescope.actions")
	local lga_actions = require("telescope-live-grep-args.actions")

	telescope.setup({
		defaults = {
			prompt_prefix = "$ ",
			layout_strategy = "flex",
			layout_config = {
				height = { padding = 0 },
				width = { padding = 0 },
			},
			mappings = {
				n = {
					["<M-p>"] = layout.toggle_preview,
					["<C-h>"] = actions.file_split,
					["dd"] = actions.delete_buffer,
				},
				i = {
					["<M-p>"] = layout.toggle_preview,
					["<C-h>"] = actions.file_split,
					["<C-k>"] = actions.move_selection_previous,
					["<C-j>"] = actions.move_selection_next,
					["<Del>"] = actions.delete_buffer,
				},
			},
			file_ignore_patterns = {
				"%.git",
			},
		},

		extensions = {
			live_grep_args = {
				auto_quoting = true,
				mappings = {
					i = {
						["<C-e>"] = lga_actions.quote_prompt({ postfix = " --iglob " }),
						-- freeze the current list and start a fuzzy search in the frozen list
						["<C-space>"] = actions.to_fuzzy_refine,
					},
				},
			},
		},
	})
	-- make sure telescope uses fzf plugin
	telescope.load_extension("fzf")
	-- replace default ui (ex. code actions) with telescope
	telescope.load_extension("ui-select")
	-- enable live grep args
	telescope.load_extension("live_grep_args")
end

return {
	"nvim-telescope/telescope.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{
			-- plugin for better sort
			"nvim-telescope/telescope-fzf-native.nvim",
			build = "make",
		},
		"nvim-telescope/telescope-ui-select.nvim",
		"nvim-telescope/telescope-live-grep-args.nvim",
	},
	keys = {
		{
			"<leader>sf",
			function()
				require("telescope.builtin").find_files({ hidden = true })
			end,
		},
		{
			"<leader>sb",
			function()
				require("telescope.builtin").buffers()
			end,
		},
		{
			"<leader>ss",
			function()
				telescope.extensions.live_grep_args.live_grep_args({
					additional_args = {
						"--hidden",
					},
				})
			end,
		},
		{
			"<leader>sw",
			function()
				require("telescope-live-grep-args.shortcuts").grep_word_under_cursor()
			end,
		},
		{
			"<leader>sv",
			function()
				require("telescope-live-grep-args.shortcuts").grep_visual_selection()
			end,
			mode = "v",
		},
		{
			"<leader>sc",
			function()
				require("telescope.builtin").commands()
			end,
		},
		{
			"<leader>sd",
			function()
				require("telescope.builtin").diagnostics()
			end,
		},
		{
			"<leader>sm",
			function()
				require("telescope.builtin").marks()
			end,
		},
	},
	config = setupTelescope,
}
