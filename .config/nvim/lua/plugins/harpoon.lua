return {
	"theprimeagen/harpoon",
	lazy = true,
	branch = "harpoon2",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		local harpoon = require("harpoon")

		harpoon:setup()

		vim.keymap.set("n", "<leader>h", function()
			harpoon:list():add()
		end)
		vim.keymap.set("n", "<leader>k", function()
			harpoon.ui:toggle_quick_menu(harpoon:list())
		end)

		vim.keymap.set("n", "<leader>m", function()
			harpoon:list():select(1)
		end)
		vim.keymap.set("n", "<leader>n", function()
			harpoon:list():select(2)
		end)
		vim.keymap.set("n", "<leader>e", function()
			harpoon:list():select(3)
		end)
		vim.keymap.set("n", "<leader>i", function()
			harpoon:list():select(4)
		end)

		-- Toggle previous & next buffers stored within Harpoon list
		vim.keymap.set("n", "<leader>j", function()
			harpoon:list():prev()
		end)
		vim.keymap.set("n", "<leader>l", function()
			harpoon:list():next()
		end)
	end,
}
