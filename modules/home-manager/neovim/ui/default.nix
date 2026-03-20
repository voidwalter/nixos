{ config, ... }:

{
  imports = [
    ./transparent.nix
    ./colorscheme.nix
  ];
  programs.nixvim = {
    plugins = {
      alpha = {
        enable = true;
				settings =  {
					layout = [
						{
							type = "padding";
							val = 2;
						}
						{
							type = "text";
							val = [
								"      █████ █     ██"
								"   ██████  ██    ████ █                                 █"
								"  ██   █  █ ██    ████                    ██           ███"
								" █    █  █  ██    █ █                     ██            █"
								"     █  █    ██   █                ████    ██    ███"
								"    ██ ██    ██   █       ███     █ ███  █  ██    ███ ███    ███ ████ ████"
								"    ██ ██     ██  █      █ ███   █   ████   ██     ███ ███    ███ ████ ███  █"
								"    ██ ██     ██  █     █   ███ ██    ██    ██      ██  ██     ██  ████ ████"
								"    ██ ██      ██ █    ██    █████    ██    ██      ██  ██     ██   ██   ██"
								"    ██ ██      ██ █    ████████ ██    ██    ██      ██  ██     ██   ██   ██"
								"    █  ██       ███    ███████  ██    ██    ██      ██  ██     ██   ██   ██"
								"       █        ███    ██       ██    ██    ██      █   ██     ██   ██   ██"
								"   ████          ██    ████    █ ██████      ███████    ██     ██   ██   ██"
								"  █  █████              ███████   ████        █████     ███ █  ███  ███  ███"
								" █     ██                █████                           ███    ███  ███  ███"
								" █"
								"  █"
								"   ██"
							];
							opts = {
								position = "center";
								hl = "Type";
							};
						}
						{
							type = "padding";
							val = 4;
						}
						{
							type = "group";
							val = [
								{
									type = "button";
									val = "      New File    ";
									on_press.__raw = "function() vim.cmd[[ene]] end";
									opts = {
										shortcut = "n";
										keymap = [
											"n"
											"n"
											"<cmd>ene<CR>"
											{
												noremap = true;
												silent = true;
												nowait = true;
											}
										];
										position = "center";
										width = 50;
										align_shortcut = "right";
										hl_shortcut = "Keyword";
									};
								}
								{
									type = "padding";
									val = 2;
								}
								{
									type = "button";
									val = "      Find File    ";
									opts = {
										shortcut = "f";
										keymap = [
											"n"
											"f"
											"<cmd>lua require('fzf-lua').files({ cwd = vim.loop.cwd() })<CR>"
											{
												noremap = true;
												silent = true;
												nowait = true;
											}
										];
										position = "center";
										width = 50;
										align_shortcut = "right";
										hl_shortcut = "Keyword";
									};
								}
								{
									type = "padding";
									val = 2;
								}
								{
									type = "button";
									val = "      Recent Files    ";
									on_press.__raw = "function() require('telescope.builtin').oldfiles() end";
									opts = {
										shortcut = "r";
										keymap = [
											"n"
											"r"
											"<cmd>lua require('fzf-lua').oldfiles({ cwd = vim.loop.cwd() })<CR>"
											{
												noremap = true;
												silent = true;
												nowait = true;
											}
										];
										position = "center";
										width = 50;
										align_shortcut = "right";
										hl_shortcut = "Keyword";
									};
								}
								{
									type = "padding";
									val = 2;
								}
								{
									type = "button";
									val = "      Find Text    ";
									on_press.__raw = "function() require('telescope.builtin').live_grep() end";
									opts = {
										shortcut = "g";
										keymap = [
											"n"
											"g"
											"<cmd>lua require('fzf-lua').live_grep()<CR>"
											{
												noremap = true;
												silent = true;
												nowait = true;
											}
										];
										position = "center";
										width = 50;
										align_shortcut = "right";
										hl_shortcut = "Keyword";
									};
								}
								{
									type = "padding";
									val = 2;
								}
								{
									type = "button";
									val = "      Quit Neovim    ";
									on_press.__raw = "function() vim.cmd[[qa]] end";
									opts = {
										shortcut = "q";
										keymap = [
											"n"
											"q"
											"<cmd>qa<CR>"
											{
												noremap = true;
												silent = true;
												nowait = true;
											}
										];
										position = "center";
										width = 50;
										align_shortcut = "right";
										hl_shortcut = "Keyword";
									};
								}
							];
						}
					];
				};
      };
    };
  };
}
