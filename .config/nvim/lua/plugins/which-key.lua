return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	opts = {
		preset = "helix",
		delay = 500,
		spec = {
			{ "<leader>a", group = "AI" },
			{ "<leader>d", group = "Diagnostics" },
			{ "<leader>f", group = "Find" },
			{ "<leader>g", group = "Git" },
			{ "<leader>gg", group = "Git Pickers" },
			{ "<leader>gh", group = "GitHub" },
			{ "<leader>gs", group = "GitSigns" },
			{ "<leader>l", group = "Lazy" },
			{ "<leader>lg", group = "LazyGit" },
			{ "<leader>n", group = "Neovim" },
			{ "<leader>y", group = "Clipboard" },
			{ "<leader>m", group = "Filetree" },
			{ "<leader>r", group = "Rename" },
			{ "<leader>t", group = "Toggle" },
		},
	},
}
