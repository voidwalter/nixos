{ inputs, pkgs, ... }:
let
  firefox-addons = inputs.firefox-addons.packages.${pkgs.stdenv.hostPlatform.system};
in
{
  home.packages =
    let
      TwilightPkg = inputs.zen.packages."${pkgs.stdenv.hostPlatform.system}".twilight;
      zenTwilight = pkgs.writeShellScriptBin "zen-twilight" ''
        exec ${TwilightPkg}/bin/zen --profile ~/.config/twilight "$@"
      '';
    in
    [
      TwilightPkg
      zenTwilight
    ];
}
