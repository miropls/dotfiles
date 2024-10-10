return {
	"lewis6991/gitsigns.nvim",
	lazy = true,
	config = function()
		require("gitsigns").setup({
			current_line_blame = true,
			current_line_blame_opts = {
				virt_text_pos = "eol",
			},
		})
	end,
}
