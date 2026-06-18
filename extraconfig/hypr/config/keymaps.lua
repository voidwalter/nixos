---- Global/LOCAL VARIABLES ----

local mod = "SUPER + "

local ipc = "noctalia msg "

local appLauncher = "noctalia msg panel-toggle launcher"
local runPrefix = "uwsm app -- "
local terminal = "foot"
local fileManager = "foot -e superfile"
local webBrowser = "zen-beta"
local secWebBrowser = "zen-twilight --profile ~/.config/twilight"

local bind = hl.bind

local function keybind(key, exec_cmd, description)
	bind(mod .. key, hl.dsp.exec_cmd(runPrefix .. exec_cmd), { desc = description })
end

local function keybind_m(key, exec_cmd, description)
	bind(key, hl.dsp.exec_cmd(exec_cmd), { desc = description })
end

-- 1. APPLICATION LAUNCHERS
local floaterm = terminal .. " -- title footFloat"
keybind("Return", floaterm, " Float Terminal")
keybind("A", appLauncher, "Open Application Launcher")
keybind("T", terminal, "Launch Terminal")
keybind("F", fileManager, "Open File Manager")
keybind("W", webBrowser, "Open Web Browser")
keybind("B", secWebBrowser, "Open Web Browser")

keybind("CTRL + B", "foot --title footFloat -e btop", "System Monitor")
keybind("CTRL + C", "foot -e cmatrix", "cmatrix")

-- 2. SHELL & SYSTEM
local cc = "panel-toggle control-center "

local function bind_ipc(key, exec_cmd, description)
	bind(key, hl.dsp.exec_cmd(ipc .. exec_cmd), { desc = description })
end

bind_ipc("F1", cc .. " media", "Media Playback")
bind_ipc("CTRL + F3", cc .. "audio", "Volume Panel")
bind_ipc("CTRL + F7", cc .. "network", "Network Panel")
bind_ipc("CTRL + F9", "wallpaper-random", "Pick Wallpaper")
bind_ipc("SHIFT + F9", "nightlight-toggle", "Night Light")
bind_ipc("ALT + F9", "theme-mode-toggle", "Toggle Theme Mode")
bind_ipc("F10", cc .. "system", "System Monitor")
bind_ipc("CTRL + F10", "panel-toggle clipboard", "Clipboard")
bind_ipc("F12", "bar-toggle", "Status Bar")
bind_ipc("CTRL + F12", cc, "Toggle Control Center")
bind_ipc("SHIFT+F12", "dock-toggle", "Dock Toggle")
bind_ipc("ALT + F12", "settings-toggle", "Settings")
bind_ipc(mod .. "F12", "panel-toggle session", "Session Menu")

bind_ipc("CTRL + XF86AudioRaiseVolume", " dpms-on", "Turn Monitors On")
bind_ipc("CTRL + XF86AudioLowerVolume", " dpms-off", "Turn Monitors Off")
bind_ipc("ALT + XF86AudioRaiseVolume", " brightness-up", "Inc Brightness")
bind_ipc("ALT + XF86AudioLowerVolume", " brightness-down", "Dec Brightness")

bind(mod .. "Z", hl.dsp.exec_cmd("qs -c overview ipc call overview toggle"), { desc = "Overview" })

-- 3. Media
-- HARDWARE KEYS
local function hard_keys(key, exec_cmd, description)
	hl.bind(key, hl.dsp.exec_cmd(ipc .. exec_cmd), { desc = description }, { locked = true })
end
hard_keys("XF86AudioRaiseVolume", "volume-up", "Volume increase")
hard_keys("XF86AudioLowerVolume", "volume-down", "Volume decrease")
hard_keys("XF86AudioMute", " volume-mute", "Volume mute")
hard_keys("XF86AudioPrev", "media previous", "Media previous")
hard_keys("XF86AudioNext", "media next", "Media next")
hard_keys("XF86AudioPlay", "media playPause", "Media pause/play")
hard_keys("XF86AudioPause", "media pause", "Media pause")
-- hard_keys("XF86HomePage", "", "Show Desktop",)
hard_keys("XF86Mail", "notification", "Notifications")
hard_keys("XF86Favorites", "zen-beta https://app.raindrop.io/", "Bookmarks")

-- 4. WINDOW
bind(mod .. " + Q", hl.dsp.window.close(), { desc = "Close Active Window" })
bind(mod .. " + CTRL + F", hl.dsp.window.fullscreen({ action = "toggle" }), { desc = "Fullscreen Window" })
bind(mod .. " + CTRL + SPACE", hl.dsp.window.float({ action = "toggle" }), { desc = "Floating Mode" })
bind(mod .. " + P", hl.dsp.window.pseudo(), { desc = "Toggle Pseudotile Mode" })

bind(mod .. " + mouse:272", hl.dsp.window.resize(), { mouse = true }, { desc = "Resize window" })
bind(mod .. " + mouse:273", hl.dsp.window.drag(), { mouse = true }, { desc = "Drag window" })
bind(mod .. " + mouse:274", hl.dsp.window.kill(), { mouse = true }, { desc = "Kill window" })

