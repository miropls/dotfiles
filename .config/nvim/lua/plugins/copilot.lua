return {
	"github/copilot.vim",
	event = "InsertEnter",
	cmd = { "Copilot" },
	keys = {
		{ "<leader>ad", "<cmd>Copilot disable<CR>", desc = "Disable Copilot" },
		{ "<leader>ae", "<cmd>Copilot enable<CR>", desc = "Enable Copilot" },
	},
}
