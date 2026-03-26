{ lib, host, ... }:
{
  wayland.windowManager.hyprland.settings.exec-once = [
    "dbus-update-activation-environment --all --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP"
    "systemctl --user import-environment WAYLAND_DISPLAY XDG_CURRENT_DESKTOP"
    "nm-applet &"

    "wl-clip-persist --clipboard both &"
    "wl-paste --watch cliphist store &"
    "hyprctl setcursor Bibata-Modern-Ice 20 &"
    "init-wallpaper &"

		"dms run"
		"hyprlock"
		"hypridle"
		"hyprpaper"
		"hyprcursor"
		"vicinae server"

    "[workspace 2 silent] zen-twilight"
  ];
}
