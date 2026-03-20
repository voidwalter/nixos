let
  status = [ "Alternate" "Current" "Inactive" "Visible" ];
  part = [
    "ADDED"
    "CHANGED"
    "DELETED"
    "ERROR"
    "HINT"
    "Icon"
    "Index"
    "INFO"
    "Mod"
    "Number"
    "Sign"
    "SignRight"
    "Target"
    "WARN"
  ];

  groups_left = [
    "BufferTabpageFill"
    "BufferTabpages"
    "TabLine"
    "TabLineSel"
    "TabLineFill"
    "NormalFloat"
    "FloatBorder"
  ];

  buffer_status =
    builtins.foldl' (acc: elem: acc ++ elem) [ ]
      (builtins.map (st: builtins.map (p: "Buffer" + st + p) part) status);

  extra_groups = groups_left ++ buffer_status;
in {
  programs.nixvim = {
    plugins = {
      transparent = {
        enable = true;
        settings = {
          extra_groups = extra_groups;
          clear_prefix = "Buffer";
        };
      };
    };

    # Toggle transparency keymap
    keymaps = [
      {
        mode = "n";
        key = "<leader>tt";
        action = "<cmd>TransparentToggle<CR>";
        options = { silent = true; desc = "Toggle transparency"; };
      }
    ];
  };
}
