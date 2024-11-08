local wezterm = require("wezterm")
local keymap = require("keymap")

local config = wezterm.config_builder()

config.default_prog = { "zellij", "-l", "welcome" }

config.max_fps = 120

config.audible_bell = "Disabled"

config.window_padding = {
	top = 10,
	left = 10,
	bottom = 10,
	right = 10,
}
config.window_background_opacity = 0.8
config.macos_window_background_blur = 20

config.color_scheme = "Catppuccin Macchiato"
config.font = wezterm.font("JetBrains Mono")
config.font_size = 13.0
config.enable_tab_bar = false

keymap.apply_to_config(config)

return config
