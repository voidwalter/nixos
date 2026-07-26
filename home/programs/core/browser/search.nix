{ pkgs, ... }:
{
  force = true;
  default = "searx";
  privateDefault = "searx";
  engines =
    let
      nixSnowflakeIcon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
    in
    {
      "searx" = {
        definedAliases = [ "@sx" ];
        name = "SearXNG";
        urls = [
          {
            template = "http://localhost:8080/search?q={searchTerms}";
          }
        ];
      };

      "brave" = {
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

      "github" = {
        definedAliases = [ "@gh" ];
        name = "GitHub Search";
        urls = [
          {
            template = "https://github.com/search?q={searchTerms}";
          }
        ];
      };

      "Nix Packages" = {
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
        icon = nixSnowflakeIcon;
        definedAliases = [ "@pkgs" ];
      };
      "Nix Options" = {
        urls = [
          {
            template = "https://search.nixos.org/options";
            params = [
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
        icon = nixSnowflakeIcon;
        definedAliases = [ "@nop" ];
      };
      "Home Manager Options" = {
        urls = [
          {
            template = "https://home-manager-options.extranix.com/";
            params = [
              {
                name = "query";
                value = "{searchTerms}";
              }
              {
                name = "release";
                value = "master"; # unstable
              }
            ];
          }
        ];
        icon = nixSnowflakeIcon;
        definedAliases = [ "hmop" ];
      };
    };
}
