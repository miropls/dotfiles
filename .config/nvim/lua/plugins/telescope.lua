return {
	"nvim-telescope/telescope.nvim",
	branch = "master",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{
			"nvim-telescope/telescope-fzf-native.nvim",
			build = "make",
		},
		"nvim-telescope/telescope-ui-select.nvim",
	},
	config = function()
		local config = require("telescope.config")
		local vimgrep_arguments = { unpack(config.values.vimgrep_arguments) }

		table.insert(vimgrep_arguments, "--hidden")
		table.insert(vimgrep_arguments, "--glob")
		table.insert(vimgrep_arguments, "!**/.git/*")

		require("telescope").setup({
			defaults = {
				vimgrep_arguments = vimgrep_arguments,
			},
			pickers = {
				find_files = {
					find_command = { "rg", "--files", "--hidden", "--glob", "!**/.git/*" },
				},
			},
			extensions = {
				["ui-select"] = {
					require("telescope.themes").get_dropdown({}),
				},
			},
		})

		require("telescope").load_extension("fzf")
		require("telescope").load_extension("ui-select")

		vim.keymap.set("n", "<leader>ff", require("telescope.builtin").find_files, { desc = "Files" })
		vim.keymap.set("n", "<leader>fg", require("telescope.builtin").git_files, { desc = "Git files" })
		vim.keymap.set("n", "<leader>fc", function()
			require("telescope.builtin").find_files({ cwd = vim.fn.stdpath("config") })
		end, { desc = "Open Neovim config" })

		vim.keymap.set("n", "<leader>p", function()
			require("telescope.builtin").live_grep(require("telescope.themes"))
		end, { desc = "Fuzzy search" })

		-- git
		vim.keymap.set("n", "<leader>ggc", require("telescope.builtin").git_commits, { desc = "Commits" })
		vim.keymap.set("n", "<leader>ggb", require("telescope.builtin").git_branches, { desc = "Branches" })
		vim.keymap.set("n", "<leader>ggs", require("telescope.builtin").git_status, { desc = "Status" })
		vim.keymap.set("n", "<leader>ggt", require("telescope.builtin").git_stash, { desc = "Stash" })
	end,
}
