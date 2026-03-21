{ config, pkgs, modulesPath, inputs, ... }:

let
  system = pkgs.stdenv.hostPlatform.system;
in
{
  home.username = "rafid";
  home.homeDirectory = "/home/rafid";

  imports = [
		./hyprland
		# ./quickshell
		./neovim
		./terminal
		./programs
  ];

  home.packages = with pkgs; [
    gh
    git
		gimp
    blesh
    element
		tesseract
		libsForQt5.qt5ct
    qt6Packages.qt6ct
    ghostty
		superfile
    newsflash
		vesktop
    obsidian
		# todoist-electron
    element-desktop
    onlyoffice-desktopeditors
  ];

  home.stateVersion = "25.05";
}
