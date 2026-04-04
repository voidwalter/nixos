
{ pkgs, ... }:

{
  home.packages = [ pkgs.blesh pkgs.eza pkgs.fzf pkgs.starship pkgs.zoxide pkgs.bat ];

  programs.bash = {
    enable = true;
    shellAliases = {
      ll = "eza -l --icons";
			la = "eza -la --icons";
      xv = "NVIM_APPNAME='xvim' nvim";
      nv = "NVIM_APPNAME='neovim' nvim";
    };

    initExtra = ''
      # Initialize blesh
      [[ $- == *i* ]] && source ${pkgs.blesh}/share/blesh/ble.sh --attach=none

      set -o vi
      eval "$(fzf --bash)"
      eval "$(starship init bash)"
      eval "$(zoxide init bash)"

      histor() { history | fzf; }

      ofix() {
        local file
        file=$(fzf --preview 'bat --style=numbers --color=always {}' --layout reverse --border --select-1 --exit-0)
        [[ -n "$file" ]] && nv "$file"
      }
      
			cdir() { cd $(find . -type d | fzf --layout reverse --border); }

      # blesh-specific Keybinds
      if ((_ble_VERSION)); then
        # Functions
        ble-bind -x "C-h" histor
        ble-bind -x "C-f" ofix
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
      fi

      [[ $- == *i* ]] && ble-attach
    '';
  };
}
