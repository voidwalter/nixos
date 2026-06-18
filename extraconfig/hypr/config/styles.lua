-----------------------
---- LOOK AND FEEL ----
-----------------------

hl.config({
	animations = { enabled = true },
	general = {
		gaps_in = 3,
		gaps_out = 7,
		border_size = 2,
		resize_corner = 0,
		resize_on_border = false, -- true to enable resizing windows by clicking and dragging on borders and gaps
		allow_tearing = false,
		layout = "master", -- scrolling, dwindle, master
		col = {
			-- active_border = { colors = { "rgba(ffffffff)", "rgba(000f99ee)" }, angle = 45 },
			active_border = { colors = { "rgba(ffffffcc)" } },
			inactive_border = "rgba(59595955)",
		},
		snap = {
			enabled = true,
			border_overlap = true,
		},
	},

	decoration = {
		rounding = 8,
		rounding_power = 2,
		active_opacity = 1.0,
		inactive_opacity = 0.8,

		shadow = {
			enabled = false,
			range = 4,
			render_power = 2,
			color = "rgba(12967564)",
		},

		blur = {
			enabled = true,
			size = 9,
			passes = 1,
			vibrancy = 0.1696,
		},

		glow = {
			enabled = false,
			range = 4,
			color = "0xee145656",
			-- color_inactive = "0x00564676",
			render_power = 1,
		},
	},
})

-- =================================

-- ============
-- Layout ----
---------------

hl.config({
	-- scrolling layout
	scrolling = {
		column_width = 0.567,
		direction = "right",
		fullscreen_on_one_column = true,
		focus_fit_method = 1, -- 0 = center, 1 = fit on focus
		follow_focus = true, -- Auto-scroll to keep focused window visible
		follow_min_visible = 0.4, -- Minimum fraction visible to follow focus
		explicit_column_widths = "0.333, 0.5, 0.667, 1.0", -- Presets for resizing
		wrap_focus = true,
		wrap_swapcol = true,
	},

	-- master layout
	master = {
		new_status = "master", -- New windows become master
		new_on_top = true, -- Place new windows at top
		special_scale_factor = 0.5, -- Size of special workspace windows
	},

	-- dwindle layout
	dwindle = {
		preserve_split = true, -- Maintain split structure
		force_split = nil, -- Auto-split: "v"=vertical, "h"=horizontal
	},
})
