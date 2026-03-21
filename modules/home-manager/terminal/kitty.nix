{
  config,
  lib,
  ...
}: let
  cfg = config.modules.terminal.kitty;
in {
  options.modules.terminal.kitty.enable = lib.mkEnableOption "Enable kitty terminal";

  config = lib.mkIf cfg.enable {
    programs.kitty = {
      enable = true;

      extraConfig = ''
				font_family      FiraCode Nerd Font
				bold_font        auto
				italic_font      auto
				bold_italic_font auto

				cursor_shape block

				background_opacity 0.8
				dynamic_background_opacity 1
				confirm_os_window_close 0

				scrollback_lines 2000
				scrollback_indicator_opacity 1.0
				wheel_scroll_multiplier 5.0
				wheel_scroll_min_lines 1
				cursor_trail 2
				linux_display_server auto
				scrollback_lines 2000
				wheel_scroll_min_lines 1
				enable_audio_bell yes
				window_padding_width 4
				selection_foreground none
				selection_background none
				foreground #dddddd
				background #000000
				cursor #dddddd

				### KEYBINDS
				# Font size (very common need)
				map ctrl+shift+k        change_font_size all +1.0
				map ctrl+shift+j        change_font_size all -1.0
				map ctrl+equal          change_font_size all 0.0

				# ──── Scrolling (most important part when tmux is handling panes) ────────────

				# Line by line 
				map ctrl+k            scroll_line_up
				map ctrl+j            scroll_line_down

				# Page jumps
				map ctrl+shift+page_up    scroll_page_up
				map ctrl+shift+page_down  scroll_page_down

				# Top / bottom of scrollback
				map ctrl+shift+home   scroll_home
				map ctrl+shift+end    scroll_end

				# Jump between shell prompts (needs shell integration – very useful)
				map ctrl+shift+z      scroll_to_prompt -1   # previous prompt
				map ctrl+shift+x      scroll_to_prompt 1    # next prompt


				# ──── Scrollback browsing in pager (extremely powerful) ──────────────────────
				map ctrl+shift+h      show_scrollback       # open whole scrollback in pager
				map ctrl+shift+g      show_last_command_output  # last command output in pager


				# ──── Search in scrollback ──────────────────────────────────────────────────
				map ctrl+shift+slash  search_scrollback     # start search (/? style)
				# After starting search:
				#   enter / esc     → finish/cancel
				#   ctrl+shift+g    → next match (default, you can keep it)
				#   ctrl+shift+shift+g → previous match (if rebound)


				# ──── Copy / Paste ──────────────────────────────────────────────────────────
				map ctrl+shift+c      copy_to_clipboard
				map ctrl+shift+v      paste_from_clipboard


				# ──── Hints (kitty's killer feature – pick urls/paths/numbers fast) ─────────
				map ctrl+shift+e      open_url_with_hints           # show numbered hints for urls → open
				map ctrl+shift+p>f    kitten hints --type path --program -          # insert path
				map ctrl+shift+p>shift+f  kitten hints --type path                  # open path
				map ctrl+shift+p>l    kitten hints --type line --program -          # insert line
				map ctrl+shift+p>w    kitten hints --type word --program -          # insert word
				map ctrl+shift+p>y    kitten hints --type hyperlink                 # open hyperlink


				# ──── Other very practical ones ─────────────────────────────────────────────
				map ctrl+shift+u      kitten unicode_input          # insert unicode char

				map ctrl+f11    toggle_fullscreen
				map ctrl+shift+f10    toggle_maximized              # maximized window (not fullscreen)

				map ctrl+shift+a>1    set_background_opacity 1      # fully opaque
				map ctrl+shift+a>d    set_background_opacity default
				map ctrl+shift+a>m    set_background_opacity +0.1   # more transparent
				map ctrl+shift+a>l    set_background_opacity -0.1   # less transparent

				map ctrl+shift+delete clear_terminal reset active   # like reset
				map ctrl+shift+f5     load_config_file              # reload kitty.conf

				map ctrl+shift+f12     edit_config_file

      '';
    };
  };
}
