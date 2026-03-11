{ pkgs, ... }:

{
  fonts = {
    enableDefaultPackages = true;
    packages = with pkgs; [ 
      noto-fonts
      noto-fonts-color-emoji
      noto-fonts-cjk-sans
      nerd-fonts.fira-code
      nerd-fonts.fira-mono
      nerd-fonts.zed-mono
      nerd-fonts.code-new-roman
      nerd-fonts.daddy-time-mono
      liberation_ttf
      vazir-fonts
    ];
  };

  environment.systemPackages = with pkgs; [
    nwg-look
    bibata-cursors
    arc-icon-theme
    papirus-icon-theme
    dracula-icon-theme
    whitesur-icon-theme
  ];
}
