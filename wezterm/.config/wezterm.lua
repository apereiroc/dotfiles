-- pull in the wezterm API
local wezterm = require("wezterm")

-- local is_windows <const> = wezterm.target_triple:find("windows") ~= nil
local is_windows = wezterm.target_triple:find("windows") ~= nil

-- start configuration
local config = wezterm.config_builder()

-- conditionally set initial program
config.default_prog = is_windows and { "wsl.exe" } or nil

-- theme
-- config.color_scheme = "Kanagawa (Gogh)"
config.color_scheme = "Kasugano (terminal.sexy)"

-- font
config.font = wezterm.font("FiraCode Nerd Font", {
	weight = "Regular",
	-- weight = "Bold",
	stretch = "Normal",
	-- style = "Normal",
	-- italic = true,
})
config.font_size = 16.0
config.line_height = 1.15
-- if warned, a fallback is needed
config.warn_about_missing_glyphs = true

-- window
config.initial_cols = 80
config.initial_rows = 40
config.window_padding = {
	left = 8,
	right = 8,
	top = 8,
	bottom = 8,
}
config.window_frame = {
	active_titlebar_bg = "#303030",
	inactive_titlebar_bg = "#303030",
}
config.window_decorations = "TITLE | RESIZE"
-- config.window_decorations = "RESIZE"
-- config.window_decorations = "TITLE"
-- config.window_decorations = "NONE"
config.adjust_window_size_when_changing_font_size = true

config.window_background_opacity = 0.98

-- tab bar
config.enable_tab_bar = true
config.use_fancy_tab_bar = true
config.hide_tab_bar_if_only_one_tab = true -- TODO: on macos this cuts a bit the environment
config.show_tab_index_in_tab_bar = true

config.integrated_title_button_color = "red"
-- config.colors = {
-- 	tab_bar = {
-- 		background = "#222222",
-- 		active_tab = {
-- 			bg_color = "#363636",
-- 			fg_color = "#dcdcdc",
-- 			intensity = "Bold",
-- 		},
-- 		inactive_tab = {
-- 			bg_color = "#222222",
-- 			fg_color = "#aab2bf",
-- 		},
-- 	},
-- }
-- updates
-- config.show_update_window = true
-- config.check_for_updates = true
--
config.window_close_confirmation = "NeverPrompt"

-- scroll cache
config.scrollback_lines = 20000

-- mouse
config.hide_mouse_cursor_when_typing = true

-- keys
-- config.disable_default_key_bindings = true
config.keys = {
	-- conditional ctrl+c
	-- copy only if selection exists, otherwise send ctrl+c
	{
		key = "c",
		mods = "CTRL",
		action = wezterm.action_callback(function(win, pane)
			local has_selection = win:get_selection_text_for_pane(pane) ~= ""
			if has_selection then
				win:perform_action(wezterm.action.CopyTo("Clipboard"), pane)
			else
				-- Pass CTRL+C through to terminal (send SIGINT)
				win:perform_action(wezterm.action.SendKey({ key = "c", mods = "CTRL" }), pane)
			end
		end),
	},
	-- ctrl+v always pastes
	{
		key = "v",
		mods = "CTRL",
		action = wezterm.action.PasteFrom("Clipboard"),
	},
}

return config
--
-- 	-- Tab bar
-- 	tab_max_width = 30,
-- 	colors = {
-- 		tab_bar = {
-- 			background = "#222222",
-- 			active_tab = {
-- 				bg_color = "#363636",
-- 				fg_color = "#dcdcdc",
-- 				intensity = "Bold",
-- 			},
-- 			inactive_tab = {
-- 				bg_color = "#222222",
-- 				fg_color = "#aab2bf",
-- 			},
-- 		},
-- 	},
--
-- 	-- Opacity / Background
-- 	window_background_opacity = 0.98,
-- 	macos_window_background_blur = 20, -- Ignored on Windows
-- 	enable_wayland = false,
-- 	use_ime = true,
--
-- 	-- Appearance
-- 	color_scheme = "Kanagawa",
-- 	enable_scroll_bar = false,
-- 	inactive_pane_hsb = {
-- 		saturation = 1.0,
-- 		brightness = 1.0,
-- 	},
--
-- 	-- Keyboard mappings
-- 	keys = {
-- 		-- Tab switching
-- 		{ key = "1", mods = "CMD", action = wezterm.action.ActivateTab(0) },
-- 		{ key = "2", mods = "CMD", action = wezterm.action.ActivateTab(1) },
-- 		{ key = "3", mods = "CMD", action = wezterm.action.ActivateTab(2) },
-- 		{ key = "4", mods = "CMD", action = wezterm.action.ActivateTab(3) },
-- 		{ key = "5", mods = "CMD", action = wezterm.action.ActivateTab(4) },
-- 		{ key = "6", mods = "CMD", action = wezterm.action.ActivateTab(5) },
-- 		{ key = "7", mods = "CMD", action = wezterm.action.ActivateTab(6) },
-- 		{ key = "8", mods = "CMD", action = wezterm.action.ActivateTab(7) },
-- 		{ key = "9", mods = "CMD", action = wezterm.action.ActivateTab(8) },
-- 		{ key = "0", mods = "CMD", action = wezterm.action.ActivateTab(9) },
--
-- 		-- Splits
-- 		{ key = "d", mods = "CMD", action = wezterm.action.SplitHorizontal({}) },
-- 		{ key = "D", mods = "CMD|SHIFT", action = wezterm.action.SplitVertical({}) },
-- 		{ key = "F7", action = wezterm.action.RotatePanes("Clockwise") },
--
-- 		-- Zoom
-- 		{ key = "F10", action = wezterm.action.TogglePaneZoomState },
--
-- 		-- Word jumps
-- 		{ key = "LeftArrow", mods = "ALT", action = wezterm.action.SendString("\x1bb") },
-- 		{ key = "RightArrow", mods = "ALT", action = wezterm.action.SendString("\x1bf") },
--
-- 		-- Shift+Enter and Ctrl+Enter
-- 		{ key = "Enter", mods = "SHIFT", action = wezterm.action.SendString("\x1b[13;2u") },
-- 		{ key = "Enter", mods = "CTRL", action = wezterm.action.SendString("\x1b[13;5u") },
-- 	},
--
-- 	-- Remote control
-- 	enable_csi_u_key_encoding = true,
-- }
