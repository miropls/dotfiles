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
		local km = vim.keymap.set

		km("n", "<leader>ff", require("telescope.builtin").find_files, { desc = "Files" })
		km("n", "<leader>fg", require("telescope.builtin").git_files, { desc = "Git files" })
		km("n", "<leader>fh", require("telescope.builtin").help_tags, { desc = "Git files" })
		km("n", "<leader>fc", function()
			require("telescope.builtin").find_files({ cwd = vim.fn.stdpath("config") })
		end, { desc = "Open Neovim config" })

		km("n", "<leader>p", function()
			require("telescope.builtin").live_grep(require("telescope.themes"))
		end, { desc = "Fuzzy search" })

		-- git
		km("n", "<leader>ggc", require("telescope.builtin").git_commits, { desc = "Commits" })
		km("n", "<leader>ggb", require("telescope.builtin").git_branches, { desc = "Branches" })
		km("n", "<leader>ggs", require("telescope.builtin").git_status, { desc = "Status" })
		km("n", "<leader>ggt", require("telescope.builtin").git_stash, { desc = "Stash" })

		km("n", "<leader>co", require("telescope.builtin").quickfix)
	end,
}
