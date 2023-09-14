{ inputs, pkgs, config, ... }:

{
  # Used to define my git account
  programs.git = {
    enable = true;
    userName = "Zaikoa";
    userEmail = "jpforzanojr@gmail.com";
  };
}
