local utils = require("utils")

local setupDap = function()
	local dap = require("dap")
	local dapUtils = require("dap.utils")
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
	dap.adapters["pwa-node"] = {
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

	local js_langs = { "typescript", "javascript" }

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
			-- for attaching to running application
			{
				type = "pwa-node",
				request = "attach",
				name = "Attach to process",
				processId = function()
					dapUtils.pick_process({ filter = vim.fn.input("Filter processes: ") })
				end,
				cwd = "${workspaceFolder}",
			},
			{
				type = "pwa-node",
				request = "attach",
				name = "Attach to motherfucker nx nestjs",
				address = "0.0.0.0",
				cwd = "${workspaceFolder}/apps/core-be",
				port = 9229,
				restart = true,
				skipFiles = { "<node_internals>/**" },
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
			"microsoft/vscode-js-debug",
			build = "npm install --ignore-scripts && npm run compile vsDebugServerBundle && rm -rf out && mv -f dist out",
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
