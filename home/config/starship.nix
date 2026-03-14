{
  programs.starship = {
    enable = true;

    settings = {
      add_newline = true;
      format = builtins.concatStringsSep "" [
        "$username"
        "$hostname"
        "$directory"
        "$git_branch"
        "$git_status"
        "\${custom.jj}"
        "$line_break"
        "$jobs"
        "$status"
        "$cmd_duration"
        "$os"
        "$container"
        "$netns"
        "$shell"
        "$character"
        "$package"
        "$c"
        "$cpp"
        "$cmake"
        "$lua"
        "$rust"
        "$python"
        "$nix_shell"
      ];

      # Shows the username
      username = {
        style_user = "white bold";
        style_root = "black bold";
        format = "[$user]($style) ";
        disabled = false;
        show_always = true;
      };

      os = {
        # symbol = " ";
        disabled = false;
      };

      # Shows current directory
      directory = {
        truncation_symbol = "…/";
        home_symbol = "󰋜 ~";
        read_only_style = "197";
        read_only = "  ";
        format = "at [$path]($style)[$read_only]($read_only_style) ";
      };

      # Shows current git branch
      git_branch = {
        symbol = " ";
        format = "via [$symbol$branch]($style)";
        truncation_symbol = "…/";
        style = "bold green";
      };

      # Shows current git status
      git_status = {
        format = "([ \( $all_status$ahead_behind\)]($style) )";
        style = "bold green";
        conflicted = "[ confliced=$count](red) ";
        up_to_date = "[󰘽 up-to-date](green) ";
        untracked = "[󰋗 untracked=$count](red) ";
        ahead = " ahead=$count";
        diverged = " ahead=$ahead_count  behind=$behind_count";
        behind = " behind=$count";
        stashed = "[ stashed=$count](green) ";
        modified = "[󰛿 modified=$count](yellow) ";
        staged = "[󰐗 staged=$count](green) ";
        renamed = "[󱍸 renamed=$count](yellow) ";
        deleted = "[󰍶 deleted=$count](red) ";
      };

      # Shows kubernetes context and namespace
      kubernetes = {
        format = "via [󱃾 $context\($namespace\)](bold purple) ";
        disabled = true;
      };

      package = {
        format = "[ $symbol$version ]($style)";
        style = "bold fg:#e06c75";
        symbol = "󰏗 ";
        display_private = true;
      };

      c = {
        symbol = " ";
        format = "[ $symbol($version )]($style)";
        style = "bold fg:#599eff";
        disabled = false;
      };

      cpp = {
        symbol = " ";
        format = "[ $symbol($version )]($style)";
        style = "bold fg:#599eff";
        disabled = false;
      };

      cmake = {
        symbol = " ";
        format = "[ $symbol($version )]($style)";
        style = "bold fg:#599eff";
      };

      rust = {
        symbol = " ";
        format = "[ $symbol($version )]($style)";
        style = "bold fg:#ce6f6f";
        version_format = "v\${raw}";
        disabled = false;
      };

      cargo = {
        symbol = "📦 ";
        format = "[ $symbol($version )]($style)";
        style = "bold fg:#ce6f6f";
      };

      python = {
        symbol = " ";
        format = "[ $symbol )($virtualenv)]($style)";
        style = "bold fg:#f0db4f";
        pyenv_version_name = true;
        pyenv_prefix = "🐍 ";
      };

      zig = {
        symbol = " ";
        format = "[ $symbol($version )]($style)";
        style = "bold fg:#f69a1b";
      };

      lua = {
        symbol = " ";
        format = "[ $symbol($version )]($style)";
        style = "bold fg:#51a0cf";
      };

      nix_shell = {
        symbol = " ";
        format = "[ $symbol$name ]($style)";
        style = "bold fg:#7ebae4";
        impure_msg = "impure";
        pure_msg = "pure";
      };

      time = {
        format = " $time";
        time_format = "%T";
        style = "bg:#a3aed2 fg:#090c0c";
        disabled = false;
      };

      cmd_duration = {
        format = "\[[⏱ $duration]($style)\]";
        show_milliseconds = true;
      };

      status = {
        format = "[ $symbol$status ](bold fg:#e06c75)";
        symbol = "✘ ";
        pipestatus = true;
        pipestatus_separator = " | ";
      };

      fill = {
        symbol = " ";
      };

      custom = {
        cmake_version = {
          command = "cmake --version | head -n1 | cut -d' ' -f3";
          when = "test -f CMakeLists.txt || find . -maxdepth 1 -name '*.cmake' | grep -q .";
          format = "[  v$output ](bold fg:#599eff)";
        };

        make_version = {
          command = "make --version | head -n1 | cut -d' ' -f3";
          when = "test -f Makefile || test -f makefile";
          format = "[ ⚙ v$output ](bold fg:#e5c07b)";
        };

        meson_version = {
          command = "meson --version 2>/dev/null";
          when = "test -f meson.build";
          format = "[ 🧮 v$output ](bold fg:#61afef)";
        };

        # Show Bazel version
        bazel_version = {
          command = "bazel --version 2>/dev/null | cut -d' ' -f2";
          when = "test -f WORKSPACE || test -f BUILD.bazel || test -f BUILD";
          format = "[ 🧱 v$output ](bold fg:#43a047)";
        };

        jj = {
          command = "prompt";
          format = "$output";
          ignore_timeout = true;
          shell = ["starship-jj" "--ignore-working-copy" "starship"];
          use_stdin = false;
          when = true;
        };
      };
    };
  };
}
