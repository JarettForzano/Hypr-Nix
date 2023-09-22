{ pkgs, config, nix-colors, ... }:
let nix-colors-lib = nix-colors.lib.contrib { inherit pkgs; };
in {
  imports = [ nix-colors.homeManagerModules.default ];
  colorScheme = nix-colors-lib.colorSchemeFromPicture {
    path = /home/jarett/.config/home-manager/photos/wallpaper.png;
  };

  #programs.waybar.nix-colors.enable = true;

}
