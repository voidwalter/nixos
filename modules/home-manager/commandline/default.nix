{ config, ...}:

{
  imports = [
		./yazi
    ./bat.nix
		./bash.nix
		./btop.nix
		./tmux.nix
  ];

	programs = {
		fzf.enable = true;
    atuin = {
      enable = true;
      daemon.enable = true;
      settings = {
        auto_sync = true;
        sync_frequency = "5m";
        style = "compact"; # compact | full | auto
        filter_mode = "workspace";
        filter_mode_shell_up_key_binding = "workspace";
        workspaces = true;
        secret_filter = true;
      };
    };
		ripgrep = {
			enable = true;
			arguments = [
				"--max-columns=2000"
				"--smart-case"
			];
		};

		eza = {
			enable = true;
			icons = "auto";

			extraOptions = [
				"--group-directories-first"
				"--no-quotes"
			];
		};
	};

	programs.alacritty.enable = true;
	xdg.configFile = {
    "alacritty/alacritty.toml".source = ./alacritty/alacritty.toml;
  };
}

