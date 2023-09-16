{ pkgs, config, ...}:

{
  programs.eww = {
    enable = false;
    package = pkgs.eww-wayland;
    configDir = ./eww;
  };
}
