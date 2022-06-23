-- always show signcolumn git-gutter and diagnostics use it
vim.opt.signcolumn = 'yes'

-- make updates more frequent/faster
vim.opt.updatetime = 300

-- make sure to enable hidden if off, vim will not let you have files
-- with unsaved changes in abandoned buffers
vim.opt.hidden = true

-- some servers (tsserver) have issue with backup files so disable them
vim.opt.backup = false
vim.opt.writebackup = false

-- make sure to show one line for cmd to avoid 'hit-enter' for all commands
vim.opt.cmdheight = 1
