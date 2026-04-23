{ config, pkgs, modulesPath, inputs, ... }:

let
  system = pkgs.stdenv.hostPlatform.system;
in
{
	home = {
		username = "rafid";
  	homeDirectory = "/home/rafid";
  	stateVersion = "25.05";
		pointerCursor = {
			hyprcursor.enable = true;
			hyprcursor.size = 20;
			name = "Bibata-Modern-Ice";
			package = pkgs.bibata-cursors;
		};
		
		packages = with pkgs; [
			blesh
			dmenu
			cliamp
			logseq
			element
			vicinae
			aseprite
			superfile
			tesseract
			zed-editor
			libreoffice
			nwg-displays
			element-desktop
			bitwarden-desktop
    	inputs.zen-browser.packages.${pkgs.system}.twilight
		];

		sessionVariables = {
			TERM = "alacritty";
			BAR = "qs -c shell";
			EDITOR = "nvim";
			BROWSER = "zen-twilight";
			NIXOS_OZONE_WL = 1;
			__GL_GSYNC_ALLOWED = 0;
			__GL_VRR_ALLOWED = 0;
			SSH_AUTH_SOCK = "/run/user/1000/ssh-agent";
			GDK_BACKEND = "wayland";
			DIRENV_LOG_FORMAT = "";
			WLR_DRM_NO_ATOMIC = 1;
			QT_AUTO_SCREEN_SCALE_FACTOR = 1;
			QT_WAYLAND_DISABLE_WINDOWDECORATION = 1;
			QT_QPA_PLATFORM = "wayland";
			QT_QPA_PLATFORMTHEME = "qt5ct";
			QT_STYLE_OVERRIDE = "kvantum";
			MOZ_ENABLE_WAYLAND = 1;
			WLR_BACKEND = "vulkan";
			WLR_RENDERER = "vulkan";
			WLR_NO_HARDWARE_CURSORS = 1;
			XDG_CURRENT_DESKTOP = "Hyprland";
			XDG_SESSION_TYPE = "wayland";
			XDG_SESSION_DESKTOP = "Hyprland";
			SDL_VIDEODRIVER = "wayland";
			CLUTTER_BACKEND = "wayland";
  	};
	};

	imports = [
		./xdg
		./neovim
		./hyprland
		./programs
		./commandline
  ];
}
