{ pkgs, conifg, lib, ... }:
with lib;

{
  programs.waybar = {
    enable = true;
    package = pkgs.waybar;
    systemd.enable = true;
    settings = {
      mainBar = {
        height = 30;
        layer = "top";
        modules-left = [ "custom/launcher" "hyprland/workspaces" ];
        modules-center = [ "clock" ];
        modules-right = [
          "tray"
          "hyprland/language"
          "network"
          "pulseaudio"
          "backlight"
          "battery"
        ];
        "hyprland/workspace" = {
          format = "{icon}";
          on-click = "activate";
        };

        "hyprland/language" = { format = "{short} {variant}"; };

        "tray" = { spacing = 10; };

        "clock" = { format = "{:%I:%M}"; };

        "backlight" = {
          format = "{icon}";
          tooltip-format = "{percent}";
          format-icons = [ "󱩎 " "󱩏 " "󱩐 " "󱩑 " "󱩒 " "󱩓 " "󱩔 " "󱩕 " "󱩖 " "󰛨 " ];
        };

        "network" = {
          format-wifi = "{icon}";
          format-ethernet = "󰞉";
          format-disconnected = "󰤭";
          tooltip-format = "{essid}";
          on-click = "${pkgs.foot}/bin/foot ${pkgs.networkmanager} nmtui";
          format-icons = [ "󰤯" "󰤟" "󰤢" "󰤥" "󰤨" ];
        };

        "pulseaudio" = {
          format = "{icon}";
          format-muted = "󰝟";
          format-icons = { default = [ "" "" "󰕾" ]; };
          on-click = "${pkgs.pavucontrol}/bin/pavucontrol";
        };

        "battery" = {
          interval = 60;
          states = {
            warning = 30;
            critical = 15;
          };
          max-length = 20;
          format = "{icon} ";
          format-warning = "{icon}";
          format-critical = "{icon}";
          format-plugged = "󰂄";

          format-alt = "{icon} {time}";
          format-full = "";
          format-icons = [ "󱊡" "󱊢" "󱊣" ];
        };

        "custom/launcher" = {
          format = "󱄅";
          on-click = "${pkgs.rofi-wayland}/bin/rofi -show drun";
        };
      };
    };

    style = ''
      * {
        font-family: Material Design Icons, JetBrainsMono Nerd Font, Iosevka Nerd Font;
        font-size: 16px;
      }

      window#waybar {
        background-color: rgba(17, 17, 17, 0.3);;
        color: #ffffff;
        transition-property: background-color;
      }

      window#waybar.hidden {
        opacity: 0.1;
      }

      #window {
        color: #64727d;
      }

      #clock,
      #tray,
      #mode,
      #custom-lock,
      #workspaces,
      #idle_inhibitor,
      #custom-launcher{
        color: #ffffff;
        border-radius: 6px;
        padding: 2px 6px;
        background-color: rgba(69, 69, 69, 0.39);
        border-radius: 8px;
        font-size: 20px;

        margin-left: 4px;
        margin-right: 4px;

        margin-top: 8.5px;
        margin-bottom: 8.5px;

      }

      #workspaces button {
        color: #7a95c9;
        box-shadow: inset 0 -3px transparent;

        padding-right: 3px;
        padding-left: 4px;

        margin-left: 0.1em;
        margin-right: 0.1em;
      }

      #workspaces button.active {
        color: #ecd3a0;
        padding-left: 1px;
        padding-right: 1px;
        margin-left: 0em;
        margin-right: 0em;
      }

      #custom-launcher {
        margin-left: 12px;

        padding-right: 18px;
        padding-left: 14px;

        font-size: 16px;

        color: #7a95c9;

        margin-top: 8.5px;
        margin-bottom: 8.5px;
      }

      #backlight,
      #battery,
      #pulseaudio,
      #network,
      #language,

      #pulseaudio, #pulseaudio.muted  {
        padding-left: 9px;
        padding-right: 12px;
      }

      #backlight {
        padding-right: 5px;
        padding-left: 8px;
      }

      #language {
        padding-left: 0.2em;
        border-radius: 8px 0px 0px 8px;
        padding-left: 12px;
        padding-right: 0px;
      }

      #network {
        padding-left: 0.2em;
        border-radius: 0px;
        padding-left: 12px;
        padding-right: 14px;;
      }

      #network.disconnected {
        color: #fff;
      }

      #battery {
        color: #2c6fbb;
        border-radius: 0px 8px 8px 0px;
        padding-right: 2px;
      }

      #battery.critical,
      #battery.warning,
      #battery.full,
      #battery.plugged {
        color: #19461a;
        padding-left: 6px;
        padding-right: 12px;
      }

      #battery.charging { 
        padding-right: 13px;
        padding-left: 4px;
      }

      #battery.full,
      #battery.plugged {
        padding-right: 10px;
      }

      #battery.warning {
        color: #f9c70c;
      }

      #battery.critical:not(.charging) {
        color: #c40233;
      }

      #clock {
        font-family: Iosevka Nerd Font;
        font-weight: bold;
        margin-top: 7px;
        margin-bottom: 7px;
        padding: 2px 15px 0 14px;
      }

      tooltip {
        font-family: Iosevka Nerd Font;
        border-radius: 15px;
        padding: 15px;
        background-color: #1f232b;
      }

      tooltip label {
        font-family: Iosevka Nerd Font;
        padding: 5px;
      }

      label:focus {
        background-color: #1f232b;
      }

      #tray {
        margin-right: 8px;
        margin-top: 7px;
        margin-bottom: 7px;
        font-size: 30px;
        padding-left: 0.2em;
        padding-left: 12px;
        padding-right: 0.2em;
        padding-right: 12px;
      }

      #tray > .passive {
        -gtk-icon-effect: dim;
      }

      #idle_inhibitor {
        background-color: #242933;
      }

      #idle_inhibitor.activated {
        background-color: #ecf0f1;
        color: #2d3436;
      }



    '';

  };
}
