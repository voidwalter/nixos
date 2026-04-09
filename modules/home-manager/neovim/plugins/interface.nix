{
  programs.nixvim = {
    plugins = {
			lualine.enable = true;
	    web-devicons.enable = true;
			colorizer.enable = true;
			modicator.enable = true;

			todo-comments = {
				enable = true;
				settings.signs = true;
			};

			smear-cursor = {
				enable = true;
				settings = {
					distance_stop_animating = 0.5;
					hide_target_hack = false;
					stiffness = 0.8;
					trailing_stiffness = 0.5;
				};
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
						# --- Standard UI ---
						"Normal"
						"NormalNC"
						"NormalFloat"
						"FloatBorder"
						"FloatTitle"
						"LineNr"
						"SignColumn"
						"CursorLine"
						"CursorLineNr"
						"EndOfBuffer"
						"NonText"
						
						# --- Status & Tabs ---
						"StatusLine"
						"StatusLineNC"
						"WinBar"
						"WinBarNC"
						"TabLine"
						"TabLineSel"
						"TabLineFill"

						# --- Popups & Menus ---
						"Pmenu"
						"PmenuSel"
						"PmenuSbar"
						"PmenuThumb"
						"NvimTreeNormal"
						"NvimTreeNormalNC"

						# --- barbar.nvim
						"BufferCurrent"
						"BufferCurrentSign"
						"BufferCurrentMod"
						"BufferVisible"
						"BufferVisibleSign"
						"BufferVisibleMod"
						"BufferInactive"
						"BufferInactiveSign"
						"BufferInactiveMod"
						"BufferTabpages"
						"BufferTabpageFill"

						# --- oil.nvim ---
						"OilFile"
						"OilDir"
						"OilLink"
						"OilPreview"
						"OilHidden"

						# --- telescope.nvim ---
						"TelescopeNormal"
						"TelescopeBorder"
						"TelescopePromptNormal"
						"TelescopePromptBorder"
						"TelescopeResultsNormal"
						"TelescopeResultsBorder"
						"TelescopePreviewNormal"
						"TelescopePreviewBorder"

						# --- dap-ui.nvim ---
						"DapUIScope"
						"DapUIType"
						"DapUIValue"
						"DapUIModifiedValue"
						"DapUIDecoration"
						"DapUIThread"
						"DapUIStoppedThread"
						"DapUISource"
						"DapUILineNumber"
						"DapUIFloatBorder"
						"DapUIWatchesEmpty"
						"DapUIWatchesValue"
						"DapUIWatchesError"
						"DapUIBreakpointsPath"
						"DapUIBreakpointsInfo"
						"DapUIBreakpointsDisabledLine"
						"DapUIBreakpointsCurrentLine"

						# --- floatterm.nvim ---
						"FTermNormal" 
						"FTermBorder"

						# --- Syntax
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
					];
				};
			};
		};
  };
}
