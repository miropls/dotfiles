return {
	"akinsho/toggleterm.nvim",
	version = "2.11.0",
	config = function()
		require("toggleterm").setup({
			direction = "float",
			float_opts = {
				border = "curved",
			},
		})

		function _G.set_terminal_keymaps()
			local opts = { buffer = 0 }
			vim.keymap.set("t", "<esc>", [[<C-\><C-n>]], opts)
			vim.keymap.set("t", "<C-m>", [[<Cmd>wincmd h<CR>]], opts)
			vim.keymap.set("t", "<C-n>", [[<Cmd>wincmd j<CR>]], opts)
			vim.keymap.set("t", "<C-e>", [[<Cmd>wincmd k<CR>]], opts)
			vim.keymap.set("t", "<C-i>", [[<Cmd>wincmd l<CR>]], opts)
			vim.keymap.set("t", "<C-w>", [[<C-\><C-n><C-w>]], opts)
			vim.keymap.set("t", "<CR>", [[<CR>]], opts)
		end

		-- if you only want these mappings for toggle term use term://*toggleterm#* instead
		vim.keymap.set("n", "<leader>tm", "<cmd>ToggleTerm<CR>")
		vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")
	end,
}