bind("ALT + Tab", function() -- switch window
	hl.dispatch(hl.dsp.window.cycle_next()) -- Change focus to another window
	hl.dispatch(hl.dsp.window.bring_to_top()) -- Bring it to the top
end, { desc = "Bring next window on top" })
-- bind("F10", hl.dsp.exec_cmd(ipc .. " window-switcher"), { desc = "Toggle System Monitor" })

bind(mod .. " + period", hl.dsp.layout("move +col"))
bind(mod .. " + comma", hl.dsp.layout("move -col"))
bind(mod .. " + ALT + period", hl.dsp.layout("swapcol r"))
bind(mod .. " + ALT + comma", hl.dsp.layout("swapcol l"))
bind(mod .. " + SHIFT + period", hl.dsp.layout("colresize +conf"))
bind(mod .. " + SHIFT + comma", hl.dsp.layout("colresize -conf"))

-- FOCUS DIRECTIONAL KEYS
bind(mod .. " + H", hl.dsp.focus({ direction = "left" }), { desc = "Focus Window Left" })
bind(mod .. " + J", hl.dsp.focus({ direction = "down" }), { desc = "Focus Window Down" })
bind(mod .. " + K", hl.dsp.focus({ direction = "up" }), { desc = "Focus Window Up" })
bind(mod .. " + L", hl.dsp.focus({ direction = "right" }), { desc = "Focus Window Right" })

bind(mod .. " + R", hl.dsp.submap("resize")) -- resize windows
hl.define_submap("resize", function()
	bind("L", hl.dsp.window.resize({ x = 10, y = 0, relative = true }), { repeating = true })
	bind("H", hl.dsp.window.resize({ x = -10, y = 0, relative = true }), { repeating = true })
	bind("K", hl.dsp.window.resize({ x = 0, y = 10, relative = true }), { repeating = true })
	bind("J", hl.dsp.window.resize({ x = 10, y = -10, relative = true }), { repeating = true })
	bind("escape", hl.dsp.submap("reset"))
end)

bind(mod .. " + S", hl.dsp.submap("swap")) -- swap windows
hl.define_submap("swap", function()
	bind("L", hl.dsp.window.swap({ direction = "right", relative = true }), { repeating = true })
	bind("H", hl.dsp.window.swap({ direction = "left", relative = true }), { repeating = true })
	bind("K", hl.dsp.window.swap({ direction = "up", relative = true }), { repeating = true })
	bind("J", hl.dsp.window.swap({ direction = "down", relative = true }), { repeating = true })
	bind("escape", hl.dsp.submap("reset"))
end)

-- 5. WORKSPACEs
bind(mod .. " + mouse_up", hl.dsp.focus({ workspace = "e+1" }), { desc = "Next workspace" })
bind(mod .. " + mouse_down", hl.dsp.focus({ workspace = "e-1" }), { desc = "Previous workspace" })
-- bind(mod .. " + ]", hl.dsp.focus({ workspace = "e+1" }), { desc = "Next workspace" })
-- bind(mod .. " + ]", hl.dsp.focus({ workspace = "e-1" }), { desc = "Previous workspace" })
bind(mod .. " + TAB", hl.dsp.focus({ workspace = "e+1" }), { desc = "Next workspace" })
bind(mod .. " + SHIFT + TAB", hl.dsp.focus({ workspace = "e-1" }), { desc = "Previous workspace" })
bind(mod .. " + SPACE", hl.dsp.focus({ workspace = "empty" }), { desc = "empty workspace" })

-- Special workspaces
bind(mod .. " + E", hl.dsp.workspace.toggle_special("temp"), { desc = "Temporary workspace" })
bind(mod .. " + O", hl.dsp.workspace.toggle_special("shellAcess"), { desc = "Special workspace" })
bind(mod .. " + SHIFT + E", hl.dsp.window.move({ workspace = "special:temp" }))
bind(mod .. " + SHIFT + O", hl.dsp.window.move({ workspace = "special:shellAcess" }))

bind(mod .. " + C", hl.dsp.submap("switchWorkspaces"))
hl.define_submap("switchWorkspaces", function()
	bind("escape", hl.dsp.submap("reset"))
	for i = 1, 10 do
		local key = i % 10 -- 10 maps to key 0
		bind(key, hl.dsp.focus({ workspace = i }), { desc = "Switch to workspace" .. i })
	end
end)

for i = 1, 10 do
	local key = i % 10 -- 10 maps to key 0
	bind(mod .. " + " .. key, hl.dsp.focus({ workspace = i }), { desc = "Switch to workspace " .. i })
	bind(
		mod .. " + SHIFT + " .. key,
		hl.dsp.window.move({ workspace = i }),
		{ desc = "Move window to workspace " .. i }
	)
end

-- 6. Misc
-- screenshot
bind_ipc("ALT + F7", " screenshot-region", "Screenshot (region)")
keybind_m("Print", "grim - | wl-copy", "Screenshot (clipboard)")
keybind("Print", 'grim -g "$(slurp)" - | satty -f - -o ~/Pictures/screenshot/img_%H%M.png', "Take shot and edit")
keybind_m("CTRL + Print", "grim ~/Pictures/shots/img_$(date '+%Y%m%d_%H%M%S').png", "Save screenshot in shots/")
keybind_m(
	"SHIFT + Print",
	"grim -g \"$(slurp)\" ~/Pictures/shots/area_$(date '+%m%d_%H%M%S').png",
	"Screenshot (region)"
)
