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
    # firefox.enable = true;
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
    qylock = {
      enable = true;
      theme = "sword";
      sddm.enable = true; # installs theme + sets it active (default)
      quickshell.enable = true; # adds `qylock-lock` to PATH (default)

      # Optional per-theme tweaks (replaces the interactive prompts):
      themeOptions = {
        terraria.backgroundMode = "time"; # time | random | static
        Genshin.backgroundMode = "time";
        clockwork.orbital = {
          themeMode = "dark";
          enableWindup = true;
        };
        osu.gameMode = "menu"; # menu | game
      };
    };
  };
}
