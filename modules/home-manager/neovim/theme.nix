{ pkgs, ... }:
{
  programs.nixvim = {
		colorschemes = {
			catppuccin = {
				enable = true;
				settings = {
					background = {
						light = "macchiato";
						dark = "mocha";
					};
					custom_highlights = ''
						function(highlights)
							return {
							CursorLineNr = { fg = highlights.peach, style = {} },
							NavicText = { fg = highlights.text },
							}
						end
					'';
					flavour = "mocha"; # "latte", "mocha", "frappe", "macchiato"
					no_bold = false;
					no_italic = false;
					no_underline = false;
					transparent_background = false;
					integrations = {
						cmp = true;
						notify = true;
						gitsigns = true;
						neotree = true;
						which_key = true;
						illuminate = {
							enabled = true;
							lsp = true;
						};
						navic = {
							enabled = true;
							custom_bg = "NONE";
						};
						treesitter = true;
						telescope.enabled = true;
						mini = {
							enabled = true;
							indentscope_color = "rosewater";
						};
						native_lsp = {
							enabled = true;
							inlay_hints = {
								background = true;
							};
							virtual_text = {
								errors = ["italic"];
								hints = ["italic"];
								information = ["italic"];
								warnings = ["italic"];
								ok = ["italic"];
							};
							underlines = {
								errors = ["underline"];
								hints = ["underline"];
								information = ["underline"];
								warnings = ["underline"];
							};
						};
					};
				};
			};

			kanagawa = {
				enable = false;
				settings = {
					colors = {
						palette = {
							fujiWhite = "#FFFFFF";
							sumiInk0 = "#000000";
						};
						theme = {
							all = {
								ui = {
									bg_gutter = "none";
								};
							};
							dragon = {
								syn = {
									parameter = "yellow";
								};
							};
							wave = {
								ui = {
									float = {
										bg = "none";
									};
								};
							};
						};
					};
					commentStyle = {
						italic = true;
					};
					compile = false;
					dimInactive = false;
					functionStyle = { };
					overrides = "function(colors) return {} end";
					terminalColors = true;
					theme = "wave";
					transparent = false;
					undercurl = true;
				};
			};
		};
	};
}
