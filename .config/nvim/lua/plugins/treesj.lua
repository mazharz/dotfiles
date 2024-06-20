return {
	'Wansmer/treesj',
	keys = {
		{
			'<space>J',
			":TSJToggle<CR>"
		}
	},
	config = function()
		require('treesj').setup({
			use_default_keymaps = false,
		})
	end,
}
