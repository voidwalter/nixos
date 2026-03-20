{
  programs.nixvim = {
    plugins.telescope = {
      enable = true;
      extensions.fzf-native = { enable = true; };

      keymaps = {
        "<leader>ff" = {
          action = "find_files";
          options = { desc = "Find Files"; };
        };
        "<leader>fg" = {
          action = "live_grep";
          options = { desc = "Live Grep"; };
        };
        "<leader>fb" = {
          action = "buffers";
          options = { desc = "Buffers"; };
        };
        "<leader>fh" = {
          action = "help_tags";
          options = { desc = "Help Tags"; };
        };
        "<leader>fk" = {
          action = "keymaps";
          options = { desc = "Keymaps"; };
        };
        "<leader>fc" = {
          action = "commands";
          options = { desc = "Commands"; };
        };
        "<leader>fo" = {
          action = "oldfiles";
          options = { desc = "Oldfiles"; };
        };
        "<leader>fs" = {
          action = "lsp_document_symbols";
          options = { desc = "Document Symbols (LSP)"; };
        };

        # FZF like bindings
        "<C-p>" = "git_files";
        "<leader>p" = "oldfiles";
        "<C-f>" = "live_grep";
      };

      settings.defaults = {
        file_ignore_patterns = [
          "^.git/"
          "^.mypy_cache/"
          "^__pycache__/"
          "^output/"
          "^data/"
          "%.ipynb"
          "%.pdf"
          "%.lock"
        ];
        set_env.COLORTERM = "truecolor";
      };
    };

    # Find TODOs
    keymaps = [
      {
        mode = "n";
        key = "<C-t>";
        action.__raw = ''
          function()
            require('telescope.builtin').live_grep({
              default_text="TODO",
              initial_mode="normal"
            })
          end
        '';
        options.silent = true;
      }
    ];
  };
}
