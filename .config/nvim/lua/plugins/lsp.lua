return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	version = "*",
	dependencies = {
		"mason-org/mason.nvim",
		"mason-org/mason-lspconfig.nvim",
		{
			"folke/lazydev.nvim",
			ft = "lua",
			opts = { library = { { path = "${3rd}/luv/library", words = { "vim%.uv" } } } },
		},
		{ "windwp/nvim-ts-autotag", event = "VeryLazy", config = true },
		{ "windwp/nvim-autopairs", event = "InsertEnter", config = true },
		{
			"saghen/blink.cmp",
			event = "InsertEnter",
			dependencies = "rafamadriz/friendly-snippets",
			version = "1.*",
			opts = function()
				return {
					keymap = { preset = "enter" },
					cmdline = {
						keymap = {
							preset = "cmdline",
							["<Tab>"] = {
								function(cmp)
									if not cmp.is_menu_visible() then
										cmp.show()
									else
										cmp.select_next()
									end
								end,
							},
							["<S-Tab>"] = {
								function(cmp)
									if not cmp.is_menu_visible() then
										cmp.show()
									else
										cmp.select_prev()
									end
								end,
							},
						},
					},
					appearance = { use_nvim_cmp_as_default = true, nerd_font_variant = "mono" },
					sources = {
						default = { "lsp", "path", "snippets", "buffer", "lazydev" },
						providers = {
							lsp = { fallbacks = { "lazydev" } },
							lazydev = { name = "LazyDev", module = "lazydev.integrations.blink" },
						},
						min_keyword_length = function(ctx)
							if ctx.mode == "cmdline" then
								return 6
							end
							return 0
						end,
					},
					completion = {
						accept = { auto_brackets = { enabled = true } },
						documentation = { auto_show = true, auto_show_delay_ms = 0 },
						list = { selection = { preselect = true, auto_insert = false } },
					},
					signature = { enabled = true },
				}
			end,
		},
	},
	config = function()
		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("lsp-attach-keymaps", { clear = true }),
			callback = function(event)
				local map = function(keys, func, desc)
					vim.keymap.set("n", keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
				end

				map("gh", function()
					vim.lsp.buf.hover({ max_width = math.floor(vim.o.columns * 0.8) })
				end, "Hover")
				map("gl", vim.diagnostic.open_float, "Hover error")
				map("gD", vim.lsp.buf.declaration, "Goto declaration")
				map("ga", vim.lsp.buf.code_action, "Code actions")
				map("gd", function()
					Snacks.picker.lsp_definitions()
				end, "Goto definition")
				map("gt", function()
					Snacks.picker.lsp_type_definitions()
				end, "Type definition")
				map("gr", function()
					Snacks.picker.lsp_references()
				end, "References")
				map("gi", function()
					Snacks.picker.lsp_implementations()
				end, "Goto implementations")
			end,
		})

		require("mason").setup()
		local lspconfig = require("lspconfig")
		local capabilities = require("blink.cmp").get_lsp_capabilities()

		require("mason-lspconfig").setup({
			ensure_installed = {
				"clangd",
				"cssls",
				"docker_compose_language_service",
				"dockerls",
				"eslint",
				"gopls",
				"jsonls",
				"lua_ls",
				"rust_analyzer",
				"tailwindcss",
				"vtsls",
				"vimls",
				"taplo",
				"ruff",
				"stylua",
				"yamlls",
				"yamlfix",
			},
			handlers = {
				function(server_name)
					lspconfig[server_name].setup({
						capabilities = capabilities,
					})
				end,
			["lua_ls"] = function()
				lspconfig.lua_ls.setup({
					capabilities = capabilities,
				})
			end,
			},
		})
	end,
}
