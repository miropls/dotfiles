local o = vim.opt

if vim.g.neovide then
	vim.g.neovide_refresh_rate = 120
	vim.g.neovide_fullscreen = true
	-- vim.g.neovide_input_macos_option_key_is_meta = 'only_left'
	-- mac
	vim.keymap.set("n", "<D-s>", ":w<CR>") -- Save
	vim.keymap.set("v", "<D-c>", '"+y') -- Copy
	vim.keymap.set("n", "<D-v>", '"+P') -- Paste normal mode
	vim.keymap.set("v", "<D-v>", '"+P') -- Paste visual mode
	vim.keymap.set("c", "<D-v>", "<C-R>+") -- Paste command mode
	vim.keymap.set("i", "<D-v>", '<ESC>l"+Pli') -- Paste insert mode

	-- linux
	vim.keymap.set("n", "<M-s>", ":w<CR>") -- Save
	vim.keymap.set("v", "<M-c>", '"+y') -- Copy
	vim.keymap.set("n", "<M-v>", '"+P') -- Paste normal mode
	vim.keymap.set("v", "<M-v>", '"+P') -- Paste visual mode
	vim.keymap.set("c", "<M-v>", "<C-R>+") -- Paste command mode
	vim.keymap.set("i", "<M-v>", '<ESC>l"+Pli') -- Paste insert mode
	o.termguicolors = true
end

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
