{ config, lib, pkgs, ... }:

let
  system = pkgs.stdenv.hostPlatform.system;
in
{
	imports = [
		./configs
		./pkgs.nix
		./programs.nix
		./hardware-configuration.nix
	];

	nix = {
		enable = true;
		package = pkgs.nix;
		daemonUser = "root";
		daemonGroup = "root";
		extraOptions = ''warn-dirty = false'';
		gc = {
			automatic = true;
			dates = "weekly";
			options = "--delete-older-than 2d";
		};
		optimise = {
			automatic = true;
			dates = [ "daily" ];
		};
		settings = {
			auto-optimise-store = true;
			trusted-users = [ "root" "rafid" "@wheel" ];
    	experimental-features = [ "nix-command" "flakes"];
		};
  };

  nixpkgs = {
		config.allowUnfree = true;
	};

  system = {
		autoUpgrade.enable = false;
		stateVersion = "25.11";
	};

	hardware = {
		i2c.enable = true;
	};

  time.timeZone = "Asia/Dhaka";
  users.users.rafid = {
		createHome = true;
    isNormalUser = true;
    description = "rafid b. User";
		extraGroups = [ "wheel" ];
    shell = pkgs.bash;
    packages = with pkgs; [
      tree
    ];
  };

	environment.systemPackages = with pkgs; [
    gnupg
    openssl
    networkmanagerapplet
  ];
	
	boot = {
    loader = {
			timeout = 1;
      efi.canTouchEfiVariables = true;
		  systemd-boot = {
				enable = true;
      	configurationLimit = 10;
			};
    };

    plymouth = {
      enable = true;
      theme = "cuts_alt";
      themePackages = with pkgs; [			# https://github.com/adi1090x/plymouth-themes/
        (adi1090x-plymouth-themes.override {
          selected_themes = [ "cuts_alt" ];
        })
      ];
    };

    consoleLogLevel = 3;
    initrd.verbose = false;
    kernelParams = [
      "quiet"
      "udev.log_level=3"
      "systemd.show_status=auto"
    ];
  };

	systemd = {
		network.wait-online.enable = false;
	};

	services = {
		openssh = {
			enable = true;
			settings = {
				PasswordAuthentication = true;
				PermitRootLogin = "no";               # Never allow direct root login
			};
		};

		httpd = {
      enable = true;
      adminAddr = "";
      virtualHosts =
			let
				mkVirtualHost = webroot: {
					documentRoot = webroot;
					adminAddr = "alice@example.org";
					forceSSL = true;
					enableACME = true;
				};
			in
			{
				"example.org" = (mkVirtualHost "/webroot/example.org");
				"example.com" = (mkVirtualHost "/webroot/example.com");
			};
    };

		dunst = {
			enable = true;
			package = pkgs.dunst;
			enableWayland = true;
			settings = {
				global = {
					width = 300;
					height = 300;
					offset = "30x50";
					origin = "top-right";
					transparency = 10;
					frame_color = "#eceff1";
					font = "Droid Sans 9";
				};

				urgency_normal = {
					background = "#37474f";
					foreground = "#eceff1";
					timeout = 10;
				};
			};
		};

		# cliphist = {
		# 	enable = true;
		# 	allowImages = true;
		# 	package = pkgs.cliphist;
		# 	clipboardPackage = pkgs.wl-clipboard;
		# };

		greetd = {
			enable = true;
			useTextGreeter = true;
			settings = {
				default_session = {
					command = "${pkgs.tuigreet}/bin/tuigreet --cmd start-hyprland";
				};
			};
		};

		pipewire = {
			enable = true;
			pulse.enable = true;
			alsa.enable = true;
			alsa.support32Bit = true;
		};

		dbus = {
			enable = true;
			implementation = "broker";
			packages = with pkgs; [
				xfconf
				gnome2.GConf
			];
		};
	};

	networking = {
    hostName = "blackmarine";
    networkmanager = {
			enable = true;
		};
    firewall = {
      enable = true;
      allowedTCPPorts = [
        22
        80
      ];
    };
		useNetworkd = true;
		dhcpcd.enable = false;
  };

  security = {
		enableWrappers = true;
		acme.acceptTerms = true;
    rtkit = {
			enable = true;    # allows Pipewire to use realtime scheduler
			package = pkgs.rtkit;
		};
    sudo-rs = {
      enable = true;
			package = pkgs.sudo-rs;
      execWheelOnly = true;
			wheelNeedsPassword = true;
    };
  };
}
