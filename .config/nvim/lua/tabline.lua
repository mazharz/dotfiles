local PADDING = 1
local MODIFIED_INDICATOR = " ●"

--- @class Tab
--- @field name string
--- @field length number
--- @field is_modified boolean

--- Format tab item
--- @param tab Tab
--- @param is_active boolean
--- @return string
local function format_tab(tab, is_active)
	local name = tab.name
	local length = tab.length - (PADDING * 2)
	local is_modified = tab.is_modified

	if is_modified then
		name = name .. MODIFIED_INDICATOR
	end

	if #name > length then
		name = name:sub(#name - length, #name)
	end

	if is_active then
		return table.concat({
			"%#TabActiveEdge#",
			"%#TabActive#",
			name,
			"%#TabActiveEdge#",
		})
	else
		return table.concat({
			"%#TabInactiveEdge# ",
			"%#TabInactive#",
			name,
			"%#TabInactiveEdge# ",
		})
	end
end

--- Get current tab
--- @param index number
--- @return Tab
local function current_tab_buffer_info(index)
	local buf_list = vim.fn.tabpagebuflist(index)
	local win = vim.fn.tabpagewinnr(index)
	local bufnr = buf_list[win]
	local name = vim.fn.bufname(bufnr)
	local filetype = vim.api.nvim_get_option_value("filetype", { buf = bufnr })

	if name == "" then
		name = "∅"
	elseif filetype == "oil" then
		name = "▢"
	elseif filetype == "fugitive" then
		name = "⎇"
	else
		name = vim.fn.fnamemodify(name, ":t")
	end

	local length = #vim.fn.fnamemodify(name, ":t") + (PADDING * 2)

	local is_modified = vim.api.nvim_get_option_value("modified", { buf = bufnr })

	if is_modified then
		length = length + #MODIFIED_INDICATOR
	end

	return {
		name = name,
		length = length,
		is_modified = is_modified,
		filetype = filetype,
	}
end

--- Get the surplus info
--- @return number[], number
local function calculate_surplus()
	local screen_width = vim.o.columns
	local number_of_tabs = vim.fn.tabpagenr("$")

	local lengths = {}
	local total_length = 0
	for index = 1, number_of_tabs do
		local tab = current_tab_buffer_info(index)
		total_length = total_length + tab.length
		table.insert(lengths, tab.length)
	end

	local surplus = total_length - screen_width

	local fractions = vim.tbl_map(function(length)
		return length / total_length
	end, lengths)

	return fractions, surplus
end

--- Apply length reduction to tab
--- @param tab Tab
--- @param surplus_fraction number
--- @param surplus number
--- @return Tab
local function apply_length_reduction(tab, surplus_fraction, surplus)
	if surplus <= 0 then
		return tab
	end

	local surplus_by_fraction = math.ceil(surplus * surplus_fraction)
	local length = tab.length - surplus_by_fraction

	return {
		name = tab.name,
		length = length,
		is_modified = tab.is_modified,
	}
end

--- Generate tabline
--- @return string
function _G.generate_tabline()
	local result = ""

	local number_of_tabs = vim.fn.tabpagenr("$")
	local surplus_fractions, surplus = calculate_surplus()

	for index = 1, number_of_tabs do
		local tab = apply_length_reduction(current_tab_buffer_info(index), surplus_fractions[index], surplus)

		-- set the highlight
		if index == vim.fn.tabpagenr() then
			result = result .. "%#TabLineSel#"
		else
			result = result .. "%#Normal#"
		end

		-- setting tab number (to be able to use with mouse)
		result = result .. "%" .. index .. "T"

		result = result .. format_tab(tab, index == vim.fn.tabpagenr())
	end

	-- reset highlight and mark end of last tab number (for mouse)
	result = result .. "%#Normal#%T"

	return result
end

vim.opt.tabline = "%!v:lua.generate_tabline()"
