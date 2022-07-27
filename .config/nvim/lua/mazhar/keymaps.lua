local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

-- set leader to comma
vim.g.mapleader = " "

-- center cursor in file
-- don't keep it centered though, reset to normal behavior
keymap("n", "zz", ":let &scrolloff=999-&scrolloff+3<CR> | :let &scrolloff=3<CR>")

-- select all with <leader>a
keymap("n", "<leader>A", "ggVG", opts)

-- quickfix list keymaps
keymap("n", "<C-k>", ":cprevious<CR>", opts)
keymap("n", "<C-j>", ":cnext<CR>", opts)
keymap("n", "<C-c>", ":cclose<CR>", opts)

-- unhighlight search results
keymap("n", "<C-l>", ":nohl<CR>", opts)

-- faster replace
keymap('n', '<leader>R', ':%s/', opts)

-------------------------------------------------------------------------------
-- Windows
-------------------------------------------------------------------------------

-- change focus
keymap('i', '<A-h>', '<C-\\><C-N><C-w>h', opts)
keymap('i', '<A-j>', '<C-\\><C-N><C-w>j', opts)
keymap('i', '<A-k>', '<C-\\><C-N><C-w>k', opts)
keymap('i', '<A-l>', '<C-\\><C-N><C-w>l', opts)
keymap('n', '<A-h>', '<C-w>h', opts)
keymap('n', '<A-j>', '<C-w>j', opts)
keymap('n', '<A-k>', '<C-w>k', opts)
keymap('n', '<A-l>', '<C-w>l', opts)

-- move window
keymap('i', '<A-S-h>', '<C-\\><C-N><C-w>H', opts)
keymap('i', '<A-S-j>', '<C-\\><C-N><C-w>J', opts)
keymap('i', '<A-S-k>', '<C-\\><C-N><C-w>K', opts)
keymap('i', '<A-S-l>', '<C-\\><C-N><C-w>L', opts)
keymap('n', '<A-S-h>', '<C-w>H', opts)
keymap('n', '<A-S-j>', '<C-w>J', opts)
keymap('n', '<A-S-k>', '<C-w>K', opts)
keymap('n', '<A-S-l>', '<C-w>L', opts)

-- resize window
keymap('n', '<A-C-h>', '<C-w>2<', opts)
keymap('i', '<A-C-h>', '<C-w>2<', opts)
keymap('n', '<A-C-l>', '<C-w>2>', opts)
keymap('i', '<A-C-l>', '<C-w>2>', opts)
keymap('n', '<A-C-k>', '<C-w>2-', opts)
keymap('i', '<A-C-k>', '<C-w>2-', opts)
keymap('n', '<A-C-j>', '<C-w>2+', opts)
keymap('i', '<A-C-j>', '<C-w>2+', opts)

-- maximize window
keymap('n', '<A-f>', '<C-w>_<C-w>|', opts)
keymap('i', '<A-f>', '<C-w>_<C-w>|', opts)
keymap('n', '<A-v>', '<C-w>_', opts)
keymap('i', '<A-v>', '<C-w>_', opts)
keymap('n', '<A-x>', '<C-w>|', opts)
keymap('i', '<A-x>', '<C-w>|', opts)

-- equally distribute window
keymap('n', '<A-=>', '<C-w>=', opts)
keymap('i', '<A-=>', '<C-w>=', opts)
keymap('n', '<A-|>', '<C-w>=<C-w>_', opts)
keymap('i', '<A-|>', '<C-w>=<C-w>_', opts)
keymap('n', '<A-_>', '<C-w>=<C-w>|', opts)
keymap('i', '<A-_>', '<C-w>=<C-w>|', opts)
