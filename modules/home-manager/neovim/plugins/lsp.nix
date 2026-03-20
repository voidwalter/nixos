{ lib, config, pkgs, ... }:
{
  programs.nixvim = {
    plugins.lspkind.enable = true;
    plugins.lsp = {
      enable = true;
      
      # LSP keybindings
      keymaps = {
        silent = true;
        lspBuf = {
          "gd" = "definition";
          "gD" = "declaration";
          "gr" = "references";
          "gi" = "implementation";
          "gt" = "type_definition";
          "K" = "hover";
          "<F2>" = "rename";
          "<leader>ca" = "code_action";
          "<leader>e" = "next_diagnostic";
          "<leader>E" = "prev_diagnostic";
          "[d" = "diagnostic_next";
          "]d" = "diagnostic_prev";
        };
      };
      
      # LSP servers configuration
      servers = {
        # C/C++ LSP - clangd
        clangd = {
          enable = true;
          cmd = [
            "clangd"
            "--background-index"
            "--clang-tidy"
            "--header-insertion=iwyu"
            "--completion-style=detailed"
            "--function-arg-placeholders"
            "--fallback-style=llvm"
          ];
          installGcc = true;  # Installs gcc for standard libraries
          extraOptions = {
            capabilities = {
              textDocument = {
                completion = {
                  completionItem = {
                    snippetSupport = true;
                  };
                };
              };
            };
            init_options = {
              usePlaceholders = true;
              completeUnimported = true;
              clangdFileStatus = true;
            };
          };
        };
        
        cmake = {
          enable = true;
          cmd = [ "cmake-language-server" ];
        };
      };
    };
  };
}
