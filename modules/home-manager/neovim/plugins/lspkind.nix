{
  programs.nixvim.plugins.lspkind = {
    enable = true;
    symbol_map = {
      Copilot = " ";
    };
    settings = {
      maxwidth = 50;
      ellipsis_char = "...";
    };
  };
}
