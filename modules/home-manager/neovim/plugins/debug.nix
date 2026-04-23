{
  programs.nixvim.plugins = {
		trouble = {
    	enable = true;
  	};
		compiler.enable = true;
		cmake_tools = {
			enable = true;
		};

		dap = {
			enable = true;
		};

		competitest = {
			enable = true;
			settings = {
				compile_command = {
					cpp = {
						exec = "clang++";
						args = [
							"-DLOCAL"
							"$(FNAME)"
							"-o"
							"$(FNOEXT)"
							"-Wall"
							"-Wextra"
						];
					};
				};
			};
		};
	};
}
