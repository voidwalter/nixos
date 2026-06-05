{ pkgs, ... }:

{
	programs = {
    starship = {
		  enable = true;
		  package = pkgs.starship;
		  presets = ["nerd-font-symbols"];
	  };
  };

  environment.systemPackages = with pkgs; [
    fzf eza tmux zoxide
	];

  programs.bash = {
    enable = true;
		blesh.enable = true;
    shellAliases = {
      n = "nvim";
			tp = "tree .";
      ll = "exa -l --icons";
			la = "exa -la --icons";
			nix-gen = "nixos-rebuild list-generations";
    };

		interactiveShellInit = ''
			eval "$(fzf --bash)"
			eval "$(zoxide init bash)"

			ofix() {
				local file
				file=$(fzf --preview 'bat --style=numbers --color=always {}' --layout reverse --border --select-1 --exit-0)
				if [[ -n "$file" ]]; then
					nvim "$file"
				fi
			}
			
      bat_show() {
        local target_bat
        target_bat=$(fzf --preview 'bat --style=numbers --color=always {}' --layout reverse --border --select-1 --exit-0)
        [[ -n "$target_bat" ]] && bat "$target_bat"
      }

			####   Keybinds
			bind '"\C-f":"ofix\n"'
			bind '"\C-b":"bat_show\n"'

			# builtin function
			bind '"\e\C-l": clear-screen'
		'';
  };
}
