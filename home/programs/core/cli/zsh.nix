{ pkgs, config, ... }: {
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    antidote = {
      enable = true;
      plugins = [
        "ohmyzsh/ohmyzsh path:lib/git.zsh"
        "ohmyzsh/ohmyzsh path:plugins/command-not-found"
        "Tarrasch/zsh-bd"
        "hlissner/zsh-autopair"
        "jeffreytse/zsh-vi-mode"
        "zsh-users/zsh-autosuggestions"
        "zsh-users/zsh-syntax-highlighting"
      ];
    };

    oh-my-zsh = {
      enable = true;
      theme = "fino";
    };

    # Environment variables
    initContent = ''
        export LANG=en_US.UTF-8
        export CASE_SENSITIVE="true"
        export HYPHEN_INSENSITIVE="false"
        export DISABLE_LS_COLORS="false"
        export DISABLE_AUTO_TITLE="false"
        export ENABLE_CORRECTION="true"
        export HIST_STAMPS="mm/dd/yyyy"
        export ARCHFLAGS="-arch $(uname -m)"
        export TERMINAL="foot"

        # Preferred editor
        if [[ -n $SSH_CONNECTION ]]; then
          export EDITOR='vim'
        else
          export EDITOR='nvim'
        fi

      	eval "$(zoxide init zsh)"
      	fortune | cowsay -f sus | lolcat
    '';

    # Shell aliases
    shellAliases = {
      nv = "NVIM_APPNAME=neovim nvim";
      ls = "eza --icons";
      ll = "eza -l";
      g = "git";
      n = "nvim";
      tas = "tmux attach-session -t";
      tns = "tmux new-session -t";
      cd = "z";
      cc = "clear";
      pssh = "ssh -T git@github.com";
    };

    history = {
      size = 10000;
      path = "${config.xdg.dataHome}/zsh/history";
    };
  };
}
