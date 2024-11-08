local wezterm = require("wezterm")
local action = wezterm.action

local M = {}

function M.apply_to_config(config)
	config.keys = {
		{ key = "v", mods = "ALT", action = action.PasteFrom("Clipboard") },
		{ key = "c", mods = "ALT", action = action.CopyTo("Clipboard") },
		{ key = "UpArrow", mods = "CTRL|SHIFT", action = action.ScrollByLine(-1) },
		{ key = "DownArrow", mods = "CTRL|SHIFT", action = action.ScrollByLine(1) },
	}
end

-- return our module table
return M
