{ config, ... }:

{
  imports = [
    ./bat.nix
    ./git.nix
    ./fzf.nix
    ./btop.nix
    ./tmux.nix
    ./shell.nix
    ./zsh.nix
    ./fetch/fastfetch.nix
  ];
}
