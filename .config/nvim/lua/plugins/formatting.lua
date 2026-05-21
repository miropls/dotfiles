return {
	"stevearc/conform.nvim",
	event = { "BufWritePre" },
	cmd = { "ConformInfo" },
	config = function(_, opts)
		require("conform").setup(opts)

		vim.api.nvim_create_user_command("FormatToggle", function(args)
			if args.bang then
				-- Buffer-local toggle
				vim.b.disable_autoformat = not vim.b.disable_autoformat
			else
				-- Global toggle
				vim.g.disable_autoformat = not vim.g.disable_autoformat
			end
		end, {
			desc = "Toggle autoformatting",
			bang = true,
		})
	end,
	keys = {
		{ "<leader>tf", "<cmd>FormatToggle<CR>", desc = "Toggle Formatting" },
	},
	opts = {
		-- I've set the log level to WARN to be less verbose
		log_level = vim.log.levels.WARN,
		formatters_by_ft = {
			c = { "clangd" },
			lua = { "stylua" },
			python = { "ruff", "black", stop_after_first = true },
			javascript = { "oxfmt", "biome", "prettierd", "prettier", stop_after_first = true },
			typescript = { "oxfmt", "biome", "prettierd", "prettier", stop_after_first = true },
			javascriptreact = { "oxfmt", "biome", "prettierd", "prettier", stop_after_first = true },
			typescriptreact = { "oxfmt", "biome", "prettierd", "prettier", stop_after_first = true },
			astro = { "oxfmt", "prettierd", "prettier", stop_after_first = true },
			svelte = { "oxfmt", "biome", "prettierd", "prettier", stop_after_first = true },
			vue = { "oxfmt", "biome", "prettierd", "prettier", stop_after_first = true },
			css = { "oxfmt", "biome", "prettierd", "prettier", stop_after_first = true },
			html = { "oxfmt", "biome", "prettierd", "prettier", stop_after_first = true },
			json = { "json-lsp", "oxfmt", "biome", "prettierd", "prettier", stop_after_first = true },
			go = { "gofmt", "goimports" },
			rust = { "rustfmt" },
			yaml = { "yamlfix", "oxfmt", "prettierd", "prettier", stop_after_first = true },
			sql = { "sql-formatter" },
			php = { "pint", "php_cs_fixer" },
		},
		format_on_save = function(bufnr)
			if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
				return
			end
			return { timeout_ms = 1500, lsp_fallback = true }
		end,
	},
}
