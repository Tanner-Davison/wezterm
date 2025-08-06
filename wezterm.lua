local wezterm = require("wezterm")
local config = {}

-- Terminal settings
config.term = "xterm-256color"
config.set_environment_variables = {
	LANG = "en_US.UTF-8",
}

-- Color scheme
config.color_scheme = "Seti (Gogh)"

-- Font with ligatures
config.font = wezterm.font_with_fallback({
	{
		family = "JetBrains Mono",
		harfbuzz_features = { "calt=1", "clig=1", "liga=1" },
	},
	{ family = "Fira Code", weight = "Medium" },
	"Noto Color Emoji",
})
config.font_size = 13

-- Visual effects
config.window_background_opacity = 0.9
config.background = {
	{
		source = { Color = "#060F1E" },
		width = "100%",
		height = "100%",
		opacity = 0.95,
	},
}

-- Window settings
config.window_decorations = "RESIZE"
config.initial_cols = 155 -- Very wide
config.initial_rows = 56 -- Very tall
config.window_frame = {
	font_size = 10,
}

-- Position window at top-left corner
wezterm.on("gui-startup", function(cmd)
	local tab, pane, window = wezterm.mux.spawn_window(cmd or {})
	local gui_window = window:gui_window()
	gui_window:set_position(0, 0) -- x=0, y=0 (top-left corner)
end)

-- Default shell
config.default_prog = { "pwsh.exe" }

-- Tab bar styling
config.use_fancy_tab_bar = true

-- Cursor settings - allow Neovim to control cursor shape
config.enable_csi_u_key_encoding = false
config.default_cursor_style = "SteadyBlock"
config.cursor_blink_rate = 0

-- Performance settings
config.scrollback_lines = 10000
config.enable_scroll_bar = false
config.front_end = "OpenGL"
config.animation_fps = 60
config.max_fps = 60

-- Cursor settings - allow Neovim to control cursor shape
config.enable_csi_u_key_encoding = false
config.default_cursor_style = "SteadyBlock"
config.cursor_blink_rate = 800 -- Add back the blinking
config.cursor_thickness = 2 -- Add back thickness
config.animation_fps = 60 -- Add back animation
config.max_fps = 60
-- Color customizations
config.colors = {
	-- Cursor colors commented out to let Neovim control cursor
	cursor_bg = "#c0caf5",
	cursor_fg = "#000000",
	cursor_border = "#ffffff",
	selection_bg = "#44475a",
	selection_fg = "#f8f8f2",
}

-- Tab styling
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

-- Key bindings
config.keys = {
	-- Split panes
	{ key = "v", mods = "CTRL|SHIFT", action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }) },
	{ key = "h", mods = "CTRL|SHIFT", action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }) },

	-- Navigate panes with Alt+arrow
	{ key = "LeftArrow", mods = "ALT", action = wezterm.action.ActivatePaneDirection("Left") },
	{ key = "RightArrow", mods = "ALT", action = wezterm.action.ActivatePaneDirection("Right") },
	{ key = "UpArrow", mods = "ALT", action = wezterm.action.ActivatePaneDirection("Up") },
	{ key = "DownArrow", mods = "ALT", action = wezterm.action.ActivatePaneDirection("Down") },

	-- Resize panes
	{ key = "LeftArrow", mods = "CTRL|SHIFT", action = wezterm.action.AdjustPaneSize({ "Left", 5 }) },
	{ key = "RightArrow", mods = "CTRL|SHIFT", action = wezterm.action.AdjustPaneSize({ "Right", 5 }) },
	{ key = "UpArrow", mods = "CTRL|SHIFT", action = wezterm.action.AdjustPaneSize({ "Up", 5 }) },
	{ key = "DownArrow", mods = "CTRL|SHIFT", action = wezterm.action.AdjustPaneSize({ "Down", 5 }) },

	-- Utilities
	{ key = "p", mods = "CTRL|SHIFT", action = wezterm.action.ActivateCommandPalette },
	{ key = "[", mods = "CTRL|SHIFT", action = wezterm.action.ActivateCopyMode },
	{ key = "v", mods = "CTRL", action = wezterm.action.PasteFrom("Clipboard") },
}

-- Mouse bindings
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

-- Workspace and utility settings
config.default_workspace = "main"
config.hide_mouse_cursor_when_typing = true

-- Smart search patterns
config.quick_select_patterns = {
	"https?://\\S+", -- URLs
	"[~/]?[\\w\\d\\.\\-_/]+\\.[a-zA-Z]+", -- File paths
	"[a-f0-9]{6,40}", -- Git hashes
}

return config
