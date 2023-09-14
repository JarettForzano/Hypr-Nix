{ inputs, pkgs, config, ... }:

{
	home.stateVersion = "23.05";

	imports = [
		./xdg.nix
		#./gtk.nix
	];
}
