{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    virt-manager
    virt-viewer
    spice spice-gtk
    spice-protocol
  ];

  virtualisation = {
    libvirtd = {
      enable = true;
      qemu = {
        package = pkgs.qemu;
        swtpm.enable = true;
      };
    };
    spiceUSBRedirection = {
      enable = false;
    };
  };

  services.spice-vdagentd.enable = true;
}
