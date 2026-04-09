{ lib, host, ... }:
{
  wayland.windowManager.hyprland.settings.exec-once = [
    "dbus-update-activation-environment --all --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP"
    "systemctl --user import-environment WAYLAND_DISPLAY XDG_CURRENT_DESKTOP"
    "nm-applet &"

    "wl-clip-persist --clipboard both &"
    "wl-paste --watch cliphist store &"
		"swww-daemon"
		"swww img /home/rafid/customs/assets/nixos3.png"
    "hyprctl setcursor Bibata-Modern-Ice 20 &"
		"hyprlock"
		"hypridle"
		"hyprcursor"
		"vicinae server"
		"qs -c overview"

		"hyprctl reload"

    "[workspace 2 silent] zen-twilight"
  ];
}
