{ pkgs, ... }:

{
	programs = {
		direnv = {
    	enable = true;
			nix-direnv.enable = true;
    	enableBashIntegration = true;
		};
		nix-ld.enable = true;
		dconf.enable = true;
		hyprland.enable = true;
	};
}
