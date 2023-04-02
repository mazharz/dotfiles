-- keep the current directory the same as the browsing directory.
-- This helps you avoid the move files error.
vim.g.netrw_keepdir = 0
-- change split size (in %)
vim.g.netrw_winsize = 25
-- hide the header by default
vim.g.netrw_banner = 0

-------------------------------------------------------------------------------
-- Keymaps
-------------------------------------------------------------------------------
local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }
-- toggle netrw
keymap('n', '<leader>m', ':Lexplore<CR>', opts)
-- open netrw in dir of current file
keymap('n', '<leader>M', ':Lexplore %:p:h<CR>', opts)

-- netrw-only keymaps
-- this uses a trick to load these keymaps once netrw starts (autocmd)
vim.cmd [[
  function! NetrwMapping()
    " go to parent dir
    nmap <buffer> h -^

    " open file/dir
    nmap <buffer> l <CR>

    " open file and close netrw
    nmap <buffer> L <CR>:Lexplore<CR>
  endfunction

  augroup netrw_mapping
    autocmd!
    autocmd filetype netrw call NetrwMapping()
  augroup END
]]
