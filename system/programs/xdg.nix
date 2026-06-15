{ pkgs, ... }:

{
  xdg.portal = {
    enable = true;
    xdgOpenUsePortal = true;
    config.hyprland = {
      default = [
        "hyprland"
        "gtk"
      ];
      # "org.freedesktop.impl.portal.FileChooser" = "hyprland";
      # "org.freedesktop.impl.portal.Print" = "hyprland";
    };
    extraPortals = with pkgs; [
      pkgs.xdg-desktop-portal-gtk
    ];
  };
}
