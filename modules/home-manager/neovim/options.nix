{ pkgs, ... }:
{
  programs.nixvim = {
    globals = {
      # Disable useless providers
      loaded_ruby_provider = 0; # Ruby
      loaded_perl_provider = 0; # Perl
      loaded_python_provider = 0; # Python 2
    };

    clipboard = {
      # Use system clipboard
      register = "unnamedplus";

      providers.wl-copy.enable = pkgs.stdenv.hostPlatform.isLinux;
    };

    opts = {
      updatetime = 100; # Faster completion

      # Tabbing && Indenting options
      tabstop = 4;
      shiftwidth = 4;
      expandtab = false;
      autoindent = false;
      smartindent = false;
      grepprg = "rg --vimgrep";
      grepformat = "%f:%l:%c:%m";
      guicursor = [
        "n-v-c:block"           # Normal, Visual, Command: block
        "i-ci-ve:ver25"         # Insert modes: vertical bar at 25%
        "r-cr:hor20"            # Replace modes: horizontal bar at 20%
        "o:hor50"               # Operator-pending: horizontal bar at 50%
        "a:blinkwait700-blinkoff400-blinkon250"  # Default blinking
        "sm:block-blinkwait175-blinkoff150-blinkon175"  # Showmatch blinking
      ];

      # Line numbers
      relativenumber = true;
      number = true;
      hidden = true; # Keep closed buffer open in the background
      mouse = "a"; # Enable mouse control
      mousemodel = "extend"; # Mouse right-click extends the current selection
      splitbelow = true; # A new window is put below the current one
      splitright = true; # A new window is put right of the current one

      swapfile = false; # Disable the swap file
      modeline = true; # Tags such as 'vim:ft=sh'
      modelines = 100; # Sets the type of modelines
      undofile = true; # Automatically save and restore undo history
      incsearch = true; # Incremental search: show match for partly typed search command
      inccommand = "split"; # Search and replace: preview changes in quickfix list
      ignorecase = true; # When the search query is lower-case, match both lower and upper-case
      smartcase = true; # Override the 'ignorecase' option if the search pattern contains upper

      #   case characters
      scrolloff = 8; # Number of screen lines to show around the cursor
      cursorline = false; # Highlight the screen line of the cursor
      cursorcolumn = false; # Highlight the screen column of the cursor
      signcolumn = "yes"; # Whether to show the signcolumn
      colorcolumn = ""; # Columns to highlight
      laststatus = 3; # When to use a status line for the last window
      fileencoding = "utf-8"; # File-content encoding for the current buffer
      termguicolors = true; # Enables 24-bit RGB color in the |TUI|
      spell = true; # Highlight spelling mistakes (local to window)
      wrap = false; # Prevent text from wrapping

      textwidth = 0; # Maximum width of text that is being inserted.  A longer line will be
      #   broken after white space to get this width.

      # Folding
      foldlevel = 99; # Folds with a level higher than this number will be closed
    };
  };
}
