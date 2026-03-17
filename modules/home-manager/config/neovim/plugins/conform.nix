{ lib, ...}:

{
  programs.nixvim = {
    conform-nvim = {
      enable = true;
      settings = {
        notify_on_error = false;
        format_on_save = {
          timeout_ms = 5000;
          lsp_format = "fallback";
        };
        formatters_by_ft = {
          c = ["clang-format"];
          cpp = ["clang-format"];
          nix = ["alejandra"];
          json = ["prettierd"];
          markdown = ["prettierd"];
        };
        formatters = {
          "clang-format" = {
            prepend_args = ["-style=file" "-fallback-style=LLVM"];
          };
        };
      };
    };
  };
}
