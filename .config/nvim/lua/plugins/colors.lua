return {
	"eldritch-theme/eldritch.nvim",
	lazy = false,
	priority = 1000,
	config = function()
		require("eldritch").setup({
			transparent = true,
		})
		vim.cmd("colorscheme eldritch")
	end,
}
-- return {
--   "scottmckendry/cyberdream.nvim",
--   lazy = false,
--   priority = 1000,
--   config = function()
--     require("cyberdream").setup({
--       -- Enable transparent background
--       transparent = true,
--
--       -- Enable italics comments
--       italic_comments = true,
--
--       -- Replace all fillchars with ' ' for the ultimate clean look
--       hide_fillchars = true,
--
--       -- Modern borderless telescope theme
--       borderless_telescope = true,
--
--       -- Set terminal colors used in `:terminal`
--       terminal_colors = true,
--     })
--     vim.cmd("colorscheme cyberdream")
--   end
-- }
-- return {
-- 	{
-- 		"AlexvZyl/nordic.nvim",
-- 		lazy = false,
-- 		priority = 1000,
-- 		config = function()
-- 			require("nordic").setup({})
-- 			vim.cmd.colorscheme("nordic")
-- 		end,
-- 	},
-- }

-- return {
-- 	"folke/tokyonight.nvim",
-- 	lazy = false,
-- 	priority = 1000,
-- 	config = function()
-- 		require("tokyonight").setup({
-- 			style = "night",
-- 			transparent = true,
-- 		})
-- 		vim.cmd("colorscheme tokyonight")
-- 	end,
-- }

-- return {
--   "rebelot/kanagawa.nvim",
--   priority = 1000,
--   config = function()
--     require("kanagawa").setup({
--       theme = "wave",
--       commentStyle = { italic = true },
--       dimInactive = true,
--       -- transparent = true,
--       colors = {
--         theme = {
--           all = {
--             ui = {
--               bg_gutter = "none",
--               float = {
--                 bg = "none",
--               },
--             },
--           },
--         },
--       },
--       overrides = function(colors)
--         local theme = colors.theme
--         return {
--           NormalFloat = { bg = "none" },
--           FloatBorder = { bg = "none" },
--           FloatTitle = { bg = "none" },
--           -- Save an hlgroup with dark background and dimmed foreground
--           -- so that you can use it where your still want darker windows.
--           -- E.g.: autocmd TermOpen * setlocal winhighlight=Normal:NormalDark
--           NormalDark = { fg = theme.ui.fg_dim, bg = theme.ui.bg_m3 },
--
--           -- Popular plugins that open floats will link to NormalFloat by default;
--           -- set their background accordingly if you wish to keep them dark and borderless
--           LazyNormal = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },
--           MasonNormal = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },
--         }
--       end,
--     })
--     vim.cmd("colorscheme kanagawa")
--     vim.wo.fillchars = "eob: " -- hides tildes from empty lines
--   end,
-- }
