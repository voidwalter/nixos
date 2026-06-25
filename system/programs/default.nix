{
  imports = [
    ./qt.nix
    ./xdg.nix
    ./bash.nix
    ./fonts.nix
    ./neovim.nix
    ./hyprland.nix
    ./container.nix
  ];

  programs = {
    appimage.enable = true;
    dconf.enable = true;
    direnv = {
      enable = true;
      nix-direnv.enable = true;
      loadInNixShell = false;
      enableBashIntegration = true;
      settings = {
        global = {
          log_format = "-";
          log_filter = "^$";
        };
      };
    };
    nix-ld.enable = true;
  };
}
