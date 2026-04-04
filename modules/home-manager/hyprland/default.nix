{ pkgs, inputs, ... }:
{
  imports = [
		./shell.nix
		./hyprlock.nix
		./hypridle.nix
		./exec-once.nix
		./settings.nix
		./keybinds.nix
		./monitor.nix
		./variables.nix
		./windowrule.nix
	];

	home.packages = with pkgs; [
    swww
		waypaper
    grimblast
    grim
    slurp
		satty
		chafa
    wl-clip-persist
    cliphist
		swaynotificationcenter
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
