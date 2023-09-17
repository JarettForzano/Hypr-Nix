{ config, pkgs, ... }:

{
  home.username = "jarett";
  home.homeDirectory = "/home/jarett";

  home.stateVersion = "23.05"; # Please read the comment before changing.

  home.packages = with pkgs; [
    foot
    (nerdfonts.override { fonts = [ "JetBrainsMono" "Iosevka"]; })
    montserrat
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
    ipafont
    dejavu_fonts
    font-awesome
    sioyek
    arc-icon-theme
    mpvpaper
    obs-cli
    flameshot

  ];

  fonts.fontconfig.enable = true;
  imports = [ ./modules ];
  programs.home-manager.enable = true;
}
