{ config, pkgs, ... }:

{
  imports = [
    ./oil.nix
    ./noice.nix
    ./which-key.nix
  ];
  programs.nixvim = {
    plugins.notify.enable = true;
    plugins.floatterm.enable = true;
    nvim-autopairs.enable = true;
    vim-surround.enable = true;
    web-devicons.enable = true;
  };
}
