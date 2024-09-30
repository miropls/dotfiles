return {
	"folke/noice.nvim",
	event = "VeryLazy",
	config = function()
		require("noice").setup({
			presets = {
				command_palette = true,
				bottom_search = true,
				lsp_doc_border = true,
				inc_rename = true,
				long_message_to_split = true,
			},
			lsp = {
				hover = {
					silent = true,
				},
			},
			routes = {
				{
					filter = {
						event = "msg_show",
						kind = "search_count",
					},
					opts = { skip = true },
				},
			},
		})
	end,
	dependencies = {
		"MunifTanjim/nui.nvim",
		"rcarriga/nvim-notify",
	},
}
