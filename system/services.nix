{
  inputs,
  config,
  pkgs,
  ...
}:

{
  services = {
    # blueman.enable = true;
    dbus = {
      enable = true;
      implementation = "broker";
    };

    displayManager.sddm = {
      enable = true;
      wayland.enable = true;
      wayland.compositor = "weston";
      settings = {
        Theme = {
          CursorTheme = "Bibata-Modern-Ice";
          CursorSize = 24;
        };
      };
    };

    gvfs.enable = true;
    lact.enable = true;
    mysql = {
      enable = true;
      package = pkgs.mysql84;
      # package = pkgs.mariadb;
    };
    openssh = {
      enable = true;
      startWhenNeeded = true;
      settings = {
        PasswordAuthentication = true;
        PermitRootLogin = "no"; # Never allow direct root login
      };
    };
    pipewire = {
      enable = true;
      pulse.enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
    };

    # hyprpolkitagent = {
    #   enable = true;
    #   packages = pkgs.hyprpolkitagent;
    # };

  };
}
