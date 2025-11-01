local lsp_operations = {}

--- Wrap text in highlight group markers
--- @param highlight_group string
--- @param text string
--- @return string
local function highlight_segment(highlight_group, text)
	return "%#" .. highlight_group .. "#" .. text .. "%#StatusLine#"
end

--- @return string
local function modified_segment()
	local buf = vim.api.nvim_get_current_buf()
	local is_modified = vim.api.nvim_get_option_value("modified", { buf = buf })

	if is_modified then
		return " ●"
	end

	return ""
end

--- @return string
local function readonly_segment()
	local buf = vim.api.nvim_get_current_buf()
	local is_readonly = vim.api.nvim_get_option_value("readonly", { buf = buf })

	if is_readonly then
		return " 𜺱"
	end

	return ""
end

--- @return string
local function diagnostics_segment()
	local error_count = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.ERROR })
	local warning_count = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.WARN })
	local info_count = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.INFO })
	local hint_count = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.HINT })

	local diagnostic_counts = {}

	if error_count > 0 then
		table.insert(diagnostic_counts, highlight_segment("DiagnosticError", string.format("E:%d", error_count)))
	end

	if warning_count > 0 then
		table.insert(diagnostic_counts, highlight_segment("DiagnosticWarn", string.format("W:%d", warning_count)))
	end

	if info_count > 0 then
		table.insert(diagnostic_counts, highlight_segment("DiagnosticInfo", string.format("I:%d", info_count)))
	end

	if hint_count > 0 then
		table.insert(diagnostic_counts, highlight_segment("DiagnosticHint", string.format("H:%d", hint_count)))
	end

	return table.concat(diagnostic_counts, " ")
end

--- @return string
local function lsp_load_segment()
	if #lsp_operations > 0 then
		return "⧗ "
	end

	return ""
end

vim.api.nvim_create_autocmd("LspProgress", {
	callback = function(args)
		local data = args.data or {}
		local params = data.params or {}
		local value = params.value or {}
		local kind = value.kind
		local token = params.token

		if kind == "begin" then
			table.insert(lsp_operations, token)
		elseif kind == "end" then
			lsp_operations = vim.tbl_filter(function(v)
				return v ~= token
			end, lsp_operations)
		end

		vim.cmd("redrawstatus")
	end,
})

vim.api.nvim_create_autocmd({ "DiagnosticChanged" }, {
	callback = function()
		vim.cmd("redrawstatus")
	end,
})

function _G.generate_statusline()
	return table.concat({
		"%f", -- filename
		readonly_segment(),
		modified_segment(),
		"%=", -- right align
		lsp_load_segment(),
		diagnostics_segment(),
	})
end

-- global status line instead of per window
vim.opt.laststatus = 3
vim.o.statusline = "%!v:lua.generate_statusline()"
