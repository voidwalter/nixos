{ config, ...}:

{
  imports = [
    ./appearences.nix
    ./dev.nix
    ./hyprland.nix
		./hardware-configuration.nix
    ./programs.nix
    ./security.nix
    ./services.nix
    ./settings.nix
  ];
}
