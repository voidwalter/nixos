{ inputs, pkgs, ... }:
let
  firefox-addons = inputs.firefox-addons.packages.${pkgs.stdenv.hostPlatform.system};
in
{
  programs.zen-browser.profiles.seco = {
    id = 1;
    search = {
      force = true;
      default = "degoog";
      privateDefault = "degoog";
      engines = {
        "degoog" = {
          definedAliases = [ "@dg" ];
          name = "Degoog";
          urls = [
            {
              template = "http://localhost:4444/search?q={searchTerms}";
            }
          ];
        };
      };
    };

    settings = {
      "zen.workspaces.continue-where-left-off" = true;
      "zen.view.compact.hide-tabbar" = true;
      "zen.urlbar.behavior" = "float";
      "zen.welcome-screen.seen" = true;
    };

    extensions.packages = with firefox-addons; [
      ublock-origin
      bitwarden
      darkreader
    ];

    sine = {
      enable = true;
      mods = [
        "context-menu-icons"
        "zen-command-palette"
        "BetterZenGradientPicker"
        "unloaded-tabs"
        "906c6915-5677-48ff-9bfc-096a02a72379" # Floating Status Bar
        "e122b5d9-d385-4bf8-9971-e137809097d0" # No Top Sites
        "253a3a74-0cc4-47b7-8b82-996a64f030d5" # Floating History
        "7190e4e9-bead-4b40-8f57-95d852ddc941" # Tab title fixes
        "72f8f48d-86b9-4487-acea-eb4977b18f21" # better <C-Tab>
      ];
    };

    spacesForce = false; # Delete spaces not declared here
    spaces = {
      "main" = {
        id = "c6de089c-410d-4206-961d-ab11f988d40a";
        position = 1000;
      };
    };

    containersForce = true;
    containers = {
      Personal = {
        color = "blue";
        icon = "fingerprint";
        id = 1;
      };
      shityBrowse = {
        color = "purple";
        icon = "briefcase";
        id = 2;
      };
      social = {
        color = "green";
        icon = "dollar";
        id = 3;
      };
      random = {
        color = "red";
        icon = "briefcase";
        id = 4;
      };
    };

  };
}
