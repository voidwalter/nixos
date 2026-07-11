# Find shortcut IDs in ~/.config/zen/default/zen-keyboard-shortcuts.json
# Get version from about:config -> zen.keyboard.shortcuts.version
# Activation fails if version changes (prevents silent breakage).
#
# Use this command:
# jq -c '.shortcuts[] | {id, key, keycode, action}' ~/.config/zen/default/zen-keyboard-shortcuts.json | fzf
{
  programs.zen-browser.profiles.default = {
    keyboardShortcutsVersion = 19; # Ensure this matches your installed Zen version
    keyboardShortcuts = [
      # --- Zen Specific Features ---

      # Compact Mode
      {
        id = "zen-compact-mode-toggle";
        key = "c";
        modifiers = {
          control = true;
          alt = true;
        };
      }
      {
        id = "zen-compact-mode-show-sidebar";
        key = "s";
        modifiers = {
          control = true;
          alt = true;
        };
      }

      # Workspaces
      {
        id = "zen-workspace-forward";
        key = "right";
        modifiers = {
          control = true;
          alt = true;
        };
      }
      {
        id = "zen-workspace-backward";
        key = "left";
        modifiers = {
          control = true;
          alt = true;
        };
      }
      {
        id = "zen-workspace-switch1";
        key = "1";
        modifiers = {
          control = true;
          alt = true;
        };
      }
      {
        id = "zen-workspace-switch2";
        key = "2";
        modifiers = {
          control = true;
          alt = true;
        };
      }

      # Split View
      {
        id = "zen-split-view-grid";
        key = "g";
        modifiers = {
          control = true;
          shift = true;
        };
      }
      {
        id = "zen-split-view-vertical";
        key = "v";
        modifiers = {
          control = true;
          shift = true;
        };
      }
      {
        id = "zen-split-view-horizontal";
        key = "h";
        modifiers = {
          control = true;
          shift = true;
        };
      }
      {
        id = "zen-split-view-unsplit";
        key = "u";
        modifiers = {
          control = true;
          shift = true;
        };
      }

      # --- Standard Navigation & Tabs ---

      # Tab Control
      {
        id = "key_close";
        key = "w"; # Standard close tab is Ctrl+W, you had 'q' which is often quit
        modifiers.control = true;
      }
      {
        id = "key_reload";
        key = "r";
        modifiers.control = true;
      }
      {
        id = "key_reload_skip_cache";
        key = "r";
        modifiers = {
          control = true;
          shift = true;
        };
      }
      {
        id = "key_undo";
        key = "z";
        modifiers = {
          control = true;
          shift = true;
        };
      }

      # Navigation
      {
        id = "key_goBack";
        key = "Left";
        modifiers.alt = true;
      }
      {
        id = "key_goForward";
        key = "Right";
        modifiers.alt = true;
      }
      {
        id = "key_focusURL";
        key = "l";
        modifiers.control = true;
      }

      # --- Disabled Keys ---
      {
        id = "key_quitApplication";
        disabled = true;
      }
    ];
  };
}
