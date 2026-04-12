{ pkgs, ... }:
{
  wayland.windowManager.hyprland = {
    settings.monitor = [ "HDMI-A-1,1920x1080@100.00Hz,0x0,1" ];

    extraConfig = ''
        # source = ~/.config/hypr/monitors.conf
        # source = ~/.config/hypr/workspaces.conf
      # hyprlang noerror false
    '';
  };

  home.packages = with pkgs; [ 
		ddcutil
		ddcutil-service
		nwg-displays
		brightnessctl
	];
}
