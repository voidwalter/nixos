{ lib, ... }:

{
  programs.git = {
    enable = true;

    signing = {
      format = "ssh";
      key = lib.mkDefault "~/.ssh/getawayy.pub";
      signByDefault = true;
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

  home.file.".config/git/allowed_signers".text = ''
    ssh-ed25519	AAAAC3NzaC1lZDI1NTE5AAAAIHokJEracfMuM2SZ7c1ZUgxAElCc2wMo+2wEdCpk2GaO	voidwalter@proton.me
  '';
}
