local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

keymap("n", "<leader>mc", '?><CR>i className=""<ESC>:nohl<CR>i', opts)

local toggle_md_task = function()
	local buf = vim.api.nvim_get_current_buf()
	local is_markdown = vim.bo[buf].filetype == "markdown"
	if not is_markdown then
		vim.notify("Toggling markdown task is only available on markdown buffers", vim.log.levels.WARN)
		return
	end

	local pos = vim.api.nvim_win_get_cursor(0)

	local ts_node = vim.treesitter.get_node({ buf = buf, pos = { pos[1] - 1, pos[2] } })
	if ts_node == nil then
		vim.notify("Couldn't get current treesitter node", vim.log.levels.WARN)
		return
	end

	while ts_node do
		if ts_node:type() == "list_item" then
			break
		end
		ts_node = ts_node:parent()
	end
	if ts_node == nil then
		vim.notify("Couldn't get treesitter list_item parent node", vim.log.levels.WARN)
		return
	end

	local ts_marker = nil

	for child in ts_node:iter_children() do
		if string.find(child:type(), "task_list_marker") then
			ts_marker = child
			break
		end
	end
	if ts_marker == nil then
		vim.notify("Couldn't get treesitter task_list_marker_* node", vim.log.levels.INFO)
		return
	end

	local marker_type = ts_marker:type()
	local start_row, start_col, end_row, end_col = ts_marker:range()

	local replacement = nil
	if marker_type == "task_list_marker_unchecked" then
		replacement = "[x]"
	elseif marker_type == "task_list_marker_checked" then
		replacement = "[ ]"
	end

	if replacement ~= nil then
		vim.api.nvim_buf_set_text(buf, start_row, start_col, end_row, end_col, { replacement })
	end
end
keymap("n", "<leader>mt", toggle_md_task, opts)
