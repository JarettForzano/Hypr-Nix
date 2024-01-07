{ config, pkgs, ... }:

{
  home.username = "jarett";
  home.homeDirectory = "/home/jarett";

  home.stateVersion = "23.05"; # Please read the comment before changing.

  home.packages = with pkgs; [
    vim
    (nerdfonts.override { fonts = [ "JetBrainsMono" "Iosevka"]; })
    montserrat
    starship
    zoxide
    bat
    zip
    eza
    pastebinit
    rnix-lsp
    brightnessctl
    unzip
    croc
    btop
    anki
    ipafont
    dejavu_fonts
    font-awesome
    sioyek
    arc-icon-theme
    mpvpaper
    grim
    slurp
    wl-clipboard
    ani-cli
    tinycc
    cinnamon.nemo
    webcord
    baekmuk-ttf
    lunarvim
  ];

  fonts.fontconfig.enable = true;
  imports = [ ./modules ];
  programs.home-manager.enable = true;
}
