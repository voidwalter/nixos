let
  mkLockedAttrs = builtins.mapAttrs (
    _: value: {
      Value = value;
      Status = "locked";
    }
  );

  mkPluginUrl = id: "https://addons.mozilla.org/firefox/downloads/latest/${id}/latest.xpi";

  mkExtensionEntry =
    {
      id,
      pinned ? false,
    }:
    let
      base = {
        install_url = mkPluginUrl id;
        installation_mode = "force_installed";
      };
    in
    if pinned then base // { default_area = "navbar"; } else base;

  mkExtensionSettings = builtins.mapAttrs (
    _: entry: if builtins.isAttrs entry then entry else mkExtensionEntry { id = entry; }
  );
in
{
  AutofillAddressEnabled = false;
  AutofillCreditCardEnabled = false;
  DisableAppUpdate = true;
  DisablePocket = true; # save webs for later reading
  DisableTelemetry = true;
  DisableBuiltinPDFViewer = true;
  DisableFirefoxScreenshots = true;
  DisableFirefoxAccounts = true;
  DisableFeedbackCommands = true;
  DisableFirefoxStudies = true;
  DisableForgetButton = true;
  DontCheckDefaultBrowser = true;
  NoDefaultBookmarks = true;
  OfferToSaveLogins = false;
  SanitizeOnShutdown = {
    FormData = true;
    Cache = true;
  };
  EnableTrackingProtection = {
    Value = true;
    Locked = true;
    Cryptomining = true;
    Fingerprinting = true;
  };

  ExtensionSettings = mkExtensionSettings {
    "uBlock0@raymondhill.net" = mkExtensionEntry {
      id = "ublock-origin";
      pinned = true;
    };
    # about:debugging#/runtime/this-firefox
    "{446900e4-71c2-419f-a6a7-df9c091e268b}" = "bitwarden";
    "{74145f27-f039-47ce-a470-a662b129930a}" = "clearurls";
    "{85860b32-02a8-431a-b2b1-40fbd64c9c69}" = "github-file-icons";
    "{a4c4eda4-fb84-4a84-b4a1-f7c1cbf2a1ad}" = "refined-github-";
    "jid0-adyhmvsP91nUO8pRv0Mn2VKeB84@jetpack" = "raindropio";
    "github-no-more@ihatereality.space" = "github-no-more";
    "github-repository-size@pranavmangal" = "gh-repo-size";
    "jid1-BoFifL9Vbdl2zQ@jetpack" = "decentraleyes";
    "addon@darkreader.org" = "dark-reader";
  };

  Preferences = mkLockedAttrs {
    "browser.startup.homepage" = {
      Value = "about:home";
      Status = "locked";
    };
    "browser.tabs.warnOnClose" = {
      Value = true;
      Status = "locked";
    };
    "browser.aboutConfig.showWarning" = false;
    "media.videocontrols.picture-in-picture.video-toggle.enabled" = true;
    # Disable swipe gestures (Browser:BackOrBackDuplicate, Browser:ForwardOrForwardDuplicate)
    "browser.gesture.swipe.left" = "";
    "browser.gesture.swipe.right" = "";
    "browser.tabs.hoverPreview.enabled" = true;
    "browser.newtabpage.activity-stream.feeds.topsites" = false;
    "browser.topsites.contile.enabled" = false;
    "browser.translations.enable" = false;

    "privacy.resistFingerprinting" = true;
    "privacy.resistFingerprinting.randomization.canvas.use_siphash" = true;
    "privacy.resistFingerprinting.randomization.daily_reset.enabled" = true;
    "privacy.resistFingerprinting.randomization.daily_reset.private.enabled" = true;
    "privacy.resistFingerprinting.block_mozAddonManager" = true;
    "privacy.spoof_english" = 1;

    "privacy.firstparty.isolate" = true;
    "network.cookie.cookieBehavior" = 5;
    "dom.battery.enabled" = false;

    "gfx.webrender.all" = true;
    "network.http.http3.enabled" = true;
    "network.socket.ip_addr_any.disabled" = true; # disallow bind to 0.0.0.0
  };
}
