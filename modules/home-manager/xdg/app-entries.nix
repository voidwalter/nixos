{ pkgs, lib, ... }:

{
  xdg.desktopEntries =
  let
		webb = lib.getExe pkgs.librewolf;
  in
  {
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
    youtube = {
      name = "Youtube";
      exec = "${webb} --app=https://youtube.com/";
      categories = [
        "Network"
				"Education"
      ];
      genericName = "Youtube | Raficaus";
      icon = "youtube";
      mimeType = [ "x-scheme-handler/youtube " ];
    };
  };
}
