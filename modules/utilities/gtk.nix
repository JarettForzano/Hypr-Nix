{ pkgs, ... }:
{ 
# GTK options (can be found if you look up home-manager options)
  gtk = {
    enable=true;
      
    theme = {
      name = "Arc-Dark";
      package = pkgs.arc-theme;
    };
      
    cursorTheme = {
        name = "phinger-cursors";
        package = pkgs.phinger-cursors;
    };

    iconTheme = {
        name = "arc-icon-theme";
        package = pkgs.arc-icon-theme;
    };

  };
}
