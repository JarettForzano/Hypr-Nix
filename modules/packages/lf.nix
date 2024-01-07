{ pkgs, inputs, ... }:

{
  programs.lf = {
    enable = true;
    commands = {
      dragon-out = ''%${pkgs.xdragon}/bin/xdragon -a -x "$fx"'';
      mkdir = ''
                ''${{
                printf "Directory Name: "
                read DIR
                mkdir $DIR
                }}
        	'';
      zip = ''
        ''${{
        set -f
        mkdir $1
        cp -r $fx $1
        zip -r $1.zip $1
        rm -rf $1
        }}
      '';
    };
    keybindings = {
      ee = "editor-open";
      V = ''$''${pkgs.bat}/bin/bat --paging=always --theme=gruvbox "$f"'';
      do = "dragon-out";
      c = "mkdir";
      q = "quit";
    };
    settings = {
      preview = true;
      hidden = true;
      drawbox = true;
      icons = true;
      ignorecase = true;
    };
    previewer = {
      keybinding = "i";
      source = "${pkgs.ctpv}/bin/ctpv";
    };
    extraConfig = ''
      &${pkgs.ctpv}/bin/ctpv -s $id
      cmd on-quit %${pkgs.ctpv}/bin/ctpv -e $id
      set cleaner ${pkgs.ctpv}/bin/ctpvclear
    '';
  };

  #xdg.configFile."lf/icons".source = "${inputs.lf-icons}/etc/icons.example";
}
