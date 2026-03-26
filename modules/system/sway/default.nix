{ config, pkgs, lib, ... }:

{
  environment.systemPackages = with pkgs; [
		sway
    wayland
    xdg-utils
    glib
    wl-clipboard
    capitaine-cursors
  ];

  programs.sway = {
    enable = true;
    wrapperFeatures.gtk = true;
  };

}
