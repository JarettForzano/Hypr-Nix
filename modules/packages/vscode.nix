{ pkgs, inputs, ... }:
{
  programs.vscode = {
    enable = true;
    package = pkgs.vscode;
    extensions = [ vscode-extensions.ms-vscode.cpptools ];
  };
}
