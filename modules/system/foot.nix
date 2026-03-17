{ config, pkgs, ... }:

{
	systemd.user.services.foot-server = {
		description = "Foot terminal server";
		wantedBy = [ "graphical-session.target" ];
		partOf = [ "graphical-session.target" ];
		serviceConfig = {
			ExecStart = "${pkgs.foot}/bin/foot --server";
			Restart = "on-failure";
		};
	};
  environment.systemPackages = with pkgs; [ foot ];
  programs.foot = {
    enable = true;

    settings = {
      main = {
        font = "JetBrainsMono Nerd Font:size=13";

        # Makes foot adjust font size based on output scaling (very useful on HiDPI)
        dpi-aware = "yes";

        # Initial window size (columns × rows)
        initial-window-size = "120x38";

        # How many lines of scrollback
        scrollback-lines = 10000;

        # Pad inside the window (horizontal × vertical)
        pad = "8x8";
        term = "foot";
      };

      cursor = {
        style = "beam";
        beam-thickness = "1.5";
        blink = "yes";
      };

      colors = {
        # Background transparency (0.0 = fully transparent, 1.0 = opaque)
        alpha = "0.78";

        # Regular colors (16 base colors)
        regular0  = "45475a";  # black
        regular1  = "f38ba8";  # red
        regular2  = "a6e3a1";  # green
        regular3  = "f9e2af";  # yellow
        regular4  = "89b4fa";  # blue
        regular5  = "f5c2e7";  # magenta
        regular6  = "94e2d5";  # cyan
        regular7  = "cdd6f4";  # white

        # Bright colors
        bright0  = "585b70";   # bright black
        bright1  = "f38ba8";   # bright red
        bright2  = "a6e3a1";   # bright green
        bright3  = "f9e2af";   # bright yellow
        bright4  = "89b4fa";   # bright blue
        bright5  = "f5c2e7";   # bright magenta
        bright6  = "94e2d5";   # bright cyan
        bright7  = "ffffff";   # bright white

        # Foreground / background
        foreground = "cdd6f4";
        background = "1e1e2e";

        # Selection
        selection-background = "585b70";
        selection-foreground = "cdd6f4";

        urls = "89b4fa";
      };

      mouse = {
        hide-when-typing = "yes";
      };

      key-bindings = {
        scrollback-up-half-page = "Mod4+Up";
        scrollback-down-half-page = "Mod4+Down";
      };
    };
  };
}
