{ config, pkgs, ... }:

{
  home.username = "jarett";
  home.homeDirectory = "/home/jarett";

  home.stateVersion = "23.05"; # Please read the comment before changing.

  home.packages = with pkgs; [
    foot
    (nerdfonts.override { fonts = [ "JetBrainsMono" ]; })
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
    brightnessctl
    unzip
    croc
    btop
    anki
    jdk17
    maven
    vscode-fhs
    hyprpaper

  ];

nixpkgs.config = {
  allowUnfree = true;
};

  fonts.fontconfig.enable = true;
  imports = [ ./modules ];
  programs.home-manager.enable = true;
}
