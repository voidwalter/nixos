{
  programs.nixvim.plugins = {
		which-key.enable = true;
		nvim-autopairs.enable = true;
    lz-n.enable = true;
		barbar = {
			enable = true;
			keymaps = {
				next.key = "<leader>bn";
				previous.key = "<leader>bp";
				moveNext.key = "<leader>bN";
				movePrevious.key = "<leader>bP";

				close.key = "<leader>bc";
				closeAllButCurrent.key = "<leader>bo";

				goTo1.key = "<leader>1";
				goTo2.key = "<leader>2";
				goTo3.key = "<leader>3";
				goTo4.key = "<leader>4";
				goTo5.key = "<leader>5";
				goTo6.key = "<leader>6";
				goTo7.key = "<leader>7";
				goTo8.key = "<leader>8";
				goTo9.key = "<leader>9";
			};
			settings = {
				animation = true;
				highlight_visible = true;
				auto_hide = 1;
				clickable = false;
				focus_on_clock = "previous";
				exclude_ft = [ ];
				exclude_name = [
					"UnicodeTable.txt"
				];
				hide.extensions = true;
				icons = {
					button = false;
					separator_at_end = false;
				};
			};
		};
		
		luasnip = {
			enable = true;
			settings = {
				enable_autosnippets = true;
			};
			fromLua = [
				{
					paths = ./snippets;
				}
			];
		};

		oil = {
			enable = true;
			autoLoad = true;
			settings = {
				columns = [
					"icon"
				];
				keymaps = {
					"<C-r>" = "actions.refresh";
					"<leader>qq" = "actions.close";
					"y." = "actions.copy_entry_path";
				};
				skip_confirm_for_simple_edits = true;
				constrain_cursor = "editable";
				default_file_explorer = true;
				view_options = {
					show_hidden = true;
				};
				float = {
					padding = 2;
					max_width = 90;
					max_height = 0.9;
					border = "rounded";
				};
				win_options = {
					concealcursor = "ncv";
					conceallevel = 3;
					cursorcolumn = false;
					foldcolumn = "0";
					list = false;
					signcolumn = "no";
					spell = false;
					wrap = false;
				};
			};
		};

		floatterm = {
			enable = true;
			settigns = {
				height = 0.9;
				autoclose = 0;
				keymap_kill = "<Leader>fk";
				keymap_new = "<Leader>ft";
				keymap_next = "<Leader>fn";
				keymap_prev = "<Leader>fp";
				keymap_toggle = "<Leader>t";
				opener = "edit ";
				rootmarkers = [
					"build/CMakeFiles"
					".project"
					".git"
					".hg"
					".svn"
					".root"
				];
				title = "";
				width = 0.9;
			};
		};

		gitsigns = {
      enable = true;
      settings.signs = {
        add.text = "+";
        change.text = "~";
      };
    };

		noice = {
			enable = true;
			settings = {
        notify = {
          enabled = false;
        };
        messages = {
          enabled = true; # Adds a padding-bottom to neovim statusline when set to false for some reason
        };
        lsp = {
          message = {
            enabled = true;
          };
          progress = {
            enabled = false;
            view = "mini";
          };
        };
        popupmenu = {
          enabled = true;
          backend = "nui";
        };
        format = {
          filter = {
            pattern = [
              ":%s*%%s*s:%s*"
              ":%s*%%s*s!%s*"
              ":%s*%%s*s/%s*"
              "%s*s:%s*"
              ":%s*s!%s*"
              ":%s*s/%s*"
            ];
            icon = "";
            lang = "regex";
          };
          replace = {
            pattern = [
              ":%s*%%s*s:%w*:%s*"
              ":%s*%%s*s!%w*!%s*"
              ":%s*%%s*s/%w*/%s*"
              "%s*s:%w*:%s*"
              ":%s*s!%w*!%s*"
              ":%s*s/%w*/%s*"
            ];
            icon = "󱞪";
            lang = "regex";
          };
				};
			};
		};

		zen-mode = {
			enable = true;
			settings = {
				on_close = ''
					function()
						require("gitsigns.actions").toggle_current_line_blame()
						vim.cmd('IBLEnable')
						vim.opt.relativenumber = true
						vim.opt.signcolumn = "yes:2"
						require("gitsigns.actions").refresh()
					end
				'';
				on_open = ''
					function()
						require("gitsigns.actions").toggle_current_line_blame()
						vim.cmd('IBLDisable')
						vim.opt.relativenumber = false
						vim.opt.signcolumn = "no"
						require("gitsigns.actions").refresh()
					end
				'';
				plugins = {
					gitsigns = {
						enabled = true;
					};
					options = {
						enabled = true;
						ruler = false;
						showcmd = false;
					};
					tmux = {
						enabled = false;
					};
					twilight = {
						enabled = false;
					};
				};
				window = {
					backdrop = 0.95;
					height = 1;
					options = {
						signcolumn = "no";
					};
					width = 0.8;
				};
			};
		};

		notify = {
			enable = true;
			settings = {
				background_colour = "#000000";
				fps = 30;
				icons = {
					debug = "";
					error = "";
					info = "";
					trace = "✎";
					warn = "";
				};
				level = "info";
				max_height = 7;
				max_width = 60;
				minimum_width = 40;
				render = "default";
				stages = "fade_in_slide_out";
				timeout = 5000;
				top_down = true;
			};
		};
	};
}
