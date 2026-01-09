return {
	"blazkowolf/gruber-darker.nvim",
	lazy = false,
	config = function()
		require("gruber-darker").setup()

		local function set_transparent()
			local groups = { "Normal", "NormalFloat", "NormalNC", "SignColumn", "Pmenu" }
			for _, group in ipairs(groups) do
				vim.api.nvim_set_hl(0, group, { bg = "none" })
			end
		end

		vim.cmd.colorscheme("gruber-darker")
		-- Apply the transparency
		set_transparent()
	end,
}
