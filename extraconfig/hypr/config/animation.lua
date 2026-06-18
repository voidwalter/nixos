-- shortcut function for animation
local function spring_anim(status, speeed, leaf, spring_name, style)
	hl.animation({
		enabled = status,
		leaf = leaf,
		speed = speeed,
		spring = spring_name,
		style = style,
	})
end

local function bezier_anim(status, speeed, leaf, bezier_name, style)
	hl.animation({
		enabled = status,
		speed = speeed,
		leaf = leaf,
		bezier = bezier_name,
		style = style,
	})
end

-- bezier
hl.curve("ease", { type = "bezier", points = { { 0, 0.55 }, { 0.45, 1 } } })
hl.curve("easeInSine", { type = "bezier", points = { { 0.12, 0 }, { 0.39, 0 } } })
hl.curve("easeOutSine", { type = "bezier", points = { { 0.61, 1 }, { 0.88, 1 } } })
hl.curve("easeOutQuint", { type = "bezier", points = { { 0.23, 1 }, { 0.32, 1 } } })
hl.curve("easeInOutCubic", { type = "bezier", points = { { 0.65, 0.05 }, { 0.36, 1 } } })
hl.curve("easeInOutBack", { type = "bezier", points = { { 0.68, -0.6 }, { 0.32, 1.6 } } })
hl.curve("easeInOutBounce", { type = "bezier", points = { { 0.65, 0.05 }, { 0.36, 1 } } })
hl.curve("easeOutCirc", { type = "bezier", points = { { 0, 0.55 }, { 0.45, 1 } } })
hl.curve("easeInOutElastic", { type = "bezier", points = { { 0.5, 1.8 }, { 0.3, 0.8 } } })

hl.curve("overshoot", { type = "bezier", points = { { 0.5, 0.9 }, { 0.1, 1.1 } } })
hl.curve("linear", { type = "bezier", points = { { 0, 0 }, { 1, 1 } } })
hl.curve("almostLinear", { type = "bezier", points = { { 0.5, 0.5 }, { 0.75, 1 } } })
hl.curve("quick", { type = "bezier", points = { { 0.15, 0 }, { 0.1, 1 } } })
hl.curve("jumpDummy", { type = "bezier", points = { { 0.15, 0.05 }, { 0.36, 1 } } })

-- springs; ref: The more “stiffness”, the more speed, and the more “dampening”, the less bounce :>
hl.curve("easy", { type = "spring", mass = 1, stiffness = 71.2633, dampening = 15.8273644 })
hl.curve("hardy", { type = "spring", mass = 2, stiffness = 76.431, dampening = 13 })
hl.curve("dannit", { type = "spring", mass = 1, stiffness = 71.2633, dampening = 10.45646 })
hl.curve("rubber", { type = "spring", mass = 3, stiffness = 100, dampening = 10 })
hl.curve("lazy", { type = "spring", mass = 1, stiffness = 40, dampening = 20 })

-- =================================
bezier_anim(true, 10, "global", "default")
bezier_anim(true, 10, "fade", "easeOutCirc")
bezier_anim(true, 1.73, "fadeIn", "almostLinear")
bezier_anim(true, 1.73, "fadeOut", "almostLinear")
bezier_anim(true, 1.73, "layers", "easeOutCirc")
bezier_anim(true, 1.73, "layersIn", "easeOutCirc", "fade")
bezier_anim(true, 1.73, "layersOut", "linear", "fade")
bezier_anim(true, 1.73, "fadeLayersIn", "almostLinear")
bezier_anim(true, 1.73, "fadeLayersOut", "almostLinear")

spring_anim(true, 1.73, "windows", "easy")
spring_anim(true, 1.73, "windowsIn", "easy", "popin")
bezier_anim(true, 1.73, "windowsOut", "easeOutCirc", "gnomed")
bezier_anim(true, 1.73, "workspaces", "easeInOutCubic", "slide")
bezier_anim(true, 1.73, "workspacesIn", "jumpDummy", "slidefadevert")
bezier_anim(true, 1.73, "workspacesOut", "easeInOutBack", "slidefade")
bezier_anim(true, 1.73, "specialWorkspace", "ease", "slide")
bezier_anim(true, 1.73, "specialWorkspaceIn", "easeInOutElastic", "slidefade")
bezier_anim(true, 1.73, "specialWorkspaceOut", "easeOutSine", "slidefadevert")
bezier_anim(true, 1.73, "zoomFactor", "quick")
