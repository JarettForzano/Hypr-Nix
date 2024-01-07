let
    pkgs = import <nixpkgs> {};
in
  pkgs.mkShell {

    nativeBuildInputs = with pkgs; [ gnumake libgcc ];
    
    shellHook = ''
    	echo "In shell"
    '';
}
