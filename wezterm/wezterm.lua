-- Pull in the wezterm API

require(".config/wezterm/wezterm.lua")
local wezterm = require("wezterm")

-- This will hold the configuration.

local config = wezterm.config_builder()

-- This is where you actually apply your config choices

-- For example, changing the color scheme:

config.color_scheme = "Solarized (light) (terminal.sexy)"
config.font = wezterm.font("JetBrains Mono")
config.font_size = 16

config.tab_bar_at_bottom = true
config.use_fancy_tab_bar = false
config.enable_scroll_bar = false
config.window_padding = {
	left = 0,
	right = 0,
	top = 0,
	bottom = 0,
}

-- and finally, return the configuration to wezterm
return config
