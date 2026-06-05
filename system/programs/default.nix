{
  imports = [
    # ./vm.nix
    ./xdg.nix
    ./bash.nix
    ./fonts.nix
    ./neovim.nix
    ./hyprland.nix
  ];

  programs = {
    direnv = {
      enable = true;
      nix-direnv.enable = true;
      enableBashIntegration = true;
    };
    nix-ld.enable = true;
    dconf.enable = true;
  };
}
