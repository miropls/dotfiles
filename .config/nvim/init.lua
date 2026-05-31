vim.cmd.packadd("cfilter")
vim.cmd.packadd("nvim.undotree")
vim.cmd.packadd("nvim.difftool")
require("vim._core.ui2").enable({
	enabled = true,
	msg = {
		target = "msg",
		msg = {
			height = 1,
			width = 1,
			timeout = 2000,
		},
	},
})

require("config.lazy")
