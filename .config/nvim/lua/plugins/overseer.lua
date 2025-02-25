return {
	"stevearc/overseer.nvim",
	config = function()
		require("overseer").setup()

		vim.keymap.set("n", "<leader>oso", "<cmd>OverseerToggle<CR>")
		vim.keymap.set("n", "<leader>osr", "<cmd>OverseerRun<CR>")
	end,
}
