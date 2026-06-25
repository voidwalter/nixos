{ config, ... }: {
  imports = [
    ./zed
    ./nixvim
    ./helix.nix
  ];
}
