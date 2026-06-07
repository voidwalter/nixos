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
      fastfetch
      zed-editor
      papirus-icon-theme
      qt6Packages.qt6ct
    ];
  };

  imports = [
    ./xdg
    ./programs
    ./service/wayland/default.nix
  ];
}
