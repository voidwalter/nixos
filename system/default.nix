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

}
