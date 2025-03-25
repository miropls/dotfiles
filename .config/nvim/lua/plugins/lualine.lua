return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    -- local color = require("lackluster.color")
    -- local color_special = require("lackluster.color-special")
    --
    -- local lualine_theme = {
    --   normal = {
    --     a = { bg = color_special.statusline, fg = color.green, gui = "bold" },
    --     b = { bg = color_special.statusline, fg = color.gray7 },
    --     c = { bg = color_special.statusline, fg = color.gray7 },
    --   },
    --   insert = {
    --     a = { bg = color.green, fg = color.gray2, gui = "bold" },
    --     b = { bg = color_special.statusline, fg = color.gray7 },
    --     c = { bg = color_special.statusline, fg = color.gray7 },
    --   },
    --   command = {
    --     a = { bg = color.blue, fg = color.gray2, gui = "bold" },
    --     b = { bg = color_special.statusline, fg = color.gray7 },
    --     c = { bg = color_special.statusline, fg = color.gray7 },
    --   },
    --   visual = {
    --     a = { bg = color.orange, fg = color.gray2, gui = "bold" },
    --     b = { bg = color_special.statusline, fg = color.gray7 },
    --     c = { bg = color_special.statusline, fg = color.gray7 },
    --   },
    --   replace = {
    --     a = { bg = color.gray9, fg = color.black, gui = "bold" },
    --     b = { bg = color_special.statusline, fg = color.gray7 },
    --     c = { bg = color_special.statusline, fg = color.gray7 },
    --   },
    --   inactive = {
    --     a = { bg = color.gray1, fg = color.gray4, gui = "bold" },
    --     b = { bg = color.gray1, fg = color.gray4 },
    --     c = { bg = color.gray1, fg = color.gray4 },
    --   },
    -- }

    -- require("nvim-web-devicons").setup({
    --   color_icons = false,
    --   override = {
    --     ["default_icon"] = {
    --       color = color.green,
    --       name = "Default",
    --     },
    --   },
    -- })
    --
    require("lualine").setup({
      options = {
        theme = "auto",
        component_separators = "|",
        section_separators = "",
      },
      sections = {
        lualine_a = { "mode" },
        lualine_b = { "branch", "diff", "diagnostics" },
        lualine_c = { "filename" },
        lualine_x = { { "overseer", colored = true } },
        lualine_y = { "encoding", "fileformat", "filetype" },
        lualine_z = { "location" },
      },
    })
  end,
}
