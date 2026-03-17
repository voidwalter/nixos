{ config, pkgs, ... }:

{
  imports = [
    ./plugins
    ./ui
    ./misc
    ./autocmds.nix
    ./keymaps.nix
    ./options.nix
  ];

  home.shellAliases.v = "nvim";

  programs.nixvim = {
    enable = true;
    defaultEditor = true;

    nixpkgs.useGlobalPackages = true;

    viAlias = true;
    vimAlias = true;

    
    globals = {
        mapleader = " ";
        maplocalleader = " ";
        have_nerd_font = true;
    };
  };
}
