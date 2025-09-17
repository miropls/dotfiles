return {
	"catppuccin/nvim",
	config = function()
		-- NOTE: you do not need to call setup if you don't want to.
		require("catppuccin").setup()
		vim.cmd.colorscheme("catppuccin-mocha")
	end,
}
