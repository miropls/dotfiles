return {
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
	dependencies = { "nvim-lua/plenary.nvim" },
	keys = {
		{
			"<leader>ha",
			function()
				require("harpoon"):list():add()
			end,
			desc = "Harpoon: Add file",
		},
		{
			"<leader>ho",
			function()
				local harpoon = require("harpoon")
				harpoon.ui:toggle_quick_menu(harpoon:list())
			end,
			desc = "Harpoon: Quick menu",
		},
		{
			"<C-m>",
			function()
				require("harpoon"):list():select(1)
			end,
			desc = "Harpoon to file 1",
		},
		{
			"<C-n>",
			function()
				require("harpoon"):list():select(2)
			end,
			desc = "Harpoon to file 2",
		},
		{
			"<C-e>",
			function()
				require("harpoon"):list():select(3)
			end,
			desc = "Harpoon to file 3",
		},
		{
			"<C-i>",
			function()
				require("harpoon"):list():select(4)
			end,
			desc = "Harpoon to file 4",
		},
		{
			"<C-S-I>",
			function()
				require("harpoon"):list():prev()
			end,
			desc = "Harpoon: Previous",
		},
		{
			"<C-S-M>",
			function()
				require("harpoon"):list():next()
			end,
			desc = "Harpoon: Next",
		},
	},
	config = function()
		-- Harpoon's setup is simple, so we can leave it here.
		-- It will only run once, when one of the keys is pressed.
		require("harpoon"):setup()
	end,
}
