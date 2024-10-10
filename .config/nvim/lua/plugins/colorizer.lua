return {
	"NvChad/nvim-colorizer.lua",
	lazy = true,
	config = function()
		require("colorizer").setup({
			filetypes = { "*" },
			user_default_options = {
				RGB = true, -- #RGB hex codes
				RRGGBB = true, -- #RRGGBB hex codes
				names = false, -- "Name" codes like Blue or red
				RRGGBBAA = false, -- #RRGGBBAA hex codes #ff8823
				AARRGGBB = false, -- 0xAARRGGBB hex codes
				rgb_fn = false, -- CSS rgb() and rgba() functions
				hsl_fn = false, -- CSS hsl() and hsla() functions
				css = false, -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
				css_fn = false, -- Enable all CSS *functions*: rgb_fn, hsl_fn
				tailwind = true,
				sass = { enable = false, parsers = { "css" } }, -- Enable sass colors
				mode = "virtualtext",
				virtualtext = "󱓻",
				virtualtext_inline = true,
				always_update = false,
			},
		})
	end,
}
