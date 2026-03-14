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

  programs.bash = {
    enable = true; 
    blesh.enable = true;
    interactiveShellInit = ''
      if [ -f ~/.bashrc ]; then
          source ~/.bashrc
      fi
    '';
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
    enableZshIntegration = true;
    shellWrapperName = "y";
  };

  xdg.configFile."yazi/theme.toml" = {
    source = pkgs.fetchFromGitHub {
      owner = "yazi-rs";
      repo = "flavors";
      rev = "02f3fc64b78223c1005672e105f6d0e97c0db79e"; # main branch on 2025-05-24
      sha256 = "sha256-7facwGT4DoaMwdkBrMzPlqDbrbSjwW57qRD34iP48+0=";
    } + "/catppuccin-mocha.yazi/flavor.toml";
  };
}
