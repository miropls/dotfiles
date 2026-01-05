return {
	"folke/tokyonight.nvim",
	lazy = false,
	config = function()
		require("tokyonight").setup({
			transparent = true,
		})
		vim.cmd.colorscheme("tokyonight-night")
	end,
}
