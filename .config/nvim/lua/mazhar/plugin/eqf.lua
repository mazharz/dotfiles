-- job.lua
local Job = require('plenary.job')

local M = {
  current_jobs = {}
}

--create and register a new job
function M.jobstart(opts)
  opts = opts or {}

  -- required options
  vim.tbl_extend('force', opts, {
    enable_recording = true, -- enable job:result()
  })

  -- default options
  opts.populate_quickfix = opts.populate_quickfix or true

  opts.on_exit = vim.schedule_wrap(function(j, code)
    local lines
    lines = j:result()
    -- if code == 0 then
    --   lines = j:result()
    -- else
    --   lines = j:stderr_result()
    -- end

    -- strip ansi terminal color codes
    for i = 1, #lines do
      lines[i] = (lines[i]):gsub(string.char(27) .. '[[0-9;]*m', '')
    end

    -- only show quickfix if there is output
    if opts.populate_quickfix and #lines > 0 then
      vim.fn.setqflist({}, 'r', {
        title = opts.command,
        lines = lines,
        efm = "%f(%l\\,%c): %m",
      })
      vim.cmd([[doautocmd QuickFixCmdPost]])
      vim.cmd('copen')
    end
  end)

  local j = Job:new(opts)
  j:start()
  M.current_jobs[j.pid] = j

  return j
end

function M.make()
  local makeprg = vim.fn.expandcmd(vim.opt.makeprg:get())
  -- split makeprg into command + args
  local args = vim.split(makeprg, ' ')
  local command = args[1]
  table.remove(args, 1)

  return M.jobstart {
    command = command,
    args = args,
  }
end

function M.sh(command_string)
  return M.jobstart {
    command = vim.env.SHELL,
    args = { '-c', command_string },
  }
end

return M
