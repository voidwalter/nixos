{ inputs, pkgs, ... }:

{
  imports = [
    ./../system/default.nix
  ];

  environment.systemPackages = with pkgs; [
    # CLIs
		fd
    bat
		eza
		fzf
		bash
		cava
		yazi
		blesh
		delta
		pipes
		zoxide
		starship
		fastfetch
		ripgrep
		cmatrix
		vicinae
		alacritty

    # graphical
    rofi			# launcher
    librewolf		# web-browser
    nautilus	# file-browser
    qutebrowser		# keyboard-based-browser
    inputs.zen-browser.packages.${pkgs.system}.twilight

		# qt and quickshell
		inputs.quickshell.packages.${system}.default
		qt5.qtbase qt5.qtsvg 
		qt5.qtimageformats qt5.qtmultimedia 
		libsForQt5.qt5ct
    qt6Packages.qt6ct

    psmisc
    wlrctl
    gifsicle
    ffmpeg
		cachix
    ffmpegthumbnailer

    at-spi2-atk
    qt6.qtwayland

    imv
    mpv
    mpvpaper
    mpv-handler
    zathura
    imagemagick

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
 
  programs.dconf.enable = true;
}
