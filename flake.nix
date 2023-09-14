{
  description = "Your new nix config";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixneovimplugins.url = "github:jooooscha/nixpkgs-vim-extra-plugins";
  };
  outputs = inputs @{ self, nixpkgs, home-manager, ... }:
    let
      system = "x86_64-linux";
    in {
      nixosConfigurations = {
        laptop =
          nixpkgs.lib.nixosSystem { modules = [ ./system/configuration.nix ]; };
      };
      homeConfigurations = {
        jarett = inputs.home-manager.lib.homeManagerConfiguration {
          pkgs = nixpkgs.legacyPackages.${system};
          modules = [
            ./home.nix
            { nixpkgs.config.allowUnfreePredicate = _: true;}
            { nixpkgs.overlays = [ inputs.nixneovimplugins.overlays.default ]; }
          ];
        };
      };
    };
}

