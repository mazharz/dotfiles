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
					["ish"] = "@assignment.lhs",
					["isl"] = "@assignment.rhs",
					["as"] = "@assignment.outer",
					["ir"] = "@return.inner",
					["ar"] = "@return.outer",
					["ib"] = "@block.inner",
					["ab"] = "@block.outer",
				},
			},
			move = {
				enable = true,
				set_jumps = true,
				goto_next_start = {
					["<leader>tjf"] = "@function.outer",
					["<leader>tjc"] = "@call.outer",
					["<leader>tjC"] = "@class.outer",
					["<leader>tj/"] = "@comment.outer",
					["<leader>tjk"] = "@conditional.outer",
					["<leader>tjl"] = "@loop.outer",
					["<leader>tja"] = "@parameter.inner",
					["<leader>tjs"] = "@assignment.outer",
					["<leader>tjr"] = "@return.outer",
					["<leader>tjb"] = "@block.outer",
				},
				goto_previous_start = {
					["<leader>tkf"] = "@function.outer",
					["<leader>tkc"] = "@call.outer",
					["<leader>tkC"] = "@class.outer",
					["<leader>tk/"] = "@comment.outer",
					["<leader>tkk"] = "@conditional.outer",
					["<leader>tkl"] = "@loop.outer",
					["<leader>tka"] = "@parameter.inner",
					["<leader>tks"] = "@assignment.outer",
					["<leader>tkr"] = "@return.outer",
					["<leader>tkb"] = "@block.outer",
				},
			},
			swap = {
				enable = true,
				swap_next = {
					["<leader>tsj"] = "@parameter.inner",
				},
				swap_previous = {
					["<leader>tsk"] = "@parameter.inner",
				},
			},
			lsp_interop = {
				enable = true,
				peek_definition_code = {
					["<leader>tpf"] = "@function.outer",
					["<leader>tpC"] = "@class.outer",
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
