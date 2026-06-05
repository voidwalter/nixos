{ inputs, pkgs, ... }:
let
  firefox-addons = inputs.firefox-addons.packages.${pkgs.stdenv.hostPlatform.system};
in
{
  programs.zen-browser.profiles.default = {
    settings = {
      "zen.workspaces.continue-where-left-off" = true;
      "zen.view.compact.hide-tabbar" = true;
      "zen.urlbar.behavior" = "float";
      "zen.welcome-screen.seen" = true;
    };

    extensions.packages = with firefox-addons; [
      ublock-origin
      darkreader
      bitwarden
      raindropio
      istilldontcareaboutcookies
    ];

    sine = {
      enable = true;
      mods = [
        "context-menu-icons"
        "906c6915-5677-48ff-9bfc-096a02a72379" # Floating Status Bar
        "e122b5d9-d385-4bf8-9971-e137809097d0" # No Top Sites
        "253a3a74-0cc4-47b7-8b82-996a64f030d5" # Floating History
        "7190e4e9-bead-4b40-8f57-95d852ddc941" # Tab title fixes
        "72f8f48d-86b9-4487-acea-eb4977b18f21" # better <C-Tab>
      ];
    };

    spacesForce = true; # Delete spaces not declared here
    spaces = {
      "main" = {
        id = "c6de089c-410d-4206-961d-ab11f988d40a";
        position = 1000;
      };
      "tmp" = {
        id = "cdd10fab-4fc5-494b-9041-325e5759195b";
        position = 2000;
        theme = {
          type = "gradient";
          colors = [
            {
              red = 100;
              green = 150;
              blue = 200;
              algorithm = "floating";
              type = "explicit-lightness";
              lightness = 50;
            }
          ];
          opacity = 0.8;
          texture = 0.5;
        };
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
      Docs = {
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

    search = {
      force = true;
      default = "brave";
      bing.metaData.hidden = "true";
      google.metaData.hidden = "true";
      engines = {
        brave = {
          definedAliases = [ "@b" ];
          name = "Brave Search";
          urls = [
            {
              template = "https://search.brave.com/search?q={searchTerms}";
            }
          ];
        };

        "ddg" = {
          definedAliases = [ "@ddg" ];
          name = "DuckDuckGo";
          urls = [
            {
              template = "https://duckduckgo.com";
              params = [
                {
                  name = "q";
                  value = "{searchTerms}";
                }
              ];
            }
          ];
        };

        mynixos = {
          icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
          definedAliases = [ "@nx" ];
          name = "My NixOS";
          urls = [
            {
              template = "https://mynixos.com/search?q={searchTerms}";
              params = [
                {
                  name = "query";
                  value = "searchTerms";
                }
              ];
            }
          ];
        };
        "Nix Packages" = {
          icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
          definedAliases = [ "@pkgs" ];
          urls = [
            {
              template = "https://search.nixos.org/packages";
              params = [
                {
                  name = "type";
                  value = "packages";
                }
                {
                  name = "channel";
                  value = "unstable";
                }
                {
                  name = "query";
                  value = "{searchTerms}";
                }
              ];
            }
          ];
        };
        github = {
          definedAliases = [ "@gh" ];
          name = "GitHub Search";
          urls = [
            {
              template = "https://github.com/search?q={searchTerms}";
            }
          ];
        };
      };
    };
  };
}
