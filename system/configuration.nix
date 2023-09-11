{ config, pkgs, ... }:

{
  imports = [ # Include the results of the hardware scan.
    ./hardware-configuration.nix
    ./tlp.nix
  ];

  networking.hostName = "jarett"; # Define your hostname.
  boot = {
    initrd.kernelModules = [ "i915" ];
    initrd.verbose = false;
    initrd.systemd.enable = true;
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
      efi.efiSysMountPoint = "/boot/efi";
      systemd-boot.configurationLimit = 2;
    };
    blacklistedKernelModules = [ "nvidia" "nouveau" "psmouse" ];
  };
  
  networking.networkmanager.enable = true;

  time.timeZone = "America/New_York";

  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

  services.xserver.enable = false;

  users.users.jarett = {
    isNormalUser = true;
    description = "Jarett";
    extraGroups = [ "networkmanager" "wheel" ];
    shell = pkgs.zsh;
    packages = with pkgs; [ ];
  };

  nix = {
    settings.auto-optimise-store = true;
    settings.allowed-users = [ "jarett" ];
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
    };
  };

  nixpkgs.config.allowUnfree = true;

  xdg = {
    autostart.enable = true;
    portal = {
      enable = true;
      wlr.enable = true;
      extraPortals = [ pkgs.xdg-desktop-portal pkgs.xdg-desktop-portal-gtk ];
    };
  };
environment.variables = {
        NIXOS_CONFIG = "$HOME/.config/home-manager/system/configuration.nix";
        NIXOS_CONFIG_DIR = "$HOME/.config/home-manager/";
        XDG_DATA_HOME = "$HOME/.local/share";
        GTK_RC_FILES = "$HOME/.local/share/gtk-1.0/gtkrc";
        GTK2_RC_FILES = "$HOME/.local/share/gtk-2.0/gtkrc";
        MOZ_ENABLE_WAYLAND = "1";
        EDITOR = "nvim";
        DIRENV_LOG_FORMAT = "";
        ANKI_WAYLAND = "1";
        DISABLE_QT5_COMPAT = "0";
    };
  environment.systemPackages = with pkgs; [
    vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    nixfmt
    firefox
  ];
  #programs.hyprland.enable = true;
  #programs.hyprland.xwayland.enable = false;
  


  programs.zsh.enable = true;
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  nix.nixPath = [ "nixpkgs=/home/jarett" ];
  system.stateVersion = "22.11"; # Did you read the comment?

}
