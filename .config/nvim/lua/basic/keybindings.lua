-- Windows

-- change focus
vim.keymap.set('i', '<A-h>', '<C-\\><C-N><C-w>h')
vim.keymap.set('i', '<A-j>', '<C-\\><C-N><C-w>j')
vim.keymap.set('i', '<A-k>', '<C-\\><C-N><C-w>k')
vim.keymap.set('i', '<A-l>', '<C-\\><C-N><C-w>l')
vim.keymap.set('n', '<A-h>', '<C-w>h')
vim.keymap.set('n', '<A-j>', '<C-w>j')
vim.keymap.set('n', '<A-k>', '<C-w>k')
vim.keymap.set('n', '<A-l>', '<C-w>l')

-- move window
vim.keymap.set('i', '<A-S-h>', '<C-\\><C-N><C-w>H')
vim.keymap.set('i', '<A-S-j>', '<C-\\><C-N><C-w>J')
vim.keymap.set('i', '<A-S-k>', '<C-\\><C-N><C-w>K')
vim.keymap.set('i', '<A-S-l>', '<C-\\><C-N><C-w>L')
vim.keymap.set('n', '<A-S-h>', '<C-w>H')
vim.keymap.set('n', '<A-S-j>', '<C-w>J')
vim.keymap.set('n', '<A-S-k>', '<C-w>K')
vim.keymap.set('n', '<A-S-l>', '<C-w>L')

-- resize window
vim.keymap.set('n', '<A-C-h>', '<C-w><')
vim.keymap.set('i', '<A-C-h>', '<C-w><')
vim.keymap.set('n', '<A-C-l>', '<C-w>>')
vim.keymap.set('i', '<A-C-l>', '<C-w>>')
vim.keymap.set('n', '<A-C-k>', '<C-w>-')
vim.keymap.set('i', '<A-C-k>', '<C-w>-')
vim.keymap.set('n', '<A-C-j>', '<C-w>+')
vim.keymap.set('i', '<A-C-j>', '<C-w>+')

-- maximize window
vim.keymap.set('n', '<A-f>', '<C-w>_<C-w>|')
vim.keymap.set('i', '<A-f>', '<C-w>_<C-w>|')
vim.keymap.set('n', '<A-v>', '<C-w>_')
vim.keymap.set('i', '<A-v>', '<C-w>_')
vim.keymap.set('n', '<A-x>', '<C-w>|')
vim.keymap.set('i', '<A-x>', '<C-w>|')

-- equally distribute window
vim.keymap.set('n', '<A-=>', '<C-w>=')
vim.keymap.set('i', '<A-=>', '<C-w>=')
vim.keymap.set('n', '<A-|>', '<C-w>=<C-w>_')
vim.keymap.set('i', '<A-|>', '<C-w>=<C-w>_')
vim.keymap.set('n', '<A-_>', '<C-w>=<C-w>|')
vim.keymap.set('i', '<A-_>', '<C-w>=<C-w>|')

-------------------------------------------------------------------------------
-- Replace
vim.keymap.set('n', '<leader>R', ':%s/')

