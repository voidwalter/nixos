{	inputs, pkgs, ...}:
{
  imports = [
    inputs.nixvim.homeModules.nixvim
    ./plugins
		./theme.nix
    ./keymaps.nix
    ./options.nix
  ];

  home.shellAliases.v = "nvim";
	home.packages = with pkgs; [
    ripgrep
    fd
    alejandra
    nixpkgs-fmt
    nixfmt
    vimPlugins.vim-prettier
    yapf
    black
    isort
    hadolint
    shfmt
  ];

  programs.nixvim = {
    enable = true;
    defaultEditor = true;
    nixpkgs.useGlobalPackages = true;
    viAlias = true;
    vimAlias = true;
		globals = {
        mapleader = " ";
        maplocalleader = "\\";
        loaded_netrw = 1;
        loaded_netrwPlugin = 1;
    };

    extraPlugins = with pkgs.vimPlugins; [
      gruvbox
      everforest
      nord-nvim
      neovim-ayu
      dracula-nvim
			kanagawa-nvim
      catppuccin-nvim
      tokyonight-nvim
    ];
  };
}
