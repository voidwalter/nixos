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
  ];

  home.packages = with pkgs; [
    gh
    git
    todoist
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
      adblock
      hidePodcasts
      shuffle # shuffle+ (special characters are sanitized out of extension names)
    ];
    enabledCustomApps = with spicePkgs.apps; [
      newReleases
      ncsVisualizer
    ];
    enabledSnippets = with spicePkgs.snippets; [
      rotatingCoverart
      pointer
    ];

    theme = spicePkgs.themes.catppuccin;
    colorScheme = "mocha";
  };

  # Home Manager state version
  home.stateVersion = "25.05";
}
