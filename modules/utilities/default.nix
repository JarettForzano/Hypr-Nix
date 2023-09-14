{ inputs, pkgs, config, ... }:

{
	home.stateVersion = "23.05";

	imports = [
		./xdg.nix
		./git.nix
		./gtk.nix
	];
}
