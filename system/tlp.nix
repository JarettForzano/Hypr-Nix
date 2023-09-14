{ pkgs, config, ... }:

{
  # Important if you are on a laptop and want more than one hour of battery (you can find tlp settings under the docs) 
  services = {
    tlp.enable = true;
    tlp.settings = {
      TLP_ENABLE = "1";
      CPU_SCALING_GOVERNOR_ON_AC = "powersave";
      CPU_SCALING_GOVEERNOR_ON_ON = "powersave";
      TLP_DEFAULT_MODE = "BAT";
      TLP_PERSISTENT_DEFAULT = "1";
    };
  };
}
