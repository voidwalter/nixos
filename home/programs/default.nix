{ config, pkgs, ... }:

{
  imports = [
    ./cli
    ./neovim
    ./zen/zen.nix
    ./zen/zenTwilight.nix
    ./foot.nix
    # ./discord.nix
    ./newsboat.nix
    ./librewolf.nix
    # ./qutebrowser.nix
    ./plewer/zathura.nix
    ./plewer/imv_mpv.nix
  ];
}
