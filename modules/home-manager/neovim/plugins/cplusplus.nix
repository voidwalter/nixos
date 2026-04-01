{ lib, ...}:

{
  programs.nixvim = {
		plugins = {
			cmake_tools = {
				enable = true;
			};

			dap = {
				enable = true;
			};
		};
	};
}
