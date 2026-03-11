{ pkgs, ... }:

{
  programs.direnv.enable = true;

  environment.systemPackages = with pkgs; [
    gcc
    clang
    lld
    lldb
    rustup
    ruby
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
}
