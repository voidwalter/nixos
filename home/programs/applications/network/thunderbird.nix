{ config, ... }: {
  programs.thunderbird = {
    enable = true;
    languagePacks = [ "en-GB" ];
    policies = {
      AppAutoUpdate = true;
      BlockAboutAddons = true;
      BlockAboutProfiles = true;

      DisableTelemetry = true;
      ExtensionSettings = {
        "addoncompatibility@opto.one" = {
          install_url = "https://addons.thunderbird.net/thunderbird/downloads/latest/addon-compatibility-check/latest.xpi";
          installation_mode = "normal_installed";
        };
      };
    };
  };
}
