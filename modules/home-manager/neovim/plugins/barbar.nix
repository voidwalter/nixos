{
  programs.nixvim.plugins.barbar = {
    enable = true;
    keymaps = {
      "<leader>1" = { action = "<Cmd>BufferGoto 1<CR>"; options = { silent = true; desc = "Buffer 1"; }; };
      "<leader>2" = { action = "<Cmd>BufferGoto 2<CR>"; options = { silent = true; desc = "Buffer 2"; }; };
      "<leader>3" = { action = "<Cmd>BufferGoto 3<CR>"; options = { silent = true; desc = "Buffer 3"; }; };
      "<leader>4" = { action = "<Cmd>BufferGoto 4<CR>"; options = { silent = true; desc = "Buffer 4"; }; };
      "<leader>5" = { action = "<Cmd>BufferGoto 5<CR>"; options = { silent = true; desc = "Buffer 5"; }; };
      "<leader>6" = { action = "<Cmd>BufferGoto 6<CR>"; options = { silent = true; desc = "Buffer 6"; }; };
      "<leader>7" = { action = "<Cmd>BufferGoto 7<CR>"; options = { silent = true; desc = "Buffer 7"; }; };
      "<leader>8" = { action = "<Cmd>BufferGoto 8<CR>"; options = { silent = true; desc = "Buffer 8"; }; };
      "<leader>9" = { action = "<Cmd>BufferGoto 9<CR>"; options = { silent = true; desc = "Buffer 9"; }; };
      "<leader>0" = { action = "<Cmd>BufferLast<CR>";   options = { silent = true; desc = "Last Buffer"; }; };

      # Close / manage buffers
      "<leader>bc" = { action = "<Cmd>BufferClose<CR>"; options = { silent = true; desc = "Close Buffer"; }; };
      "<leader>bp" = { action = "<Cmd>BufferPickClose<CR>"; options = { silent = true; desc = "Pick & Close Buffer"; }; };
      "<leader>bh" = { action = "<Cmd>BufferHide<CR>"; options = { silent = true; desc = "Hide Buffer"; }; };

      # Navigation
      "<leader>bn" = { action = "<Cmd>BufferNext<CR>"; options = { silent = true; desc = "Next Buffer"; }; };
      "<leader>bb" = { action = "<Cmd>BufferPrevious<CR>"; options = { silent = true; desc = "Previous Buffer"; }; };

      # force delete
      "<leader>bd" = { action = "<Cmd>bd<CR>"; options = { silent = true; desc = "Delete Buffer"; }; };
      next.key = "<TAB>";
      previous.key = "<S-TAB>";
      close = {
        key = "<C-w>";
        # No delay after pressing C-w
        options.nowait = true;
      };
    };
  };
}
