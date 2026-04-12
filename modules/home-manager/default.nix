{ config, pkgs, modulesPath, inputs, ... }:

let
  system = pkgs.stdenv.hostPlatform.system;
in
{
  home.username = "rafid";
  home.homeDirectory = "/home/rafid";

  imports = [
		./xdg
		./neovim
		./hyprland
		./programs
		./commandline
  ];

  home.packages = with pkgs; [
    git
		zola					# SSG
		nemo
    blesh
		cliamp
		tesseract
		element					# Predic-table element
    ghostty					# terminal emulator
		superfile				# file-browser
		vesktop					# discord client
    logseq				# markdown notes
		bitwarden-desktop	# password-manager
		aseprite				# Animated sprite editor
    element-desktop	# matrix client
    libreoffice			# THE Best Office suite
		zed-editor
		kdePackages.kapman
  ];

  home.stateVersion = "25.05";
}
