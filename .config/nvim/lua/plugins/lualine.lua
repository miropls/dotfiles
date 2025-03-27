return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "echasnovski/mini.nvim" },
	config = function()
		require("mini.icons").setup()
		require("mini.icons").mock_nvim_web_devicons()

		require("lualine").setup({
			options = {
				theme = "auto",
				component_separators = "|",
				section_separators = { left = "", right = "" },
			},
			sections = {
				lualine_a = { { "mode", separator = { left = "" }, left_padding = 4 } },
				lualine_b = { "branch", "diff", "diagnostics" },
				lualine_c = { "filename" },
				lualine_x = { { "overseer", colored = true } },
				lualine_y = { "encoding", "fileformat", "filetype" },
				lualine_z = { { "location", separator = { right = "" }, right_padding = 4 } },
			},
		})
	end,
}
