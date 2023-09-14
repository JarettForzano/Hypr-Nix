{ pkgs, config, ... }: {
# Setup of all the xdg paths
xdg = {
    userDirs = {
      enable = true;
      documents = "$HOME/Documents/";
      download = "$HOME/Downloads/";
      videos = "$HOME/Videos/";
      music = "$HOME/Music/";
      pictures = "$HOME/Pictures/";
      desktop = "$HOME/Desktop/";
    };
  };
}
