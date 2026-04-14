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

    scripts = with pkgs.mpvScripts; [
      mpris
      sponsorblock
      thumbnail
      webtorrent-mpv-hook
    ];

    config = {
      screenshot-format = "png";
      title = "\${filename} - mpv";
      script-opts = "osc-title=\${filename},osc-boxalpha=150,osc-visibility=never,osc-boxvideo=yes";
      loop-playlist = "inf";
      osc = "no";
      volume = 60;
    };

    bindings = {
      "ctrl+a" = "script-message osc-visibility cycle";
      "ctrl+s" = "script-binding subtitle_lines/list_subtitles";
      "Del" = "run \"trash\" \"\${path}\"; playlist_next";
    };
  };

	# Document viewer
	programs.zathura = {
    enable = true;
	};
}
