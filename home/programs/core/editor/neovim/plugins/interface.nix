{
  programs.nixvim = {
    plugins = {
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
      lualine = {
        enable = true;
        settings = {
          options = {
            disabled_filetypes = {
              __unkeyed-1 = "startify";
              __unkeyed-2 = "neo-tree";
              statusline = [
                "dap-repl"
              ];
              winbar = [
                "aerial"
                "dap-repl"
                "neotest-summary"
              ];
            };
            globalstatus = true;
          };
          sections = {
            lualine_a = [
              "mode"
            ];
            lualine_b = [
              "branch"
            ];
            lualine_c = [
              "filename"
              "diff"
            ];
            lualine_x = [
              "diagnostics"
              {
                __unkeyed-1 = {
                  __raw = ''
                    function()
                        local msg = ""
                        local buf_ft = vim.bo[0].filetype
                        local clients = vim.lsp.get_clients({ bufnr = 0 })
                        if next(clients) == nil then
                            return msg
                        end
                        for _, client in ipairs(clients) do
                            local filetypes = client.config.filetypes
                            if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
                                return client.name
                            end
                        end
                        return msg
                    end
                  '';
                };
                color = {
                  fg = "#ffffff";
                };
                icon = "";
              }
              "encoding"
              "fileformat"
              "filetype"
            ];
            lualine_y = [
              {
                __unkeyed-1 = "aerial";
                colored = true;
                cond = {
                  __raw = ''
                    function()
                      local buf_size_limit = 1024 * 1024
                      if vim.api.nvim_buf_get_offset(0, vim.api.nvim_buf_line_count(0)) > buf_size_limit then
                        return false
                      end

                      return true
                    end
                  '';
                };
                dense = false;
                dense_sep = ".";
                depth = {
                  __raw = "nil";
                };
                sep = " ) ";
              }
            ];
            lualine_z = [
              {
                __unkeyed-1 = "location";
              }
            ];
          };
          tabline = {
            lualine_a = [
              {
                __unkeyed-1 = "buffers";
                symbols = {
                  alternate_file = "";
                };
              }
            ];
            lualine_z = [
              "tabs"
            ];
          };
          # winbar = {
          #   lualine_c = [
          #     {
          #       __unkeyed-1 = "navic";
          #     }
          #   ];
          #   lualine_x = [
          #     {
          #       __unkeyed-1 = "filename";
          #       newfile_status = true;
          #       path = 3;
          #       shorting_target = 150;
          #     }
          #   ];
          # };
        };
      };
      dashboard = {
        enable = true;
        autoLoad = true;
        settings = {
          change_to_vcs_root = true;
          config = {
            week_header.enable = false;
            footer = [ "Homo Sapiens!?" ];
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
              limit = 15;
            };
            project = {
              enable = true;
              limit = 10;
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
                icon = "";
                icon_hl = "@variable";
                key = "f";
              }
              {
                action = "Telescope";
                desc = "  Telescope";
                group = "DiagnosticHint";
                key = "t";
              }
              {
                action = "Telescope live_grep";
                desc = "  Grep Text";
                group = "Number";
                key = "g";
              }
            ];
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
