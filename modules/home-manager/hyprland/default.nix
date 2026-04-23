{ pkgs, inputs, ... }:
{
  imports = [
		./shell.nix
		./hyprlock.nix
		./hypridle.nix
		./keybinds.nix
		./windowrule.nix
	];

	home.packages = with pkgs; [
    grimblast
    grim
    slurp
		satty
		sqlite
    glib
		matugen
    wayland
    hyprpicker
		hyprlock
		hypridle
		hyprshutdown
		hyprsysteminfo
		nerd-fonts.symbols-only
		qt6.qtmultimedia
		qt6.qtbase
		qt6.qtdeclarative
		qt6.qtsvg
		qt6.qtimageformats
		qt6.qtmultimedia
		qt6.qt5compat
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
    systemd.enable = true;

		plugins = [
			inputs.hy3.packages.${pkgs.stdenv.hostPlatform.system}.default
      # inputs.hyprland-easymotion.packages.${pkgs.stdenv.hostPlatform.system}.default
		];

    xwayland = {
      enable = true;
      # hidpi = true;
    };

		settings = {
			"$mod" = "SUPER";
			"$ipc" = "dms ipc call";

			input = {
				kb_layout = "us,bd";
				kb_variant = ",probhat";
				kb_options = "caps:swapescape";	# Swap: CAPSLOCK <=> ESC
				repeat_delay = 300;
				numlock_by_default = false;

				follow_mouse = 0;
				mouse_refocus = 0;
				float_switch_override_focus = 0;
			};

			general = {
				layout = "dwindle";
				gaps_in = 4;
				gaps_out = 4;
				border_size = 3;
				"col.active_border" = "rgb(373737)";
				"col.inactive_border" = "0x00000000";
			};

			monitor = [ "HDMI-A-1,1920x1080@100.00Hz,0x0,1" ];

			exec-once = [
				"dbus-update-activation-environment --all --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP"
				"systemctl --user import-environment WAYLAND_DISPLAY XDG_CURRENT_DESKTOP"
				"nm-applet &"
				"awww-daemon"
				"awww img /home/rafid/wallpapers/chainsaw.jpg"
				"hyprctl setcursor Bibata-Modern-Ice 20 &"
				"hypridle"
				"hyprcursor"
				"vicinae server"
				"qs -c overview"
				"qs -c shell"
				"hyprctl reload"
			];

			misc = {
				disable_hyprland_logo = true;
				disable_splash_rendering = false;
				focus_on_activate = true;
				middle_click_paste = true;
				disable_autoreload = false;
			};

			dwindle = {
				force_split = 2;
				preserve_split = true;
				use_active_for_splits = true;
			};

			master = {
				new_status = "master";
			};

			decoration = {
				rounding = 10;

				blur = {
					enabled = true;
					size = 3;
					noise = 0;
					passes = 2;
					contrast = 1.4;
					brightness = 1;
					xray = true;
				};

				shadow = {
					enabled = false;
					range = 20;
					render_power = 3;
					offset = "0 2";
					color = "rgba(00000055)";
				};
			};

			animations = {
				enabled = true;
				bezier = [
					"fluent_decel, 0, 0.2, 0.4, 1"
					"easeOutCirc, 0, 0.55, 0.45, 1"
					"easeOutCubic, 0.33, 1, 0.68, 1"
					"fade_curve, 0, 0.55, 0.45, 1"
				];
				animation = [
					# name, enable, speed, curve, style
					# Windows
					"windowsIn,   0, 4, easeOutCubic,  popin 20%" # window open
					"windowsOut,  0, 4, fluent_decel,  popin 80%" # window close.
					"windowsMove, 1, 2, fluent_decel, slide" # everything in between, moving, dragging, resizing.

					# Fade
					"fadeIn,      1, 3,   fade_curve" # fade in (open) -> layers and windows
					"fadeOut,     1, 3,   fade_curve" # fade out (close) -> layers and windows
					"fadeSwitch,  0, 1,   easeOutCirc" # fade on changing activewindow and its opacity
					"fadeShadow,  1, 10,  easeOutCirc" # fade on changing activewindow for shadows
					"fadeDim,     1, 4,   fluent_decel" # the easing of the dimming of inactive windows
					"workspaces,  1, 4,   easeOutCubic, fade" # styles: slide, slidevert, fade, slidefade, slidefadevert
				];
			};
		};
  };
}
