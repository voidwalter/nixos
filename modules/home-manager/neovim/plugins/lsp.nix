{
  programs.nixvim.plugins = {
    lsp-format = {
      enable = true;
      lspServersToEnable = "all";
    };
		lspsaga = {
			enable = false;
		};
		lspkind = {
			enable = true;
			settings = {
				maxwidth = 50;
				ellipsis_char = "...";
			};
		};

    lsp = {
      enable = true;
      servers = {
        # bash
        bashls.enable = true;
				markdown_oxide.enable = true;
        # C++
				cmake.enable = true;
        clangd = {
          enable = true;
          packageFallback = true;
          cmd = [
            "clangd"
            "--offset-encoding=utf-16"
            "--clang-tidy"
            "--background-index"
            "--limit-references=0"
            "--cross-file-rename"
          ];
          settings.InlayHints = {
            Designators = true;
            Enabled = true;
            ParameterNames = true;
            DeducedTypes = true;
          };
				};
      };

			keymaps = {
				diagnostic = {
					"<leader>E" = "open_float";
					"[" = "goto_prev";
					"]" = "goto_next";
					"<leader>do" = "setloclist";
				};
				lspBuf = {
					"K" = "hover";
					"gD" = "declaration";
					"gd" = "definition";
					"gr" = "references";
					"gI" = "implementation";
					"gy" = "type_definition";
					"<leader>ca" = "code_action";
					"<leader>cr" = "rename";
					"<leader>wl" = "list_workspace_folders";
					"<leader>wr" = "remove_workspace_folder";
					"<leader>wa" = "add_workspace_folder";
				};
			};
    };
  };
}
