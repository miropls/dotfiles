return {
	"akinsho/toggleterm.nvim",
	lazy = false,
	version = "*",
	config = function()
		require("toggleterm").setup({
			open_mapping = { "<M-i>", "<D-i>" },
			direction = "float",
			float_opts = {
				direction = "float",
				border = "curved",
				width = 140,
				height = 40,
			},
		})
	end,
}
