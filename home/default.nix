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
  nixpkgs.config.allowUnfree = true;
  home = {
    username = "void";
    homeDirectory = "/home/void";
    stateVersion = "26.05";

    packages = with pkgs; [
      deno
      lux
      dasel
      gh
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
      zed-editor
      papirus-icon-theme
      qt6Packages.qt6ct
      qtcreator
    ];
  };

  imports = [
    ./xdg
    ./programs/core
    ./programs/applications
    ./service/wayland/default.nix
  ];
}
