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

      nixvim = {
        url = "github:nix-community/nixvim";
      };

      zen-browser = {
        url = "github:0xc000022070/zen-browser-flake";
        inputs = {
            nixpkgs.follows = "nixpkgs";
            home-manager.follows = "home-manager";
        };
	    };

	    noctalia = {
	      url = "github:noctalia-dev/noctalia-shell";
	      inputs.nixpkgs.follows = "nixpkgs";
	      inputs.noctalia-qs.follows = "noctalia-qs";
	    };

	    noctalia-qs = {
	      url = "github:noctalia-dev/noctalia-qs";
	      inputs.nixpkgs.follows = "nixpkgs";
	    };

      spicetify-nix.url = "github:Gerg-L/spicetify-nix";
	};

	outputs = { 
      self, nixpkgs, home-manager,
      nixvim, zen-browser, 
      ...
  } @inputs: 
	{
    nixosConfigurations.nixie = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = { inherit inputs; };
      modules = [
        home-manager.nixosModules.home-manager

        ./configuration.nix
        ./modules/common/default.nix

        {
          home-manager = {
            users.rafid = import ./modules/home-manager/home.nix;
            extraSpecialArgs = { inherit inputs; };
            
            sharedModules = [ nixvim.homeManagerModules.nixvim ];
            useGlobalPkgs = true;
            useUserPackages = true;
            backupFileExtension = "backup";
          };
        }
      ];
    };
	};
}
