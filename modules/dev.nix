{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    gcc
    clang
    lld
    lldb
    rustup
    lua

    vim
    tmux
    curl
    wget
    neovim
    vscodium
    
    gh
    jq
    git
    devenv
    lazygit
  ];

  programs.direnv = {
    enable = true;
    nix-direnv = {
      enable = true;
    };
    enableBashIntegration = true;
  };
}
