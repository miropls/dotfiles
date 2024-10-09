return {
	{
		"nvim-lualine/lualine.nvim",
		event = "VeryLazy",
		dependencies = {
			{
				"nvim-tree/nvim-web-devicons",
				lazy = true,
			},
			{ "abeldekat/harpoonline", version = "*" },
		},
		config = function()
			local Harpoonline = require("harpoonline")
			Harpoonline.setup({
				on_update = function()
					require("lualine").refresh()
				end,
			})
			require("lualine").setup({
				options = {
					theme = "auto",
					component_separators = "∵",
					section_separators = { left = "", right = "" },
				},
				sections = {
					lualine_a = { { "mode", separator = { left = "" }, right_padding = 2 } },
					lualine_b = {
						{ "branch" },
						{ "filetype", icon_only = true, separator = "", padding = { left = 1, right = 0 } },
						{
							"filename",
							symbols = { modified = "  ", readonly = "", unnamed = "" },
						},
					},
					lualine_c = {
						{
							"diagnostics",
							symbols = {
								error = " ",
								warn = " ",
								info = " ",
								hint = "󰝶 ",
							},
						},
						{
							"aerial",
						},
						{ Harpoonline.format, "filename" },
					},
					lualine_x = {
						{ require("noice").api.statusline.mode.get, cond = require("noice").api.statusline.mode.has },
					},
					lualine_y = {
						function()
							return "  " .. os.date("%X")
						end,
					},
					lualine_z = {
						{ "location", separator = { right = "" }, left_padding = 2 },
					},
				},
				inactive_sections = {
					lualine_a = { "filename" },
					lualine_b = {},
					lualine_c = {},
					lualine_x = {},
					lualine_y = {},
					lualine_z = { "location" },
				},
				tabline = {},
				extensions = { "lazy", "aerial", "mason", "oil", "overseer", "toggleterm" },
			})
		end,
	},
}
-- return {
--   "nvim-lualine/lualine.nvim",
--   event = "VeryLazy",
--   opts = function()
--     local colors = require("eldritch.colors").default
--     local eldritch = require("lualine.themes.eldritch")
--     return {
--       options = {
--         component_separators = '',
--         section_separators = { left = '', right = '' },
--         theme = eldritch,
--         globalstatus = true,
--         disabled_filetypes = { statusline = { "dashboard", "alpha" } },
--       },
--       sections = {
--         lualine_a = { { "mode", separator = { left = '' }, icon = "", right_padding = 2 } },
--         lualine_b = { { "branch", icon = "" } },
--         lualine_c = {
--           {
--             "diagnostics",
--             symbols = {
--               error = " ",
--               warn = " ",
--               info = " ",
--               hint = "󰝶 ",
--             },
--             { color = colors.cyan }
--           },
--           { "filetype", icon_only = true, separator = "", padding = { left = 1, right = 0 } },
--           {
--             "filename",
--             symbols = { modified = "  ", readonly = "", unnamed = "" },
--           },
--           {
--             function()
--               return require("nvim-navic").get_location()
--             end,
--             cond = function()
--               return package.loaded["nvim-navic"] and require("nvim-navic").is_available()
--             end,
--             color = { fg = colors.grey, bg = colors.none },
--           },
--         },
--         lualine_x = {
--           {
--             require("lazy.status").updates,
--             cond = require("lazy.status").has_updates,
--             color = { fg = colors.green },
--           },
--           {
--             function()
--               local icon = " "
--               local status = require("copilot.api").status.data
--               return icon .. (status.message or "")
--             end,
--             cond = function()
--               local ok, clients = pcall(vim.lsp.get_clients, { name = "copilot", bufnr = 0 })
--               return ok and #clients > 0
--             end,
--             color = function()
--               if not package.loaded["copilot"] then
--                 return
--               end
--               local status = require("copilot.api").status.data
--               return copilot_colors[status.status] or copilot_colors[""]
--             end,
--           },
--           { "diff" },
--         },
--         lualine_y = {
--           {
--             "progress",
--           },
--           {
--             "location",
--             color = { fg = colors.cyan, bg = colors.none },
--           },
--         },
--         lualine_z = {
--           function()
--             return "  " .. os.date("%X") .. " 🚀 "
--           end,
--         },
--       },
--
--       extensions = { "lazy", "toggleterm", "mason" },
--     }
--   end,
-- }
