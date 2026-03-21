{ inputs, pkgs, config, ...}:

{
	imports = [
	  inputs.spicetify-nix.homeManagerModules.default
	];

	programs.spicetify =
  let
    spicePkgs = inputs.spicetify-nix.legacyPackages.${pkgs.stdenv.hostPlatform.system};
  in
  {
    enable = true;

    enabledExtensions = with spicePkgs.extensions; [
      oneko
      wikify
      writeify
      shuffle
      adblock
      allOfArtist
      powerBar
      history
      songStats
      spicyLyrics
      keyboardShortcut
    ];
    enabledCustomApps = with spicePkgs.apps; [
      reddit
      betterLibrary
      newReleases
      ncsVisualizer
    ];
    enabledSnippets = with spicePkgs.snippets; [
      rotatingCoverart
      pointer
    ];

    theme = spicePkgs.themes.defaultDynamic;
  };
}
