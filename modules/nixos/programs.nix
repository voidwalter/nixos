{ inputs, pkgs, ... }:

{
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

		gdb                  # GNU debugger
    lldb                 # LLVM debugger (alternative)
    cmake                # Build system generator
    gnumake							 # Make build system
		cmake-language-server # CMake LSP (optional)
    gcc
    clang
		clang-tools
    lld
    lua

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

		nwg-look
    bibata-cursors
    papirus-icon-theme
  ];

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

	programs.direnv = {
    enable = true;
    nix-direnv = {
      enable = true;
    };
    enableBashIntegration = true;
  };
 
	programs.nix-ld.enable = true;
  programs.dconf.enable = true;
	programs.hyprland.enable = true;
}
