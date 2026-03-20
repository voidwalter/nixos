{
  programs.nixvim = {
    plugins = {
      luasnip.enable = true;

      blink-cmp-nixpkgs-maintainers.enable = true;
      blink-cmp = {
        enable = true;
        autoLoad = true;
        setupLspCapabilities = true;

        settings = {
          cmdline.enabled = false;

          snippets.preset = "luasnip";
          appearance = {
              nerd_font_variant = "normal";
              use_nvim_cmp_as_default = true;
          };
          completion = {
            accept = {
              auto_brackets = {
                enabled = true;
                semantic_token_resolution = {
                  enabled = false;
                };
              };
            };
            documentation = {
              auto_show = true;
            };
          };

          keymap = {
            "<Tab>" = [ "select_next" "fallback" ];
            "<S-Tab>" = [ "select_prev" "fallback" ];
            "<CR>" = [ "select_and_accept" "fallback" ];
            "<C-space>" = [ "show" "show_documentation" "hide_documentation" ];
            "<C-b>" = [ "scroll_documentation_up" "fallback" ];
            "<C-f>" = [ "scroll_documentation_down" "fallback" ];
          };

          sources = {
            default = [
              "lsp"
              "path"
              "snippets"
              "buffer"
            ];
            providers = {
              buffer.opts.get_bufnrs.__raw = "vim.api.nvim_list_bufs";

              nixpkgs_maintainers = {
                name = "nixpkgs maintainers";
                module = "blink_cmp_nixpkgs_maintainers";
              };
            };
            per_filetype = {
              markdown = [
                "nixpkgs_maintainers"
              ];
            };
          };
        };
      };
    };
  };
}
