{ inputs, pkgs, ... }:
{
  programs.brave = {
    enable = true;
    package = inputs.brave.packages.${pkgs.stdenv.hostPlatform.system}.default;

    extensions = [
      "hlbgchjfepnbkdeoeoehinocffkellai"
    ];

    commandLineArgs = [
      "--disable-features=WebRtcHideLocalIpsWithMdns"
    ];
  };
}
