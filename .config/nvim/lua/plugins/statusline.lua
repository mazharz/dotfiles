local setupStatusLine = function()
	require("lualine").setup({
		options = {
			icons_enabled = false,
			theme = "gruvbox-material",
			section_separators = { left = "", right = "" },
			component_separators = { left = "", right = "" },
			disabled_filetypes = {},
			always_divide_middle = true,
			globalstatus = true, -- aka: vim.opt.laststatus = 3
		},
		sections = {
			lualine_a = { { "mode", separator = { left = "" } } },
			lualine_b = { "branch" },
			lualine_c = {
				{ "filename", path = 1 },
				{ "lsp_progress", display_components = { "spinner" } },
			},
			lualine_x = { "diagnostics" },
			lualine_y = {},
			lualine_z = {},
		},
		tabline = {
			lualine_a = {
				{
					"tabs",
					max_length = vim.o.columns, -- defaults to init terminal length
					mode = 1,
				},
			},
		},
		extensions = {},
	})
end

return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "arkav/lualine-lsp-progress" },
	config = setupStatusLine,
}
