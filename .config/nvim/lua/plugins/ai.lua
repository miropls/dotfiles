return {
	{
		"olimorris/codecompanion.nvim",
		lazy = false,
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-treesitter/nvim-treesitter",
			"zbirenbaum/copilot.lua",
		},
		keys = {
			{ "<leader>at", "<cmd>CodeCompanionChat Toggle<CR>", desc = "Toggle" },
			{ "<leader>aa", "<cmd>CodeCompanionActions<CR>", desc = "Actions" },
			{
				"<A-C-p>",
				function()
					require("copilot.suggestion").next()
				end,
				mode = "i",
			},
			{
				"<A-C-b>",
				function()
					require("copilot.suggestion").prev()
				end,
				mode = "i",
			},
			{
				"<A-C-e>",
				function()
					require("copilot.suggestion").accept()
				end,
				mode = "i",
			},
			{
				"<A-C-d>",
				function()
					require("copilot.suggestion").dismiss()
				end,
				mode = "i",
			},
		},
		config = function()
			local model_id = "claude-3.5-sonnet"

			require("copilot").setup({
				copilot_model = model_id,
			})

			require("codecompanion").setup({
				chat = {},
			})

			vim.cmd([[cab cc CodeCompanion]])
		end,
	},
}
