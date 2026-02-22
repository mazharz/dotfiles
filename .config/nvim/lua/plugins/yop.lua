return {
	"zdcthomas/yop.nvim",
	event = "VeryLazy",
	config = function()
		require("yop").op_map({ "n", "v" }, "<leader>sg", function(lines)
			require("fzf-lua").live_grep({ search = lines[1] })
		end)
	end,
}
