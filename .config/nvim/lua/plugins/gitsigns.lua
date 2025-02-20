return {
	"lewis6991/gitsigns.nvim",
	config = function()
		require("gitsigns").setup({
			current_line_blame = true,
			current_line_blame_opts = {
				virt_text_pos = "eol",
			},
		})

		vim.keymap.set("n", "<leader>hpp", "<CMD>Gitsigns preview_hunk<CR>")
		vim.keymap.set("n", "<leader>hpi", "<CMD>Gitsigns preview_hunk_inline<CR>")
		vim.keymap.set("n", "<leader>hs", "<CMD>Gitsigns stage_hunk<CR>")
	end,
}
