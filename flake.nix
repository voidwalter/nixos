{
	description = "NixOS :: All Flakes";

	inputs = {
	    nixpkgs.url = "nixpkgs/nixos-unstable";

	    home-manager = {
		    url = "github:nix-community/home-manager";
		    inputs.nixpkgs.follows = "nixpkgs";
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
            users.rafid = { config, lib, pkgs, modulesPath, ... }@args:
              import ./modules/home-manager/main.nix (args // { inherit inputs; });
            
            useGlobalPkgs = true;
            useUserPackages = true;
            backupFileExtension = "backup";
          };
        }
      ];
    };
	};
}
