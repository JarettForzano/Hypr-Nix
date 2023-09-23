{ pkgs, config, inputs, fetchurl, lib, ... }:
let
    vscode = pkgs.vscode.overrideAttrs(old: rec {
    version = "1.60.0";
    src = fetchurl {
      name = "VSCode_${version}_linux-x64.tar.gz";
      url = "https://update.code.visualstudio.com/${version}/linux-x64/stable";
      sha256 = "0g49765pnimh107pw3q7dlgd6jcmr5gagsvxrdx8i93mbxb0xm0c";
    };
  });
in {
  programs.vscode = {
    enable = true;
    package = vscode;
  };
}
