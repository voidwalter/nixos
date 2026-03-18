{ pkgs, ... }:
{
  home.packages = with pkgs; [
    swww
    grimblast
    grim
    slurp
    wl-clip-persist
    cliphist
    wf-recorder
    glib
    wayland
    hyprpicker
		hyprlock
		hypridle
		hyprsysteminfo
  ];

  systemd.user.targets.hyprland-session.Unit.Wants = [
    "xdg-desktop-autostart.target"
  ];
  wayland.windowManager.hyprland = {
    enable = true;
    package = null;
    portalPackage = null;

    xwayland = {
      enable = true;
      # hidpi = true;
    };
    systemd.enable = true;
  };
}
