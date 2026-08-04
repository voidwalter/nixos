{ pkgs, config, ... }:

{
  networking = {
    hostName = "nix";
    networkmanager = {
      enable = true;
    };
    # nameservers = ;
    # nftables.enable = true; # netfilter: provide a new packet fitering framework

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
      blockPorn = false;
      blockSocial = false;
    };
    useNetworkd = true;
    dhcpcd.enable = false;

    nat = {
      enable = true;
      internalInterfaces = [ "ve-+" ];
      externalInterface = [ "eth0" ];
      enableIPv6 = true;
    };

    hosts = {
      "192.168.102.1" = [ "forgejo-containers" ];
    };
  };

  # services = {
  #   tailscale.enable = true;
  #   resolved = {
  #     enable = true;
  #     settings = {
  #       Resolve = {
  #         DNSOverTLS = true;
  #         DNSSEC = "allow-downgrade";
  #         Domains = [ "~." ];
  #         # FallbackDNS = ;
  #       };
  #     };
  #   };
  # };

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
