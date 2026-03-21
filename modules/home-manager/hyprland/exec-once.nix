{ lib, host, ... }:
{
  wayland.windowManager.hyprland.settings.exec-once = [
    "dbus-update-activation-environment --all --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP"
    "systemctl --user import-environment WAYLAND_DISPLAY XDG_CURRENT_DESKTOP"
    "nm-applet &"
		"bash ../../../../src/scripts/exec.sh"

    "wl-clip-persist --clipboard both &"
    "wl-paste --watch cliphist store &"
    "hyprctl setcursor Bibata-Modern-Ice 20 &"
    "init-wallpaper &"

		"hyprlock"
		"hypridle"
		"hyprpaper"
		"hyprcursor"

    "[workspace 2 silent] zen-twilight"
    "[workspace 3 silent] kitty"
  ];
}
