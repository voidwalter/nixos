{
  programs.nixvim.plugins = {
		which_key.enable = true;
		nvim-autopairs.enable = true;
    lz-n.enable = true;

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
				};
				skip_confirm_for_simple_edits = true;
				constrain_cursor = "editable";
				default_file_explorer = true;
				view_options = {
					show_hidden = true;
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

		gitsigns = {
      enable = true;
      settings.signs = {
        add.text = "+";
        change.text = "~";
      };
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
				on_close = {
					__raw = "function() print('Window closed') end";
				};
				on_open = {
					__raw = "function() print('Window opened') end";
				};
				render = "default";
				stages = "fade_in_slide_out";
				timeout = 5000;
				top_down = true;
			};
		};
	};
}
