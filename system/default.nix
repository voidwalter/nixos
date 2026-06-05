{ config, ... }:

{
  imports = [
    ./programs
    ./core/configuration.nix
  ];
}
