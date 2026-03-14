{ pkgs, lib, ...}:

{
  programs.bash = {
    enable = true; 
    blesh.enable = true;
    interactiveShellInit = ''
      if [ -f ~/.bashrc ]; then
          source ~/.bashrc
      fi
    '';
  };
}
