local wezterm = require("wezterm")

return {
	font = wezterm.font("IosevkaTerm Nerd Font", { weight = "Medium", stretch = "Normal", style = "Normal" }),

	font_size = 20.0,

	colors = {
		indexed = { [16] = "#F8BD96", [17] = "#F5E0DC" },
		split = "#161320",
	},

	window_padding = {
		left = 15,
		right = 15,
		top = 15,
		bottom = 15,
	},

	color_scheme = "Afterglow",
	window_decorations = "RESIZE",
  use_fancy_tab_bar = false,
  tab_bar_at_bottom = true,

	scrollback_lines = 5000,
  enable_scroll_bar = false,
	front_end = "WebGpu",
	max_fps = 200,

  -- Leader is the same as my old tmux prefix
  leader = { key = 'a', mods = 'CTRL', timeout_milliseconds = 1000 },

  keys = {
    {
      mods   = "LEADER",
      key    = "s",
      action = wezterm.action.SplitVertical { domain = 'CurrentPaneDomain' }
    },
    {
      mods   = "LEADER",
      key    = "v",
      action = wezterm.action.SplitHorizontal { domain = 'CurrentPaneDomain' }
    },
    {
      mods   = "LEADER",
      key    = "c",
      action = wezterm.action.CloseCurrentPane { confirm = true }
    },
    {
      mods = 'LEADER',
      key = 'h',
      action = wezterm.action.ActivatePaneDirection 'Left',
    },
    {
      mods = 'LEADER',
      key = 'l',
      action = wezterm.action.ActivatePaneDirection 'Right',
    },
    {
      mods = 'LEADER',
      key = 'k',
      action = wezterm.action.ActivatePaneDirection 'Up',
    },
    {
      mods = 'LEADER',
      key = 'j',
      action = wezterm.action.ActivatePaneDirection 'Down',
    },
  },

}

