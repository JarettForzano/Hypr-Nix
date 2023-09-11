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
	
];
fonts.fontconfig.enable = true;
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  # if you don't want to manage your shell through Home Manager.
  home.sessionVariables = {
    # EDITOR = "emacs";
  };
  imports = [ ./modules ./system ];
  programs.home-manager.enable = true;
}
