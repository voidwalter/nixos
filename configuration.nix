# Bootloader, Settings

{ config, lib, pkgs, ... }:

{
  imports = [
      ./hardware-configuration.nix
  ];

  boot = {
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
      systemd-boot.configurationLimit = 10;
    };

    plymouth = {
      enable = true;
      theme = "double";
      themePackages = with pkgs; [
        (adi1090x-plymouth-themes.override {
          selected_themes = [ "double" ];
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
    loader.timeout = 1;
  };

  nix = {
    settings.experimental-features = [ "nix-command" "flakes"];
    extraOptions = ''warn-dirty = false'';
  };
  system.stateVersion = "25.11";
}

