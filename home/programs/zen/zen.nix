{ inputs, pkgs, ... }:
{
  imports = [
    inputs.zen.homeModules.beta
    ./profileDefault.nix
    # ./profileTwilight.nix
    ./keymaps.nix
  ];

  programs.zen-browser = {
    enable = true;
    setAsDefaultBrowser = true;
    policies = import ./policies.nix;
  };
}
