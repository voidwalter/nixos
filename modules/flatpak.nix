{ lib, ... }:
{
  services.flatpak.enable = true;
  services.flatpak.remotes = [{
    name = "flathub-beta"; location = "https://flathub.org/beta-repo/flathub-beta.flatpakrepo";
  }];
  services.flatpak.packages = [
    { appId = "com.brave.Browser"; origin = "flathub";  }
    "com.github.tchx84.Flatseal"
    "org.kde.gwenview"
    "com.infinipaint.infinipaint"
    "im.riot.Riot"
  ];
}
