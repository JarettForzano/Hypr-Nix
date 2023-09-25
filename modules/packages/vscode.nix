{ pkgs, inputs, ... }:
{
  programs.vscode = {
    enable = true;
    package = (import inputs.nixpkgs-vscode {
        system = pkgs.system;
        config.allowUnfree = true;
      })
      .vscode;
  };
}
