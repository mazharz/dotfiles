return {
	"kaarmu/typst.vim",
	ft = { "typst" },
	config = function()
		vim.g.typst_pdf_viewer = "zathura"
		vim.keymap.set("n", "<leader>t", ":TypstWatch<CR>")
	end,
}
