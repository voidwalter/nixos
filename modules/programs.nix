{ inputs, pkgs, nixvim-config, ... }:

{

  # details config for programs
  imports = [
    # ./../config/tmux/default.nix
  ];

  environment.systemPackages = with pkgs; [
    # CLIs
    bat     kitty         pipes
    eza     zoxide        cava
    fzf     starship      tree
    btop    fastfetch     ripgrep
    cava    cmatrix       fd delta
    bash    blesh         
    nixvim-config.packages.${pkgs.system}.default

    # graphical
    rofi
    firefox
    nautilus
    qutebrowser
    bitwarden-desktop
    inputs.zen-browser.packages.${pkgs.system}.twilight

    psmisc
    wlrctl
    gifsicle
    ffmpeg
    ffmpegthumbnailer

    quickshell
    at-spi2-atk
    qt6.qtwayland

    imv
    vlc
    mpv
    mpvpaper
    mpv-handler
    zathura
    imagemagick

    grim
    slurp
    satty
    pamixer
    playerctl
    pavucontrol
    libnotify
    wl-screenrec
    wl-clipboard
    wl-clip-persist
    cliphist
    xdg-utils
    wtype
    dunst
    avizo
    ddcutil
    brightnessctl
    #libfido2
  ];
  
  programs.bash = {
    enable = true; 
    blesh.enable = true;
    interactiveShellInit = ''
      if [ -f ~/.bashrc ]; then
          source ~/.bashrc
      fi
    '';
  };

  programs.dconf.enable = true;
}
