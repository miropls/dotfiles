return {
	"smjonas/inc-rename.nvim",
	lazy = true,
	config = function()
		require("inc_rename").setup()

		vim.keymap.set("n", "<leader>rn", function()
			return ":IncRename " .. vim.fn.expand("<cword>")
		end, { expr = true })
	end,
}
