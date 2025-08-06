local wezterm = require("wezterm")
local config = {}
config.term = "wezterm"
config.set_environment_variables = {
	LANG = "en_US.UTF-8",
}
-- Color scheme
-- tokyo night(prefered)
config.color_scheme = "Seti (Gogh)"

-- Font with ligatures
config.font = wezterm.font_with_fallback({
	{
		--DECENT fallback =>
		family = "JetBrains Mono",
		harfbuzz_features = { "calt=1", "clig=1", "liga=1" },
	},
	{ family = "Fira Code", weight = "Medium" },
	"Noto Color Emoji",
})
config.font_size = 13

-- Cool visual effects
config.window_background_opacity = 0.9

-- deepblue = "#060F1E" (favorite)
-- grayish/nice =  "#1a1b26" (second)
config.background = {
	{
		source = { Color = "#060F1E" },
		width = "100%",
		height = "100%",
		opacity = 0.95,
	},
}
config.window_decorations = "RESIZE"
config.initial_cols = 155 -- Very wide
config.initial_rows = 56 --Very tall
-- Position window at top-left corner (0,0 coordinates)
config.window_frame = {
	font_size = 10,
}

-- Set window position to top-left
wezterm.on("gui-startup", function(cmd)
	local tab, pane, window = wezterm.mux.spawn_window(cmd or {})
	local gui_window = window:gui_window()
	gui_window:set_position(0, 0) -- x=0, y=0 (top-left corner)
end)

-- Default to PowerShell
config.default_prog = { "pwsh.exe" }

-- Tab bar styling
config.use_fancy_tab_bar = true

-- Window padding
-- config.window_padding = {
-- 	left = 10,
-- 	right = 10,
-- 	top = 10,
-- 	bottom = 5,
-- }

-- Cool cursor effects
-- config.cursor_blink_rate = 800
-- config.cursor_thickness = 2
-- config.animation_fps = 60
-- config.max_fps = 60
config.default_cursor_style = "SteadyBlock"
config.cursor_blink_rate = 0
-- Scrollback and performance
config.scrollback_lines = 10000
config.enable_scroll_bar = false
config.front_end = "OpenGL"
-- Custom key bindings for better workflow
config.keys = {
	-- Split panes with more intuitive keys
	{ key = "v", mods = "CTRL|SHIFT", action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }) },
	{ key = "h", mods = "CTRL|SHIFT", action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }) },

	-- Move between panes with Alt+arrow
	{ key = "LeftArrow", mods = "ALT", action = wezterm.action.ActivatePaneDirection("Left") },
	{ key = "RightArrow", mods = "ALT", action = wezterm.action.ActivatePaneDirection("Right") },
	{ key = "UpArrow", mods = "ALT", action = wezterm.action.ActivatePaneDirection("Up") },
	{ key = "DownArrow", mods = "ALT", action = wezterm.action.ActivatePaneDirection("Down") },

	-- Resize panes
	{ key = "LeftArrow", mods = "CTRL|SHIFT", action = wezterm.action.AdjustPaneSize({ "Left", 5 }) },
	{ key = "RightArrow", mods = "CTRL|SHIFT", action = wezterm.action.AdjustPaneSize({ "Right", 5 }) },
	{ key = "UpArrow", mods = "CTRL|SHIFT", action = wezterm.action.AdjustPaneSize({ "Up", 5 }) },
	{ key = "DownArrow", mods = "CTRL|SHIFT", action = wezterm.action.AdjustPaneSize({ "Down", 5 }) },

	-- Quick launcher (super useful!)
	{ key = "p", mods = "CTRL|SHIFT", action = wezterm.action.ActivateCommandPalette },

	-- Copy mode (like vim)
	{ key = "[", mods = "CTRL|SHIFT", action = wezterm.action.ActivateCopyMode },
	{ key = "v", mods = "CTRL", action = wezterm.action.PasteFrom("Clipboard") },
}

-- Advanced: Workspaces (like tmux sessions)
config.default_workspace = "main"

-- Cool color customizations
config.colors = {
	-- cursor_bg = "#00ff41", -- Normal mode: Matrix green
	-- cursor_fg = "#000000", -- Black text on bright cursor
	-- cursor_border = "#ffffff",
	-- selection_bg = "#44475a",
	-- selection_fg = "#f8f8f2",
}
-- Fancy tab styling
config.colors.tab_bar = {
	background = "#1a1b26",
	active_tab = {
		bg_color = "#7aa2f7",
		fg_color = "#1a1b26",
		intensity = "Bold",
	},
	inactive_tab = {
		bg_color = "#414868",
		fg_color = "#c0caf5",
	},
	inactive_tab_hover = {
		bg_color = "#565f89",
		fg_color = "#c0caf5",
	},
}

-- Mouse bindings for better workflow
config.mouse_bindings = {
	-- Right click to paste
	{
		event = { Down = { streak = 1, button = "Right" } },
		mods = "NONE",
		action = wezterm.action.PasteFrom("Clipboard"),
	},
	-- Ctrl+click to open URLs
	{
		event = { Up = { streak = 1, button = "Left" } },
		mods = "CTRL",
		action = wezterm.action.OpenLinkAtMouseCursor,
	},
}

-- Auto-hide mouse cursor when typing
config.hide_mouse_cursor_when_typing = true

-- Smart search highlighting
config.quick_select_patterns = {
	-- Match URLs
	"https?://\\S+",
	-- Match file paths
	"[~/]?[\\w\\d\\.\\-_/]+\\.[a-zA-Z]+",
	-- Match git hashes
	"[a-f0-9]{6,40}",
}

config.default_prog = { "pwsh.exe" }
return config
