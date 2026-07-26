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
    username = "void";
    homeDirectory = "/home/void";
    stateVersion = "26.05";
    sessionVariables = {
      # QT_QPA_PLATFORM = "wayland";
    };

    packages = with pkgs; [
      deno
      lux
      dasel
      obsidian
      grim
      slurp
      satty
      browsh
      pipes
      cargo
      adw-gtk3
      nwg-look
      nautilus
      fastfetch
      cliamp
      telegram-desktop
      libreoffice-qt
      luanti
      zed-editor
      papirus-icon-theme
      qt6Packages.qt6ct
      qtcreator
    ];
  };

  programs.home-manager.enable = true;

  imports = [
    ./xdg
    ./programs/core
    # ./programs/applications
    # ./service/quickshell
  ];
}
