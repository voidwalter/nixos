{
  programs.nixvim = {
    plugins = {
			lualine.enable = true;
	    web-devicons.enable = true;
 			colorizer.enable = true;
			
			todo-comments = {
				enable = true;
				settings.signs = true;
			};

			hlchunk = {
				enable = true;
				settings = {
					blank = {
						enable = false;
					};
					chunk = {
						chars = {
							horizontal_line = "─";
							left_bottom = "╰";
							left_top = "╭";
							right_arrow = "─";
							vertical_line = "│";
						};
						enable = true;
						exclude_filetypes = {
							lazyterm = true;
							neo-tree = true;
						};
						style.fg = "#91cef0";
						use_treesitter = true;
					};
					indent = {
						chars = [
							"│"
						];
						exclude_filetypes = {
							lazyterm = true;
							neo-tree = true;
						};
						style = {
							fg = "#45475a";
						};
						use_treesitter = true;
					};
					line_num = {
						style = "#91bef0";
						use_treesitter = true;
					};
				};
			};

			dashboard = {
				enable = true;
				autoLoad = true;
				theme = "hyper";
				settings = {
					change_to_vcs_root = true;
					config = {
						footer = ["Homo Sapiens!?" ];
						header = [
							"███╗   ██╗██╗██╗  ██╗██╗   ██╗██╗███╗   ███╗"
							"████╗  ██║██║╚██╗██╔╝██║   ██║██║████╗ ████║"
							"██╔██╗ ██║██║ ╚███╔╝ ██║   ██║██║██╔████╔██║"
							"██║╚██╗██║██║ ██╔██╗ ╚██╗ ██╔╝██║██║╚██╔╝██║"
							"██║ ╚████║██║██╔╝ ██╗ ╚████╔╝ ██║██║ ╚═╝ ██║"
							"╚═╝  ╚═══╝╚═╝╚═╝  ╚═╝  ╚═══╝  ╚═╝╚═╝     ╚═╝"
						];
						mru = {
							cwd_only = true;
							label = " Recents(cwd):";
							limit = 13;
						};
						project = {
							enable = true;
							limit = 5;
							label = " Recents Projects:";
							icon = "󰏓 ";
						};
						shortcut = [
							{
								action = {
									__raw = "function(path) vim.cmd('Telescope find_files') end";
								};
								desc = "Files";
								group = "Label";
								icon = " ";
								icon_hl = "@variable";
								key = "f";
							}
							{
								action = "Telescope app";
								desc = " Apps";
								group = "DiagnosticHint";
								key = "a";
							}
							{
								action = "Telescope live_grep";
								desc = "  Grep Text";
								group = "Number";
								key = "g";
							}
						];
						week_header.enable = false;
					};
				};
			};

			transparent = {
        enable = true;
        settings = {
        	extra_groups = [
						"BufferLineBackground"
						"BufferLineTab"
						"BufferLineTabSelected"
						"BufferLineTabClose"
						"BufferLineFill"
						"BufferLineSeparator"
						"BufferLineIndicatorSelected"
						"BufferLineCloseButton"
						"BufferLineModified"
						"BufferLineModifiedSelected"
						"StatusLine"
						"StatusLineNC"
						"WinBar"
						"WinBarNC"
						"NormalFloat"
						"Pmenu"
						"PmenuSel"
						"PmenuSbar"
						"PmenuThumb"
						"FloatBorder"
						"FloatTitle"
						"NvimTreeNormal"
						"NvimTreeNormalNC"
						"NvimTreeEndOfBuffer"
						"NeoTreeNormal"
						"NeoTreeNormalNC"
						"NeoTreeEndOfBuffer"
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
      	};
			};
		};
  };
}
