{ config, ... }:

{
  imports = [
    ./quickshell
    ./wayland
    ./qt.nix
  ];
}
