local wezterm = require("wezterm")
local config = {}

-- Color scheme
config.color_scheme = "Tokyo Night"

-- Font with ligatures
config.font = wezterm.font("Fira Code", { weight = "Medium" })
config.font_size = 12

-- Cool visual effects
config.window_background_opacity = 0.9
config.background = {
	{
		source = { Color = "#1a1b26" },
		width = "100%",
		height = "100%",
		opacity = 0.9,
	},
}
config.window_decorations = "RESIZE"

-- Default to PowerShell
config.default_prog = { "pwsh.exe" }

-- Tab bar styling
config.use_fancy_tab_bar = true

-- Window padding
config.window_padding = {
	left = 10,
	right = 10,
	top = 10,
	bottom = 10,
}

-- Cool cursor effects
config.default_cursor_style = "BlinkingBlock"
config.cursor_blink_rate = 800
config.cursor_thickness = 2

-- Scrollback and performance
config.scrollback_lines = 10000
config.enable_scroll_bar = true

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
}

-- Advanced: Workspaces (like tmux sessions)
config.default_workspace = "main"

-- Cool color customizations
config.colors = {
	cursor_bg = "#bf00ff", -- Neon purple!
	cursor_fg = "#ffffff", -- Keep white text
	selection_bg = "#44475a",
	selection_fg = "#f8f8f2",
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
