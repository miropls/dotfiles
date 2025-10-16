return {
	"folke/tokyonight.nvim",
	config = function()
		-- NOTE: you do not need to call setup if you don't want to.
		require("tokyonight").setup({
			style = "night",
			transparent = true,
		})
		vim.cmd.colorscheme("tokyonight")
	end,
}
