
{ pkgs, ... }:

{
  home.packages = [ pkgs.blesh pkgs.eza pkgs.fzf pkgs.zoxide pkgs.bat ];

	programs.starship = {
		enable = true;
		package = pkgs.starship;
		presets = ["pure-preset"];
		
		settings = {
    	package.disabled = true;
    	cmd_duration.min_time = 500;
  	};
	};
  programs.bash = {
    enable = true;
    shellAliases = {
      ll = "eza -l --icons";
			la = "eza -la --icons";
      xv = "NVIM_APPNAME='xvim' nvim";
      nv = "NVIM_APPNAME='neovim' nvim";
			ne = "sudo nvim /etc/nixos";
			nrs = "sudo nixos-rebuild switch --flake /etc/nixos/#nixie --show-trace";
    };

    initExtra = ''
      # Initialize blesh
      [[ $- == *i* ]] && source ${pkgs.blesh}/share/blesh/ble.sh --attach=none

      eval "$(fzf --bash)"
      eval "$(zoxide init bash)"
			eval "$(starship init bash)"

      histor() { history | fzf; }

      ofix() {
        local file
        file=$(fzf --preview 'bat --style=numbers --color=always {}' --layout reverse --border --select-1 --exit-0)
        [[ -n "$file" ]] && nv "$file"
      }
 
      bat_show() {
        local target_bat
        target_bat=$(fzf --preview 'bat --style=numbers --color=always {}' --layout reverse --border --select-1 --exit-0)
        [[ -n "$file" ]] && bat "$file"
      }

			cdir() { cd $(find . -type d | fzf --layout reverse --border); }

      # blesh-specific Keybinds
      # Functions
      ble-bind -x "C-h" histor
      ble-bind -x "C-f" ofix
			ble-bind -x "C-b" bat_show
      ble-bind -x "C-c" cdir
      ble-bind -x "C-w" fk

      # Shell utilities
      ble-bind -c "M-C-l" clear-screen
      ble-bind -x "C-x c" clear
      ble-bind -x "C-x u" "cd .."
      
      # Eza binds
      ble-bind -x "C-z l" "eza -la"
      ble-bind -x "C-z d" "eza --only-dirs"
      ble-bind -x "C-z f" "eza --only-files"
      ble-bind -x "C-z t" "eza -T"
      ble-bind -x "C-z g" "eza --grid"
      
      # Git binds
      ble-bind -x "C-g s" "git status"
      ble-bind -x "C-g r" "git remote -v"
      ble-bind -x "C-g a" "git add ."

      # Launch applications
      ble-bind -x "C-a x" "xv"
      ble-bind -x "C-a n" "nvim"
      ble-bind -x "C-a y" "yazi"
      ble-bind -x "C-a t" "tmux"
      ble-bind -x "C-a b" "btop"
      ble-bind -x "C-a c" "pipes.sh -p 2"
      ble-bind -x "C-s h" "start-hyprland"

      [[ $- == *i* ]] && ble-attach
    '';
  };
}
