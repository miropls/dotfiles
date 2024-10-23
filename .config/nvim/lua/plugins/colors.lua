return {
  "catppuccin/nvim",
  lazy = false,
  priority = 1000,
  config = function()
    require("catppuccin").setup({
      transparent_background = true, -- disables setting the background color.
      send_end_of_buffer = false,
    })
    vim.cmd.colorscheme("catppuccin")
  end,
}
