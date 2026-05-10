local function setup()
	require("treesitter-context").setup({
		enable = true,
		multiline_threshold = 10,
	})

	vim.keymap.set("n", "<leader>K", function()
		require("treesitter-context").go_to_context(vim.v.count1)
	end)

	-- remove disturbing background
	-- TODO: make it easier to distinguish
	-- vim.api.nvim_set_hl(0, "TreesitterContext", { bg = "NONE" })
end

return {
	"nvim-treesitter/nvim-treesitter-context",
	event = "VeryLazy",
	config = setup,
	keys = {
		{ "<leader>zc", ":TSContext toggle<CR>" },
	},
}
