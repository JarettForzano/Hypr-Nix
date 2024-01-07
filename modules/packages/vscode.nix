{ pkgs, inputs, ... }: {
  programs.vscode = {
    enable = true;
    package = pkgs.vscodium;
    extensions = [ ];
  };
}
