return {
	"stevearc/oil.nvim",
	config = function()
		require("oil").setup({
			columns = {
				"icon",
				-- "permissions",
				-- "size",
				-- "mtime",
			},
			keymaps = {
				["q"] = "actions.close",
				["<Esc>"] = "actions.close",
				["os"] = "actions.select_split",
				["oh"] = "actions.select_vsplit",
			},
			view_options = {
				show_hidden = true,
			},
      watch_for_changes = true,
      default_file_explorer = true
		})
		vim.keymap.set("n", "<leader>mm", "<CMD>Oil<CR>")
	end,
}
