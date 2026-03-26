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
			nerd-fonts.monofur
			nerd-fonts.symbols-only
			nerd-fonts.caskaydia-cove
      nerd-fonts.code-new-roman
      nerd-fonts.daddy-time-mono
    ];
  };

  environment.systemPackages = with pkgs; [
    nwg-look
    bibata-cursors
    papirus-icon-theme
    whitesur-icon-theme
  ];
}
