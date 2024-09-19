local setupDap = function()
	local dap = require("dap")
	local utils = require("dap.utils")
	local dapui = require("dapui")

	-- Set up icons.
	local icons = {
		DapStopped = { ">", "DiagnosticWarn", "DapStoppedLine" },
		DapBreakpoint = { "*", "DiagnosticInfo" },
		DapBreakpointCondition = { "?", "DiagnosticInfo" },
		DapBreakpointRejected = { "!", "DiagnosticError" },
		DapLogPoint = { "$", "DiagnosticInfo" },
	}

	for name, sign in pairs(icons) do
		vim.fn.sign_define(name, {
			text = sign[1],
			texthl = sign[2],
			linehl = sign[3],
			numhl = sign[3],
		})
	end

	local js_langs = { "typescript", "javascript", "typescriptreact", "javascriptreact" }

	for _, language in ipairs(js_langs) do
		dap.configurations[language] = {
			-- for single file debugging
			{
				type = "pwa-node",
				request = "launch",
				name = "Launch file",
				program = "${file}",
				cwd = "${workspaceFolder}",
			},
			-- for backend debugging
			{
				type = "pwa-node",
				request = "attach",
				name = "Attach to process",
				processId = function()
					utils.pick_process({ filter = vim.fn.input("Filter: ") })
				end,
				cwd = "${workspaceFolder}",
			},
			-- for frontend debugging
			{
				type = "pwa-chrome",
				request = "launch",
				name = 'Start Chrome with "localhost"',
				url = "http://localhost:3000",
				webRoot = "${workspaceFolder}",
				-- userDataDir = "${workspaceFolder}/.vscode/vscode-chrome-debug-userdatadir"
			},
		}
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
		{
			"mxsdev/nvim-dap-vscode-js",
			opts = {
				debugger_path = vim.fn.stdpath("data") .. "/lazy/vscode-js-debug",
				adapters = { "pwa-node", "pwa-chrome" },
			},
		},
		{
			"microsoft/vscode-js-debug",
			build = "npm i && npm run compile vsDebugServerBundle && rm -rf out && mv -f dist out",
		},
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
