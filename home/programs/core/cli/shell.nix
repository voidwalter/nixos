{ pkgs, ... }:
{

  home.packages = [
    pkgs.blesh
    pkgs.eza
    pkgs.zoxide
    pkgs.bat
  ];

  programs = {
    fzf = {
      enable = true;
      enableBashIntegration = true;
      tmux.enableShellIntegration = true;
    };

    zoxide = {
      enable = true;
      package = pkgs.zoxide;
      enableBashIntegration = true;
      options = [
        "--no-cmd"
      ];
    };

    starship = {
      enable = true;
      package = pkgs.starship;
      enableTransience = true;
      enableBashIntegration = true;

      presets = [ "pure-preset" ];

      settings = {
        package.disabled = true;
        cmd_duration.min_time = 500;
      };
    };

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
      git = true;
      icons = "auto";
      colors = "auto";
      enableBashIntegration = true;

      extraOptions = [
        "--group-directories-first"
        "--no-quotes"
      ];
    };
  };

  programs.bash = {
    enable = true;
    historyIgnore = [
      "ll"
      "cd"
      "exit"
      "clear"
      "git status"
    ];

    shellAliases = {
      ll = "eza -l --icons";
      la = "eza -la --icons";
      xv = "NVIM_APPNAME='xvim' nvim";
      nv = "NVIM_APPNAME='neovim' nvim";
      ne = "sudo nvim /etc/nixos";
      g = "git";
      gclone = "git clone";
    };

    initExtra = ''
            [[ $- == *i* ]] && source ${pkgs.blesh}/share/blesh/ble.sh --attach=none

            eval $(starship init bash)
       
            ofix() {
              local file
              file=$(fzf --preview 'bat --style=numbers --color=always {}' --layout reverse --border --select-1 --exit-0)
              [[ -n "$file" ]] && nv "$file"
            }
       
            bat_show() {
              local target_bat
              target_bat=$(fzf --preview 'bat --style=numbers --color=always {}' --layout reverse --border --select-1 --exit-0)
              [[ -n "$target_bat" ]] && bat "$target_bat"
            }

      			cdir() { cd $(find . -type d | fzf --height 40% --layout reverse --border); }

            # keybinds

            ble-bind -x "C-f" ofix
      			ble-bind -x "C-b" bat_show
            ble-bind -x "C-w" cdir
            ble-bind -x "C-y" zi
            ble-bind -x "C-n" nv
            ble-bind -x "C-x c" clear
            ble-bind -x "C-x u" "z .."

            # Launch applications
            ble-bind -x "C-a x" "xv"
            ble-bind -x "C-a n" "nvim"
            ble-bind -x "C-a t" "tmux"
            ble-bind -x "C-a b" "btop"
            ble-bind -x "C-a c" "pipes.sh -p 2"
            ble-bind -x "C-s h" "start-hyprland"

            [[ $- == *i* ]] && ble-attach
    '';
  };
}
