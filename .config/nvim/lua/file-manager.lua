local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

local open_cwd_in_lf = function()
	local path = vim.fn.getcwd()
	vim.fn.system({ "tmux", "new-window", "-n", "lf", "lf", "-command", "set hidden true", path })
end
keymap("n", "<leader>F", open_cwd_in_lf, opts)

local open_file_or_cwd_in_lf = function()
	local path = vim.fn.expand("%:p")
	if path == "" then
		path = vim.fn.getcwd()
	end
	vim.fn.system({ "tmux", "new-window", "-n", "lf", "lf", "-command", "set hidden true", path })
end
keymap("n", "<leader>f", open_file_or_cwd_in_lf, opts)

local remove_invalid_buffers = function()
	for _, bufnr in ipairs(vim.api.nvim_list_bufs()) do
		local name = vim.api.nvim_buf_get_name(bufnr)
		if vim.api.nvim_buf_is_loaded(bufnr) and name ~= "" then
			if vim.fn.filereadable(name) == 0 and vim.fn.isdirectory(name) == 0 then
				vim.api.nvim_buf_delete(bufnr, { force = true })
			end
		end
	end
end
keymap("n", "<leader>bc", remove_invalid_buffers, opts)
