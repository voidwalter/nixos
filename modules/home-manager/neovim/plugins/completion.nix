{ lib, ...}:

{
  programs.nixvim = {
		plugins = {
			luasnip.enable = true;
			cmp-calc.enable = true;
			cmp-path.enable = true;
			cmp-cmdline.enable = true;
			cmp-buffer.enable = true;
			cmp-nvim-lsp = { enable = true; };
			cmp_luasnip = { enable = true; };
			cmp = {
				enable = true;
				settings = {
					experimental = { ghost_text = true; };
					snippet.expand = ''
						function(args)
							require('luasnip').lsp_expand(args.body)
						end
					'';
					sources = [
						{ name = "nvim_lsp"; }
						{ name = "luasnip"; }
						{
							name = "buffer";
							option.get_bufnrs.__raw = "vim.api.nvim_list_bufs";
						}
						{ name = "nvim_lua"; }
						{ name = "path"; }
						{ name = "copilot"; }
					];

					formatting = {
						fields = [ "abbr" "kind" "menu" ];
						format = lib.mkForce ''
							function(_, item)
								local icons = {
									Namespace = "󰌗",
									Text = "󰉿",
									Method = "󰆧",
									Function = "󰆧",
									Constructor = "",
									Field = "󰜢",
									Variable = "󰀫",
									Class = "󰠱",
									Interface = "",
									Module = "",
									Property = "󰜢",
									Unit = "󰑭",
									Value = "󰎠",
									Enum = "",
									Keyword = "󰌋",
									Snippet = "",
									Color = "󰏘",
									File = "󰈚",
									Reference = "󰈇",
									Folder = "󰉋",
									EnumMember = "",
									Constant = "󰏿",
									Struct = "󰙅",
									Event = "",
									Operator = "󰆕",
									TypeParameter = "󰊄",
									Table = "",
									Object = "󰅩",
									Tag = "",
									Array = "[]",
									Boolean = "",
									Number = "",
									Null = "󰟢",
									String = "󰉿",
									Calendar = "",
									Watch = "󰥔",
									Package = "",
								}

								local icon = icons[item.kind] or ""
								item.kind = string.format("%s %s", icon, item.kind or "")
								return item
							end
						'';
					};

					window = {
						completion = {
							winhighlight =
								"FloatBorder:CmpBorder,Normal:CmpPmenu,CursorLine:CmpSel,Search:PmenuSel";
							scrollbar = false;
							sidePadding = 0;
							border = [ "╭" "─" "╮" "│" "╯" "─" "╰" "│" ];
						};

						settings.documentation = {
							border = [ "╭" "─" "╮" "│" "╯" "─" "╰" "│" ];
							winhighlight =
								"FloatBorder:CmpBorder,Normal:CmpPmenu,CursorLine:CmpSel,Search:PmenuSel";
						};
					};

					mapping = {
						"<C-Space>" = "cmp.mapping.complete()";
						"<C-d>" = "cmp.mapping.scroll_docs(-4)";
						"<C-e>" = "cmp.mapping.close()";
						"<C-f>" = "cmp.mapping.scroll_docs(4)";
						"<CR>" = "cmp.mapping.confirm({ select = true })";
						"<S-Tab>" = "cmp.mapping(cmp.mapping.select_prev_item(), {'i', 's'})";
						"<Tab>" = "cmp.mapping(cmp.mapping.select_next_item(), {'i', 's'})";
					};
				};
			};
		};
  };
}
