return {
	"akinsho/toggleterm.nvim",
	version = "*",
	config = function()
		require("toggleterm").setup({
			open_mapping = { "<ALT-i>", "<D-i>" },
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
