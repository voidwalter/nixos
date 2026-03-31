{ lib, pkgs, ... }:

{
	# Image Viewer
	programs.imv = {
    enable = true;
    settings.binds = {
      h = "prev";
      j = "zoom -5";
      k = "zoom 5";
      l = "next";
    };
  };

	# Media Player
  programs.mpv = {
    enable = true;

    config = {
      # fullscreen = true;
      screenshot-format = "png";

      title = "\${filename} - mpv";
      script-opts = "osc-title=\${filename},osc-boxalpha=150,osc-visibility=never,osc-boxvideo=yes";

      osd-on-seek = "yes";
      osd-bar = "yes";
      osd-bar-w = 30;
      osd-bar-h = "0.2";
      osd-duration = 750;
      autofit = "65%";
      subs-fallback = false;
    };

    bindings = {
      "ctrl+a" = "script-message osc-visibility cycle";
      "ctrl+s" = "script-binding subtitle_lines/list_subtitles";
      "Del" = "run \"trash\" \"\${path}\"; playlist_next";
    };
  };

  xdg.configFile = {
    "mpv/scripts/run_websocket_server.lua".text = # lua
      ''
        mp.command_native_async({
          name = "subprocess",
          playback_only = false,
          capture_stdout = true,
          capture_stderr = true,
        })
      '';

    "mpv/script-opts/uosc.conf".text = lib.concatStrings [
      "opacity="
      ",timeline=0.1"
      ",position=0.2"
      ",chapters=0.075"
      ",slider=0.1"
      ",slider_gauge=0.2"
      ",controls=0"
      ",speed=0.2"
      ",menu=1"
      ",submenu=0.4"
      ",border=1"
      ",title=1"
      ",tooltip=1"
      ",thumbnail=1"
      ",curtain=0.8"
      ",idle_indicator=0.8"
      ",audio_indicator=0.5"
      ",buffering_indicator=0.3"
      ",playlist_position=0.8"
    ];
  };

	# Document viewer
	programs.zathura = {
    enable = true;
    options = {
      recolor-lightcolor = "rgba(0,0,0,0)";
      default-bg = "rgba(0,0,0,0.7)";
      guioptions = "v";
      statusbar-basename = true;
      render-loading = false;
      font = "Inter 12";
      selection-notification = true;
      selection-clipboard = "clipboard";
      adjust-open = "best-fit";
      pages-per-row = "1";
      scroll-page-aware = "true";
      scroll-full-overlap = "0.01";
      scroll-step = "100";
      zoom-min = "10";
    };

    extraConfig = "include catppuccin-mocha";
  };

  xdg.configFile = {
    "zathura/catppuccin-latte".source = pkgs.fetchurl {
      name = "zathura-catppuccin-latte";
      url = "https://raw.githubusercontent.com/catppuccin/zathura/9f29c2c1622c70436f0e0b98fea9735863596c1e/themes/catppuccin-latte";
      hash = "sha256-GbSSl8k0Rqtq5IwcAHE7BiTajozNc+z+VhCAkbFDi2E=";
    };
    "zathura/catppuccin-mocha".source = pkgs.fetchurl {
      name = "zathura-catppuccin-mocha";
      url = "https://raw.githubusercontent.com/catppuccin/zathura/9f29c2c1622c70436f0e0b98fea9735863596c1e/themes/catppuccin-mocha";
      hash = "sha256-aUUT1ExI5kEeEawwqnW+n0XWe2b5j4tFdJbCh4XCFIs=";
    };
  };
}
