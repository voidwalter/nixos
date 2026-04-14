{ pkgs, lib, ...}:

{
  programs.tmux = {
    enable = true;
    package = pkgs.tmux;
    mouse = false;
    clock24 = true;
		keyMode = "vi";
    terminal = "$TERM";
    baseIndex = 1;
    prefix = "M-Space";
		resizeAmount = 10;
    historyLimit = 50000;
    escapeTime = 0;
    sensibleOnTop = true;

    plugins = with pkgs.tmuxPlugins; [
      sensible
			continuum
			resurrect
			fuzzback
			tmux-fzf
			tmux-sessionx
			tokyo-night-tmux
    ];

    extraConfig = ''
			# plugin

			set -g @tokyo-night-tmux_window_id_style "roman"   # or "none", "digital",
			set -g @tokyo-night-tmux_window_number_position "right"
			set -g @tokyo-night-tmux_theme storm
			set @tokyo-night-tmux_pane_id_style hsquare
			set -g @tokyo-night-tmux_terminal_icon 
			set -g @tokyo-night-tmux_active_terminal_icon 

      set -g @sessionx-bind 'o'
      set -g @continuum-restore 'off'
      set -g @continuum-save-interval '10'
      set -g @resurrect-restore 'R'
      set -g @resurrect-save 'S'

			TMUX_FZF_LAUNCH_KEY="C-f"
      TMUX_FZF_OPTIONS="-m"
      TMUX_FZF_OPTIONS="-p -w 62% -h 38% -m"
      TMUX_FZF_PREVIEW=0
      TMUX_FZF_PREVIEW_FOLLOW=0
      TMUX_FZF_ORDER="session|window|pane|command|keybinding"
      TMUX_FZF_PANE_FORMAT="[#{window_name}] #{pane_current_command}  [#{pane_width}x#{pane_height}] [history #{history_size}/#{history_limit}, #{history_bytes} bytes] #{?pane_active,[active],[inactive]}"
      TMUX_FZF_SWITCH_CURRENT=1

			set -ga terminal-overrides ",alacritty:RGB"
    	set -ga terminal-overrides ",alacritty:Tc"

      set -g detach-on-destroy off
      set -g renumber-windows on    # renumber if closed a window

      # Status Bar
      set -g status-position bottom
      set -g status on
			set -g status-justify centre
      set -g status-left ""
      set -g status-left-length 50
      set -g status-right-length 50
      set -g status-right ' %H:%M '
      set -g status-style "bg=default,fg=default"
			setw -g window-status-format "#[bg=brightblack]#[fg=black] #I #[bg=black]#[fg=white] #W "
      setw -g window-status-current-format "#[bg=brightcyan]#[fg=black] #I #[bg=#5c5c5c]#[fg=black] #W "

      unbind C-b
      set -g prefix M-Space
      bind M-Space send-prefix

      bind h select-pane -L
      bind j select-pane -D
      bind k select-pane -U
      bind l select-pane -R
			bind -r H resize-pane -L 5
      bind -r J resize-pane -D 5
      bind -r K resize-pane -U 5
      bind -r L resize-pane -R 5
      bind -n M-h next-window
      bind -n M-l previous-window
      bind-key -n M-0 select-window -t :=0
      bind-key -n M-1 select-window -t :=1
      bind-key -n M-2 select-window -t :=2
      bind-key -n M-3 select-window -t :=3
      bind-key -n M-4 select-window -t :=4
      bind-key -n M-5 select-window -t :=5
      bind-key -n M-6 select-window -t :=6
      bind-key -n M-7 select-window -t :=7
      bind-key -n M-8 select-window -t :=8
    '';
  };
}
