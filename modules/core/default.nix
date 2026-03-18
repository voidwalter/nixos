{ config, ...}:

{
  imports = [
    ./appearences.nix
    ./dev.nix
		./hardware-configuration.nix
    ./programs.nix
    ./security.nix
    ./services.nix
    ./settings.nix
  ];
}
