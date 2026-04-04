{ config, pkgs, inputs, lib, ... }:

{
  imports = [
    ./types.nix
    ./icons.nix
    ./manager.nix
    ./status.nix
  ];

  home.packages = [ pkgs.exiftool ];
  programs.yazi = {
    enable = true;
    package = inputs.yazi.packages.${pkgs.stdenv.hostPlatform.system}.default;
    enableBashIntegration = config.programs.bash.enable;
    shellWrapperName = "y";

    settings = {
      manager = {
        layout = [
          2
          3
          4
        ];
        sort_by = "alphabetical";
        sort_sensitive = true;
        sort_reverse = false;
        sort_dir_first = true;
        linemode = "none";
        show_hidden = false;
        show_symlink = true;
      };

      preview = {
        tab_size = 2;
        max_width = 600;
        max_height = 900;
        cache_dir = config.xdg.cacheHome;
      };
    };

    keymap.manager.prepend_keymap = [
      {
        on = [ "<C-n>" ];
        run = ''shell '${lib.getExe pkgs.ripdrag} "$@" -x 2>/dev/null &' --confirm'';
      }
    ];
  };
}
