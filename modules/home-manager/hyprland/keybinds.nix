{
  wayland.windowManager.hyprland.settings = {
    binds = {
      scroll_event_delay = 100;
      movefocus_cycles_fullscreen = true;
    };

    bind = [
			"$mod, T, exec, alacritty"
			"$mod, W, exec, zen-twilight"
			"$mod, B, exec, qutebrowser"
			"$mod, -, exec, [float; size 1000 700] pcmanfm-qt"
			"$mod, Return, exec, [float; size 1111 700] alacritty"
			"$mod, G, exec, [float; size 1111 700] ghostty"
			"$mod, Y, exec, [float; size 1500 900] yazi"
			"$mod, N, exec, alacritty -e nvim"
			
			"$mod, Q, killactive"
			"$mod SHIFT, F, fullscreen, 0"
			"$mod ALT, F, fullscreen, 1"
			"$mod, SPACE, togglefloating"
			"$mod ALT, SPACE, exec, hyprctl dispatch workspaceopt allfloat"
			"ALT, Tab, cyclenext"
			"ALT, Tab, bringactivetotop"
			"ALT, Escape, exec, hyprlock"
			"$mod CTRL, A, exec, alacritty msg config window.opacity=1.0"
			"$mod CTRL, T, exec, alacritty msg config window.opacity=0.65"
			
			"$mod, X, exec, vicinae toggle"
			"$mod, R, exec, rofi -show drun"
			"$mod, V, exec, vicinae vicinae://extensions/vicinae/clipboard/history"

			"$mod CTRL, S, exec, [float; size 1200 800] alacritty -e cliamp"
			"$mod CTRL, B, exec, [float; size 1300 850] alacritty -e btop"
			"$mod CTRL, P, exec, [float; size 1500 900] alacritty -e pipes.sh -p 2"
			"$mod CTRL, C, exec, [fullscreen;] alacritty -e cmatrix"
			
			", XF86AudioRaiseVolume, exec, pamixer --increase 5"
      ", XF86AudioLowerVolume, exec, pamixer --decrease 5"
      ", XF86AudioMute, exec, pamixer --toggle-mute"
      ", XF86AudioPlay, exec, playerctl play-pause"
      ", XF86AudioNext, exec, playerctl next"
      ", XF86AudioPrev, exec, playerctl previous"
      "ALT, F3, exec, brightnessctl set +5%"
      "ALT, F2, exec, brightnessctl set 5%-"

			# Shell Controls
			", F1, exec, $ipc spotlight toggle"
			", F2, exec, qs ipc -c overview call overview toggle"
			"$mod, F1, exec, $ipc keybinds toggle hyprland"
			", F5, exec, $ipc notepad toggle"
			", F6, exec, $ipc keyboard-layout toggle"
			", F7, exec, $ipc clipboard toggle"
			", F8, exec, $ipc processlist toggle"
			", F10, exec, $ipc notifications toggle"
			", F12, exec, $ipc control-center toggle"
			"CTRL, F12, exec, $ipc powermenu toggle"
			"ALT, F12, exec, $ipc dock toggle"
			"SHIFT, F12, exec, $ipc bar toggle name \"Main Bar\""

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
			"$mod, bracketleft, movetoworkspace, -1"
			"$mod, bracketright, movetoworkspace, +1"

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
      "$mod CTRL, M, movetoworkspace, empty"
		];
		bindm = [
			"$mod, mouse:273, movewindow"
			"$mod, mouse:272, resizewindow"
		];
	};
}
