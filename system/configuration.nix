{ config, pkgs, ... }:

{
  # Import extensions to configuration.nix (stuff that is specific to my system)
  imports = [ ./hardware-configuration.nix ./tlp.nix ./nvidia.nix ];

  # Setting up the hostname (shown in flake.nix)
  networking.hostName = "laptop";

  # Telling boot to make sure it uses intel module and the rest is just setting up systemd-boot (boot options)
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
    # Black listed modules on startup (normally stuff that will just throw a error on boot)
    blacklistedKernelModules = [ "psmouse" ];
  };

  networking.networkmanager.enable = true;

  # Time zone stuff
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
  # services / packages (for organization)
  services.xserver.enable = false;
  programs.zsh.enable = true;
  security.polkit.enable = true;

  # Setup user here (make sure you have a password if not defined here)
  users.users.jarett = {
    isNormalUser = true;
    description = "Jarett";
    extraGroups = [ "networkmanager" "wheel" ];
    shell = pkgs.zsh;
    packages = with pkgs; [ ];
  };
  # Nix options for running gc automatically (removes the need to run it manually) 
  nix = {
    settings.auto-optimise-store = true;
    settings.allowed-users = [ "jarett" ];
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
    };
  };
  # Self explanitory (will also need in home.nix if running standalone)
  nixpkgs.config.allowUnfree = true;

  # Start xdg portal
  xdg = {
    autostart.enable = true;
    portal = {
      enable = true;
      extraPortals = [ pkgs.xdg-desktop-portal pkgs.xdg-desktop-portal-gtk ];
    };
  };

  # Setup environment variables (most of this depends on what you wm you are using) echo $environment (variable.name)
  environment.variables = {
    NIXOS_CONFIG = "$HOME/.config/home-manager/system/configuration.nix";
    NIXOS_CONFIG_DIR = "$HOME/.config/home-manager/";
    XDG_DATA_HOME = "$HOME/.local/share";
    GTK_RC_FILES = "$HOME/.local/share/gtk-1.0/gtkrc";
    GTK2_RC_FILES = "$HOME/.local/share/gtk-2.0/gtkrc";
    MOZ_ENABLE_WAYLAND = "1";
    ANKI_WAYLAND = "1";
    DISABLE_QT5_COMPAT = "0";
    NIXOS_OZONE_WL = "1";
    MOZ_WEBRENDER = "1";
  };

  # Stuff installed globally throughout all users (ill take your kneecaps if you dont use nxfmt to format your .nix files)
  environment.systemPackages = with pkgs; [ vim nixfmt firefox ];

  # Sound setup. Can be changed (use pavucontrol to select devices in use -- even though you arent using pavu to control sound)
  security.rtkit.enable = true;

  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  hardware = {
    bluetooth.enable = false;
    opengl = {
      enable = true;
      driSupport = true;
      driSupport32Bit = true;
    };
  };

  # Setup for flakes and declaration of config.version (dont worry about nix.nixPath)
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  nix.nixPath = [ "nixpkgs=/home/jarett" ];
  system.stateVersion = "22.11"; # Did you read the comment?

}
