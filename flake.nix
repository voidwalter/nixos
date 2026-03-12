{
	description = "NixOS :: All Flakes";

	inputs = {
	    nixpkgs.url = "nixpkgs/nixos-unstable";

	    home-manager = {
		    url = "github:nix-community/home-manager";
		    inputs.nixpkgs.follows = "nixpkgs";
	    };

      nix-flatpak = {
        url = "github:gmodena/nix-flatpak";
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

      # hyprland = {
      #   url = "github:hyprwm/Hyprland";
      #   inputs.nixpkgs.follows = "nixpkgs";
      # };
	};

	outputs = { self, nixpkgs, home-manager, nix-flatpak, zen-browser, ... } @ inputs: 
	  {
	    nixosConfigurations.nixie = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = { inherit inputs; };
        modules = [
          home-manager.nixosModules.home-manager
          # hyprland.nixosModules.default
          nix-flatpak.nixosModules.nix-flatpak

          ./configuration.nix
          ./modules/appearences.nix
          ./modules/dev.nix
          ./modules/flatpak.nix
          ./modules/hyprland.nix
          ./modules/programs.nix
          ./modules/settings.nix
          ./modules/services.nix
          ./modules/security.nix

          {
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              users.rafid = import [
                inputs.noctalia.homeModules.default
                inputs.spicetify-nix.homeManagerModules.default              
                
                ./home/main.nix
              ];
              backupFileExtension = "backup";
            };
          }
        ];
	  };
	};
}
