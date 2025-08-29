local setupTreeSitter = function()
	require("nvim-treesitter.configs").setup({
		ensure_installed = {},
		modules = {},
		ignore_install = {},
		sync_install = false,
		auto_install = true,

		highlight = {
			enable = true,
			throttle = true,
			additional_vim_regex_highlighting = false,
		},

		incremental_selection = {
			enable = true,
			keymaps = {
				node_incremental = "v",
			},
		},

		indent = {
			enable = true,
		},

		textobjects = {
			select = {
				enable = true,
				lookahead = true,
				keymaps = {
					["af"] = "@function.outer",
					["if"] = "@function.inner",
					["ac"] = "@call.outer",
					["ic"] = "@call.inner",
					["aC"] = "@class.outer",
					["iC"] = "@class.inner",
					["a/"] = "@comment.outer",
					["ik"] = "@conditional.inner",
					["ak"] = "@conditional.outer",
					["il"] = "@loop.inner",
					["al"] = "@loop.outer",
					["ia"] = "@parameter.inner",
					["aa"] = "@parameter.outer",
				},
			},
			move = {
				enable = true,
				set_jumps = true,
				goto_next_start = {
					["<leader>gf"] = "@function.outer",
					["<leader>gc"] = "@call.outer",
					["<leader>g/"] = "@comment.outer",
					["<leader>gk"] = "@conditional.outer",
					["<leader>gl"] = "@loop.outer",
					["<leader>ga"] = "@parameter.inner",
				},
				goto_previous_start = {
					["<leader>gF"] = "@function.outer",
					["<leader>gC"] = "@call.outer",
					["<leader>g?"] = "@comment.outer",
					["<leader>gK"] = "@conditional.outer",
					["<leader>gL"] = "@loop.outer",
					["<leader>gA"] = "@parameter.inner",
				},
			},
			-- swap = {
			-- 	enable = true,
			-- 	swap_next = {
			-- 		["<leader>J"] = "@parameter.inner",
			-- 	},
			-- 	swap_previous = {
			-- 		["<leader>K"] = "@parameter.inner",
			-- 	},
			-- },
			lsp_interop = {
				enable = true,
				border = "none",
				peek_definition_code = {
					["<leader>pf"] = "@function.outer",
					["<leader>pC"] = "@class.outer",
				},
			},
		},
	})
end

return {
	"nvim-treesitter/nvim-treesitter",
	dependencies = {
		"nvim-treesitter/nvim-treesitter-textobjects",
	},
	build = ":TSUpdate",
	event = "VeryLazy",
	config = setupTreeSitter,
}
