{ config, pkgs, inputs, lib, ... }:

{
  # pkgs.exiftool
  programs.yazi = {
    enable = true;
    package = inputs.yazi.packages.${pkgs.stdenv.hostPlatform.system}.default;
    enableBashIntegration = config.programs.bash.enable;
    shellWrapperName = "y";
  };
}
