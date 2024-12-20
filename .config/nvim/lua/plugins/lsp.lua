return {
  "neovim/nvim-lspconfig",
  lazy = false,
  version = "*",
  dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    {
      "folke/lazydev.nvim",
      ft = "lua",
      opts = {
        library = {
          -- See the configuration section for more details
          -- Load luvit types when the `vim.uv` word is found
          { path = "${3rd}/luv/library", words = { "vim%.uv" } },
        },
      },
    },
    {
      "windwp/nvim-ts-autotag",
      config = true,
    },
    {
      "windwp/nvim-autopairs",
      event = "InsertEnter",
      config = true,
    },
    -- Autocompletion
    {
      "saghen/blink.cmp",
      lazy = false,
      dependencies = "rafamadriz/friendly-snippets",
      version = "v0.*",
      ---@module 'blink.cmp'
      ---@type blink.cmp.Config
      opts = {
        -- 'default' for mappings similar to built-in completion
        -- 'super-tab' for mappings similar to vscode (tab to accept, arrow keys to navigate)
        -- 'enter' for mappings similar to 'super-tab' but with 'enter' to accept
        -- see the "default configuration" section below for full documentation on how to define
        -- your own keymap.
        keymap = { preset = "enter" },

        appearance = {
          use_nvim_cmp_as_default = true,
          nerd_font_variant = "mono",
        },
        sources = {
          default = { "lsp", "path", "snippets", "buffer", "lazydev" },
          providers = {
            lsp = { fallbacks = { "lazydev" } },
            lazydev = { name = "LazyDev", module = "lazydev.integrations.blink" },
          },
        },

        -- experimental auto-brackets support
        completion = {
          accept = { auto_brackets = { enabled = true } },
          documentation = {
            auto_show = true,
            auto_show_delay_ms = 0,
          },
        },

        -- experimental signature help support
        signature = { enabled = true },
      },
      opts_extend = { "sources.default" },
    },
    {
      "onsails/lspkind.nvim",
    },
  },
  config = function()
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

    require("mason-lspconfig").setup_handlers({
      function(server_name)
        local lsp_capabilities = require("lspconfig")[server_name].capabilities
        local capabilities = require("blink.cmp").get_lsp_capabilities(lsp_capabilities)
        -- Select the correct LSP for Typescript based on the root file, deno.json for Deno, package.json for everything else
        if server_name == "denols" then
          require("lspconfig").denols.setup({
            root_dir = require("lspconfig").util.root_pattern("deno.json", "deno.jsonc"),
            capabilities = capabilities,
          })
        elseif server_name == "ts_ls" then
          require("lspconfig").ts_ls.setup({
            root_dir = require("lspconfig").util.root_pattern("package.json"),
            single_file_support = false,
            capabilities = capabilities,
          })
        else
          require("lspconfig")[server_name].setup({
            capabilities = capabilities,
          })
        end
      end,
    })

    -- for reasons unknown
    function docker_fix()
      local filename = vim.fn.expand("%:t")

      if filename == "docker-compose.yaml" or filename == "docker-compose.yml" then
        vim.bo.filetype = "yaml.docker-compose"
      end
    end

    vim.cmd([[au BufRead * lua docker_fix()]])

    -- Keymaps for LSP actions
    local builtin = require("telescope.builtin")

    vim.api.nvim_create_autocmd({ "VimEnter", "VimResized" }, {
      desc = "Setup LSP hover window",
      callback = function()
        local width = math.floor(vim.o.columns * 0.8)
        local height = math.floor(vim.o.lines * 0.3)

        vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
          border = "rounded",
          max_width = width,
          max_height = height,
        })
      end,
    })
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
