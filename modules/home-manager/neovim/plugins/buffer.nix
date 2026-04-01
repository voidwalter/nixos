{
  programs.nixvim.plugins = {
		barbar = {
			enable = true;
			keymaps = {
				next.key = "<leader>bn";
				previous.key = "<leader>bp";
				moveNext.key = "<leader>bN";
				movePrevious.key = "<leader>bP";

				close.key = "<leader>bc";
				closeAllButCurrent.key = "<leader>bo";

				goTo1.key = "<leader>1";
				goTo2.key = "<leader>2";
				goTo3.key = "<leader>3";
				goTo4.key = "<leader>4";
				goTo5.key = "<leader>5";
				goTo6.key = "<leader>6";
				goTo7.key = "<leader>7";
				goTo8.key = "<leader>8";
				goTo9.key = "<leader>9";
			};
			settings = {
				animation = true;
				highlight_visible = true;
				auto_hide = 1;
				clickable = false;
				focus_on_clock = "previous";
				exclude_ft = [ ];
				exclude_name = [
					"UnicodeTable.txt"
				];
				hide.extensions = true;
				icons = {
					button = false;
					separator_at_end = false;
				};
			};
		};
  };
}
