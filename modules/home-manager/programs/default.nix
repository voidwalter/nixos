{ config, ...}:

{
  imports = [
		./mpv.nix
		./dms.nix
		./yazi.nix
    ./zatura.nix
		# ./neovim.nix
		./spicetify.nix
		./librewolf.nix
  ];
}
