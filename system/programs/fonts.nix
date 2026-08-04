{ pkgs, ... }:

{
  fonts = {
    enableDefaultPackages = false;
    fontDir.enable = true;
    packages = with pkgs; [
      # nerdfonts
      nerd-fonts.fira-code
      nerd-fonts.fira-mono
      nerd-fonts.monofur
      nerd-fonts.symbols-only
      nerd-fonts.jetbrains-mono
      nerd-fonts.caskaydia-cove
      nerd-fonts.code-new-roman
      nerd-fonts.daddy-time-mono

      # icon fonts
      material-symbols

      maple-mono.NF
      libertinus
      noto-fonts
      noto-fonts-cjk-sans
      noto-fonts-color-emoji
      roboto
      (google-fonts.override { fonts = [ "Inter" ]; })

      # monospace fonts
      jetbrains-mono
      maple-mono.CN
    ];

    # user defined fonts
    fontconfig.defaultFonts = {
      serif = [ "Libertinus Serif" ];
      sansSerif = [ "Inter" ];
      monospace = [ "JetBrains Mono Nerd Font" ];
      emoji = [ "Noto Color Emoji" ];
    };
  };
}
