{ pkgs, ... }:

{
  programs.nixvim = {
    # Install colorschemes as regular plugins
    extraPlugins = with pkgs.vimPlugins; [
      gruvbox
      everforest
      nord-nvim
      neovim-ayu
      dracula-nvim
      catppuccin-nvim
      tokyonight-nvim
    ];
    
    # Active colorscheme
    colorscheme = "nord";
  };
}
