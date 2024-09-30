return {
  "rest-nvim/rest.nvim",
  config = function()
    vim.keymap.set("n", "<leader>rr", "<CMD>Rest run<CR>")
  end
}
