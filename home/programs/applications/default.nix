{ config, pkgs, ... }:

{
  imports = [
    ./foot.nix
    ./wofi.nix
    ./vesktop.nix
    ./newsboat.nix
    ./imv_mpv.nix
    ./zathura.nix
  ];
}
