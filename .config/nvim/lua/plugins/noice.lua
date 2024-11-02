return {
  "folke/noice.nvim",
  lazy = true,
  event = "VeryLazy",
  config = function()
    require("noice").setup({
      presets = {
        command_palette = true,
        bottom_search = false,
        lsp_doc_border = true,
        inc_rename = true,
        long_message_to_split = true,
      },
      lsp = {
        override = {
          ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
          ["vim.lsp.util.stylize_markdown"] = true,
          ["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
        },
        hover = {
          silent = true,
        },
      },
      routes = {
        {
          filter = {
            event = "msg_show",
            kind = "search_count",
          },
          opts = { skip = true },
        },
        {
          filter = {
            event = "notify",
            find = "No information available",
          },
          opts = { skip = true },
        },
      },
    })

    -- Supress warning with Catppuccin
    require("notify").setup({
      background_colour = "#000000",
    })
  end,
  dependencies = {
    "MunifTanjim/nui.nvim",
    "rcarriga/nvim-notify",
  },
}
