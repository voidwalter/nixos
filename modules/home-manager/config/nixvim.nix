{ config, pkgs, ... }:

{
  programs.nixvim = {
    enable = true;
    defaultEditor = true; # Optional: set nvim as default editor

    # Example: enable a colorscheme and a plugin
    colorschemes.gruvbox.enable = true;
    plugins.lightline.enable = true;

    # Your custom vimrc config
    extraConfigLua = ''
      -- Set leader key to space
      vim.g.mapleader = " "
      -- Other custom settings
    '';
  };
}
