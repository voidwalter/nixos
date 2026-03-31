{
  # Import all your configuration modules here
  imports = [ 
    ./telescope.nix
    ./buffer.nix
    ./oil.nix
    ./cmp.nix
		./dashboard.nix
    ./treesitter.nix
    ./lsp.nix
    ./which-key.nix
    ./markdown-preview.nix
    ./autopairs.nix
    #./neo-tree.nix
		./hlchunk.nix
    ./lualine.nix
    ./colorizer.nix
    ./conform.nix
    ./trouble.nix
    ./noice.nix
    ./lint.nix
    ./lspkind.nix
    ./vimtex.nix
    ./typst.nix
    ./luasnip.nix
    ./lspsaga.nix
		./ui.nix
  ];

  programs.nixvim.plugins = {
    lz-n.enable = true;

    web-devicons.enable = true;

    gitsigns = {
      enable = true;
      settings.signs = {
        add.text = "+";
        change.text = "~";
      };
    };

		smear-cursor = {
			enable = true;
			settings = {
				distance_stop_animating = 0.5;
				hide_target_hack = false;
				stiffness = 0.8;
				trailing_stiffness = 0.5;
			};
		};

    luasnip.enable = true;
  };
}

