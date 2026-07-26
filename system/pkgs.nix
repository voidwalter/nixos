{
  inputs,
  pkgs,
  lib,
  ...
}:

let
  dev_pkgs = with pkgs; [
    gcc
    gdb
    lua
    nasm # just for test :)
    nixfmt
    lldb
    cmake
    ninja
    gnumake
    clang
    clang-tools
    cmake-language-server
  ];

  core_util = with pkgs; [
    wev # Wayland Event Viewer
    wtype # xdotool type for wayland
    unzip
    cliphist # clipboard
    wl-clipboard # clip utils
    ddcutil # brightness
    ddcutil-service
    pavucontrol # volume
    vulkan-tools
    xdg-utils
    libnotify
    bibata-cursors
    mpv-handler # mpv external-url handler
    ffmpeg
    mediainfo
    fontpreview
    ffmpegthumbnailer
    gnupg
    openssl
    networkmanagerapplet
  ];

  list_pkgs = with pkgs; [
    fd
    jq
    bat
    git
    vim
    cava
    curl
    foot
    tree
    wget
    dmenu
    ripgrep
    cmatrix
    stylua
    tree-sitter
  ];

  common_pkgs = with pkgs; [
    quickshell
  ];
in
{
  environment.systemPackages = lib.flatten [
    dev_pkgs
    core_util
    list_pkgs
    common_pkgs
  ];
}
