{ inputs, pkgs, ... }:

{

  environment.systemPackages = with pkgs; [
    bat     kitty         pipes
    eza     zoxide
    fzf     starship
    btop    fastfetch
    yazi    cmatrix
    bash    blesh

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

  programs.direnv.enable = true;
  programs.dconf.enable = true;
}
