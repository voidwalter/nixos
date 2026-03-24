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

			quickshell = {
      	url = "git+https://git.outfoxxed.me/outfoxxed/quickshell";
      	inputs.nixpkgs.follows = "nixpkgs";
    	};

      nixvim.url = "github:nix-community/nixvim";

      zen-browser = {
        url = "github:0xc000022070/zen-browser-flake";
        inputs = {
            nixpkgs.follows = "nixpkgs";
            home-manager.follows = "home-manager";
        };
	    };

      spicetify-nix.url = "github:Gerg-L/spicetify-nix";
			vicinae.url = "github:vicinaehq/vicinae";
    	vicinae-extensions.url = "github:vicinaehq/extensions";
			catppuccin.url = "github:catppuccin/nix";


			### Hyprland
			hyprland.url = "github:hyprwm/Hyprland";
			hy3 = {
				url = "github:outfoxxed/hy3";
				inputs.hyprland.follows = "hyprland";
			};
			hyprland-easymotion = {
				url = "github:zakk4223/hyprland-easymotion";
				inputs.hyprland.follows = "hyprland";
			};
	};

	outputs = { 
      self, nixpkgs, home-manager, hyprland, hy3,
      nixvim, zen-browser,
      ...
  } @inputs: 
	{
    nixosConfigurations.nixie = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = { inherit inputs; };
      modules = [

				./modules/core/default.nix
        home-manager.nixosModules.home-manager

        {
          home-manager = {
            users.rafid = import ./modules/home-manager/default.nix;
            extraSpecialArgs = { inherit inputs; };
            
            sharedModules = [ nixvim.homeModules.nixvim ];
            useGlobalPkgs = true;
            useUserPackages = true;
            backupFileExtension = "backup";
          };
        }
      ];
    };
	};
}
