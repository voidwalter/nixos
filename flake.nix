{
	description = "NixOS :: All Flakes";

	inputs = {
	    nixpkgs.url = "nixpkgs/nixos-unstable";

	    home-manager = {
		    url = "github:nix-community/home-manager";
		    inputs.nixpkgs.follows = "nixpkgs";
	    };

      flake-parts = {
        url = "github:hercules-ci/flake-parts";
        inputs.nixpkgs-lib.follows = "nixpkgs";
      };

			hyprland.url = "github:hyprwm/Hyprland";
			hyprland-plugins = {
				url = "github:hyprwm/hyprland-plugins";
				inputs.hyprland.follows = "hyprland";
			};

			hy3 = {
				url = "github:outfoxxed/hy3";
				inputs.hyprland.follows = "hyprland";
			};

			hyprland-easymotion = {
				url = "github:voidwalter/hyprland-easymotion";
				inputs.hyprland.follows = "hyprland";
			};
			quickshell = {
      	url = "git+https://git.outfoxxed.me/outfoxxed/quickshell";
      	inputs.nixpkgs.follows = "nixpkgs";
    	};

			awww.url = "git+https://codeberg.org/LGFae/awww";

			dms = {
      	url = "github:AvengeMedia/DankMaterialShell/stable";
      	inputs.nixpkgs.follows = "nixpkgs";
    	};

      nixvim = {
				url = "github:nix-community/nixvim";
				inputs.nixpkgs.follows = "nixpkgs";
			};

      zen-browser = {
        url = "github:0xc000022070/zen-browser-flake";
        inputs = {
            nixpkgs.follows = "nixpkgs";
            home-manager.follows = "home-manager";
        };
	    };

			yazi.url = "github:sxyazi/yazi";
			catppuccin.url = "github:catppuccin/nix";
	};

	outputs = {
      self, nixpkgs, home-manager, hyprland, quickshell,
      nixvim, zen-browser,
      ...
  } @inputs:
	{
    nixosConfigurations.nixie = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = { inherit inputs; };
      modules = [
				./modules/nixos/configuration.nix
        home-manager.nixosModules.home-manager
        {
          home-manager = {
            users.rafid = import ./modules/home-manager/default.nix;
            extraSpecialArgs = { inherit inputs; };
            useGlobalPkgs = true;
            useUserPackages = true;
            backupFileExtension = "backup";
          };
        }
      ];
    };
	};
}
