{ inputs, pkgs, ...}: let
  firefox-addons = inputs.firefox-addons.packages.${pkgs.stdenv.hostPlatform.system};
in {
  programs.zen-browser.profiles.twilight = {
    settings = {
      "zen.workspaces.continue-where-left-off" = true;
      "zen.view.compact.hide-tabbar" = true;
      "zen.urlbar.behavior" = "float";
      "zen.welcome-screen.seen" = false;
    };
    extensions.packages = with firefox-addons; [
      ublock-origin
      darkreader
      bitwarden
      vimium
      dearrow
      istilldontcareaboutcookies
    ];
    mods = [
      "906c6915-5677-48ff-9bfc-096a02a72379" # Floating Status Bar
      "e122b5d9-d385-4bf8-9971-e137809097d0" # No Top Sites
      "253a3a74-0cc4-47b7-8b82-996a64f030d5" # Floating History
      "7190e4e9-bead-4b40-8f57-95d852ddc941" # Tab title fixes
      "72f8f48d-86b9-4487-acea-eb4977b18f21" # better <C-Tab>
    ];

    spacesForce = true; # Delete spaces not declared here
    spaces = {
      "main" = {
        id = "c6de089c-410d-4206-961d-ab11f988d40a";
        position = 1000;
      };
    };
 
    containersForce = true;
    containers = {
      shityBrowse = {
        color = "purple";
        icon = "briefcase";
        id = 2;
      };
      ggokk = {
        color = "red";
        icon = "dollar";
        id = 3;
      };
    };
    search = {
      force = true;
      default = "brave";
      engines = {
        brave = {
          definedAliases = ["@b"];
          name = "Brave Search";
          urls = [
            {
              template = "https://search.brave.com/search?q={searchTerms}";
            }
          ];
        };
      };
    };
  };
}
