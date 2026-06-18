--==== windowrules ======
--
hl.window_rule({
	match = { title = "footFloat" },
	animation = "popin",
	float = true,
	center = true,
	rounding_power = 10,
	size = { 1100, 700 },
	border_color = { colors = { "rgba(3c6e88ae)", "rgba(42414afe)", "rgba(4f457efe)" }, angle = 45 },
})

hl.window_rule({
	match = { class = "xdg-desktop-portal-gtk" },
	animation = "popin",
	center = true,
	size = { 1000, 800 },
	border_color = { colors = { "rgba(ac6e88ae)", "rgba(42f14afe)", "rgba(4f457efe)" }, angle = 45 },
})

hl.window_rule({
	match = { class = "zen-beta" },
	workspace = 2,
	animation = "popin",
	no_blur = true,
	opaque = true,
	allows_input = true, -- force window to allow input
	-- confine_pointer = true,      -- lock mouse
})

hl.window_rule({
	match = { class = "zen-twilight" },
	workspace = 3,
	border_size = 0,
	animation = "slide",
	no_blur = true,
	opaque = true,
	allows_input = true, -- force window to allow input
	-- confine_pointer = true,      -- lock mouse
})

hl.window_rule({
	match = { class = "dev.zed.Zed", title = "Zed — Settings" },
	float = true,
	center = true,
	border_size = 3,
	border_color = { colors = { "rgba(33ccffee)", "rgba(0daf99ee)", "rgba(0daab455)" }, angle = 45 },
})

hl.window_rule({
	match = { class = "zen", title = "Extension: (Bitwarden Password Manager) - Bitwarden — Zen Browser" },
	float = true,
	center = false,
})

hl.window_rule({
	match = { class = "vesktop" },
	workspace = 5,
	border_size = 3,
	no_screen_share = true,
	border_color = { colors = { "rgba(33ccffee)", "rgba(0daf99ee)", "rgba(0daab455)" }, angle = 45 },
})

hl.window_rule({ match = { class = "com.obsproject.Studio" }, workspace = 8 })

hl.window_rule({
	match = { class = "com.gabm.satty" },
	size = { 1300, 900 },
	animation = "slide",
	float = true,
	center = true,
	no_blur = true,
	no_shadow = true,
})

hl.window_rule({
	match = { class = "imv" },
	float = true,
	center = false,
})

hl.window_rule({
	match = { class = "mpv" },
	max_size = { 1920, 900 },
	float = true,
	center = false,
	no_blur = true,
	no_shadow = true,
})

-- layer rules
hl.layer_rule({
	name = "noctalia",
	match = {
		namespace = "^noctalia-(bar-.+|notification|dock|panel|attached-panel|osd)$",
	},
	ignore_alpha = 0.5,
	animation = "popin 45",
	blur = true,
	blur_popups = true,
	dim_around = false,
})
