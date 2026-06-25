{ config, pkgs, ... }:

{
  imports = [
    ./cli
    ./editor
    ./browser/zen.nix
    # ./browser/brave.nix
    ./browser/zenTwilight.nix
    # ./browser/qutebrowser.nix
  ];
}
