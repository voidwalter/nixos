hl.plugin.load("/nix/store/kwlzp2w2mk4dic151l1csrgyvkmv045i-Hyprspace-0.1+date=2026-05-28_c109256/lib/libHyprspace.so")

hl.config({
	plugin = {
		hyprspace = {
			panel_height = 220,
			panel_border_width = 2,
			workspace_margin = 10,
			reserved_area = 35,
			workspace_border_size = 1,

			center_aligned = true,
			on_bottom = false,
			draw_active_workspace = true,
			hide_real_layers = false,
			affect_strut = false,

			auto_drag = true,
			auto_scroll = true,
			exit_on_click = true,
			exit_on_switch = false,

			disable_gestures = false,
			swipe_fingers = 3,
			swipe_distance = 300,
			swipe_force_speed = 30,
			swipe_cancel_ratio = 0.5,
			click_release_threshold_ms = 200,
		},
	},
})
