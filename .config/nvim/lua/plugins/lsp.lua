return {
  "neovim/nvim-lspconfig",
  lazy = false,
  version = "*",
  keys = {
    -- Native LSP bindings
    {
      "gh",
      function()
        vim.lsp.buf.hover({
          border = "single",
          max_width = math.floor(vim.o.columns * 0.8),
          max_height = math.floor(vim.o.lines * 0.3),
        })
      end,
      desc = "Hover",
    },
    { "gl", vim.diagnostic.open_float,                         desc = "Hover error" },
    { "gD", vim.lsp.buf.declaration,                           desc = "Goto declaration" },
    { "ga", vim.lsp.buf.code_action,                           desc = "Code actions" },

    -- Telescope lsp stuff
    { "gd", require("telescope.builtin").lsp_definitions,      desc = "Goto definition" },
    { "gt", require("telescope.builtin").lsp_type_definitions, desc = "Type_definition" },
    { "gr", require("telescope.builtin").lsp_references,       desc = "References" },
    { "gi", require("telescope.builtin").lsp_implementations,  desc = "Goto implementations" },

    -- Diagnostics
    {
      "<leader>dd",
      function() -- Buffer diagnostics
        require("telescope.builtin").diagnostics({ bufnr = 0 })
      end,
      desc = "Buffer diagnostics",
    },
    {
      "<leader>dw",
      function()
        require("telescope.builtin").diagnostics()
      end,
      desc = "Workspace diagnostics",
    },

    { "<leader>ni", "<cmd>LspInfo<CR>", desc = "LspInfo" },
  },
  dependencies = {
    "mason-org/mason.nvim",
    "mason-org/mason-lspconfig.nvim",
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
      version = "1.*",
      ---@module 'blink.cmp'
      ---@type blink.cmp.Config
      opts = {
        -- 'default' for mappings similar to built-in completion
        -- 'super-tab' for mappings similar to vscode (tab to accept, arrow keys to navigate)
        -- 'enter' for mappings similar to 'super-tab' but with 'enter' to accept
        -- see the "default configuration" section below for full documentation on how to define
        -- your own keymap.
        keymap = {
          preset = "enter",
        },
        cmdline = {
          keymap = {
            preset = "enter",
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

        appearance = {
          use_nvim_cmp_as_default = true,
          nerd_font_variant = "mono",
        },
        sources = {
          default = { "lsp", "path", "snippets", "buffer", "lazydev", "omni" },
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

        -- experimental auto-brackets support
        completion = {
          accept = { auto_brackets = { enabled = true } },
          documentation = {
            auto_show = true,
            auto_show_delay_ms = 0,
          },
          list = {
            selection = {
              preselect = true,
              auto_insert = false,
            },
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
        "clangd",
        "cssls",
        "docker_compose_language_service",
        "dockerls",
        "eslint",
        "gopls",
        "intelephense",
        "jsonls",
        "lua_ls",
        "rust_analyzer",
        "tailwindcss",
        "ts_ls",
        "vimls",
      },
      automatic_enable = true
    })

    -- for reasons unknown
    function docker_fix()
      local filename = vim.fn.expand("%:t")

      if filename == "docker-compose.yaml" or filename == "docker-compose.yml" then
        vim.bo.filetype = "yaml.docker-compose"
      end
    end

    vim.cmd([[au BufRead * lua docker_fix()]])

    -- Sign icons
    vim.diagnostic.config({
      signs = {
        text = {
          [vim.diagnostic.severity.ERROR] = "✘",
          [vim.diagnostic.severity.WARN] = "▲",
          [vim.diagnostic.severity.INFO] = "⚑",
          [vim.diagnostic.severity.HINT] = "»",
        },
      },
    })
  end,
}
