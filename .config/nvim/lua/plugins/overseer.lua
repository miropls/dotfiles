return {
	"stevearc/overseer.nvim",
	opts = {},
	config = function()
		vim.keymap.set("n", "<leader>os", "<CMD>OverseerRun<CR>")
		vim.keymap.set("n", "<leader>ot", "<CMD>OverseerToggle<CR>")

		require("overseer").setup()
	end,
}
