{ config, lib, ... }:

{
  programs.nixvim = {
    keymaps = [
      { key = "<Space>"; action = "<NOP>"; options.desc = "Disable space key"; }
      { key = "<esc>"; action = ":noh<CR>"; options.silent = true; options.desc = "Clear search highlighting"; }
      { key = "<C-c>"; action = ":b#<CR>"; options.desc = "Switch to previous buffer"; }
      { key = "<C-x>"; action = ":close<CR>"; options.desc = "Close current window"; }
      { key = "<C-s>"; action = ":w<CR>"; options.desc = "Save file"; }
      { key = "<leader>h"; action = "<C-w>h"; options.desc = "Go to left window"; }
      { key = "<leader>l"; action = "<C-w>l"; options.desc = "Go to right window"; }
      { key = "H"; action = "^"; options.desc = "Go to first non-blank character"; }
      { key = "L"; action = "$"; options.desc = "Go to end of line"; }
      { key = "<C-Up>"; action = ":resize -2<CR>"; options.desc = "Decrease window height"; }
      { key = "<C-Down>"; action = ":resize +2<CR>"; options.desc = "Increase window height"; }
      { key = "<C-Left>"; action = ":vertical resize +2<CR>"; options.desc = "Increase window width"; }
      { key = "<C-Right>"; action = ":vertical resize -2<CR>"; options.desc = "Decrease window width"; }
      { key = "<M-k>"; action = ":move-2<CR>"; options.desc = "Move line up"; }
      { key = "<M-j>"; action = ":move+<CR>"; options.desc = "Move line down"; }
      { key = "<leader>bn"; action = "<Cmd>bnext<CR>"; options.desc = "Next buffer"; }

      { key = "<C-s>"; action = "<Esc>:w<CR>"; options.desc = "Save file from insert mode"; }

      { key = "H"; action = "^"; options.desc = "Go to first non-blank character (visual)"; }
      { key = "L"; action = "$"; options.desc = "Go to end of line (visual)"; }
      { key = "<M-k>"; action = ":move-2<CR>"; options.desc = "Move selected lines up"; }
      { key = "<M-j>"; action = ":move+<CR>"; options.desc = "Move selected lines down"; }

      {mode = "n"; key = "<C-d>"; action = "<C-d>zz"; options.desc = "Half page down (centered)";}
      {mode = "n"; key = "<C-u>"; action = "<C-u>zz"; options.desc = "Half page up (centered)";}

      # Buffer navigation
      {mode = "n"; key = "<leader>bn"; action = "<Cmd>bnext<CR>"; options.desc = "Next buffer";}
      {mode = "n"; key = "<leader>bp"; action = "<Cmd>bprevious<CR>"; options.desc = "Previous buffer";}

      # Splitting & Resizing
      {mode = "n"; key = "<leader>sv"; action = "<Cmd>vsplit<CR>"; options.desc = "Split window vertically";}
      {mode = "n"; key = "<leader>sh"; action = "<Cmd>split<CR>"; options.desc = "Split window horizontally";}
      {mode = "n"; key = "<C-Up>"; action = "<Cmd>resize +2<CR>"; options.desc = "Increase window height";}
      {mode = "n"; key = "<C-Down>"; action = "<Cmd>resize -2<CR>"; options.desc = "Decrease window height";}
      {mode = "n"; key = "<C-Left>"; action = "<Cmd>vertical resize -2<CR>"; options.desc = "Decrease window width";}
      {mode = "n"; key = "<C-Right>"; action = "<Cmd>vertical resize +2<CR>"; options.desc = "Increase window width";}

      # Better indenting in visual mode
      {mode = "v"; key = "<"; action = "<gv"; options.desc = "Indent left and reselect";}
      {mode = "v"; key = ">"; action = ">gv"; options.desc = "Indent right and reselect";}

      # Disable arrow keys in normal mode
      {mode = "n"; key = "<left>"; action = "<cmd>echo \"Use h to move!!\"<CR>";}
      {mode = "n"; key = "<right>"; action = "<cmd>echo \"Use l to move!!\"<CR>";}
      {mode = "n"; key = "<up>"; action = "<cmd>echo \"Use k to move!!\"<CR>";}
      {mode = "n"; key = "<down>"; action = "<cmd>echo \"Use j to move!!\"<CR>";}

      # ── Auto-session ──
      {mode = "n"; key = "<leader>wr"; action = "<cmd>SessionRestore<CR>"; options.desc = "Restore session for cwd";}
      {mode = "n"; key = "<leader>ws"; action = "<cmd>SessionSave<CR>"; options.desc = "Save session for auto session root dir";}

      # ── Oil ──
      {mode = "n"; key = "<leader>-"; action = "<CMD>Oil<CR>"; options.desc = "Oil: Open parent directory";}
      {mode = "n"; key = "<leader>e"; action.__raw = "function() require('oil').toggle_float() end"; options.desc = "Oil: Toggle float";}

      # ── Trouble ──
      {mode = "n"; key = "<leader>xx"; action = "<cmd>Trouble diagnostics toggle<cr>"; options.desc = "Trouble: Diagnostics (Workspace)";}
      {mode = "n"; key = "<leader>d"; action = "<cmd>Trouble diagnostics toggle filter.buf=0<cr>"; options.desc = "Trouble: Buffer Diagnostics";}
      {mode = "n"; key = "gr"; action = "<cmd>Trouble lsp_references toggle<cr>"; options.desc = "Trouble: LSP References";}
      {mode = "n"; key = "gd"; action = "<cmd>Trouble lsp_definitions toggle<cr>"; options.desc = "Trouble: LSP Definitions";}
      {mode = "n"; key = "gD"; action = "<cmd>Trouble lsp_declarations toggle<cr>"; options.desc = "Trouble: LSP Declarations";}
      {mode = "n"; key = "gi"; action = "<cmd>Trouble lsp_implementations toggle<cr>"; options.desc = "Trouble: LSP Implementations";}
      {mode = "n"; key = "gt"; action = "<cmd>Trouble lsp_type_definitions toggle<cr>"; options.desc = "Trouble: LSP Type Definitions";}
      {mode = "n"; key = "<leader>cs"; action = "<cmd>Trouble lsp_document_symbols toggle<cr>"; options.desc = "Trouble: Document Symbols";}
      {mode = "n"; key = "<leader>cS"; action = "<cmd>Trouble lsp_workspace_symbols toggle<cr>"; options.desc = "Trouble: Workspace Symbols";}
      {mode = "n"; key = "<leader>xl"; action = "<cmd>Trouble loclist toggle<cr>"; options.desc = "Trouble: Location List";}
      {mode = "n"; key = "<leader>xq"; action = "<cmd>Trouble qflist toggle<cr>"; options.desc = "Trouble: Quickfix List";}
      {mode = "n"; key = "<leader>xt"; action = "<cmd>Trouble todo toggle<CR>"; options.desc = "Open todos in trouble";}
      {mode = "n"; key = "[q"; action.__raw = "function() require('trouble').prev({ skip_groups = true, jump = true }) end"; options.desc = "Trouble: Previous Item";}
      {mode = "n"; key = "]q"; action.__raw = "function() require('trouble').next({ skip_groups = true, jump = true }) end"; options.desc = "Trouble: Next Item";}

    ];
  };
}
