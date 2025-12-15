return {
	"AlexvZyl/nordic.nvim",
	name = "nordic",
	config = function()
		require("nordic").setup({
			transparent = {
				bg = true,
				float = true,
			},
			swap_backgrounds = true,
		})
		vim.cmd.colorscheme("nordic")
	end,
}
