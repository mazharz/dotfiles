return {
	"zdcthomas/yop.nvim",
	event = "VeryLazy",
	config = function()
		require("yop").op_map({ "n", "v" }, "<leader>sg", function(lines)
			require("fzf-lua").live_grep({ search = lines[1] })
		end)
		require("yop").op_map({ "n", "v" }, "<leader>ybd", function(lines)
			local decoded = vim.fn.system("echo -n '" .. lines[1] .. "' | base64 -d")
			return { decoded }
		end)
		require("yop").op_map({ "n", "v" }, "<leader>ybe", function(lines)
			local encoded = vim.fn.system("echo -n '" .. lines[1] .. "' | base64 -w 0")
			return { encoded }
		end)
	end,
}
