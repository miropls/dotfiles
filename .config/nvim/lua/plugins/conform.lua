return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local conform = require("conform")

		conform.setup({
			log_level = vim.log.levels.DEBUG,
			formatters_by_ft = {
				lua = { "stylua" },
				python = { "black" },
				javascript = { "biome", "prettierd", "prettier" },
				typescript = { "biome", "prettierd", "prettier" },
				javascriptreact = { "biome", "prettierd", "prettier" },
				typescriptreact = { "biome", "prettierd", "prettier" },
				astro = { "biome", "prettierd", "prettier" },
				svelte = { "biome", "prettierd", "prettier" },
				vue = { "biome", "prettierd", "prettier" },
				css = { "biome", "prettierd", "prettier" },
				html = { "biome", "prettierd", "prettier" },
				json = { "biome", "prettierd", "prettier" },
				go = { "gofmt", "goimports" },
				rust = { "rustfmt" },
				yaml = { "yamlfix" },
				sql = { "sql-formatter" },
				php = { "pint", "php_cs_fixer" },
				blade = { "blade-formatter" },
			},

			format_on_save = function(bufnr)
				-- Disable with a global or buffer-local variable
				if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
					return
				end
				return { timeout_ms = 3000, lsp_fallback = true }
			end,
		})

		vim.keymap.set({ "n", "v" }, "<leader>fmt", function()
			conform.format({
				lsp_fallback = true,
				async = false,
				timeout_ms = 1000,
			})
		end, { desc = "Format file or range (in visual mode)" })

		-- Create command to toggle autoformatting on or offset
		-- leader fo to toggle, or use cmd
		vim.api.nvim_create_user_command("FormatToggle", function(args)
			if args.bang then
				-- FormatDisable! will disable formatting just for this buffer
				if vim.b.disable_autoformat == true then
					vim.b.disable_autoformat = false
				else
					vim.b.disable_autoformat = true
				end
			else
				if vim.g.disable_autoformat == true then
					vim.g.disable_autoformat = false
				else
					vim.g.disable_autoformat = true
				end
			end
		end, {
			desc = "Toggle autoformatting",
			bang = true,
		})

		vim.keymap.set("n", "<leader>fo", vim.cmd.FormatToggle)
	end,
}
