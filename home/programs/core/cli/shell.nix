{ pkgs, ... }:
{
  home.packages = [
    pkgs.eza
    pkgs.zoxide
    pkgs.bat
    pkgs.fortune
    pkgs.cowsay
    pkgs.lolcat
  ];

  programs = {
    zoxide = {
      enable = true;
      package = pkgs.zoxide;
      enableZshIntegration = true;
      options = [
        "--no-cmd"
      ];
    };

    atuin = {
      enable = true;
      daemon.enable = true;
      settings = {
        auto_sync = true;
        sync_frequency = "5m";
        style = "compact"; # compact | full | auto
        filter_mode = "workspace";
        filter_mode_shell_up_key_binding = "workspace";
        workspaces = true;
        secret_filter = true;
      };
    };

    ripgrep = {
      enable = true;
      arguments = [
        "--max-columns=2000"
        "--smart-case"
      ];
    };

    eza = {
      enable = true;
      git = true;
      icons = "auto";
      colors = "auto";
      enableZshIntegration = true;

      extraOptions = [
        "--group-directories-first"
        "--no-quotes"
      ];
    };
  };
}
