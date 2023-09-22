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
      RUNTIME_PM_DRIVER_DENYLIST="mei_me";

      CPU_ENERGY_PERF_POLICY_ON_BAT="power";
      CPU_ENERGY_PERF_POLICY_ON_AC="power";

      PLATFORM_PROFILE_ON_BAT="low-power";
      PLATFORM_PROFILE_ON_AC="balanced";

      CPU_BOOST_ON_BAT="0";
      CPU_BOOST_ON_AC="0";

      CPU_HWP_DYN_BOOST_ON_BAT="0";
      CPU_HWP_DYN_BOOST_ON_AC="0";

      RUNTIME_PM_ON_AC="auto";
      RUNTIME_PM_ON_BAT="auto";

      WIFI_PWR_ON_AC="on";
      WIFI_PWR_ON_BAT="on";

    };
  };
}
