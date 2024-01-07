{ config, pkgs, ... }:

{
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    plugins = with pkgs.vimPlugins; [
      {
        plugin = telescope-nvim;
        config = "	lua require('telescope').setup()\n\n";
      }
      telescope-coc-nvim
      windows-nvim
      nvim-fzf
      nvim-treesitter
      nvim-treesitter.withAllGrammars
    ];
  };
}
