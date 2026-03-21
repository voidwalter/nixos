{ config, ...}:

{
  imports = [
    ./bat.nix
		./git.nix
		./btop.nix
		./tmux.nix
		./starship.nix
  ];
}

