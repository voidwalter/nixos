{ pkgs, ... }:

{
  programs.bash = {
    enable = true;
		blesh.enable = true;
    
    shellAliases = {
      ll = "exa -l --icons";
			xv = "NVIM_APPNAME='xvim' nvim";
			nv = "NVIM_APPNAME='neovim' nvim";
      nix-switch = "nixos-rebuild switch";
    };

		interactiveShellInit = ''
			set -o vi
			eval "$(fzf --bash)"
			eval "$(starship init bash)"
			eval "$(zoxide init bash)"

			histor() {
				history | fzf
			}

			ofix() {
				local file
				file=$(fzf --preview 'bat --style=numbers --color=always {}' --layout reverse --border --select-1 --exit-0)
				if [[ -n "$file" ]]; then
					xv "$file"
				fi
			}

			cdir() {
				cd $(find . -type d | fzf --layout reverse --border)
			}

			fk() {
				local pid
				pid=$(ps -ef | sed 1d | fzf -m --header='[kill:process]' --header-lines=1 | awk '{print $2}')
				if [ "x$pid" != "x" ]; then
					echo $pid | xargs kill -9
				fi
			}

			####   Keybinds

			# Functions
			bind '"\C-h":"histor\n"'
			bind '"\C-f":"ofix\n"'
			bind '"\C-c":"cdir\n"'
			bind '"\C-w":"fk\n"'

			# builtin function
			bind '"\e\C-l": clear-screen'
			bind -x '"\C-xs": source ~/.bashrc'
			bind -x '"\C-xc": clear'
			bind -x '"\C-xu": cd ..'
			bind -x '"\C-zl": eza -la'         # long and all list
			bind -x '"\C-zd": eza --only-dirs' #
			bind -x '"\C-zf": eza -only-files'
			bind -x '"\C-zt": eza -T'
			bind -x '"\C-zg": eza --grid'
			
			bind -x '"\C-gs": git status'
			bind -x '"\C-gr": git remote -v'
			bind -x '"\C-ga": git add .'

			# Launch applications
			bind -x '"\C-ax": xv'
			bind -x '"\C-an": nvim'
			bind -x '"\C-ay": yazi'
			bind -x '"\C-at": tmux'
			bind -x '"\C-ab": btop'
			bind -x '"\C-ac": cmatrix'
			bind -x '"\C-ac": pipes.sh -p 2'
			bind -x '"\C-sh": start-hyprland'
		'';
  };
}

