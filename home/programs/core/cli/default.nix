{ config, ... }:

{
  imports = [
    ./bat.nix
    ./git.nix
    ./fzf.nix
    ./ssh.nix
    ./btop.nix
    ./tmux.nix
    ./shell.nix
    ./fetch/fastfetch.nix
  ];
}
