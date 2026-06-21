{ lib, pkgs, ... }: {
  programs.git = {
    enable = true;

    signing = {
      format = "ssh";
      key = lib.mkDefault "~/.ssh/gith.pub";
      signByDefault = false;
    };

    settings = {
      alias = {
        sts = "status --short";
      };

      gpg.ssh.allowedSignersFile = "~/.config/git/allowed_signers";

      user.name = lib.mkDefault "Walter";
      user.email = lib.mkDefault "voidwalter@proton.me";

      init.defaultBranch = "main";

      commit.verbose = true;

      log.date = "iso";
      column.ui = "auto";

      pull.rebase = true;
      push.autoSetupRemote = true;
      merge.conflictStyle = "zdiff3";
      rebase.autoSquash = true;
      rebase.autoStash = true;
      rebase.updateRefs = true;
      rerere.enabled = true;
      fetch.fsckObjects = true;
      receive.fsckObjects = true;
      transfer.fsckobjects = true;
    };
  };

  programs.gh = {
    enable = true;
    extensions = with pkgs; [
      gh-eco
      gh-dash
      gh-markdown-preview
      gh-notify
    ];
  };

  programs.lazygit = {
    enable = true;
    enableBashIntegration = true;
    shellWrapperName = "lg";
    settings = {
      notARepository = "quit";
      gui = {
        theme = {
          activeBorderColor = [
            "blue"
            "bold"
          ];
          inactiveBorderColor = [
            "black"
          ];
          lightTheme = true;
          selectedLineBgColor = [
            "default"
          ];
        };
      };
    };
  };

  programs.delta = {
    enable = true;
    enableGitIntegration = true;
    options = {
      decorations = {
        commit-decoration-style = "bold yellow box ul";
        file-decoration-style = "none";
        file-style = "bold yellow ul";
      };
      features = "decorations";
      whitespace-error-style = "22 reverse";
    };
  };

  home.file.".config/git/allowed_signers".text = ''
    ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIPkmsU/Z8QBlfZmf3Y/jWU9EbQxavTTwX8zkVJNdBUHe voidwalter@proton.me
  '';
}
