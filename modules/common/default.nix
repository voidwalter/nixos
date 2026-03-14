{ config, ...}:

{
  imports = [
    ./appearences.nix
    ./dev.nix
    ./hyprland.nix
    ./programs.nix
    ./security.nix
    ./services.nix
    ./settings.nix
  ];
}
