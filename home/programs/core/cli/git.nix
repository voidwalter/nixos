{
  config,
  lib,
  pkgs,
  ...
}:
{
  programs.git = {
    enable = true;

    signing = {
      format = "ssh";
      signByDefault = true;
    };

    settings = {
      alias = {
        sts = "status --short";
      };

      user = {
        signingkey = "~/.ssh/signgit.pub";
        name = lib.mkDefault "elyrisai";
        email = lib.mkDefault "elyrisai@tutamail.com";
      };

      gpg.format = "ssh";
      gpg.ssh.allowedSignersFile = "~/.config/git/allowed_signers";

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

  services.ssh-agent.enable = true;
  programs.ssh = {
    enable = true;
    enableDefaultConfig = false;
    settings = {
      "*" = {
        ForwardAgent = false;
        AddKeysToAgent = "no";
        Compression = false;
        ServerAliveInterval = 0;
        ServerAliveCountMax = 3;
        HashKnownHosts = false;
        UserKnownHostsFile = "~/.ssh/known_hosts";
        ControlMaster = "no";
        ControlPath = "~/.ssh/master-%r@%n:%p";
        ControlPersist = "no";
      };

      "github.com" = {
        hostname = "github.com";
        user = "git";
        identityFile = "~/.ssh/signgit";
        identitiesOnly = true;
      };

      "codeberg.org" = {
        hostname = "codeberg.org";
        user = "git";
        identityFile = "~/.ssh/signgit";
        identitiesOnly = true;
      };
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
    enableZshIntegration = true;
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

  xdg.configFile."git/allowed_signers".text =
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIPSVKhob8YESeEDLdSPeGVt7hcjorfbm/UnFdPfkf1lt elyrisai@tutamail.com";
}
