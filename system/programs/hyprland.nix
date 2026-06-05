{ inputs, pkgs, ... }:

let
  inherit (pkgs.stdenv.hostPlatform) system;
in
{
  imports = [
    inputs.hyprland.nixosModules.default
  ];

  environment.pathsToLink = [ "/share/icons" ];

  environment.systemPackages = with pkgs; [
    hyprshutdown
    hyprpwcenter
    hyprpaper
    # hyprqt6engine
    hyprsysteminfo
    inputs.shell.packages.${pkgs.stdenv.hostPlatform.system}.default
  ];

  programs = {
    xwayland.enable = true;

    hyprland = {
      enable = true;
      withUWSM = true;
      package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
      portalPackage =
        inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland;

      plugins = [
        # inputs.hyprland-plugins.packages.${pkgs.stdenv.hostPlatform.system}.hyprland-easymotion
      ];
    };
  };
}
