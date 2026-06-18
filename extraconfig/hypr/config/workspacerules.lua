-- =================
-- == workspace ====
-- =================
hl.workspace_rule({
	workspace = "1",
	layout = "scrolling",
	no_rounding = false,
	decorate = true,
	persistent = true,
	default_name = "main",
})

hl.workspace_rule({
	workspace = "2",
	layout = "scrolling",
	no_rounding = false,
	decorate = true,
	persistent = true,
	on_created_empty = "foot",
	default_name = "internet",
})

hl.workspace_rule({
	workspace = "3",
	layout = "scrolling",
	no_rounding = false,
	decorate = true,
	default_name = "twilight",
})

hl.workspace_rule({
	workspace = "4",
	layout = "dwindle",
	no_rounding = false,
	decorate = true,
	default_name = "xatoro",
})

hl.workspace_rule({
	workspace = "5",
	layout = "master",
	no_rounding = false,
	decorate = true,
	default_name = "nanami",
})

hl.workspace_rule({
	workspace = "6",
	layout = "scrolling",
	no_rounding = false,
	decorate = true,
	default_name = "simpshell",
})
