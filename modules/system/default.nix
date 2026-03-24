{ pkgs, ...}:

{
  imports = [
		./program/dunst.nix
		./program/bash.nix
	];
}
