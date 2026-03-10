return {
	"nvim-telescope/telescope.nvim",
	branch = "master",
	cmd = "Telescope",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		"nvim-telescope/telescope-ui-select.nvim",
	},
	keys = {
		{
			"<leader>ff",
			function()
				require("telescope.builtin").find_files()
			end,
			desc = "Find Files",
		},
		{
			"<leader>fg",
			function()
				require("telescope.builtin").git_files()
			end,
			desc = "Find Git Files",
		},
		{
			"<leader>fh",
			function()
				require("telescope.builtin").help_tags()
			end,
			desc = "Find Help Tags",
		},
		{
			"<leader>fc",
			function()
				require("telescope.builtin").find_files({ cwd = vim.fn.stdpath("config") })
			end,
			desc = "Find in Config",
		},
		{
			"<leader>p",
			function()
				require("telescope.builtin").live_grep()
			end,
			desc = "Live Grep",
		},
		{
			"<leader>ggc",
			function()
				require("telescope.builtin").git_commits()
			end,
			desc = "Git Commits",
		},
		{
			"<leader>ggb",
			function()
				require("telescope.builtin").git_branches()
			end,
			desc = "Git Branches",
		},
		{
			"<leader>ggs",
			function()
				require("telescope.builtin").git_status()
			end,
			desc = "Git Status",
		},
		{
			"<leader>ggt",
			function()
				require("telescope.builtin").git_stash()
			end,
			desc = "Git Stash",
		},
		{
			"<leader>co",
			function()
				require("telescope.builtin").quickfix()
			end,
			desc = "Quickfix",
		},
	},
	config = function()
		local telescope = require("telescope")
		local actions = require("telescope.actions")
		local vimgrep_arguments = { unpack(require("telescope.config").values.vimgrep_arguments) }

		table.insert(vimgrep_arguments, "--hidden")
		table.insert(vimgrep_arguments, "--glob")
		table.insert(vimgrep_arguments, "!**/.git/*")

		telescope.setup({
			defaults = {
				vimgrep_arguments = vimgrep_arguments,
				mappings = {
					i = {
						-- A common UX improvement: close Telescope with Escape in insert mode.
						["<esc>"] = actions.close,
					},
				},
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

		telescope.load_extension("fzf")
		telescope.load_extension("ui-select")
	end,
}
