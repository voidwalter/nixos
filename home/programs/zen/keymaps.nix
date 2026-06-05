# Find shortcut IDs in ~/.config/zen/default/zen-keyboard-shortcuts.json
# Get version from about:config -> zen.keyboard.shortcuts.version
# Activation fails if version changes (prevents silent breakage).
#
# Use this command:
# jq -c '.shortcuts[] | {id, key, keycode, action}' ~/.config/zen/default/zen-keyboard-shortcuts.json | fzf

{
  programs.zen-browser.profiles.default = {
    keyboardShortcutsVersion = 18;
    keyboardShortcuts = [
      {
        id = "zen-compact-mode-toggle";
        key = "c";
        modifiers = {
          control = true;
          alt = true;
        };
      }
      {
        id = "zen-toggle-sidebar";
        key = "x";
        modifiers = {
          control = true;
          alt = true;
        };
      }
      # Common
      {
        id = "key_close";
        key = "q";
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

      # disabled keys
      {
        id = "key_quitApplication";
        disabled = true;
      }
    ];
  };
}
