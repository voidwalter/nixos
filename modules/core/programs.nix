{ inputs, pkgs, ... }:

{
  imports = [
    ./../system/default.nix
  ];

  environment.systemPackages = with pkgs; [
    # CLIs
		fd
		jq
    bat
		eza
		fzf
		git
		bash
		cava
		tree
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

		vim
    curl
    wget
		tmux
    neovim

    # graphical
    rofi			# launcher
    librewolf		# web-browser
    # nautilus	# file-browser
    qutebrowser		# keyboard-based-browser
    inputs.zen-browser.packages.${pkgs.system}.twilight

		# qt and quickshell
		inputs.quickshell.packages.${system}.default

    psmisc
    wlrctl
    gifsicle
    ffmpeg
		cachix
    ffmpegthumbnailer
		vulkan-tools

    at-spi2-atk
    qt6.qtwayland

    imv
    mpv
    mpv-handler
    zathura
    imagemagick

    pamixer
    playerctl
		brightnessctl
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
    #libfido2
  ];
 
  programs.dconf.enable = true;
}
