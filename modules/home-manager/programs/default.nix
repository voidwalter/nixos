{ config, ...}:

{
  imports = [
		./mpv.nix
		./yazi.nix
    ./zatura.nix
		./neovim.nix
		./spicetify.nix
		./librewolf.nix
  ];
}
