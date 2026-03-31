{ config, ... }:

{
  programs.nixvim.plugins.dashboard = {
		enable = true;
		autoLoad = true;
		theme = "hyper";
		settings = {
			change_to_vcs_root = true;
			config = {
				footer = "Homo Sapiens!?";
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
}
