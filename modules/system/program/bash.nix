{ pkgs, ... }:

{
  programs.bash = {
    enable = true;
		blesh.enable = true;
    shellAliases = {
			tp = "tree .";
      ll = "exa -l --icons";
			la = "exa -la --icons";
      nix-switch = "nixos-rebuild switch";
			nix-gen = "nixos-rebuild list-generations";
			ncg = "nix-collect garbage --delete-older-than 2d";
    };

		interactiveShellInit = ''
			set -o vi
			eval "$(fzf --bash)"
			eval "$(starship init bash)"
			eval "$(zoxide init bash)"


			ofix() {
				local file
				file=$(fzf --preview 'bat --style=numbers --color=always {}' --layout reverse --border --select-1 --exit-0)
				if [[ -n "$file" ]]; then
					nvim "$file"
				fi
			}

			####   Keybinds

			# Functions
			bind '"\C-f":"ofix\n"'

			# builtin function
			bind '"\e\C-l": clear-screen'
			bind -x '"\C-xs": source ~/.bashrc'
			bind -x '"\C-xc": clear'
			bind -x '"\C-xu": cd ..'
			bind -x '"\C-ax": xv'
			bind -x '"\C-an": nvim'
			bind -x '"\C-ay": yazi'
			bind -x '"\C-at": tmux'
			bind -x '"\C-sh": start-hyprland'
		'';
  };
}

