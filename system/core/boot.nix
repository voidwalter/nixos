{ config, ... }: {
  boot = {
    loader = {
      efi.canTouchEfiVariables = true;
      systemd-boot.enable = true;
    };
  };

  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true;
  };

  # greetd = {
  #   enable = true;
  #   settings = {
  #     default_session = {
  #       command = "${pkgs.greetd}/bin/agreety --cmd ${pkgs.hyprland}/bin/start-hyprland";
  #     };
  #   };
  # };

  programs.qylock = {
    enable = true;
    theme = "Genshin";
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
}
