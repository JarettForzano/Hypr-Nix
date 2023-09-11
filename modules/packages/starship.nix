{ pkgs, lib, config,... }:

{
  home.sessionVariables.STARSHIP_CACHE = "${config.xdg.cacheHome}/starship";
  programs.starship = {
    enable = true;
    enableZshIntegration = true;
    settings = {
      add_newline = false;
      format = lib.concatStrings [
        ""
        "[╭╴](238)$directory$all[╰─](238)$character"
        ""
      ];
      character = {
        success_symbol = "[λ](green)";
        error_symbol = "[λ](red)";
        vimcmd_symbol = "[](bright-black)";
        vimcmd_visual_symbol = "[](bold-red)";
      };
      sudo = { symbol = "[](bright-green)"; };
    };
  };
}
