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
						"<C-j>" = "cmp.mapping.select_next_item()";
						"<C-k>" = "cmp.mapping.select_prev_item()";
						"<C-d>" = "cmp.mapping.scroll_docs(-4)";
						"<C-f>" = "cmp.mapping.scroll_docs(4)";
						"<C-x>" = "cmp.mapping.complete()";
						"<C-e>" = "cmp.mapping.abort()";
						"<Tab>" = ''
              cmp.mapping(function(fallback)
                if cmp.visible() then
                  cmp.select_next_item()
                elseif luasnip.expand_or_jumpable() then
                  luasnip.expand_or_jump()
                else
                  fallback()
                end
              end, { "i", "s" })
            '';

            "<S-Tab>" = ''
              cmp.mapping(function(fallback)
                if cmp.visible() then
                  cmp.select_prev_item()
                elseif luasnip.locally_jumpable(-1) then
                  luasnip.jump(-1)
                else
                  fallback()
                end
              end, { "i", "s" })
            '';
					};
				};
			};
		};
  };
}
