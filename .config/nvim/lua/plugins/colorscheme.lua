return {
	"sainnhe/gruvbox-material",
	config = function()
		vim.o.background = "dark"
		vim.g.gruvbox_material_foreground = "original"
		vim.g.gruvbox_material_disable_italic_comment = 1
		vim.g.gruvbox_material_transparent_background = 2
		vim.g.gruvbox_material_show_eob = 0 -- hide end of buffer ~ chars
		vim.g.gruvbox_material_diagnostic_virtual_text = "colored"
		vim.g.gruvbox_material_better_performance = 1

		vim.cmd("colorscheme gruvbox-material")

		-- Colorscheme overrides for tabline
		vim.api.nvim_set_hl(0, "TabActive", {
			fg = "#282828",
			bg = "#d5c4a1",
		})
		vim.api.nvim_set_hl(0, "TabActiveEdge", {
			fg = "#d5c4a1",
			bg = "NONE",
		})
		vim.api.nvim_set_hl(0, "TabInactive", {
			fg = "#d5c4a1",
			bg = "NONE",
		})
		vim.api.nvim_set_hl(0, "TabInactiveEdge", {
			fg = "#d5c4a1",
			bg = "NONE",
		})
	end,
}
