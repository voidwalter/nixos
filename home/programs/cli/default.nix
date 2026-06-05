{ config, ...}:

{
  imports = [
    ./bat.nix
		./btop.nix
    ./shell.nix
		./tmux.nix
  ];
}

