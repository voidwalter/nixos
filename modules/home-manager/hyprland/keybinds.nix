{
  wayland.windowManager.hyprland.settings = {
    binds = {
      scroll_event_delay = 100;
      movefocus_cycles_fullscreen = true;
    };

    bind = [
			"$mod, T, exec, alacritty"
			"$mod, G, exec, ghostty"
			"$mod, W, exec, zen-twilight"
			"$mod, B, exec, qutebrowser"
			"$mod, Return, exec, [float; size 1111 700] alacritty"
			
			"$mod, Q, killactive"
			"$mod SHIFT, F, fullscreen, 0"
			"$mod ALT, F, fullscreen, 1"
			"$mod, SPACE, togglefloating"
			"$mod ALT, SPACE, exec, hyprctl dispatch workspaceopt allfloat"
			"ALT, Tab, cyclenext"
			"ALT, Tab, bringactivetotop"
			"ALT, Escape, exec, hyprlock"
			
			"$mod, X, exec, vicinae toggle"
			"$mod, C, exec, rofi -show drun"
			"$mod, V, exec, vicinae vicinae://extensions/vicinae/clipboard/history"
			
			", XF86AudioRaiseVolume, exec, pamixer --increase 5"
      ", XF86AudioLowerVolume, exec, pamixer --decrease 5"
      ", XF86AudioMute, exec, pamixer --toggle-mute"
      ", XF86AudioPlay, exec, playerctl play-pause"
      ", XF86AudioNext, exec, playerctl next"
      ", XF86AudioPrev, exec, playerctl previous"
      "ALT, F3, exec, brightnessctl set +5%"
      "ALT, F2, exec, brightnessctl set 5%-"

			"CTRL, F9, exec, waypaper"
			
			"$mod, PRINT, exec, grim -g \"$(slurp)\" - | satty --filename -"					# select region > edit satty
			"$mod CTRL, PRINT, exec, grim -g \"$(slurp)\" - | wl-copy"								# select region > copy to clipboard
			"SHIFT, PRINT, exec, grim ~/Pictures/Shots/$(date +'freeze-%m%d-%H%M%S').png"				# save screenshot directly
			"CTRL, PRINT, exec, grim - | satty --filename -"			# screenshot + edit satty
			", PRINT, exec, grim - | wl-copy"				# copy to clipboard
			
			"$mod, H, movefocus, l"
			"$mod, L, movefocus, r"
			"$mod, K, movefocus, u"
			"$mod, J, movefocus, d"
			"$mod ALT, H, swapwindow, l"
			"$mod ALT, L, swapwindow, r"
			"$mod ALT, K, swapwindow, u"
			"$mod ALT, J, swapwindow, d"
			"$mod CTRL, H, movewindow, l"
			"$mod CTRL, L, movewindow, r"
			"$mod CTRL, K, movewindow, u"
			"$mod CTRL, J, movewindow, d"
			"$mod SHIFT, H, resizeactive, -50 0"
			"$mod SHIFT, L, resizeactive, 50 0"
			"$mod SHIFT, K, resizeactive, 0 -50"
			"$mod SHIFT, J, resizeactive, 0 50"
			
			"$mod, Tab, workspace, m+1"
			"$mod SHIFT, Tab, workspace, m-1"
			"$mod, mouse_down, workspace, e+1"
			"$mod, mouse_up, workspace, e-1"
			
			"$mod, 1, workspace, 1"
			"$mod, 2, workspace, 2"
			"$mod, 3, workspace, 3"
			"$mod, 4, workspace, 4"
			"$mod, 5, workspace, 5"
			"$mod, 6, workspace, 6"
			"$mod, 7, workspace, 7"
			"$mod, 8, workspace, 8"
			"$mod, 9, workspace, 9"
			"$mod, 0, workspace, 10"
			"$mod, O, togglespecialworkspace, stash"
			
			"$mod SHIFT, 1, movetoworkspacesilent, 1" # movetoworkspacesilent
      "$mod SHIFT, 2, movetoworkspacesilent, 2"
      "$mod SHIFT, 3, movetoworkspacesilent, 3"
      "$mod SHIFT, 4, movetoworkspacesilent, 4"
      "$mod SHIFT, 5, movetoworkspacesilent, 5"
      "$mod SHIFT, 6, movetoworkspacesilent, 6"
      "$mod SHIFT, 7, movetoworkspacesilent, 7"
      "$mod SHIFT, 8, movetoworkspacesilent, 8"
      "$mod SHIFT, 9, movetoworkspacesilent, 9"
      "$mod SHIFT, 0, movetoworkspacesilent, 10"
      "$mod CTRL, c, movetoworkspace, empty"

			"$mod, bracketleft, movetoworkspace, -1"
			"$mod, bracketright, movetoworkspace, +1"

			"$mod, mouse_down, workspace, e-1"
      "$mod, mouse_up, workspace, e+1"
		];
		bindm = [
			"$mod, mouse:273, movewindow"
			"$mod, mouse:272, resizewindow"
		];
	};
}
