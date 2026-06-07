{ config, ... }:

{
  imports = [
    ./appEntries.nix
    ./mimeapps.nix
  ];

  xdg = {
    enable = true;
    userDirs =
      let
        home = config.home.homeDirectory;
      in
      {
        enable = true;
        createDirectories = true;
        desktop = null;
        documents = null;
        download = "${home}/Downloads";
        pictures = "${home}/Pictures";
        music = null;
        publicShare = null;
        templates = null;
        videos = "${home}/Videos";
        extraConfig = {
          XDG_PROJECTS_DIR = "${home}/Projects";
        };
      };
  };
}
