return {
	"echasnovski/mini.nvim",
	lazy = true,
	config = function()
		require("mini.icons").setup()

		require("mini.git").setup()
		require("mini.statusline").setup({ use_icons = true })

		require("mini.splitjoin").setup({
			mappings = {
				toggle = "gS",
			},
		})

		require("mini.move").setup({
			mappings = {
				-- Move visual selection in Visual mode. Defaults are Alt (Meta) + hjkl.
				left = "<C-m>",
				down = "<C-n>",
				up = "<C-e>",
				right = "<C-i>",

				-- Move current line in Normal mode
				line_left = "<C-m>",
				line_down = "<C-n>",
				line_up = "<C-e>",
				line_right = "<C-i>",
			},
		})

		require("mini.surround").setup()

		require("mini.comment").setup()
	end,
}
