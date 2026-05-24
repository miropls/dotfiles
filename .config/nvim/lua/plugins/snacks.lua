return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
	opts = {
		animate = { enabled = true },
		dim = { enabled = true },
		gh = { enabled = true },
		gitbrowse = { enabled = true },
		input = { enabled = true },
		lazygit = { enabled = true },
		notifier = { enabled = true },
		picker = {
			enabled = true,
			sources = {
				files = { hidden = true },
				grep = { hidden = true },
			},
		},
		scroll = { enabled = true },
		select = { enabled = true },
		toggle = { enabled = true },
		words = { enabled = true },
		zen = { enabled = true },
	},
	config = function(_, opts)
		require("snacks").setup(opts)
		Snacks.toggle.zen():map("<leader>tz")
		Snacks.toggle.dim():map("<leader>td")
		Snacks.toggle.diagnostics():map("<leader>tD")
		Snacks.toggle.inlay_hints():map("<leader>ti")
		Snacks.toggle.option("wrap", { name = "Wrap", on = true }):map("<leader>tw")
		Snacks.toggle.option("spell", { name = "Spell" }):map("<leader>ts")
	end,
	keys = {
		{
			"<leader>lg",
			function()
				Snacks.lazygit()
			end,
			desc = "LazyGit",
		},
		{
			"<leader>gb",
			function()
				Snacks.gitbrowse()
			end,
			desc = "Git Browse",
			mode = { "n", "v" },
		},
		{
			"<leader>ghi",
			function()
				Snacks.picker.gh_issue()
			end,
			desc = "GitHub Issues",
		},
		{
			"<leader>ghp",
			function()
				Snacks.picker.gh_pr()
			end,
			desc = "GitHub PRs",
		},
		{
			"<leader>gha",
			function()
				Snacks.picker.gh_actions()
			end,
			desc = "GitHub Actions",
		},
		{
			"<leader>ghd",
			function()
				Snacks.picker.gh_diff()
			end,
			desc = "GitHub PR Diff",
		},
		{
			"<leader>ff",
			function()
				Snacks.picker.files()
			end,
			desc = "Find Files",
		},
		{
			"<leader>fg",
			function()
				Snacks.picker.git_files()
			end,
			desc = "Find Git Files",
		},
		{
			"<leader>fh",
			function()
				Snacks.picker.help()
			end,
			desc = "Find Help Tags",
		},
		{
			"<leader>fc",
			function()
				Snacks.picker.files({ cwd = vim.fn.stdpath("config") })
			end,
			desc = "Find in Config",
		},
		{
			"<leader>fk",
			function()
				Snacks.picker.keymaps()
			end,
			desc = "Find keymaps",
		},
		{
			"<leader>p",
			function()
				Snacks.picker.grep()
			end,
			desc = "Live Grep",
		},
		{
			"<leader>ggc",
			function()
				Snacks.picker.git_log()
			end,
			desc = "Git Commits",
		},
		{
			"<leader>ggb",
			function()
				Snacks.picker.git_branches()
			end,
			desc = "Git Branches",
		},
		{
			"<leader>ggs",
			function()
				Snacks.picker.git_status()
			end,
			desc = "Git Status",
		},
		{
			"<leader>ggt",
			function()
				Snacks.picker.git_stash()
			end,
			desc = "Git Stash",
		},
		{
			"<leader>co",
			function()
				Snacks.picker.qflist()
			end,
			desc = "Quickfix",
		},
		{
			"<leader>fm",
			function()
				Snacks.picker.man()
			end,
			desc = "Manpages",
		},
		{
			"<leader>fn",
			function()
				Snacks.picker.notifications()
			end,
			desc = "Notifications",
		},
		{
			"<leader>fs",
			function()
				Snacks.picker.search_history()
			end,
			desc = "Search history",
		},
		{
			"<leader>fz",
			function()
				Snacks.picker.zoxide()
			end,
			desc = "Zoxide",
		},
	},
}
