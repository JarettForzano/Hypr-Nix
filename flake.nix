{
  description = "Your new nix config";

  inputs = {
    nixpkgs-wayland.url = "github:nix-community/nixpkgs-wayland";
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
                nix.settings = {
                  # add binary caches
                  trusted-public-keys = [
                    "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
                    "nixpkgs-wayland.cachix.org-1:3lwxaILxMRkVhehr5StQprHdEo4IrE8sRho9R9HOLYA="
                  ];
                  substituters = [
                    "https://cache.nixos.org"
                    "https://nixpkgs-wayland.cachix.org"
                  ];
                };

                # use it as an overlay
                nixpkgs.overlays = [ inputs.nixpkgs-wayland.overlay ];
              };
            })

          ];

        };
      };
      homeConfigurations = {
        jarett = inputs.home-manager.lib.homeManagerConfiguration {
          extraSpecialArgs = { };
          pkgs = nixpkgs.legacyPackages.${system};
          modules = [
            ./home.nix
            { nixpkgs.config.allowUnfreePredicate = _: true; }
          ];
        };
      };
    };
}

