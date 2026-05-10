local setupTreeSitter = function()
	local treesitter = require("nvim-treesitter")
	local textobjects = require("nvim-treesitter-textobjects")

	treesitter.setup({})

	treesitter.install({
		"javascript",
		"typescript",
		"jsx",
		"tsx",
		"jsdoc",
		"json",
		"bash",
		"comment",
		"lua",
		"luadoc",
		"markdown",
		"markdown_inline",
		"graphql",
		"gitcommit",
		"git_config",
		"git_rebase",
		"gitignore",
		"go",
		"yaml",
		"html",
		"css",
		"scss",
		"dockerfile",
		"nginx",
		"python",
		"regex",
		"sql",
		"styled",
		"tmux",
		"hyprlang",
		"printf",
		"robots_txt",
	})

	vim.api.nvim_create_autocmd("FileType", {
		pattern = {
			"javascript",
			"typescript",
			"javascriptreact",
			"typescriptreact",
		},
		callback = function()
			vim.treesitter.start()

			vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
			vim.wo.foldmethod = "expr"

			vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
		end,
	})

	textobjects.setup({
		select = { lookahead = true },
		move = { set_jumps = true },
	})

	local selection = {
		["af"] = "@function.outer",
		["if"] = "@function.inner",
		["ai"] = "@call.outer",
		["ii"] = "@call.inner",
		["ac"] = "@class.outer",
		["ic"] = "@class.inner",
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
	}

	for key, value in pairs(selection) do
		vim.keymap.set({ "x", "o" }, key, function()
			require("nvim-treesitter-textobjects.select").select_textobject(value, "textobjects")
		end)
	end

	vim.keymap.set("n", "<leader>tsj", function()
		require("nvim-treesitter-textobjects.swap").swap_next("@parameter.inner")
	end)
	vim.keymap.set("n", "<leader>tsk", function()
		require("nvim-treesitter-textobjects.swap").swap_previous("@parameter.inner")
	end)

	local move_next = {
		["<leader>tjf"] = "@function.outer",
		["<leader>tji"] = "@call.outer",
		["<leader>tjc"] = "@class.outer",
		["<leader>tj/"] = "@comment.outer",
		["<leader>tjk"] = "@conditional.outer",
		["<leader>tjl"] = "@loop.outer",
		["<leader>tja"] = "@parameter.inner",
		["<leader>tjs"] = "@assignment.outer",
		["<leader>tjr"] = "@return.outer",
		["<leader>tjb"] = "@block.outer",
	}

	local move_previous = {
		["<leader>tkf"] = "@function.outer",
		["<leader>tki"] = "@call.outer",
		["<leader>tkc"] = "@class.outer",
		["<leader>tk/"] = "@comment.outer",
		["<leader>tkk"] = "@conditional.outer",
		["<leader>tkl"] = "@loop.outer",
		["<leader>tka"] = "@parameter.inner",
		["<leader>tks"] = "@assignment.outer",
		["<leader>tkr"] = "@return.outer",
		["<leader>tkb"] = "@block.outer",
	}

	for key, value in pairs(move_next) do
		vim.keymap.set({ "n", "x", "o" }, key, function()
			require("nvim-treesitter-textobjects.move").goto_next_start(value, "textobjects")
		end)
	end

	for key, value in pairs(move_previous) do
		vim.keymap.set({ "n", "x", "o" }, key, function()
			require("nvim-treesitter-textobjects.move").goto_previous_start(value, "textobjects")
		end)
	end
end

return {
	"nvim-treesitter/nvim-treesitter",
	lazy = false,
	build = ":TSUpdate",
	dependencies = {
		"nvim-treesitter/nvim-treesitter-textobjects",
		init = function()
			-- Disable entire built-in ftplugin mappings to avoid conflicts.
			vim.g.no_plugin_maps = true
		end,
	},
	config = setupTreeSitter,
}
