{ config, ...}:

{
  imports = [
    ./bat.nix
		./git.nix
		./btop.nix
		./tmux.nix
		./starship.nix
  ];

	programs.alacritty.enable = true;
	xdg.configFile = {
    "alacritty/alacritty.toml".source = ./alacritty/alacritty.toml;
  };
}

