-- useless submap to use cursor with keyboard

local bind = hl.bind
bind(mod .. " + I", hl.dsp.submap("useCursor"))
hl.define_submap("useCursor", function()
	bind("escape", hl.dsp.submap("reset"))
	local h = 960
	local v = 540
	bind("A", function()
		hl.dispatch(hl.dsp.cursor.move({ x = h - 10, y = v }))
		h = h - 20
	end, { repeating = true })
	bind("D", function()
		hl.dispatch(hl.dsp.cursor.move({ x = h + 10, y = v }))
		h = h + 20
	end, { repeating = true })
	bind("W", function()
		hl.dispatch(hl.dsp.cursor.move({ x = h, y = v + 10 }))
		v = v - 20
	end, { repeating = true })
	bind("S", function()
		hl.dispatch(hl.dsp.cursor.move({ x = h, y = v - 10 }))
		v = v + 20
	end, { repeating = true })

	bind("J", function() -- simulate left mouse button press and release
		hl.dispatch(hl.dsp.send_key_state({ mods = "", key = "mouse:272", state = "down", window = "active" }))
		hl.dispatch(hl.dsp.send_key_state({ mods = "", key = "mouse:272", state = "up", window = "active" }))
	end)

	bind("K", function() -- simulate right mouse button press and release
		hl.dispatch(hl.dsp.send_key_state({ mods = "", key = "mouse:273", state = "down", window = "active" }))
		hl.dispatch(hl.dsp.send_key_state({ mods = "", key = "mouse:273", state = "up", window = "active" }))
	end)
end)
