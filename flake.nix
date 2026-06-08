{
  description = "NixOS : Flakes";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    agenix = {
      url = "github:ryantm/agenix";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.darwin.follows = ""; # choose not to download darwin deps
    };

    firefox-addons = {
      url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hyprland.url = "github:hyprwm/Hyprland/fcbbd6d4d80033c40e3b702518e1a2ba3f479452";
    hyprland-plugins = {
      url = "github:hyprwm/hyprland-plugins";
      inputs.hyprland.follows = "hyprland";
    };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hosts = {
      url = "github:StevenBlack/hosts";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    neovim.url = "github:nix-community/neovim-nightly-overlay";
    nur = {
      url = "github:nix-community/NUR";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    shell = {
      url = "github:voidwalter/Qore/void";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    zen = {
      url = "github:voidwalter/zen-browser-flake/main";
      inputs = {
        nixpkgs.follows = "nixpkgs";
        home-manager.follows = "home-manager";
      };
    };
  };

  outputs =
    {
      self,
      nixpkgs,
      agenix,
      hosts,
      nur,
      home-manager,
      hyprland,
      nixvim,
      zen,
      ...
    }@inputs:
    {
      nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = { inherit inputs; };
        modules = [
          ./system
          hosts.nixosModule
          nur.modules.nixos.default
          agenix.nixosModules.default
          home-manager.nixosModules.home-manager
          {
            home-manager = {
              users.void = import ./home;
              extraSpecialArgs = { inherit inputs; };
              useUserPackages = true;
              backupFileExtension = "backup";
            };
          }
        ];
      };
    };
}
