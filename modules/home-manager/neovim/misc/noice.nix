{ ... }:
{
  programs.nixvim = {
      plugins.which-key = {
        enable = true;
        lazyLoad.settings.event = "DeferredUIEnter";

        settings = {
          spec = [
            {
              __unkeyed-1 = "<leader>b";
              group = "Buffers";
            }
            {
              __unkeyed-1 = "<leader>f";
              group = "Find";
            }
            {
              __unkeyed-1 = "<leader>g";
              group = "Git";
              mode = [ "n" "v" ];
            }
            {
              __unkeyed-1 = "<leader>l";
              group = "LSP";
            }
            {
              __unkeyed-1 = "<leader>s";
              group = "Search";
            }
            {
              __unkeyed-1 = "<leader>u";
              group = "UI";
            }
            {
              __unkeyed-1 = "<leader>w";
              icon = "";
            }
            {
              __unkeyed-1 = "<leader>/";
              icon = "";
            }
          ];

          replace = {
            desc = [
              [ "<space>" "SPACE" ]
              [ "<leader>" "SPACE" ]
            ];
          };
          
          win = {
            border = "single";
          };
        };
      };

      # Keymaps for noice
      keymaps = [
        {
          mode = "n";
          key = "<leader>fn";
          action = "<cmd>Noice<CR>";
          options = {
            desc = "Show notifications";
          };
        }
        {
          mode = "c";
          key = "<S-Enter>";
          action.__raw = ''
            function()
              require("noice").redirect(vim.fn.getcmdline())
            end
          '';
          options = {
            desc = "Redirect command to popup";
          };
        }
      ];
    };
}
