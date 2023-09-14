{
description = "Your new nix config";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixneovimplugins.url = github:jooooscha/nixpkgs-vim-extra-plugins;
  };
  outputs = { nixpkgs, home-manager, ... }@inputs:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in {
      nixosConfigurations = {
        laptop = nixpkgs.lib.nixosSystem {
          modules = [
            ./system/configuration.nix
          ];
        };
      };
      homeConfigurations = {
        jarett = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          modules = [
            ./home.nix
		{
 		nixpkgs.overlays = [
                                inputs.nixneovimplugins.overlays.default
                            ];
}
          ];
        };
      };
    };
}

