{ config, pkgs, modulesPath, inputs, ... }:

let
  system = pkgs.stdenv.hostPlatform.system;
in
{
  home.username = "rafid";
  home.homeDirectory = "/home/rafid";

  imports = [
		./hyprland
		./quickshell
		./neovim
		./terminal
		./programs
  ];

  home.packages = with pkgs; [
    gh
    git
		gimp
    blesh
		tesseract
		element					# Predic-table element
    ghostty
		superfile				# file-browser
    newsflash				# (gnome)newsfeed
		vesktop					# discord client
    obsidian				# markdown notes
		obs-studio			# recorder/broadcaster
		bitwarden-desktop	# password-manager
		aseprite				# Animated sprite editor
    element-desktop	# matrix client
    libreoffice			# THE Best Office suite
		zed-editor
  ];

  home.stateVersion = "25.05";
}
