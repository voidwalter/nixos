{ ... }:

{
  programs.nixvim = {
    plugins.oil = {
      enable = true;
      
      settings = {
        default_file_explorer = true;
        columns = {
          icon = "";
        };
        keymaps = {
          "<C-p>" = false;
          "<C-l>" = "actions.select_vsplit";
          "<C-k>" = "actions.select_split";
        };
        view_options = {
          show_hidden = true;
        };
      };
    };
  };
}
