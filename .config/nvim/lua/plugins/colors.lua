return {
	{
		"AlexvZyl/nordic.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			require("nordic").setup({
				-- on_palette = function(palette)
				-- 	palette.black1 = "#000000"
				-- end,
				-- fix this, darker bg?
				transparent = {
					bg = false,
				},
				swap_backgrounds = true,
			})
			vim.cmd.colorscheme("nordic")
		end,
	},
}
