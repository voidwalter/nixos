{ pkgs, lib,... }:

{
  networking = {
    hostName = "nixie";
    networkmanager.enable = true;
    nameservers = [
      # "8.8.8.8"
      # "8.8.4.4"
      # "1.1.1.1"
    ];
    firewall = {
      enable = true;
      allowedTCPPorts = [
        22
        80
      ];
      allowedUDPPorts = [
        # 59010
      ];
    };
  };

  # Enable Security Services
  security = { 
    rtkit.enable = true;    # allows Pipewire to use realtime scheduler
    sudo-rs = {
      enable = true;
      execWheelOnly = true;
    };
  };


  environment.systemPackages = with pkgs; [
    gnupg
    openssl
    networkmanagerapplet
  ];
}
