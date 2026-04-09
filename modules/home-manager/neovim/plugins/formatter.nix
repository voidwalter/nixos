{
	home.file.".clang-format".text = ''
    BasedOnStyle: LLVM
    IndentWidth: 4
    TabWidth: 4
    UseTab: Always
    ColumnLimit: 80
    BreakBeforeBraces: Attach
    AllowShortFunctionsOnASingleLine: None
    AllowShortIfStatementsOnASingleLine: Never
    IndentCaseLabels: true
    PointerAlignment: Right
  '';

  programs.nixvim.plugins = {
    treesitter = {
      enable = true;
			highlight.enable = true;
      indent.enable = false;
      autotag.enable = true;
      folding.enable = true;
      settings = {
        ensure_installed = [
          "bash"
          "c"
          "cpp"
          "json"
          "markdown"
          "markdown_inline"
          "regex"
          "toml"
          "vimdoc"
          "yaml"
          "nix"
          "vim"
        ];
        autoinstall = true;
        nixvimInjections = true;
      };
    };

		conform-nvim = {
			enable = false;
			autoLoad = true;

			settings =  {
				formatters_by_ft = {
					bash = [
						"shellcheck"
						"shellharden"
						"shfmt"
					];
					c = [ "clang_format" ];
					cpp = [ "clang_format" ];
					nix = [
						"nix_fmt"
					];
					"_" = [
						"squeeze_blanks"
						"trim_whitespace"
						"trim_newlines"
					];
				};
				format_on_save = ''
					function(bufnr)
						if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
							return
						end

						if slow_format_filetypes[vim.bo[bufnr].filetype] then
							return
						end

						local function on_format(err)
							if err and err:match("timeout$") then
								slow_format_filetypes[vim.bo[bufnr].filetype] = true
							end
						end

						return { timeout_ms = 200, lsp_fallback = true }, on_format
					end
				'';
				format_after_save = ''
					function(bufnr)
						if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
							return
						end

						if not slow_format_filetypes[vim.bo[bufnr].filetype] then
							return
						end

						return { lsp_fallback = true }
					end
				'';
				log_level = "warn";
				notify_on_error = false;
				notify_no_formatters = false;
			};
		};
	};
}
