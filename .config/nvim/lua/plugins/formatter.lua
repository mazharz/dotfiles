return {
	"stevearc/conform.nvim",
	event = "VeryLazy",
	config = function()
		local shouldFormat = true
		local conform = require("conform")

		conform.setup({
			formatters_by_ft = {
				lua = { "stylua" },
				go = { "gofumpt" },
				haskell = { "ormolu" },
				["_"] = { "prettier" },
			},
			-- prevent annoying error when file can't be formatted
			notify_on_error = false,
		})

		vim.api.nvim_create_autocmd("BufWritePre", {
			pattern = "*",
			callback = function(args)
				if shouldFormat then
					conform.format({ bufnr = args.buf, quiet = true })
				end
			end,
		})

		vim.keymap.set("n", "<C-f>", function()
			shouldFormat = not shouldFormat
		end)
	end,
}
