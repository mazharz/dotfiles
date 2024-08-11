local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

-- set leader to comma
vim.g.mapleader = " "

keymap("n", "<C-d>", "<C-d>zz")
keymap("n", "<C-u>", "<C-u>zz")

-- select all with <leader>a
keymap("n", "<leader>A", "ggVG", opts)

-- quickfix list keymaps
keymap("n", "<C-k>", ":cprevious<CR>", opts)
keymap("n", "<C-j>", ":cnext<CR>", opts)
keymap("n", "<leader>cc", ":cclose<CR>", opts)
keymap("n", "<leader>co", ":copen<CR>", opts)

-- unhighlight search results
keymap("n", "<C-l>", ":nohl<CR>", opts)

-- faster save
keymap("n", "<leader>w", ":w<CR>", opts)
keymap("n", "<leader>W", ":wq<CR>", opts)

-- faster quit
keymap("n", "<leader>q", ":q<CR>", opts)

-- use register for pasting yanked
keymap("x", "<leader>p", '"_dP')

-- make new stuff
keymap("n", "<leader>nt", ":tabnew<CR>", opts)
keymap("n", "<leader>nv", ":vsplit<CR>", opts)
keymap("n", "<leader>nh", ":split<CR>", opts)

keymap("n", "<leader>o", ":only<CR>", opts)

-- easier tab cycling
keymap("n", "<A-r>", ":tabnext<CR>", opts)
keymap("n", "<A-e>", ":tabprevious<CR>", opts)
keymap("n", "<A-S-r>", ":tabmove +1<CR>", opts)
keymap("n", "<A-S-e>", ":tabmove -1<CR>", opts)

-------------------------------------------------------------------------------
-- Windows
-------------------------------------------------------------------------------

-- change focus
keymap("i", "<A-h>", "<C-\\><C-N><C-w>h", opts)
keymap("i", "<A-j>", "<C-\\><C-N><C-w>j", opts)
keymap("i", "<A-k>", "<C-\\><C-N><C-w>k", opts)
keymap("i", "<A-l>", "<C-\\><C-N><C-w>l", opts)
keymap("n", "<A-h>", "<C-w>h", opts)
keymap("n", "<A-j>", "<C-w>j", opts)
keymap("n", "<A-k>", "<C-w>k", opts)
keymap("n", "<A-l>", "<C-w>l", opts)

-- move window
keymap("i", "<A-S-h>", "<C-\\><C-N><C-w>H", opts)
keymap("i", "<A-S-j>", "<C-\\><C-N><C-w>J", opts)
keymap("i", "<A-S-k>", "<C-\\><C-N><C-w>K", opts)
keymap("i", "<A-S-l>", "<C-\\><C-N><C-w>L", opts)
keymap("n", "<A-S-h>", "<C-w>H", opts)
keymap("n", "<A-S-j>", "<C-w>J", opts)
keymap("n", "<A-S-k>", "<C-w>K", opts)
keymap("n", "<A-S-l>", "<C-w>L", opts)

-- resize window
keymap("n", "<A-C-h>", "<C-w>2<", opts)
keymap("i", "<A-C-h>", "<C-w>2<", opts)
keymap("n", "<A-C-l>", "<C-w>2>", opts)
keymap("i", "<A-C-l>", "<C-w>2>", opts)
keymap("n", "<A-C-k>", "<C-w>2-", opts)
keymap("i", "<A-C-k>", "<C-w>2-", opts)
keymap("n", "<A-C-j>", "<C-w>2+", opts)
keymap("i", "<A-C-j>", "<C-w>2+", opts)

-- maximize window
keymap("n", "<A-f>", "<C-w>_<C-w>|", opts)
keymap("i", "<A-f>", "<C-w>_<C-w>|", opts)
keymap("n", "<A-v>", "<C-w>_", opts)
keymap("i", "<A-v>", "<C-w>_", opts)
keymap("n", "<A-x>", "<C-w>|", opts)
keymap("i", "<A-x>", "<C-w>|", opts)

-- equally distribute window
keymap("n", "<A-=>", "<C-w>=", opts)
keymap("i", "<A-=>", "<C-w>=", opts)
keymap("n", "<A-|>", "<C-w>=<C-w>_", opts)
keymap("i", "<A-|>", "<C-w>=<C-w>_", opts)
keymap("n", "<A-_>", "<C-w>=<C-w>|", opts)
keymap("i", "<A-_>", "<C-w>=<C-w>|", opts)

-------------------------------------------------------------------------------
-- macro keymaps
-------------------------------------------------------------------------------

keymap("n", "<leader>mc", '?><CR>i className=""<ESC>:nohl<CR>i', opts)
