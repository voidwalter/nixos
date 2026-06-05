{ inputs, pkgs, ... }: {
  imports = [
    inputs.hyprshell.homeModules.hyprshell
  ];
  programs.hyprshell = {
    enable = true;
    package = inputs.hyprshell.packages.${pkgs.stdenv.hostPlatform.system}.hyprshell-slim;

    # settings = {
    #   windows = {
    #     enable = true;
    #     scale = 8.0;
    #     items_per_row = 5; # Note: camelCase in RON config, but Nix module maps snake_case
    #     overview = {
    #       enable = true;
    #       key = "space";      # sometimes 'super_l'
    #       modifier = "super";
    #       filter_by = [ "current_monitor" ];
    #       hide_filtered = false;
    #
    #       launcher = {
    #         launch_modifier = "ctrl";
    #         width = 650;
    #         max_items = 6;
    #         show_when_empty = true;
    #
    #         plugins = {
    #           applications = {
    #             run_cache_weeks = 8;
    #             show_execs = true;
    #             show_actions_submenu = true;
    #           };
    #           terminal = { };
    #           # shell = ;
    #           websearch = {
    #             engines = [
    #               {
    #                 url = "https://www.duckduckgo.com/search?q={}";
    #                 name = "DuckDuckGo";
    #                 key = "d";
    #               }
    #               {
    #                 url = "https://www.youtube.com/results?search_query={}";
    #                 name = "Youtube";
    #                 key = "y";
    #               }
    #               {
    #                 url = "https://search.nixos.org/packages?query={}";
    #                 name = "Search NixOS";
    #                 key = "n";
    #               }
    #               {
    #                 url = "https://www.reddit.com/search/?q={}";
    #                 name = "Reddit";
    #                 key = "r";
    #               }
    #               {
    #                 url = "https://en.wikipedia.org/wiki/Special:Search?search={}";
    #                 name = "Wikipedia";
    #                 key = "w";
    #               }
    #             ];
    #           };
    #           calc = { };
    #           path = { };
    #         };
    #       };
    #     };
    #
    #     switch = {
    #       enable = true;
    #       modifier = "alt";
    #       key = "Tab";
    #       filter_by = [ "current_monitor" ];
    #       switch_workspaces = false;
    #     };
    #
    #     switch_2 = {};
    #   };
    # };
  };
}   
