local utils = require("utils")

local setupDap = function()
	local dap = require("dap")
	local dapui = require("dapui")

	-- Set up icons.
	local icons = {
		DapStopped = { "▶", "DiagnosticWarn", "DapStoppedLine" },
		DapBreakpoint = { "●", "DiagnosticInfo" },
		DapBreakpointCondition = { "◆", "DiagnosticInfo" },
		DapBreakpointRejected = { "○", "DiagnosticError" },
		DapLogPoint = { "■", "DiagnosticInfo" },
	}

	for name, sign in pairs(icons) do
		vim.fn.sign_define(name, {
			text = sign[1],
			texthl = sign[2],
			linehl = sign[3],
			numhl = sign[3],
		})
	end

	-- NOTE: install `js-debug-adapter` manually via :Mason
	if not dap.adapters["pwa-node"] then
		require("dap").adapters["pwa-node"] = {
			type = "server",
			host = "localhost",
			port = "${port}",
			executable = {
				command = "node",
				args = {
					utils.get_mason_pkg_path("js-debug-adapter", "/js-debug/src/dapDebugServer.js"),
					"${port}",
				},
			},
		}
	end

	if not dap.adapters["node"] then
		dap.adapters["node"] = function(cb, config)
			if config.type == "node" then
				config.type = "pwa-node"
			end
			local nativeAdapter = dap.adapters["pwa-node"]
			if type(nativeAdapter) == "function" then
				nativeAdapter(cb, config)
			else
				cb(nativeAdapter)
			end
		end
	end

	local js_filetypes = { "typescript", "javascript", "typescriptreact", "javascriptreact" }

	local vscode = require("dap.ext.vscode")
	vscode.type_to_filetypes["node"] = js_filetypes
	vscode.type_to_filetypes["pwa-node"] = js_filetypes

	for _, language in ipairs(js_filetypes) do
		if not dap.configurations[language] then
			dap.configurations[language] = {
				{
					type = "pwa-node",
					request = "launch",
					name = "Launch file",
					program = "${file}",
					cwd = "${workspaceFolder}",
				},
				{
					type = "pwa-node",
					request = "attach",
					name = "Attach",
					port = function()
						return tonumber(vim.fn.input("Debug port: ", "9001"))
					end,
					cwd = "${workspaceFolder}",
					sourceMaps = true,
					resolveSourceMapLocations = {
						"${workspaceFolder}/**",
						"!**/node_modules/**",
					},
					outFiles = { "${workspaceFolder}/**/*.js", "!**/node_modules/**" },
				},
			}
		end
	end

	dapui.setup()

	-- automatically open ui on dap init
	dap.listeners.after.event_initialized["dapui_config"] = function()
		dapui.open({})
	end
end

return {
	"mfussenegger/nvim-dap",
	dependencies = {
		{ "rcarriga/nvim-dap-ui", dependencies = "nvim-neotest/nvim-nio" },
	},
	keys = {
		{
			"<leader>dc",
			function()
				require("dap").continue()
			end,
		},
		{
			"<leader>do",
			function()
				require("dap").step_over()
			end,
		},
		{
			"<leader>di",
			function()
				require("dap").step_into()
			end,
		},
		{
			"<leader>dO",
			function()
				require("dap").step_out()
			end,
		},
		{
			"<leader>db",
			function()
				require("dap").toggle_breakpoint()
			end,
		},
		{
			"<leader>dB",
			function()
				require("dap").toggle_breakpoint(vim.fn.input("Condition: "))
			end,
		},
		{
			"<leader>dd",
			function()
				require("dap").clear_breakpoints()
			end,
		},
		{
			"<leader>du",
			function()
				require("dapui").toggle()
			end,
		},
		{
			"<leader>dl",
			function()
				require("dap").list_breakpoints()
				vim.cmd("copen")
			end,
		},
		-- evaluate symbol under cursor and show its value in floating window
		{
			"<leader>dk",
			function()
				require("dapui").eval(nil, { enter = true })
			end,
		},
	},
	config = setupDap,
}
