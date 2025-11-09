--- Generate tab item
--- @param index number
--- @param max_width number
--- @return string
local function tab_item(index, max_width)
	max_width = max_width - 2 -- for the padding spaces
	local buf_list = vim.fn.tabpagebuflist(index)
	local win = vim.fn.tabpagewinnr(index)
	local bufnr = buf_list[win]
	local name = vim.fn.bufname(bufnr)
	local is_modified = vim.api.nvim_get_option_value("modified", { buf = bufnr })
	local filetype = vim.api.nvim_get_option_value("filetype", { buf = bufnr })

	if name == "" then
		name = "[No Name]"
	elseif filetype == "oil" then
		name = "[oil]"
	elseif filetype == "fugitive" then
		name = "[fugitive]"
	else
		name = vim.fn.fnamemodify(name, ":t")
	end

	if is_modified then
		name = name .. " ●"
	end

	if #name > max_width then
		name = name:sub(#name - max_width, #name)
	end

	return " " .. name .. " "
end

--- Generate tabline
--- @return string
function _G.generate_tabline()
	local result = ""

	local screen_width = vim.o.columns
	local number_of_tabs = vim.fn.tabpagenr("$")
	local max_tab_width = math.floor(screen_width / number_of_tabs)

	for index = 1, number_of_tabs do
		-- set the highlight
		if index == vim.fn.tabpagenr() then
			result = result .. "%#TabLineSel#"
		else
			result = result .. "%#Normal#"
		end

		-- setting tab number (to be able to use with mouse)
		result = result .. "%" .. index .. "T"

		result = result .. tab_item(index, max_tab_width)
	end

	-- reset highlight and mark end of last tab number (for mouse)
	result = result .. "%#Normal#%T"

	return result
end

vim.opt.tabline = "%!v:lua.generate_tabline()"
