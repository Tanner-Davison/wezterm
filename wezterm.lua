local wezterm = require("wezterm")
local config = {}

-- Color scheme (tons of built-in options)
config.color_scheme = "Tokyo Night" -- or try 'Dracula', 'Nord', 'Catppuccin'

-- Font (make sure you have it installed)
config.font = wezterm.font("JetBrains Mono", { weight = "Medium" })
config.font_size = 12

-- Background opacity for that cool translucent look
config.window_background_opacity = 0.9

-- Remove title bar for cleaner look
config.window_decorations = "TITLE | RESIZE"

-- Tab bar styling
config.hide_tab_bar_if_only_one_tab = true
config.use_fancy_tab_bar = false

-- Padding around the terminal
config.window_padding = {
	left = 20,
	right = 20,
	top = 20,
	bottom = 20,
}
config.default_prog = { "pwsh.exe" }
return config
