{ config, pkgs, modulesPath, inputs, ... }:

let
  system = pkgs.stdenv.hostPlatform.system;
in
{
  

  home.username = "rafid";
  home.homeDirectory = "/home/rafid";

  imports = [
    inputs.noctalia.homeModules.default
    inputs.spicetify-nix.homeManagerModules.default              

    ./config/tmux.nix
    ./config/starship.nix
  ];

  home.packages = with pkgs; [
    gh
    git
    blesh
    todoist
    element
    ghostty
    newsboat
    newsflash
    vicinae
    zed-editor
    obs-studio
    gimp
    discord
    ferdium
    obsidian
    element-desktop
    onlyoffice-desktopeditors
  ];
  
  programs.git = {
    enable = true;
    settings = {
      user = {
        name = "voidwalter";
        email = "voidwalter@proton.me";
        defaultBranch = "main";
      };
    };
  };
  
  programs.gh = {
    enable = true;
    settings = {
      git_protocol = "ssh"; # Use SSH for Git operations [citation:9]
    };
  };

  programs.noctalia-shell = {
      enable = true;
  };

  
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
    # colorScheme = "mocha";
  };

  # Home Manager state version
  home.stateVersion = "25.05";
}
