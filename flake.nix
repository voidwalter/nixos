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
      nixvim.url = "github:nix-community/nixvim";

      zen-browser = {
        url = "github:0xc000022070/zen-browser-flake";
        inputs = {
            nixpkgs.follows = "nixpkgs";
            home-manager.follows = "home-manager";
        };
	    };

      spicetify-nix.url = "github:Gerg-L/spicetify-nix";
	};

	outputs = { 
      self, nixpkgs, home-manager, hyprland,
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
