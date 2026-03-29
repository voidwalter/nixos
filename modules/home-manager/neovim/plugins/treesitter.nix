{
  programs.nixvim.plugins = {
    treesitter = {
      enable = true;

      nixvimInjections = true;

      settings = {
        highlight.enable = true;
        indent.enable = true;
        autotag.enable = true;
        folding.enable = true;
        ensure_installed = [
          "bash"
          "c"
          "cpp"
          "json"
          "markdown"
          "markdown_inline"
          "regex"
          "toml"
          "vimdoc"
          "yaml"
          "nix"
          "vim"
        ];
        autoinstall = true;
        nixvimInjections = true;
      };
    };
  };
}
