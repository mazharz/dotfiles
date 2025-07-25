-- Install lazy if not already installed
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
	print("Installing Lazy...")
end
vim.opt.rtp:prepend(lazypath)

require("options")
require("keymaps")
require("file-manager")

require("lazy").setup("plugins", {
	change_detection = {
		notify = false,
	},
})
