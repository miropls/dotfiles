-- return {
--   "slugbyte/lackluster.nvim",
--   lazy = false,
--   priority = 1000,
--   config = function()
--     -- vim.cmd.colorscheme("lackluster")
--     -- vim.cmd.colorscheme("lackluster-hack") -- my favorite
--     vim.cmd.colorscheme("lackluster-mint")
--   end,
-- }
--
return {
	"AlexvZyl/nordic.nvim",
	lazy = false,
	priority = 1000,
	config = function()
		require("nordic").setup({
			transparent = {
				bg = false,
			},
			swap_backgrounds = true,
		})

		vim.cmd.colorscheme("nordic")
	end,
}
