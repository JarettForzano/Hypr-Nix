{ config, pkgs, ... }:

{
  home.username = "jarett";
  home.homeDirectory = "/home/jarett";

  home.stateVersion = "23.05"; # Please read the comment before changing.

  home.packages = with pkgs; [
	foot
	(nerdfonts.override {fonts = ["JetBrainsMono"];})
	rofi-wayland
	starship
	zoxide
	bat
	eza
	pastebinit
	rnix-lsp
	sumneko-lua-language-server
	stylua
	webcord-vencord
	
	
];
fonts.fontconfig.enable = true;

  # if you don't want to manage your shell through Home Manager.
  home.sessionVariables = {
    # EDITOR = "emacs";
  };
  imports = [ ./modules ./system ];
  programs.home-manager.enable = true;
}
