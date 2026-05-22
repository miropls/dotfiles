-- lua/config/options.lua
vim.g.mapleader = " "

local o = vim.opt

o.signcolumn = "yes"
o.showtabline = 1
o.guicursor = ""
o.nu = true
o.relativenumber = true
o.cursorline = true
o.winborder = "rounded"
o.showbreak = "↪ "
o.scrolloff = 8
o.termguicolors = true
o.isfname:append("@-@")

o.ignorecase = true
o.smartcase = true
o.tabstop = 2
o.softtabstop = 2
o.shiftwidth = 2
o.expandtab = true
o.smartindent = true
o.showmode = false
o.hlsearch = false
o.incsearch = true
o.splitbelow = true
o.splitright = true

o.swapfile = false
o.backup = false
o.undodir = os.getenv("HOME") .. "/.vim/undodir"
o.undofile = true
o.updatetime = 500

vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	callback = function()
		vim.hl.on_yank()
	end,
})
