{
  config,
  ...
}:
{
  programs.fzf = {
    enable = true;
    enableBashIntegration = true;
    tmux.enableShellIntegration = true;

    defaultOptions = [
      "--height=60%"
      "--layout=reverse"
      "--cycle"
      "--no-scrollbar"
      "--no-bold"
      "--color=16"

      "--bind 'alt-k:up'"
      "--bind 'alt-j:down'"
      "--bind 'ctrl-y:execute-silent(printf {} | cut -f 2- | wl-copy --trim-newline)'"
    ];
  };
}
