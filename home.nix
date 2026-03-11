{ config, lib, pkgs, modulesPath, inputs, ... }:

let
  system = pkgs.stdenv.hostPlatform.system;
in
{
  home.username = "rafid";
  home.homeDirectory = "/home/rafid";

  home.packages = with pkgs; [
    gh
    git
    cava
    ghostty
    newsboat
    newsflash
    vicinae
    
    # sfl
    obs-studio
    gimp
    discord
    ferdium
    obsidian
    thunderbird
    bitwarden-desktop
    onlyoffice-desktopeditors
  ];
  
  programs.git = {
    enable = true;
    settings.user = {
      name = "voidwalter";
      email = "voidwalter@proton.me";
      defaultBranch = "main";
      gpg.format = "ssh";
    };

    signing = {
      key = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIAhENVdTScuEb8y1jIZGp/OQVgTjgWvc41miGCd+mTd+ voidwalter@proton.me"; # public key string
      signByDefault = true;
    };
  };
  
  programs.ssh = {
    enable = true;
    addKeysToAgent = "yes";

    extraConfig = ''
      Host github.com
        User git
        IdentityFile ~/.ssh/github
        IdentitiesOnly yes
    '';
  };

  programs.gh = {
    enable = true;
    settings = {
      git_protocol = "ssh"; # Use SSH for Git operations [citation:9]
    };
  };

  # Home Manager state version
  home.stateVersion = "25.05";
}
