return {
	"blazkowolf/gruber-darker.nvim",
	name = "gruber-darker",
	lazy = false,
	priority = 1000,
	config = function()
		require("gruber-darker").setup({
			transparent = true,
		})
		vim.cmd.colorscheme("gruber-darker")
	end,
}
