{ pkgs, config, ... }: {
  services.hyprpaper = {
    enable = true;
    package = pkgs.hyprpaper;
  };
}
