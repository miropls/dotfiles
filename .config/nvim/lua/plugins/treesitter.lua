return {
	"nvim-treesitter/nvim-treesitter",
	event = "VeryLazy",
	build = function()
		require("nvim-treesitter.install").update({ with_sync = true })()
	end,
	dependencies = {
		"nvim-treesitter/nvim-treesitter-context",
	},
	opts = {
		ensure_installed = {
			"c",
			"lua",
			"rust",
			"go",
			"vimdoc",
			"astro",
			"javascript",
			"typescript",
			"tsx",
			"html",
			"php_only",
			"bash",
			"query",
		},
		sync_install = false,
		auto_install = true,
		highlight = {
			enable = true,
		},
	},
	config = function(_, opts)
		require("nvim-treesitter.configs").setup(opts)
		require("treesitter-context").setup({
			enable = true,
			line_numbers = true,
			max_lines = 1,
		})
	end,
}
