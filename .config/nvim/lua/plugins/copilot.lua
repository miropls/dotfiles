return {
	{
		"CopilotC-Nvim/CopilotChat.nvim",
		dependencies = {
			{ "zbirenbaum/copilot.lua" },
			{ "nvim-lua/plenary.nvim", branch = "master" }, -- for curl, log and async functions
		},
		keys = {
			{ "<leader>ap", "<cmd>CopilotChatPrompts<CR>", desc = "Prompts" },
			{ "<leader>am", "<cmd>CopilotChatModels<CR>", desc = "Models" },
			{ "<leader>aa", "<cmd>CopilotChatAgents<CR>", desc = "Agents" },
			{ "<leader>at", "<cmd>CopilotChatToggle<CR>", desc = "Toggle" },
			{
				"<A-C-n>",
				function()
					require("copilot.suggestion").next()
				end,
				mode = "i",
			},
			{
				"<A-C-p>",
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
			require("CopilotChat").setup({
				model = model_id,
			})
		end,
	},
}
