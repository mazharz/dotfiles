return {
	"tpope/vim-dadbod",
	dependencies = {
		"kristijanhusak/vim-dadbod-ui",
		"kristijanhusak/vim-dadbod-completion",
	},
	keys = {
		{ "<leader>S", ":DBUIToggle<CR>" },
	},
	config = function()
		vim.cmd([[
      " use neovim's notify api instead of the default horrible notification mechanism
      let g:db_ui_use_nvim_notify = 1
    ]])
	end,
}
