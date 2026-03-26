{ pkgs, inputs, ... }:
{
  home.packages = with pkgs; [
    swww
    grimblast
    grim
    slurp
		satty
    wl-clip-persist
    cliphist
    wf-recorder
    glib
    wayland
    hyprpicker
		hyprlock
		hypridle
		hyprpaper
		hyprsysteminfo
  ];

  systemd.user.targets.hyprland-session.Unit.Wants = [
    "xdg-desktop-autostart.target"
  ];
  wayland.windowManager.hyprland = {
    enable = true;
    package = null;
    portalPackage = null;

		plugins = [
			# inputs.hyprland-easymotion.packages.${pkgs.stdenv.hostPlatform.system}.hyprland-easymotion
  	];

    xwayland = {
      enable = true;
      # hidpi = true;
    };
    systemd.enable = true;
  };
}
