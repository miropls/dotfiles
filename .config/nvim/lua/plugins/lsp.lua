return {
  "neovim/nvim-lspconfig",
  version = "*",
  dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "folke/neodev.nvim",
    {
      "pmizio/typescript-tools.nvim",
      dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
      opts = {},
      config = function()
        require("typescript-tools").setup({
          on_attach = function(client, bufnr)
            vim.keymap.set({ "n", "v", "x" }, "<leader>ga", vim.lsp.buf.code_action, { buffer = bufnr })
            vim.keymap.set({ "n" }, "<leader>tssd", "<cmd>TSToolsGoToSourceDefinition<CR>")
            vim.keymap.set({ "n" }, "<leader>tsoi", "<cmd>TSToolsOrganizeImports<CR>")
            vim.keymap.set({ "n" }, "<leader>tsai", "<cmd>TSToolsAddMissingImports<CR>")
            vim.keymap.set({ "n" }, "<leader>tsfa", "<cmd>TSToolsFixAll<CR>")
            vim.keymap.set({ "n" }, "<leader>tsrn", "<cmd>TSToolsRenameFile<CR>")
            vim.keymap.set({ "n" }, "<leader>tsfr", "<cmd>TSToolsFileReferences<CR>")
          end,
          settings = {
            tsserver_plugins = {
              "@styled/typescript-styled-plugin",
            },
            jsx_close_tag = {
              enable = true,
              filetypes = { "javascriptreact", "typescriptreact" },
            },
          },
        })
      end,
    },
    {
      "windwp/nvim-ts-autotag",
      config = function()
        vim.filetype.add({
          pattern = {
            [".*%.blade%.php"] = "blade",
          },
        })

        require("nvim-ts-autotag").setup({
          aliases = {
            ["blade"] = "html"
          }
        })
      end
    },
    -- Autocompletion
    {
      "hrsh7th/nvim-cmp",
      config = function()
        local cmp = require("cmp")
        local luasnip = require("luasnip")
        local lspkind = require("lspkind")

        local has_words_before = function()
          unpack = unpack or table.unpack
          local line, col = unpack(vim.api.nvim_win_get_cursor(0))
          return col ~= 0
              and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
        end

        ---@diagnostic disable-next-line missing-fields
        cmp.setup({
          snippet = {
            expand = function(args)
              luasnip.lsp_expand(args.body)
            end,
          },
          sources = cmp.config.sources({
            { name = "nvim_lsp" },
            { name = "luasnip" },
            { name = "buffer" },
            require("luasnip.loaders.from_vscode").lazy_load(),
          }),
          window = {
            completion = cmp.config.window.bordered(),
            documentation = cmp.config.window.bordered(),
          },
          ---@diagnostic disable-next-line missing-fields
          formatting = {
            format = lspkind.cmp_format({
              mode = "symbol_text",
              maxwidth = 50,
              ellipsis_char = "...",
            }),
          },
          mapping = {
            ["<CR>"] = cmp.mapping.confirm({ select = true }),
            ["<C-g>"] = cmp.mapping.scroll_docs(-4),
            ["<C-b>"] = cmp.mapping.scroll_docs(4),
            ["<Up>"] = cmp.mapping.select_prev_item({ behavior = "select" }),
            ["<Down>"] = cmp.mapping.select_next_item({ behavior = "select" }),
            ["<C-Space>"] = cmp.mapping(function(fallback)
              if cmp.visible() then
                cmp.abort()
              else
                cmp.complete()
              end
            end),
            ["<Tab>"] = cmp.mapping(function(fallback)
              if cmp.visible() then
                cmp.select_next_item({ behavior = "insert" })
                -- You could replace the expand_or_jumpable() calls with expand_or_locally_jumpable()
                -- that way you will only jump inside the snippet region
              elseif luasnip.expand_or_jumpable() then
                luasnip.expand_or_jump()
              elseif has_words_before() then
                cmp.complete()
              else
                fallback()
              end
            end, { "i", "s" }),

            ["<S-Tab>"] = cmp.mapping(function(fallback)
              if cmp.visible() then
                cmp.select_prev_item({ behavior = "insert" })
              elseif luasnip.jumpable(-1) then
                luasnip.jump(-1)
              else
                fallback()
              end
            end, { "i", "s" }),
          },
        })
      end,
    },
    { "hrsh7th/cmp-buffer" },
    { "hrsh7th/cmp-path" },
    { "saadparwaiz1/cmp_luasnip" },
    { "hrsh7th/cmp-nvim-lsp" },
    { "hrsh7th/cmp-nvim-lua" },
    {
      "windwp/nvim-autopairs",
      event = "InsertEnter",
      config = true,
    },

    -- Snippets
    {
      "L3MON4D3/LuaSnip",
      dependencies = { "rafamadriz/friendly-snippets" },
    },
    {
      "onsails/lspkind.nvim",
    },
  },
  config = function()
    require("neodev").setup()
    require("mason").setup()
    require("mason-lspconfig").setup({
      ensure_installed = {
        "lua_ls",
        "gopls",
        "eslint",
        "rust_analyzer",
        "clangd",
        "dockerls",
        "docker_compose_language_service",
        "tailwindcss",
        "vimls",
        "intelephense",
      },
      automatic_insallation = true,
    })
    local cmp_autopairs = require("nvim-autopairs.completion.cmp")
    local cmp = require("cmp")

    local capabilities = require("cmp_nvim_lsp").default_capabilities()

    require("mason-lspconfig").setup_handlers({
      function(server_name)
        require("lspconfig")[server_name].setup({
          capabilities = capabilities,
        })
      end,
    })

    -- Keymaps for LSP actions
    local builtin = require("telescope.builtin")

    -- Native LSP bindings
    vim.keymap.set("n", "gh", vim.lsp.buf.hover)
    vim.keymap.set("n", "gl", vim.diagnostic.open_float)
    vim.keymap.set("n", "gD", vim.lsp.buf.declaration)
    vim.keymap.set("n", "ga", vim.lsp.buf.code_action)

    -- Telescope builtins
    vim.keymap.set("n", "gd", builtin.lsp_definitions, {})
    vim.keymap.set("n", "gt", builtin.lsp_type_definitions, {})
    vim.keymap.set("n", "gr", builtin.lsp_references, {})
    vim.keymap.set("n", "gi", builtin.lsp_implementations, {})

    -- Telescope diagnostics
    vim.keymap.set("n", "<leader>dd", function() -- Buffer diagnostics
      builtin.diagnostics({ bufnr = 0 })
    end)
    vim.keymap.set("n", "<leader>dw", builtin.diagnostics, {}) -- Workspace diagnostics

    vim.keymap.set("n", "<leader>ni", "<cmd>LspInfo<CR>")

    -- Auto insert parenthesis after function or method completion
    cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())

    -- Sign column icons
    local function set_sign_icons(opts)
      opts = opts or {}

      local sign = function(args)
        if opts[args.name] == nil then
          return
        end

        vim.fn.sign_define(args.hl, {
          texthl = args.hl,
          text = opts[args.name],
          numhl = "",
        })
      end

      sign({ name = "error", hl = "DiagnosticSignError" })
      sign({ name = "warn", hl = "DiagnosticSignWarn" })
      sign({ name = "hint", hl = "DiagnosticSignHint" })
      sign({ name = "info", hl = "DiagnosticSignInfo" })
    end

    set_sign_icons({
      error = "✘",
      warn = "▲",
      hint = "⚑",
      info = "»",
    })
  end,
}
