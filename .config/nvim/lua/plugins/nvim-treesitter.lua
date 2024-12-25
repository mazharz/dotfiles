local setupTreeSitter = function()
	require("nvim-treesitter.configs").setup({
		ensure_installed = {
			"bash",
			"c",
			"comment",
			"cpp",
			"css",
			"diff",
			"dockerfile",
			"go",
			"gitcommit",
			"gitignore",
			"graphql",
			"vimdoc",
			"html",
			"http",
			"javascript",
			"json",
			"jsdoc",
			"ledger",
			"lua",
			"python",
			"regex",
			"rust",
			"scss",
			"sql",
			"tsx",
			"typescript",
			"markdown",
			"markdown_inline",
			"query",
			"vue",
			"haskell",
		},

		sync_install = false,

		highlight = {
			enable = true,
			throttle = true,
			additional_vim_regex_highlighting = false,
		},

		incremental_selection = {
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
			-- 		["<leader>aj"] = "@parameter.inner",
			-- 	},
			-- 	swap_previous = {
			-- 		["<leader>ak"] = "@parameter.inner",
			-- 	},
			-- },
			lsp_interop = {
				enable = true,
				border = "none",
				peek_definition_code = {
					-- TODO: find better keymaps, used <leader>d prefix for dap
					["<leader>df"] = "@function.outer",
					["<leader>dC"] = "@class.outer",
				},
			},
		},

		indent = {
			enable = true,
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
