{
  config,
  lib,
  pkgs,
  ...
}:

let
  system = pkgs.stdenv.hostPlatform.system;
in
{
  imports = [
    ./pkgs.nix
    ./service.nix
    ./networking.nix
    ./hardware-configuration.nix
  ];

  nix = {
    enable = true;
    package = pkgs.nix;
    extraOptions = "warn-dirty = false";
    gc.automatic = true;
    optimise.automatic = true;
    settings = {
      # access-tokens = ;
      allow-dirty = true;
      allow-dirty-locks = false;
      allowed-users = [
        "@wheel"
        "void"
      ];
      experimental-features = [
        "nix-command"
        "flakes"
      ];
    };
  };

  nixpkgs.config.allowUnfree = true;

  system = {
    autoUpgrade.enable = false;
    stateVersion = "25.11";
  };

  hardware = {
    i2c.enable = true;
    graphics.enable = true;
  };

  time.timeZone = "Asia/Dhaka";
  users.users.void = {
    createHome = true;
    isNormalUser = true;
    extraGroups = [ "wheel" ];
    shell = pkgs.bash;
    packages = with pkgs; [
      tree
    ];
  };

  environment.systemPackages = with pkgs; [
  ];

  boot = {
    loader = {
      efi.canTouchEfiVariables = true;
      systemd-boot.enable = true;
    };
  };
}
