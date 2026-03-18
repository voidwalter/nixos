{ config, lib, pkgs, ... }:

{
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
      theme = "hexagon_dots_alt";
      themePackages = with pkgs; [			# https://github.com/adi1090x/plymouth-themes/
        (adi1090x-plymouth-themes.override {
          selected_themes = [ "hexagon_dots_alt" ];
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


  # Define a user account.
  users.users.rafid = {
    isNormalUser = true;
    description = "rafid";
    extraGroups = [ "wheel" ];
    shell = pkgs.bash;
    packages = with pkgs; [
      tree
    ];
  };

  time.timeZone = "Asia/Dhaka";
  
  nixpkgs.config.allowUnfree = true;
	programs.nix-ld.enable = true;
  
	xdg.portal = {
    enable = true;
    xdgOpenUsePortal = true;
    configPackages = [ pkgs.hyprland ];
    extraPortals = with pkgs; [
      xdg-desktop-portal-gtk
    ];
    config = {
      common.default = [ "gtk" ];
      hyprland.preferred = [
        "gtk"
        "hyprland"
      ];
    };
  }; 

	nix = {
    settings.experimental-features = [ "nix-command" "flakes"];
    extraOptions = ''warn-dirty = false'';
  };

  system.stateVersion = "25.11";
}
