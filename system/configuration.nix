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
  ];

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "nix";

  # Configure network connections interactively with nmcli or nmtui.
  networking.networkmanager.enable = true;

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
    amdgpu = {
      initrd.enable = true;
      overdrive.enable = true;
      overdrive.ppfeaturemask = "0xffffffff";
    };
    graphics = {
      enable = true;
      enable32Bit = true;
    };
    i2c.enable = true;
  };

  nixpkgs.config.allowUnfree = true;

  time.timeZone = "Asia/Dhaka";
  services.pipewire = {
    enable = true;
    pulse.enable = true;
  };

  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true;
    settings = {
      Theme = {
        CursorTheme = "Bibata-Modern-Ice";
        CursorSize = 24;
      };
    };
  };

  programs.qylock = {
    enable = true;
    theme = "sword";
    sddm.enable = true; # installs theme + sets it active (default)
    quickshell.enable = true; # adds `qylock-lock` to PATH (default)

    # Optional per-theme tweaks (replaces the interactive prompts):
    themeOptions = {
      terraria.backgroundMode = "time"; # time | random | static
      Genshin.backgroundMode = "time";
      clockwork.orbital = {
        themeMode = "dark";
        enableWindup = true;
      };
      osu.gameMode = "menu"; # menu | game
    };
  };

  users.users.sai = {
    isNormalUser = true;
    shell = pkgs.zsh;
    extraGroups = [ "wheel" ];
    packages = with pkgs; [
      tree
    ];
  };

  services.openssh.enable = true;
  system.stateVersion = "26.05";
}
