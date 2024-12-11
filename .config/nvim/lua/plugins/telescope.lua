return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.8",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{
			"nvim-telescope/telescope-fzf-native.nvim",
			build = "make",
		},
		"nvim-telescope/telescope-ui-select.nvim",
	},
	config = function()
		local builtin = require("telescope.builtin")
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
					theme = "ivy",
				},
			},
			extensions = {
				["ui-select"] = {
					require("telescope.themes").get_dropdown({}),
				},
			},
		})

		-- find (in) files
		vim.keymap.set("n", "<leader>f", builtin.find_files)
		vim.keymap.set("n", "<leader>gf", builtin.git_files)
		vim.keymap.set("n", "<leader>fc", function()
			builtin.find_files({
				cwd = vim.fn.stdpath("config"),
			})
		end)

		-- buffers
		vim.keymap.set("n", "<leader>bf", builtin.buffers)

		-- registers
		vim.keymap.set("n", "<leader>rg", builtin.registers)

		vim.keymap.set("n", "<leader>pf", function()
			builtin.grep_string({ search = vim.fn.input("Grep > ") })
		end)
		vim.keymap.set("n", "<leader>pp", function()
			builtin.live_grep(require("telescope.themes"))
		end)

		-- git
		vim.keymap.set("n", "<leader>gc", builtin.git_commits, {})
		vim.keymap.set("n", "<leader>gb", builtin.git_branches, {})
		vim.keymap.set("n", "<leader>gs", builtin.git_status, {})
		vim.keymap.set("n", "<leader>gss", builtin.git_stash, {})

		require("telescope").load_extension("fzf")
		require("telescope").load_extension("ui-select")
		require("telescope").load_extension("aerial")
	end,
}
