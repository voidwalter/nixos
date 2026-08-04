{ inputs, pkgs, ... }:
{
  imports = [
    inputs.zen.homeModules.beta
    ./profileDefault.nix
    ./keymaps.nix
    ./profileSeco.nix
  ];

  programs.zen-browser = {
    enable = true;
    setAsDefaultBrowser = true;
    policies = import ./policies.nix;
  };
}
