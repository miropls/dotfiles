return {
	"wtfox/luna.nvim",
	name = "luna",
	lazy = false,
	priority = 1000,
	config = function()
		require("luna").setup({
			transparent = true,
		})

		vim.cmd.colorscheme("luna")
	end,
}
