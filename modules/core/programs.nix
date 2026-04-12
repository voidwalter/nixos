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
		pipes
		zoxide
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
	programs.hyprland.enable = true;
}
