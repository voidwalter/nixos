{ pkgs, lib, ... }:

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
      tmux-sessionx
    ];

    extraConfig = ''
      set -g default-terminal "xterm-256color"
      set-option -ga terminal-overrides ',xterm-256color:Tc'
      set -g terminal-features "xterm*:RGB"
      set -g @sessionx-bind 'o'
      set -g @continuum-restore 'off'
      set -g @continuum-save-interval '10'
      set -g @resurrect-restore 'R'
      set -g @resurrect-save 'S'

      set -g detach-on-destroy off
      set -g renumber-windows on    # renumber if closed a window

      # Status Bar
      set -g status-position bottom
      set -g status on
      set -g status-justify centre
      set -g status-style "bg=default,fg=default"
      setw -g window-status-format "#[bg=default]#[fg=cyan] #I #[bg=default]#[fg=white] #W "
      setw -g window-status-current-format "#[bg=brightblack]#[fg=white] #I #[bg=default]#[fg=white] #W "

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
