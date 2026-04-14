{ pkgs, config, ...}:

{
	xdg.portal = {
    enable = true;
    xdgOpenUsePortal = true;
    configPackages = [ pkgs.hyprland ];
    extraPortals = with pkgs; [
      xdg-desktop-portal-gtk
			xdg-desktop-portal-hyprland
    ];
    config = {
      common.default = [ "gtk" ];
      hyprland.preferred = [
        "gtk"
        "hyprland"
      ];
    };
  };
}
