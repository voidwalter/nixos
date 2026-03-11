{ inputs, pkgs, ... }:

{

  environment.systemPackages = with pkgs; [
    rofi
    firefox
    nautilus
    qutebrowser
    inputs.zen-browser.packages.${pkgs.system}.twilight
  ];

}
