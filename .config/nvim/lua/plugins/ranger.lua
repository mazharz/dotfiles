return {
	"kelly-lin/ranger.nvim",
	keys = {
		{
			"<leader>f", function() require("ranger-nvim").open(true) end,
		},
		{
			"<leader>F", function() require("ranger-nvim").open(false) end
		},
	},
	config = function()
		require("ranger-nvim").setup(
			{
				replace_netrw = true,
				keybinds = {
					["<c-v>"] = require("ranger-nvim").OPEN_MODE.vsplit,
					["<c-h>"] = require("ranger-nvim").OPEN_MODE.split,
					["<c-t>"] = require("ranger-nvim").OPEN_MODE.tabedit,
					["<c-r>"] = require("ranger-nvim").OPEN_MODE.rifle,
				}
			}
		)
	end
}
