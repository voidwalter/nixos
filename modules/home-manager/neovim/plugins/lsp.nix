{
  programs.nixvim.plugins = {
    lsp-format = {
      enable = true;
      lspServersToEnable = "all";
    };

    lsp = {
      enable = true;
      servers = {
        # bash
        bashls.enable = true;
				markdown_oxide.enable = true;
        # C++
        clangd.enable = true;
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
