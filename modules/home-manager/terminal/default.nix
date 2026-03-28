{ config, ...}:

{
  imports = [
    ./bat.nix
		./git.nix
		./btop.nix
		./tmux.nix
  ];

	programs.starship.enable = true;
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

