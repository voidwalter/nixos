{ config, pkgs, ... }:

{
  imports = [
    ./foot.nix
    ./wofi.nix
    ./imv_mpv.nix
    ./zathura.nix
    ./network/vesktop.nix
  ];
}
