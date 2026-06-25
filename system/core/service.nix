{
  inputs,
  config,
  pkgs,
  ...
}:

{
  services = {
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

    gvfs = {
      enable = true;
    };

    # hyprpolkitagent = {
    #   enable = true;
    #   packages = pkgs.hyprpolkitagent;
    # };

    dbus = {
      enable = true;
      implementation = "broker";
    };
  };
}
