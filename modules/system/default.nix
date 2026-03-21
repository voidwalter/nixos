{ pkgs, ...}:

{
  imports = [
		./kitty.nix
		./dunst.nix
		# ./foot.nix
		# ./cli_programs.nix
	];
}
