{
  imports = [
    ./qt.nix
    ./xdg.nix
    # ./zsh.nix
    ./fonts.nix
    # ./neovim.nix
    ./docker.nix
    ./hyprland.nix
    # ./container.nix
  ];

  programs = {
    appimage.enable = true;
    dconf.enable = true;
    firefox.enable = true;
    zsh.enable = true;
    direnv = {
      enable = true;
      nix-direnv.enable = true;
      loadInNixShell = false;
      enableZshIntegration = true;
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
