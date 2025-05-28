return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		require("lualine").setup({
			options = {
				theme = "auto",
				component_separators = "|",
				section_separators = "",
			},
			sections = {
				lualine_a = { "mode" },
				lualine_b = { "branch", "diff", "diagnostics" },
				lualine_c = { "filename", { "overseer", colored = true } },
				lualine_x = {},
				lualine_y = { "encoding", "fileformat", "filetype" },
				lualine_z = { "location" },
			},
		})
	end,
}
