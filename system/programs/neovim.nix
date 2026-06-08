{ inputs, pkgs, ... }:
{
  programs.neovim = {
    enable = true;
    package = inputs.neovim.packages.${pkgs.stdenv.hostPlatform.system}.default;
  };
}
