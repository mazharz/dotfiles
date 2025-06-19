local setupGitsigns = function()
	require("gitsigns").setup({
		on_attach = function(bufnr)
			local gitsigns = require("gitsigns")

			local function map(mode, l, r, opts)
				opts = opts or {}
				opts.buffer = bufnr
				vim.keymap.set(mode, l, r, opts)
			end

			map("n", "<leader>hj", function()
				gitsigns.nav_hunk("next")
			end)
			map("n", "<leader>hk", function()
				gitsigns.nav_hunk("prev")
			end)
			-- don't pass stage_hunk & reset_hunk functions, because this way,
			-- it passes the range to be able to stage/reset via visual select
			map({ "n", "v" }, "<leader>hs", ":Gitsigns stage_hunk<CR>")
			map({ "n", "v" }, "<leader>hr", ":Gitsigns reset_hunk<CR>")
			map("n", "<leader>hp", gitsigns.preview_hunk)
			map("n", "<leader>hb", function()
				gitsigns.blame_line({ full = true })
			end)

			-- text object
			map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>")
		end,
	})
end

return {
	"lewis6991/gitsigns.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = setupGitsigns,
}
