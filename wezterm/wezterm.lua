local wezterm = require("wezterm")

local config = wezterm.config_builder()

return {
	font = wezterm.font("IosevkaTerm Nerd Font", { weight = "Medium", stretch = "Normal", style = "Normal" }),

	font_size = 20.0,

	colors = {
		indexed = { [16] = "#F8BD96", [17] = "#F5E0DC" },
		split = "#161320",
	},

	window_padding = {
		left =0,
		right =0,
		top =0,
		bottom =0,
	},

	color_scheme = "Afterglow",
	window_decorations = "RESIZE",
  use_fancy_tab_bar = false,
  tab_bar_at_bottom = true,

	scrollback_lines = 5000,
  enable_scrollbar = false,
	front_end = "WebGpu",
	max_fps = 200,
}

