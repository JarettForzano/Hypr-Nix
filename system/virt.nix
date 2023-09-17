{pkgs, config, ...}:

{
  virtualisation.libvirtd.enable = true;
  environment.systemPackages = with pkgs; [ virt-manager qemu];
  programs.dconf.enable = true;
}
