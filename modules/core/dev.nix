{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    gdb                  # GNU debugger
    lldb                 # LLVM debugger (alternative)
    cmake                # Build system generator
    gnumake							 # Make build system
		cmake-language-server # CMake LSP (optional)
    gcc
    clang
		clang-tools
    lld
    lua
  ];

  programs.direnv = {
    enable = true;
    nix-direnv = {
      enable = true;
    };
    enableBashIntegration = true;
  };
}
