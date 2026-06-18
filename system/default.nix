{
  inputs,
  config,
  pkgs,
  ...
}:
{
  imports = [
    ./programs
    ./core/configuration.nix
  ];

  home-manager = {
    users.void = import ../home;
    extraSpecialArgs = { inherit inputs; };
    useUserPackages = true;
    backupFileExtension = "backup";
  };
}
