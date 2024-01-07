{
  description = "Your new nix config";

  inputs = {
    nixpkgs-wayland.url = "github:nix-community/nixpkgs-wayland";
    nixpkgs-wayland.inputs.nixpkgs.follows = "nixpkgs";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  outputs = inputs@{ self, nixpkgs, home-manager, ... }:
    let system = "x86_64-linux";
    in {
      nixosConfigurations = {
        laptop = nixpkgs.lib.nixosSystem {
          modules = [
            ./system/configuration.nix
            ({ pkgs, config, ... }: {
              config = {
	        nix.nixPath = ["nixpkgs=flake:nixpkgs"];
                nix.settings = {
                  trusted-public-keys = [
                    "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
                    "nixpkgs-wayland.cachix.org-1:3lwxaILxMRkVhehr5StQprHdEo4IrE8sRho9R9HOLYA="
                  ];
                  substituters = [
                    "https://cache.nixos.org"
                    "https://nixpkgs-wayland.cachix.org"
                  ];
                };
		
                nixpkgs.overlays = [ inputs.nixpkgs-wayland.overlay ];


              };
            })

          ];

        };
      };
      homeConfigurations = {
        jarett = inputs.home-manager.lib.homeManagerConfiguration {
          extraSpecialArgs = { inherit inputs; };
          pkgs = nixpkgs.legacyPackages.${system};
          modules = [
            ./home.nix
            {
	    	nixpkgs.config.allowUnfreePredicate = _: true; 
		home.sessionVariables.NIX_PATH = "nixpkgs=flake:nixpkgs$\{NIX_PATH:+:$NIX_PATH}";
	    }
          ];
        };
      };
    };
}

