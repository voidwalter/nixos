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
  
  programs.dms-shell = {
    enable = true;
		quickshell.package = inputs.quickshell.packages.${pkgs.stdenv.hostPlatform.system}.quickshell;
    
		systemd = {
      enable = true;             # Systemd service for auto-start
      restartIfChanged = true;   # Auto-restart dms.service when dms-shell changes
    };

    # Core features
    enableSystemMonitoring = true;     # System monitoring widgets (dgop)
    enableVPN = true;                  # VPN management widget
    enableDynamicTheming = true;       # Wallpaper-based theming (matugen)
    enableAudioWavelength = true;      # Audio visualizer (cava)
    enableCalendarEvents = true;       # Calendar integration (khal)
    enableClipboardPaste = true;       # Pasting from the clipboard history (wtype)
  };

  programs.dconf.enable = true;
}
