{ pkgs, ... }:
{ 
# GTK options (can be found if you look up home-manager options)
  gtk = {
    enable=true;
      
    theme = {
      name = "Catppuccin-Mocha-Compact-Rosewater-dark";
      package = pkgs.catppuccin-gtk.override {
        accents = [ "rosewater" ];
        size = "compact";
        tweaks = [ "rimless" ];
        variant = "mocha";
      };
    };
      
    cursorTheme = {
        name = "phinger-cursors";
        package = pkgs.phinger-cursors;
    };
/* 
    iconTheme = {
        name = "Papirus";
        package = pkgs.papirus-icon-theme.override {
        color = "white";
      };
    };
*/
  };
}
