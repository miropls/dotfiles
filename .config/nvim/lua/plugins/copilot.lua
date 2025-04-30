return {
	{
		"CopilotC-Nvim/CopilotChat.nvim",
		dependencies = {
			{ "zbirenbaum/copilot.lua" },
			{ "nvim-lua/plenary.nvim", branch = "master" }, -- for curl, log and async functions
		},
		keys = {
			{ "<leader>cp", "<cmd>CopilotChatPrompts<CR>", desc = "Prompts" },
			{ "<leader>cm", "<cmd>CopilotChatModels<CR>", desc = "Models" },
			{ "<leader>ca", "<cmd>CopilotChatAgents<CR>", desc = "Agents" },
			{ "<leader>ct", "<cmd>CopilotChatToggle<CR>", desc = "Toggle" },
			{
				"<leader>cg",
				function()
					require("CopilotChat").complete_items()
				end,
				desc = "Toggle",
			},
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
