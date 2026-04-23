{ pkgs, lib, ... }:

let
	webb = lib.getExe pkgs.librewolf;
in
{
	xdg.desktopEntries = {
		github = {
			name = "GitHub";
			exec = "zen-twilight https://github.com/";
			categories = [
				"Work"
				"Programming"
			];
			genericName = "GitHub Web App";
			icon = "github";
			mimeType = [ "x-scheme-handler/github" ];
		};
	};
}
