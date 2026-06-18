----  MISC  ----
hl.config({
	misc = {
		enable_swallow = true,
		disable_autoreload = false,
		force_default_wallpaper = -1, -- Set to 0 or 1 to disable the anime mascot wallpapers
		disable_hyprland_logo = false, -- If true disables the random hyprland logo / anime girl background. :(
		splash_font_family = "CodeNewRoman Nerd Font",
		animate_manual_resizes = true,
		animate_mouse_windowdragging = true,
	},
})

---- INPUT ----
hl.config({
	input = {
		kb_layout = "us,bd",
		kb_variant = ",probhat",
		kb_model = "",
		kb_options = "caps:swapescape",
		kb_rules = "",
		numlock_by_default = false,
		follow_mouse = 1,
		-- follow_mouse_shrink = 100,
		sensitivity = 0, -- -1.0 - 1.0, 0 means no modification.
	},
})

hl.config({
	binds = {
		pass_mouse_when_bound = false,
		workspace_back_and_forth = false,
	},
})

hl.config({
	cursor = {
		invisible = false,
		enable_hyprcursor = true,
		hide_on_key_press = true,
		warp_on_change_workspace = 1,
		warp_on_toggle_special = 1,
	},
})

hl.config({
	xwayland = {
		enabled = true,
		force_zero_scaling = false,
	},
})

hl.config({
	debug = {
		overlay = false,
		error_limit = 3,
		error_position = 1,
	},
})

---- MONITORS ----
hl.monitor({
	output = "HDMI-A-1",
	mode = "1920x1080@100",
	position = "0x0",
	scale = 1,
})

---- AUTOSTART ----
hl.on("hyprland.start", function()
	hl.exec_cmd("hyprctl setcursor Bibata-Modern-Ice 20")
	hl.exec_cmd("qs -c overview")
	hl.exec_cmd("nm-applet")
end)
