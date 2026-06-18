----- PERMISSIONS ----
-- W: permission changes here require a Hyprland restart and are not applied on-the-fly for security reasons

hl.config({ ecosystem = { enforce_permissions = true } })

-- hl.permission({ binary = ".quickshell-wrapped", type = "screencopy", mode = "allow" })
hl.permission({
	binary = "/nix/store/.*-quickshell-.*/bin/.quickshell-wrapped",
	type = "screencopy",
	mode = "allow",
})

-- hl.permission({ binary = "${pkgs.wf-recorder}/bin/wf-recorder", type = "screencopy", mode = "allow" })
hl.permission({ binary = "/nix/store/[a-z0-9]{32}-wf-recorder-.*", type = "screencopy", mode = "allow" })
hl.permission({ binary = "/nix/store/[a-z0-9]{32}-noctalia-[0-9.]*/bin/noctalia", type = "screencopy", mode = "allow" })
hl.permission({ binary = "/nix/store/[a-z0-9]{32}-grim-[0-9.]*/bin/grim", type = "screencopy", mode = "allow" })
hl.permission({
	binary = "${pkgs.xdg-desktop-portal-hyprland}/libexec/.xdg-desktop-portal-hyprland-wrapped",
	type = "screencopy",
	mode = "allow",
})
