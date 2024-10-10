return {
	"nvim-treesitter/nvim-treesitter",
	lazy = false,
	build = function()
		local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
		ts_update()
	end,

	config = function()
		vim.filetype.add({
			pattern = {
				[".*%.blade%.php"] = "blade",
			},
		})

		require("nvim-treesitter.configs").setup({
			-- A list of parser names, or 'all'
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
				"blade",
				"bash",
				"query",
			},

			-- Install parsers synchronously (only applied to `ensure_installed`)
			sync_install = false,

			-- Automatically install missing parsers when entering buffer
			-- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
			auto_install = true,

			-- List of parsers to ignore installing (for 'all')
			ignore_install = {},

			---- If you need to change the installation directory of the parsers (see -> Advanced Setup)
			-- parser_install_dir = '/some/path/to/store/parsers', -- Remember to run vim.opt.runtimepath:append('/some/path/to/store/parsers')!

			highlight = {
				-- `false` will disable the whole extension
				enable = true,

				additional_vim_regex_highlighting = false,
			},
		})

		require("treesitter-context").setup({
			enable = true,
			line_numbers = true,
			max_lines = 1,
		})

		local parser_config = require("nvim-treesitter.parsers").get_parser_configs()

		parser_config.blade = {
			install_info = {
				url = "https://github.com/EmranMR/tree-sitter-blade",
				files = {
					"src/parser.c",
					-- 'src/scanner.cc',
				},
				branch = "main",
				generate_requires_npm = true,
				requires_generate_from_grammar = true,
			},
			filetype = "blade",
		}
	end,
	dependencies = {
		"nvim-treesitter/nvim-treesitter-context",
	},
}
