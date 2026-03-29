{ config, ... }:

{
  programs.nixvim = {
		plugins = {
			alpha = {
				enable = true;
				settings.layout = [
					{
						type = "padding";
						val = 2;
					}
					{
						opts = {
							# TODO: Test other options
							#hl = "Type";
							position = "center";
						};
						type = "text";
						val = [
							"░▒▓███████▓▒░ ░▒▓██████▓▒░░▒▓████████▓▒░▒▓█▓▒░░▒▓█▓▒░ "
							"░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░      ░▒▓█▓▒░░▒▓█▓▒░ "
							"░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░      ░▒▓█▓▒░░▒▓█▓▒░ "
							"░▒▓███████▓▒░░▒▓█▓▒░░▒▓█▓▒░▒▓██████▓▒░ ░▒▓████████▓▒░ "
							"░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░      ░▒▓█▓▒░░▒▓█▓▒░ "
							"░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░      ░▒▓█▓▒░░▒▓█▓▒░ "
							"░▒▓███████▓▒░ ░▒▓██████▓▒░░▒▓█▓▒░      ░▒▓█▓▒░░▒▓█▓▒░ "
							"                                                      "
						];
					}
					{
						type = "padding";
						val = 2;
					}
					{
						type = "group";
						val = [
							{
								on_press = {
									__raw = "function() vim.cmd[[enew]] end";
								};
								opts = {
									shortcut = "";
									position = "center";
								};
								type = "button";
								val = "  New file";
							}
							{
								type = "padding";
								val = 1;
							}
							{
								on_press = {
									__raw = "function() vim.cmd[[Oil]] end";
								};
								opts = {
									shortcut = "";
									position = "center";
								};
								type = "button";
								val = "  Open Tree (oil)";
							}
							{
								type = "padding";
								val = 1;
							}
							{
								on_press = {
									__raw = "function() vim.cmd[[Telescope find_files]] end";
								};
								opts = {
									shortcut = "";
									position = "center";
								};
								type = "button";
								val = "  Find File";
							}
							{
								type = "padding";
								val = 1;
							}
							{
								on_press = {
									__raw = "function() vim.cmd[[Telescope oldfiles]] end";
								};
								opts = {
									shortcut = "";
									position = "center";
								};
								type = "button";
								val = "  Recent File";
							}
							{
								type = "padding";
								val = 1;
							}
							{
								on_press = {
									__raw = "function() vim.cmd[[qa]] end";
								};
								opts = {
									shortcut = "";
									position = "center";
								};
								type = "button";
								val = " Quit";
							}
						];
					}
					{
						type = "padding";
						val = 2;
					}
					{
						opts = {
							position = "center";
						};
						type = "text";
						val = "Neovim - C++ Optimized";
					}
				];
			};
			illuminate.settings.filetypes_denylist = ["alpha"];
			lualine.settings.options.disabled_filetypes = {
				statusline = ["alpha"];
				winbar = ["alpha"];
			};
		};
	};
}
