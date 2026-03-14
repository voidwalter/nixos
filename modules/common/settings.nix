{ config, lib, pkgs, ... }:

{
  # Define a user account.
  users.users.rafid = {
    isNormalUser = true;
    description = "rafid";
    extraGroups = [ "wheel" ];
    shell = pkgs.bash;
    packages = with pkgs; [
      tree
    ];
  };

  time.timeZone = "Asia/Dhaka";
  
  nixpkgs.config.allowUnfree = true;

  xdg.portal = {
    enable = true;
    xdgOpenUsePortal = true;
    configPackages = [ pkgs.hyprland ];
    extraPortals = with pkgs; [
      xdg-desktop-portal-gtk
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
