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
		"BufferLineTabClose"
    "BufferLineBufferSelected"
    "BufferLineFill"
    "BufferLineBackground"
    "BufferLineSeparator"
    "BufferLineIndicatorSelected"
    "TabLine"
    "TabLineSel"
    "Telescope"
		"Normal"
		"NormalNC"
		"Comment"
		"Constant"
		"Special"
		"Identifier"
		"Statement"
		"PreProc"
		"Type"
		"Underlined"
		"Todo"
		"String"
		"Function"
		"Conditional"
		"Repeat"
		"Operator"
		"Structure"
		"LineNr"
		"NonText"
		"SignColumn"
		"CursorLine"
		"CursorLineNr"
		"StatusLine"
		"StatusLineNC"
		"EndOfBuffer"
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
