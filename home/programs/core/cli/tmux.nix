{ pkgs, lib, ... }:

{
  programs.tmux = {
    enable = true;
    package = pkgs.tmux;
    mouse = true;
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
      minimal-tmux-status
    ];

    extraConfig = ''
      bind | split-window -h -c "#{pane_current_path}"
      bind - split-window -v -c "#{pane_current_path}"
      bind c new-window -c "#{pane_current_path}"

      bind h select-pane -L
      bind j select-pane -D
      bind k select-pane -U
      bind l select-pane -R
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
      bind-key -n M-9 select-window -t :=9

      bind -r H resize-pane -L 5
      bind -r J resize-pane -D 5
      bind -r K resize-pane -U 5
      bind -r L resize-pane -R 5

      setw -g mode-keys vi

      # Enter copy mode: Alt+Space then '[' Select: 'v', Copy: 'y', Exit: 'q'
      bind-key -T copy-mode-vi v send-keys -X begin-selection
      bind-key -T copy-mode-vi y send-keys -X copy-selection-and-cancel
      bind-key -T copy-mode-vi C-v send-keys -X rectangle-toggle

      # APPEARANCE
      set -g @minimal-tmux-fg "#000000"
      set -g @minimal-tmux-bg "#698DDA"
      set -g @minimal-tmux-justify "centre"
      set -g @minimal-tmux-indicator-str "  tmux  "
      set -g @minimal-tmux-indicator true
      set -g @minimal-tmux-status "bottom"

      # Enables or disables the left and right status bar
      set -g @minimal-tmux-right true
      set -g @minimal-tmux-left true

      # expanded icon (fullscreen icon)
      set -g @minimal-tmux-expanded-icon "󰊓 "

      # on all tabs (default is false)
      # false will make it visible for the current tab only
      set -g @minimal-tmux-show-expanded-icon-for-all-tabs true

      # To add or remove extra text in status bar
      set -g @minimal-tmux-status-right-extra ""
      set -g @minimal-tmux-status-left-extra ""

      # To make the selection box rounded () or edged <>
      # Default is nothing, when set to true default is edged
      set -g @minimal-tmux-use-arrow true
      set -g @minimal-tmux-right-arrow ""
      set -g @minimal-tmux-left-arrow ""

      # Not recommended to change these values
      set -g @minimal-tmux-status-right "#S"
      set -g @minimal-tmux-status-left "What are you doing?"

      # If getting strings cut in left status or right
      # Here 20 is the length of the characters in the string
      set -g status-right-length 20
      set -g status-left-length 20

      # tmux-resurrect: Save pane contents (requires tmux 3.2+)
      set -g @resurrect-capture-pane-contents 'on'
      set -g @resurrect-dir "~/.config/tmux/resurrect"
      set -g @resurrect-save 'S'
      set -g @resurrect-restore 'R'
      set -g @continuum-save-interval '15'
      set -g @continuum-restore 'on'

      set -g @vim_navigator_mapping_left "C-Left C-h"  # use C-h and C-Left
      set -g @vim_navigator_mapping_right "C-Right C-l"
      set -g @vim_navigator_mapping_up "C-k"
      set -g @vim_navigator_mapping_down "C-j"
      set -g @vim_navigator_mapping_prev ""  # removes the C-\ binding

      # minimal-tmux-status
      bind-key b set-option status

      set -g @easymotion-hints 'asdfghjkl;'

      set -g @sessionx-bind 'o'
      set -g @sessionx-tree-mode 'off'
      set -g @sessionx-window-mode 'on'
    '';
  };
}
