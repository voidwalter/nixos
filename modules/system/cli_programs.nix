{ config, ... }:

{
  programs.starship = {
    enable = true;
    enableBashIntegration = true;
    settings = {
      gcloud.disabled = true;
      username = {
        style_user = "blue bold";
        style_root = "red bold";
        format = "[$user]($style_root) ";
        disabled = false;
        show_always = true;
      };
      hostname = {
        ssh_only = false;
        ssh_symbol = "󰣀 ";
        format = "on [$hostname](bold red) ";
        trim_at = ".local";
        disabled = false;
      };
    };
  };

  programs.fzf = {
    enable = true;
    package = pkgs.fzf;
    tmux.enableShellIntegration = true;
    enableBashIntegration = true;
    defaultOptions = [
      "--height 80%"
      "--layout=reverse"
  };

  programs.yazi = {
    enable = true;
    package = pkgs.yazi
    enableShellIntegration = true;
    shellWrapperName = "y";
  };
}
