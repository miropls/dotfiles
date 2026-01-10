return {
	"echasnovski/mini.nvim",
	version = false,
	event = "VeryLazy", -- Lazy-load the entire mini.nvim suite
	config = function()
		-- Appereance
		require("mini.notify").setup()
		require("mini.icons").setup()

		-- Text manipulation
		require("mini.ai").setup()
		require("mini.operators").setup({
			evaluate = { prefix = "m=" },
			exchange = { prefix = "mx", reindent_linewise = true },
			multiply = { prefix = "mm" },
			replace = { prefix = "mr", reindent_linewise = true },
			sort = { prefix = "ms" },
		})
		require("mini.surround").setup()
		require("mini.comment").setup()
		require("mini.align").setup({
			mappings = { start = "ma", start_with_preview = "mA" },
		})
		require("mini.splitjoin").setup({
			mappings = { toggle = "mS" },
		})

		require("mini.move").setup({
			mappings = {
				left = "<M-Left>",
				down = "<M-Down>",
				up = "<M-Up>",
				right = "<M-Right>",
				line_left = "<M-Left>",
				line_down = "<M-Down>",
				line_up = "<M-Up>",
				line_right = "<M-Right>",
			},
		})

		local miniclue = require("mini.clue")
		miniclue.setup({
			window = { delay = 500 },
			triggers = {
				{ mode = "n", keys = "<Leader>" },
				{ mode = "x", keys = "<Leader>" },
				{ mode = "i", keys = "<C-x>" },
				{ mode = "n", keys = "g" },
				{ mode = "x", keys = "g" },
				{ mode = "n", keys = "m" },
				{ mode = "x", keys = "m" },
				{ mode = "n", keys = "'" },
				{ mode = "n", keys = "`" },
				{ mode = "x", keys = "'" },
				{ mode = "x", keys = "`" },
				{ mode = "n", keys = '"' },
				{ mode = "x", keys = '"' },
				{ mode = "i", keys = "<C-r>" },
				{ mode = "c", keys = "<C-r>" },
				{ mode = "n", keys = "<C-w>" },
				{ mode = "n", keys = "z" },
				{ mode = "x", keys = "z" },
			},
			clues = {
				{ mode = "n", keys = "<Leader>a", desc = "+AI" },
				{ mode = "n", keys = "<Leader>d", desc = "+Diagnostics" },
				{ mode = "n", keys = "<Leader>f", desc = "+Find" },
				{ mode = "n", keys = "<Leader>g", desc = "+Git" },
				{ mode = "n", keys = "<Leader>gg", desc = "+Telescope" },
				{ mode = "n", keys = "<Leader>gs", desc = "+GitSigns" },
				{ mode = "n", keys = "<Leader>h", desc = "+Harpoon" },
				{ mode = "n", keys = "<Leader>m", desc = "+Filetree" },
				{ mode = "n", keys = "<Leader>n", desc = "+LSP" },
				{ mode = "n", keys = "<Leader>o", desc = "+Overseer" },
				{ mode = "n", keys = "<Leader>r", desc = "+Rename" },
				{ mode = "n", keys = "<Leader>t", desc = "+Toggle" },
				{ mode = "n", keys = "m", desc = "+Mini" },
				miniclue.gen_clues.builtin_completion(),
				miniclue.gen_clues.g(),
				miniclue.gen_clues.marks(),
				miniclue.gen_clues.registers(),
				miniclue.gen_clues.windows(),
				miniclue.gen_clues.z(),
			},
		})
	end,
}
