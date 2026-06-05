{ pkgs, ... }:

{
  programs = {
		imv = {
			enable = true;
      package = pkgs.imv;
			settings = {
				binds = {
					h = "prev";
					j = "zoom -5";
					k = "zoom 5";
					l = "next";
				};
			};
		};

		mpv = {
			enable = true;
      package = pkgs.mpv;
			scripts = with pkgs.mpvScripts; [
				mpris
				sponsorblock
				thumbnail
				webtorrent-mpv-hook
			];
		};
	};
}
