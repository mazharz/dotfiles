local dap = require("dap")
local utils = require("dap.utils")
local dapui = require("dapui")

vim.keymap.set('n', '<leader>dc', dap.continue)
vim.keymap.set('n', '<leader>do', dap.step_over)
vim.keymap.set('n', '<leader>di', dap.step_into)
vim.keymap.set('n', '<leader>dO', dap.step_out)
vim.keymap.set('n', '<leader>db', dap.toggle_breakpoint)
vim.keymap.set('n', '<leader>dB', function()
  dap.toggle_breakpoint(vim.fn.input('Condition: '))
end)
vim.keymap.set('n', '<leader>dd', dap.clear_breakpoints)
vim.keymap.set('n', '<leader>du', dapui.toggle)
vim.keymap.set('n', "<leader>dl", function()
  dap.list_breakpoints()
  vim.cmd('copen')
end)
-- evaluate symbol under cursor and show its value in floating window
vim.keymap.set('n', "<leader>dk", function()
  dapui.eval(nil, { enter = true })
end)

-- Set up icons.
local icons = {
  DapStopped = { ' ', 'DiagnosticWarn', 'DapStoppedLine' },
  DapBreakpoint = { ' ', 'DiagnosticInfo' },
  DapBreakpointCondition = { ' ', 'DiagnosticInfo' },
  DapBreakpointRejected = { ' ', 'DiagnosticError' },
  DapLogPoint = { ' ', 'DiagnosticInfo' },
}

for name, sign in pairs(icons) do
  vim.fn.sign_define(name, {
    text = sign[1],
    texthl = sign[2],
    linehl = sign[3],
    numhl = sign[3],
  })
end

-- find how to setup for other languages from the nvim-dap GitHub page
require("dap-vscode-js").setup({
  adapters = { 'pwa-node', 'pwa-chrome' },
})

local js_langs = { "typescript", "javascript", "typescriptreact", "javascriptreact" };

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
      processId = function() utils.pick_process({ filter = vim.fn.input("Filter: ") }) end,
      cwd = "${workspaceFolder}",
    },
    -- for frontend debugging
    {
      type = "pwa-chrome",
      request = "launch",
      name = "Start Chrome with \"localhost\"",
      url = "http://localhost:3000",
      webRoot = "${workspaceFolder}",
      -- userDataDir = "${workspaceFolder}/.vscode/vscode-chrome-debug-userdatadir"
    }
  }
end

dapui.setup()

-- automatically open ui on dap init
dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open({})
end
