{ pkgs, lib, ... }:

let
	dev_pkgs = with pkgs; [
    gcc
		gdb
    lua
    lldb
    cmake
		ninja
    gnumake
    clang
		clang-tools
		cmake-language-server
	];

	media_pkgs = with pkgs; [
    imv
    mpv
    mpv-handler			# mpv external-url handler
    zathura
		gifsicle
		ffmpeg
		ffmpegthumbnailer
    imagemagick
    pamixer
    playerctl
    pavucontrol
  ];

  core_pkgs = with pkgs; [
    wtype			# xdotool type for wayland
		wlrctl				# wayland control utils
		cachix
		cliphist
		ddcutil
		brightnessctl
		ddcutil-service
		wl-clipboard
    wl-screenrec
		vulkan-tools
    xdg-utils
    libnotify
    nwg-look
		librewolf
		pcmanfm-qt
    bibata-cursors
    papirus-icon-theme
  ];

	cli_pkgs = with pkgs; [
		fd
		jq				# JSON processor
    bat
		eza
		fzf
		vim
		cava
		curl
		tree
		wget
		yazi
		blesh
		pipes
		zoxide
		neovim
		ripgrep
		cmatrix
		lazygit
		alacritty
		fastfetch
	];
in
{
  environment.systemPackages = lib.flatten [
		cli_pkgs
		dev_pkgs
		core_pkgs
		media_pkgs
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
}
