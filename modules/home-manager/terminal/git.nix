{
  config,
  pkgs,
  ...
}:
let
  cfg = config.programs.git;
  key = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIAhENVdTScuEb8y1jIZGp/OQVgTjgWvc41miGCd+mTd+ voidwalter@proton.me";
in
{
  home.packages = [ pkgs.gh ];

	programs.gh = {
    enable = true;
    settings = {
      git_protocol = "ssh"; # Use SSH for Git operations [citation:9]
    };
  };

	programs.git = {
    enable = true;

    ignores = [
      "*~"
      "*.swp"
      "*result*"
      ".direnv"
      "node_modules"
    ];

    signing = {
      key = "${config.home.homeDirectory}/.ssh/github";
      signByDefault = true;
      format = "ssh";
    };

    settings = {
      user = {
        email = "voidwalter@proton.me";
        name = "Walter";
      };

      pull.rebase = true;
      diff.colorMoved = "default";
      merge.conflictstyle = "diff3";
    };
  };

  programs.delta = {
    enable = true;
    enableGitIntegration = true;
    options.dark = true;
  };
}
