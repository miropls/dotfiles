return {
	"stevearc/overseer.nvim",
	keys = {
		{ "<leader>ot", "<cmd>OverseerToggle right<CR>", desc = "Overseer toggle" },
		{ "<leader>or", "<cmd>OverseerRun<CR>", desc = "Overseer run" },
	},
	config = function()
		require("overseer").setup()
	end,
}
