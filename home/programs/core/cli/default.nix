{ config, ... }:

{
  imports = [
    ./bat.nix
    ./ssh.nix
    ./btop.nix
    ./tmux.nix
    ./shell.nix
    ./fetch/fastfetch.nix
  ];
}
