{ pkgs, lib, ... }:

{
	xdg.desktopEntries = {
		github = {
			name = "GitHub";
			exec = "zen-beta  https://github.com/";
			categories = [ "X-Work" ];
			genericName = "GitHub Web App";
			icon = "github";
			mimeType = [ "x-scheme-handler/github" ];
		};
		
    ddocs = {
			name = "dDocs";
			exec = "zen-beta  https://docs.fileverse.io/";
			categories = [ "X-Work, X-Office" ];
			genericName = "Document Editor - Fileverse";
			icon = "fileverse";
			mimeType = [ "x-scheme-handler/office" ];
		};

		dsheets = {
			name = "dSheets";
			exec = "zen-beta  https://sheets.fileverse.io/";
			categories = [ "X-Work, X-Office" ];
			genericName = "Sheets - Fileverse";
			icon = "fileverse";
			mimeType = [ "x-scheme-handler/office" ];
		};
	};
}
