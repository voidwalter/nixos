{ config, ...}:

{
  imports = [
    ./bat.nix
		./git.nix
		./btop.nix
		./tmux.nix
		./kitty.nix
		./starship.nix
  ];
}

