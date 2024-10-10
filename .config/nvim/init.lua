local o = vim.opt

-- Allow copy paste
vim.api.nvim_set_keymap("", "<D-v>", "+p<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("!", "<D-v>", "<C-R>+", { noremap = true, silent = true })
vim.api.nvim_set_keymap("t", "<D-v>", "<C-R>+", { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "<D-v>", "<C-R>+", { noremap = true, silent = true })
o.guicursor = ""

o.nu = true
o.relativenumber = true
o.ignorecase = true
o.smartcase = true

o.tabstop = 2
o.softtabstop = 2
o.shiftwidth = 2
o.expandtab = true

o.smartindent = true

o.wrap = false

o.swapfile = false
o.backup = false
o.undodir = os.getenv("HOME") .. "/.vim/undodir"
o.undofile = true
o.showmode = false

o.hlsearch = false
o.incsearch = true

o.termguicolors = true

o.scrolloff = 8
o.signcolumn = "yes"
o.isfname:append("@-@")

o.updatetime = 50

vim.g.mapleader = " "

local opts = {
	custom_keys = {
		-- vim.keymap.set("n", "<leader>mm", vim.cmd.Ex),
		vim.keymap.set("n", "<C-d>", "<C-d>zz"),
		vim.keymap.set("n", "<C-u>", "<C-u>zz"),
		vim.keymap.set("n", "n", "nzzzv"),
		vim.keymap.set("n", "N", "Nzzzv"),

		-- Yank to system clipboard
		vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]]),
		vim.keymap.set("n", "<leader>Y", [["+Y]]),

		vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]]),
	},
}

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup("plugins", opts)
