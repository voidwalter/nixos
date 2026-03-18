{ ... }:
{
  wayland.windowManager.hyprland.settings = {
    binds = {
      scroll_event_delay = 100;
      movefocus_cycles_fullscreen = true;
    };

    bind = [
			"$mod, F1, exec, show-keybinds"

		  # Launch Applications
			"$mod, T, exec, kitty"
			"$mod, G, exec, ghostty"
			"$mod, W, exec, zen-twilight"
			"$mod, B, exec, firefox"
			"$mod, F, exec, nautilus"
			"$mod , Return, exec, [float; size 1111 700] kitty"
			"$mod SHIFT, D, exec, [workspace 4 silent] discord"
			
			# Window Management
			"$mod, Q, killactive"
			"$mod SHIFT, F, fullscreen, 0"
			"$mod CTRL, F, fullscreen, 1"
			"$mod, SPACE, togglefloating"
			"$mod ALT, SPACE, exec, hyprctl dispatch workspaceopt allfloat"
			"$mod SHIFT, Return, exec, $scriptsDir/Dropterminal.sh $term"
			"ALT, Tab, cyclenext"
			"ALT, Tab, bringactivetotop"
			"ALT, Escape, exec, hyprlock"
			
			# Launchers & Menus
			"$mod, X, exec, vicinae toggle"
			"$mod, C, exec, rofi -show drun"
			"$mod, V, exec, vicinae vicinae://extensions/vicinae/clipboard/history"
			
			# Shell Controls
			", F1, exec, $dms spotlight toggle"
			", F2, exec, $dms hypr toggleOverview"
			", F3, exec, $dms"
			", F4, exec, $dms keybinds toggle hyprland"
			", F5, exec, $dms notepad toggle"
			", F6, exec, $dms keyboard-layout toggle"
			", F7, exec, $dms clipboard toggle"
			", F8, exec, $dms processlist toggle"
			", F9, exec, $dms keybinds toggleWithPath hyprland $config/"
			", F10, exec, $dms notifications toggle"
			", F12, exec, $dms control-center toggle"
			"CTRL, F12, exec, $dms powermenu toggle"
			"CTRL, F9, exec, $dms wallpaper next"
			"ALT, F9, exec, $dms theme toggle"
			"ALT, F12, exec, $dms dock toggle"
			"SHIFT, F12, exec, $dms bar toggle name \"Main Bar\""
			
			# Media & Hardware Keys
			", XF86AudioRaiseVolume, exec, $dms audio increment 5"
			", XF86AudioLowerVolume, exec, $dms audio decrement 5"
			", XF86AudioMute, exec, $dms audio mute"
			", XF86AudioPlay, exec, $dms mpris playPause"
			", xf86AudioNext, exec, $dms mpris next"
			", xf86AudioPrev, exec, $dms mpris previous"
			", xf86AudioStop, exec, $dms mpris pause"
			"ALT, F3, exec, $dms brightness increment 5 \"\""
			"ALT, F2, exec, $dms brightness decrement 5 \"\""
			
			# Screenshots
			"$mod, PRINT, exec, grim -g \"$(slurp)\" - | wl-copy"
			"$mod CTRL, PRINT, exec, grim -g \"$(slurp)\" - | satty --filename -"
			"SHIFT, PRINT, exec, grim ~/Pictures/Shots/$(date +'freeze-%m%d-%H%M%S').png"
			"CTRL, PRINT, exec, grim - | satty --filename -"
			", PRINT, exec, grim - | wl-copy"
			
			# Layout & Workspace Navigation
			"CTRL ALT, up, exec, hyprctl dispatch focuswindow floating"
      "CTRL ALT, down, exec, hyprctl dispatch focuswindow tiled"

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
