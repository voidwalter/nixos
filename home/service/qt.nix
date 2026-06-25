{ pkgs, ... }: {
	qt = {
		enable = true;
		kvantum = {
			enable = true;
			themes = with pkgs; [
				gruvbox-kvantum
				catppuccin-kvantum
			];
		};
		# platformTheme.name = "kvantum"
	}
}
