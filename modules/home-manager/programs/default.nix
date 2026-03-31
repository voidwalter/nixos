{ config, pkgs, ...}:

{
  imports = [
		./dms.nix
		./yazi.nix
		./browsers.nix
		# ./neovim.nix
		# ./spicetify.nix
		./qutebrowser.nix
		./media-viewer.nix
  ];

	programs.obs-studio = {
    enable = true;
    package = pkgs.obs-studio.override { cudaSupport = true; };
    plugins = with pkgs.obs-studio-plugins; [
      obs-multi-rtmp
      obs-pipewire-audio-capture
      obs-vkcapture
    ];
  };
}
