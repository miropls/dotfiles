-- return {
-- 	"catppuccin/nvim",
-- 	priority = 1000,
-- 	config = function()
-- 		require("catppuccin").setup({
-- 			transparent_background = true,
-- 		})
-- 		vim.cmd.colorscheme("catppuccin-mocha")
-- 	end,
-- }

return {
	"slugbyte/lackluster.nvim",
	lazy = false,
	priority = 1000,
	config = function()
		-- vim.cmd.colorscheme("lackluster")
		-- vim.cmd.colorscheme("lackluster-hack") -- my favorite
		vim.cmd.colorscheme("lackluster-mint")
	end,
}
