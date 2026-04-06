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
    grimblast
    grim
    slurp
		satty
		chafa
		sqlite
    wl-clip-persist
    cliphist
		swaynotificationcenter
    wf-recorder
    glib
		ffmpeg
		matugen
    wayland
    hyprpicker
		hyprlock
		hypridle
		hyprsysteminfo
		brightnessctl
		nerd-fonts.symbols-only
		qt6.qtmultimedia
		qt5.qtbase qt5.qtsvg 
		qt5.qtimageformats qt5.qtmultimedia 
		libsForQt5.qt5ct
    qt6Packages.qt6ct
		inputs.awww.packages.${pkgs.stdenv.hostPlatform.system}.awww
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
