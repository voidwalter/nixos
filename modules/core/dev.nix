{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
		clang-tools          # Provides clangd, clang-format
    gdb                  # GNU debugger
    lldb                 # LLVM debugger (alternative)
    cmake                # Build system generator
    gnumake							 # Make build system
		cmake-language-server # CMake LSP (optional)
    bear                 # Generate compile_commands.json
    gcc
    clang
		clang-tools
    meson
    lld
    rustup
    lua

    vim
    tmux
    curl
    wget
    neovim

    gh
    jq
    git
    devenv
    lazygit
		vulkan-tools
  ];

  programs.direnv = {
    enable = true;
    nix-direnv = {
      enable = true;
    };
    enableBashIntegration = true;
  };
}
