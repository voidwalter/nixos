{ config, lib, pkgs, ... }:

let
  system = pkgs.stdenv.hostPlatform.system;
in
{
	imports = [
		./configs
		./programs.nix
		./hardware-configuration.nix
	];

	########## Core System Settings

	nix = {
		enable = true;
		package = pkgs.nix;
		daemonUser = "root";
		daemonGroup = "root";
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

  nixpkgs.config.allowUnfree = true;
	
  system = {
		autoUpgrade.enable = false;
		stateVersion = "25.11";
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

    # Enable "Silent boot" :: no kernel/load status
    consoleLogLevel = 3;
    initrd.verbose = false;
    kernelParams = [
      "quiet"
      "udev.log_level=3"
      "systemd.show_status=auto"
    ];
  };

	systemd.network.wait-online.enable = false;

	services = {
		openssh = {
			enable = true;
			settings = {
				PasswordAuthentication = true;
				PermitRootLogin = "no";               # Never allow direct root login
			};
		};

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
    nameservers = [
      # "8.8.8.8"
      # "8.8.4.4"
      # "1.1.1.1"
    ];
    firewall = {
      enable = true;
      allowedTCPPorts = [
        22
        80
      ];
      allowedUDPPorts = [
        # 59010
      ];
    };
		useNetworkd = true;
		dhcpcd.enable = false;
  };

  security = {
		enableWrappers = true;
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
