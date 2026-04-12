{ lib, host, ... }:
{
  wayland.windowManager.hyprland.settings.exec-once = [
    "dbus-update-activation-environment --all --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP"
    "systemctl --user import-environment WAYLAND_DISPLAY XDG_CURRENT_DESKTOP"
    "nm-applet &"

    "wl-clip-persist --clipboard both &"
    "wl-paste --watch cliphist store &"
		"awww-daemon"
		"awww img /home/rafid/customs/assets/b-459.jpg"
    "hyprctl setcursor Bibata-Modern-Ice 20 &"
		"hyprlock"
		"hypridle"
		"hyprcursor"
		"vicinae server"
		"qs -c overview"
		"qs -c shell"

		"hyprctl reload"

    "[workspace 2 silent] zen-twilight"
  ];
}
