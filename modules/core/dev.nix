{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    gdb                  # GNU debugger
    lldb                 # LLVM debugger (alternative)
    cmake                # Build system generator
    gnumake							 # Make build system
		cmake-language-server # CMake LSP (optional)
    bear                 # Generate compile_commands.json
    gcc
    clang
		clang-tools
    lld
    rustup
		ruby
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
