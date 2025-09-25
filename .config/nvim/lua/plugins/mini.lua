return {
	"echasnovski/mini.nvim",
	version = false,
	config = function()
		-- Appereance
		require("mini.notify").setup()
		require("mini.icons").setup()
		require("mini.statusline").setup()
		require("mini.cursorword").setup()
		require("mini.pairs").setup()
		require("mini.pick").setup()
		require("mini.extra").setup()

		-- Pick keymaps
		vim.keymap.set("n", "<leader>ff", function()
			MiniPick.builtin.files({ tool = "rg" })
		end, { desc = "Files" })

		vim.keymap.set("n", "<leader>fg", function()
			MiniPick.builtin.files({ tool = "git" })
		end, { desc = "Git files" })

		vim.keymap.set("n", "<leader>fr", function()
			MiniPick.builtin.grep({ tool = "rg" })
		end, { desc = "Grep" })

		vim.keymap.set("n", "<leader>fi", function()
			MiniPick.builtin.grep_live({ tool = "rg" })
		end, { desc = "Live grep" })

		vim.keymap.set("n", "<leader>fc", function() end, { desc = "Live grep" })

		vim.keymap.set("n", "<leader>hc", function()
			MiniExtra.pickers.history({ scope = "cmd" })
		end)

		vim.keymap.set("n", "<leader>hs", function()
			MiniExtra.pickers.history({ scope = "search" })
		end)

		vim.keymap.set("n", "<leader>rg", function()
			MiniExtra.pickers.registers()
		end, { desc = "Registers" })

		vim.keymap.set("n", "<leader>cf", function()
			MiniExtra.pickers.list({ scope = "quickfix" })
		end, { desc = "Open quickfix list" })

		vim.keymap.set("n", "<leader>cl", function()
			MiniExtra.pickers.list({ scope = "location" })
		end, { desc = "Open location-list" })

		vim.keymap.set("n", "<leader>kmv", function()
			MiniExtra.pickers.keymaps()
		end, { desc = "View Neovim keybinds" })

		-- End Pick keymaps

		-- Text manipulation
		require("mini.ai").setup()
		require("mini.operators").setup({
			evaluate = {
				prefix = "m=",
			},
			exchange = {
				prefix = "mx",
				reindent_linewise = true,
			},
			multiply = {
				prefix = "mm",
			},
			replace = {
				prefix = "mr",
				reindent_linewise = true,
			},
			sort = {
				prefix = "ms",
			},
		})
		require("mini.surround").setup()
		require("mini.comment").setup()
		require("mini.align").setup({
			mappings = {
				start = "ma",
				start_with_preview = "mA",
			},
		})
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

		local miniclue = require("mini.clue")
		miniclue.setup({
			window = {
				delay = 500,
			},
			triggers = {
				-- Leader triggers
				{ mode = "n", keys = "<Leader>" },
				{ mode = "x", keys = "<Leader>" },

				-- Built-in completion
				{ mode = "i", keys = "<C-x>" },

				-- `g` key
				{ mode = "n", keys = "g" },
				{ mode = "x", keys = "g" },

				-- `m` key
				{ mode = "n", keys = "m" },
				{ mode = "x", keys = "m" },

				-- Marks
				{ mode = "n", keys = "'" },
				{ mode = "n", keys = "`" },
				{ mode = "x", keys = "'" },
				{ mode = "x", keys = "`" },

				-- Registers
				{ mode = "n", keys = '"' },
				{ mode = "x", keys = '"' },
				{ mode = "i", keys = "<C-r>" },
				{ mode = "c", keys = "<C-r>" },

				-- Window commands
				{ mode = "n", keys = "<C-w>" },

				-- `z` key
				{ mode = "n", keys = "z" },
				{ mode = "x", keys = "z" },
			},

			clues = {
				-- Enhance this by adding descriptions for <Leader> mapping groups
				{ mode = "n", keys = "<Leader>d", desc = "+Diagnostics" },
				{ mode = "n", keys = "<Leader>f", desc = "+Find" },
				{ mode = "n", keys = "<Leader>g", desc = "+Git" },
				{ mode = "n", keys = "<Leader>gg", desc = "+Telescope" },
				{ mode = "n", keys = "<Leader>gs", desc = "+GitSigns" },
				{ mode = "n", keys = "<Leader>m", desc = "+Filetree" },
				{ mode = "n", keys = "<Leader>n", desc = "+LSP" },
				{ mode = "n", keys = "<Leader>o", desc = "+Overseer" },
				{ mode = "n", keys = "<Leader>r", desc = "+Rename" },
				{ mode = "n", keys = "<Leader>t", desc = "+Toggle" },
				{ mode = "n", keys = "<Leader>lg", desc = "LazyGit" },
				{ mode = "n", keys = "<Leader>c", desc = "+QF/LL" },
				{ mode = "n", keys = "<Leader>kmv", desc = "View Neovim keymaps" },
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
