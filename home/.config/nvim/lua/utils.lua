local M = {}

--- Gets a path to a package in the Mason registry.
---@param pkg string
---@param path? string
M.get_mason_pkg_path = function(pkg, path)
	pcall(require, "mason")
	local root = vim.env.MASON or (vim.fn.stdpath("data") .. "/mason")
	path = path or ""
	local ret = root .. "/packages/" .. pkg .. "/" .. path
	return ret
end

return M
