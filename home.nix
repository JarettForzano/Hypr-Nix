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
    zip
    eza
    pastebinit
    rnix-lsp
    sumneko-lua-language-server
    stylua
    brightnessctl
    unzip
    croc
    btop
    anki
    jdk17
    maven
    ipafont
    dejavu_fonts
    font-awesome
    sioyek
    arc-icon-theme
    mpvpaper
    grim
    slurp
    wl-clipboard
    obsidian
    nodejs_20
    ani-cli
    nodePackages."@angular/cli"
    tinycc
    cinnamon.nemo
    webcord
    spring-boot-cli
    (python3.withPackages(ps: with ps; [ flask flask-cors ]))
    nodePackages.typescript
    baekmuk-ttf
  ];

  fonts.fontconfig.enable = true;
  imports = [ ./modules ];
  programs.home-manager.enable = true;
}
