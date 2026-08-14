{
  config,
  pkgs,
  modulesPath,
  inputs,
  ...
}:

let
  system = pkgs.stdenv.hostPlatform.system;
in
{
  home = {
    username = "sai";
    homeDirectory = "/home/sai";
    stateVersion = "26.05";
    sessionVariables = {
      # QT_QPA_PLATFORM = "wayland";
    };

    packages = with pkgs; [
      deno
      dasel
      obsidian
      grim
      slurp
      satty
      pipes
      adw-gtk3
      nwg-look
      fastfetch
      # wineWow64Packages.full
      # winetricks
      # quaternion
      thunar
      element-desktop
      telegram-desktop
      papirus-icon-theme
      qt6Packages.qt6ct
      kdePackages.okular

    ];
  };

  programs.home-manager.enable = true;

  imports = [
    ./xdg
    ./programs/core
    ./programs/applications
    ./service/quickshell
  ];
}
