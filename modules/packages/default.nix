{ inputs, pkgs, config, ... }:

{

  home.stateVersion = "23.05";

  imports = [ ./hyprland.nix ./foot.nix ./starship.nix ./zsh.nix ./nvim.nix ./nix-colors.nix ./rofi.nix ./waybar.nix ];

}
