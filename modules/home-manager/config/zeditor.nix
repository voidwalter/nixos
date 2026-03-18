{ pkgs, lib, config, ... }:

{
  programs.zed-editor = {
    enable = true;
    extensions = [ "c" "cpp" "toml" "qml" "nix" "make" ];
    installRemoteServer = true;
  };

  home.file.".config/zed/settings.json" = {
    text = builtins.toJSON {
      theme = "Transparent Prism - Lavender";
      ui_font_size = 16;
      buffer_font_size = 16;
      font_weight = 450.0;
      ui_font_family = "FiraMono Nerd Font";
      buffer_font_family = "CodeNewRoman Nerd Font";
      show_whitespaces = "all";
      relative_line_numbers = "enabled";
      auto_update = false;
      disable_ai = true;
      vim_mode = true;
      base_keymap = "JetBrains";
      load_direnv = "shell_hook";
      format_on_save = "on";
    };
  };
}
