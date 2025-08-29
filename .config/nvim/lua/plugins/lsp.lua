local setupLsp = function()
	local capabilities = require("cmp_nvim_lsp").default_capabilities()

	-- remove stupid default keybinds
	local bufopts = { noremap = true, silent = true }
	vim.keymap.del("n", "gra", bufopts)
	vim.keymap.del("x", "gra", bufopts)
	vim.keymap.del("n", "grn", bufopts)
	vim.keymap.del("n", "grr", bufopts)
	vim.keymap.del("n", "gri", bufopts)
	vim.keymap.del("n", "grt", bufopts)

	local on_attach = function(client, bufnr)
		bufopts = { noremap = true, silent = true, buffer = bufnr }
		vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)

		vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
		vim.keymap.set("n", "gvd", ":vsplit | lua vim.lsp.buf.definition()<CR>", bufopts)
		vim.keymap.set("n", "ghd", ":split | lua vim.lsp.buf.definition()<CR>", bufopts)
		vim.keymap.set("n", "gtd", ":tab split | lua vim.lsp.buf.definition()<CR>", bufopts)

		vim.keymap.set("n", "gr", vim.lsp.buf.references, bufopts)
		vim.keymap.set("n", "gvr", ":vsplit | lua vim.lsp.buf.references()<CR>", bufopts)
		vim.keymap.set("n", "ghr", ":split | lua vim.lsp.buf.references()<CR>", bufopts)
		vim.keymap.set("n", "gtr", ":tab split | lua vim.lsp.buf.references()<CR>", bufopts)

		vim.keymap.set("n", "gD", vim.lsp.buf.type_definition, bufopts)
		vim.keymap.set("n", "gvD", ":vsplit | lua vim.lsp.buf.type_definition()<CR>", bufopts)
		vim.keymap.set("n", "ghD", ":split | lua vim.lsp.buf.type_definition()<CR>", bufopts)
		vim.keymap.set("n", "gtD", ":tab split | lua vim.lsp.buf.type_definition()<CR>", bufopts)

		vim.keymap.set("n", "gi", vim.lsp.buf.implementation, bufopts)
		vim.keymap.set("n", "gvi", ":vsplit | lua vim.lsp.buf.implementation()<CR>", bufopts)
		vim.keymap.set("n", "ghi", ":split | lua vim.lsp.buf.implementation()<CR>", bufopts)
		vim.keymap.set("n", "gti", ":tab split | lua vim.lsp.buf.implementation()<CR>", bufopts)

		vim.keymap.set("n", "<leader>j", function()
			vim.diagnostic.jump({ count = 1, float = true })
		end, bufopts)
		vim.keymap.set("n", "<leader>k", function()
			vim.diagnostic.jump({ count = -1, float = true })
		end, bufopts)
		vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, bufopts)

		vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename, bufopts)

		vim.keymap.set("n", "<leader>R", ":LspRestart<CR>", bufopts)

		-- prevent ts_ls from formatting, let formatter plugin handle it
		if client.name == "ts_ls" then
			client.server_capabilities.document_formatting = false
		end
	end

	vim.diagnostic.config({
		virtual_text = {
			source = false,
			spacing = 0,
			prefix = "●",
			suffix = "",
			format = function()
				return ""
			end,
		},
		signs = false,
	})

	require("mason").setup()
	require("mason-lspconfig").setup({
		ensure_installed = {},
		automatic_enable = false,
	})

	local servers = {
		clangd = {},
		ts_ls = {},
		lua_ls = {},
		graphql = {},
		eslint = {},
		html = {},
		cssls = {
			settings = {
				css = { validate = true, lint = { unknownAtRules = "ignore" } },
				scss = { validate = true, lint = { unknownAtRules = "ignore" } },
				less = { validate = true, lint = { unknownAtRules = "ignore" } },
			},
		},
		jsonls = {},
		yamlls = {},
		cssmodules_ls = {},
		bashls = {},
		rust_analyzer = {},
		gopls = {},
		golangci_lint_ls = {},
		pyright = {},
	}

	for name, extra in pairs(servers) do
		vim.lsp.config(
			name,
			vim.tbl_deep_extend("force", {
				capabilities = capabilities,
				on_attach = on_attach,
			}, extra)
		)
		vim.lsp.enable(name)
	end
end

return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		{ "williamboman/mason-lspconfig.nvim" },
		{
			"williamboman/mason.nvim",
			cmd = "Mason",
			config = true,
		},
	},
	config = setupLsp,
}
