{ pkgs, lib, ... }:

let
  search = {
    force = true;
    default = "excite.co.jp";
    privateDefault = "excite.co.jp";

    engines = {
      google.metaData.hidden = true;
      bing.metaData.hidden = true;
      ddg.metaData.hidden = true;
      wikipedia.metaData.hidden = true;
    };
  };

  settings = {
    "extensions.autoDisableScopes" = 0;
    "middlemouse.paste" = true;
    "browser.download.useDownloadDir" = true;
    "browser.tabs.insertAfterCurrent" = true;
    "browser.tabs.warnOnClose" = true;
    "browser.toolbars.bookmarks.visibility" = "never";
    "browser.quitShortcut.disabled" = true;
    "browser.sessionstore.restore_pinned_tabs_on_demand" = true;
    "browser.urlbar.suggest.bookmark" = true;
    "browser.urlbar.suggest.engines" = false;
    "browser.urlbar.suggest.history" = true;
    "browser.urlbar.suggest.openpage" = false;
    "browser.urlbar.suggest.topsites" = false;
    "browser.urlbar.trimHttps" = true;
    "sidebar.position_start" = false;
    "findbar.highlightAll" = true;
    "xpinstall.signatures.required" = false;
    "apz.overscroll.enabled" = false;
    "browser.tabs.hoverPreview.enabled" = true;
    "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
  };
in
{
  programs.librewolf = {
    enable = true;

    package = pkgs.librewolf.override {
      cfg.speechSynthesisSupport = false;
    };

    policies = {
      ExtensionSettings = {
        "showdex@tize.io" = {
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/showdex/latest.xpi";
          installation_mode = "force_installed";
        };

        "{5003e502-f361-4bf6-b09e-41a844d36d33}" = {
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/redlib/latest.xpi";
          installation_mode = "force_installed";
        };

        "uBlock0@raymondhill.net" = {
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/ublock-origin/latest.xpi";
          installation_mode = "force_installed";
        };
      };
    };
  };
}
