{ pkgs, config, ... }:

{
  networking = {
    hostName = "nixos";
    networkmanager = {
      enable = true;
    };
    firewall = {
      enable = true;
      # lists of ports: https://en.wikipedia.org/wiki/List_of_TCP_and_UDP_port_numbers
      allowedTCPPorts = [
        22
        80
        443
				3000
				8080
				9090
      ];
      autoLoadConntrackHelpers = false;
      connectionTrackingModules = [ ];
    };

    stevenBlackHosts = {
    	enable = true;
    	enableIPv6 = true;
    	blockFakenews = true;
    	blockGambling = true;
    	blockPorn = true;
    	blockSocial = false;
    };
    useNetworkd = true;
    dhcpcd.enable = false;
  };

  security = {
    enableWrappers = true;
    # protectKernelImage = false;
    acme.acceptTerms = true;
    rtkit = {
      enable = true; # allows Pipewire to use realtime scheduler
      package = pkgs.rtkit;
    };
    sudo-rs = {
      enable = true;
      package = pkgs.sudo-rs;
      execWheelOnly = true;
      wheelNeedsPassword = false;
    };
  };
}
