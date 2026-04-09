{ lib, ...}:

{
  programs.nixvim = {
		plugins = {
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
							exec = "g++";
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
	};
}
