{
  config,
  lib,
  pkgs,
  ...
}:

{
  imports = [
    ./hardware-configuration.nix
    ./programs
    ./pkgs.nix
    ./networking.nix
    ./services.nix
  ];

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  users.users.sai = {
    isNormalUser = true;
    shell = pkgs.zsh;
    extraGroups = [ "wheel" ];
    packages = with pkgs; [
      tree
    ];
  };

  systemd = {
    network.wait-online.enable = false;
  };

  nix = {
    enable = true;
    package = pkgs.nix;
    extraOptions = "warn-dirty = false";
    gc.automatic = true;
    optimise.automatic = true;
    settings = {
      # access-tokens = [
      #   "github.com=!include ${config.age.secrets.flake-token.path}"
      # ];
      allow-dirty = true;
      allow-dirty-locks = false;
      allowed-users = [
        "@wheel"
        "sai"
      ];
      experimental-features = [
        "nix-command"
        "flakes"
      ];
    };
  };

  hardware = {
    enableAllFirmware = true;
    amdgpu = {
      initrd.enable = true;
      overdrive.enable = true;
      overdrive.ppfeaturemask = "0xffffffff";
    };

    bluetooth = {
      enable = true;
      powerOnBoot = true;
    };

    graphics = {
      enable = true;
      enable32Bit = true;
    };
    i2c.enable = true;
  };

  nixpkgs.config.allowUnfree = true;

  time.timeZone = "Asia/Dhaka";

  system.stateVersion = "26.05";
}
