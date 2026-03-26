{ config, ...}:

{
  imports = [
    ./bat.nix
		./git.nix
		./btop.nix
		./tmux.nix
		./starship.nix
  ];

  programs.ripgrep = {
    enable = true;

    arguments = [
      "--max-columns=2000"
      "--smart-case"
    ];
  };

  programs.eza = {
    enable = true;
    icons = "auto";

    extraOptions = [
      "--group-directories-first"
      "--no-quotes"
    ];
  };

	programs.alacritty.enable = true;
	xdg.configFile = {
    "alacritty/alacritty.toml".source = ./alacritty/alacritty.toml;
  };
}

