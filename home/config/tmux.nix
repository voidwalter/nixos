{ pkgs, lib, ...}:

{ 
  programs.tmux = {
    enable = true;
    package = pkgs.tmux;
    shell = "${pkgs.bash}/bin/bash";
    mouse = false;
    clock24 = true;
    terminal = "screen-256color";
    baseIndex = 0;
    prefix = "M-Space";
    historyLimit = 50000;
    focusEvents = true;
    escapeTime = 0;
    sensibleOnTop = true;
    
    plugins = with pkgs.tmuxPlugins; [
      # Some quality of life settings
      sensible
      nord
      tmux-which-key

      { plugin = resurrect;
        extraConfig = ''
          set -g @resurrect-dir '~/.config/tmux/resurrect'
          set -g @resurrect-capture-pane-contents 'on'        # Capture full pane contents (scrollback) — very useful!

          set -g @resurrect-processes 'ssh vim nvim yazi btop newsboat'
          set -g @resurrect-strategy-vim 'session'
          set -g @resurrect-strategy-nvim 'session'
        '';
      }
      {
        plugin = tmux-fzf;
        extraConfig = ''
          TMUX_FZF_LAUNCH_KEY="C-f"
          TMUX_FZF_OPTIONS="-m"
          TMUX_FZF_OPTIONS="-p -w 62% -h 38% -m"
          TMUX_FZF_PREVIEW=0
          TMUX_FZF_PREVIEW_FOLLOW=0
          TMUX_FZF_ORDER="session|window|pane|command|keybinding"
          TMUX_FZF_PANE_FORMAT="[#{window_name}] #{pane_current_command}  [#{pane_width}x#{pane_height}] [history #{history_size}/#{history_limit}, #{history_bytes} bytes] #{?pane_active,[active],[inactive]}"
          TMUX_FZF_SWITCH_CURRENT=1
        '';
      }
      { plugin = fzf-url-opener;
        extraConfig = ''
          set -g @fzf-url-bind 'u'
          set -g @fzf-url-history-limit '2000'
          set -g @fzf-url-open "zen"
        '';
      }
      { plugin = sessionx;
        extraConfig = ''
        set -g @sessionx-bind 'o'
        '';
      }
      { plugin = jump;
        extraConfig = ''
          set -g @jump-key 'z'
          set -g @jump-bg-color '\e[0m\e[90m'
          set -g @jump-fg-color '\e[1m\e[31m'
          # keys will overlap with the word (default)
          set -g @jump-keys-position 'left'

          # keys will be at the left of the word without overlap
          set -g @jump-keys-position 'off_left'
        '';
      }
      { plugin = continuum;
        extraConfig = ''
          set -g @continuum-restore 'off'
          set -g @continuum-save-interval '10'
          set -g @resurrect-restore 'R'
          set -g @resurrect-save 'S'
        '';
      }

      fuzzback
    ];

    extraConfig = ''
      set -g detach-on-destroy off
      set -g renumber-windows on    # renumber if closed a window

      # ICONS
      terminal_icon=""
      active_terminal_icon=""
      ssh_icon="󰣀"
      left_edge_icon="󱞸"
      right_edge_icon="󱞴"
      prefix_on_icon="󰠠"
      prefix_off_icon="󰤂"
      paired_icon="⚇"
      sync_icon="⚏"
      mouse_icon="󰍽"
      root_icon="!"
      bell_icon=""
      zoom_icon=""
      last_icon="󰁯"

      # COLOR
      color_white="#E4E4E4"
      color_blue="#00AFFF"
      color_dim_blue="#008BCC"
      color_dim_gray="#303030"
      color_black="#080808"
      color_red="#C04851"

      unbind C-b
      set -g prefix M-Space
      bind M-Space send-prefix

      bind h select-pane -L
      bind j select-pane -D
      bind k select-pane -U
      bind l select-pane -R

      # Bind Alt + number to select the corresponding window
      bind-key -n M-0 select-window -t :=0
      bind-key -n M-1 select-window -t :=1
      bind-key -n M-2 select-window -t :=2
      bind-key -n M-3 select-window -t :=3
      bind-key -n M-4 select-window -t :=4
      bind-key -n M-5 select-window -t :=5
      bind-key -n M-6 select-window -t :=6
      bind-key -n M-7 select-window -t :=7
      bind-key -n M-8 select-window -t :=8

      # Resize panes using Prefix + HJKL (repeatable with -r)
      bind -r H resize-pane -L 5
      bind -r J resize-pane -D 5
      bind -r K resize-pane -U 5
      bind -r L resize-pane -R 5

      bind -n M-h previous-window
      bind -n M-l next-window

      # Status Bar
      set -g status-position top
      set -g status-justify left
      set -g status-left ""
      set -g status-left-length 100
      set -g status-right-length 80
      set -g status-right '#{cpu_bg_color} CPU: #{cpu_icon} #{cpu_percentage} | %a %h-%d %H:%M '
      set -g status-style "bg=default,fg=default"         # Optional: make status style very minimal/transparent-ish


    '';
  };
}
