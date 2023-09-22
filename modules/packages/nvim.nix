{ config, pkgs, ... }:

{
  programs.neovim = {
    enable = true;
    package = pkgs.vimPlugins.nvchad;
  };
}
