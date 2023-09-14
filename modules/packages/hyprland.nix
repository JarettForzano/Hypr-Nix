{ config, pkgs, ... }:

{
# Configuration for hyprland (not imported through flake since the flake version does not have support for hyprland.settings)
  wayland.windowManager.hyprland = {
    enable = true;
    systemdIntegration = true;
    enableNvidiaPatches = false;
    xwayland.enable = false;

    settings = {
      "$MOD" = "SUPER";

      exec-once = [
        "dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESK &"

        "wl-paste -p --watch wl-copy -p ''"
      ];

      input = {
        kb_layout = "us";
        follow_mouse = 0;
        sensitivity = 0;
        accel_profile = "flat";
        natural_scroll = false;
        touchpad = { disable_while_typing = false; };
        kb_options = "caps:escape";
      };
      general = {
        gaps_in = 6;
        gaps_out = 8;
        border_size = 2;
        "col.active_border" = "rgba(ffffffee)";
        "col.inactive_border" = "0xff292a37";
      };

      misc = {
        disable_hyprland_logo = true;
        disable_splash_rendering = true;
        mouse_move_enables_dpms = true;
      };

      decoration = {
        rounding = 14;
        drop_shadow = true;
        shadow_range = 15;
        "col.shadow" = "0xFFDAB9E5";
        "col.shadow_inactive" = "0x50000000";
        #blur = {
        #enable = true;
        #passes = 2;
        #size = 7;
        #new_optimizations = true;
        #noise = 0.07;
        #contrast = 1.6;
        #brightness = 1.1;
        #};
      };

      animations = {
        enabled = true;

        bezier = [
          "smoothOut, 0.36, 0, 0.66, -0.56"
          "smoothIn, 0.25, 1, 0.5, 1"
          "overshot, 0.4,0.8,0.2,1.2"
        ];

        animation = [
          "windows, 1, 4, overshot, slide"
          "windowsOut, 1, 4, smoothOut, slide"
          "border,1,10,default"

          "fade, 1, 10, smoothIn"
          "fadeDim, 1, 10, smoothIn"
          "workspaces,1,4,overshot,slidevert"
        ];
      };
      dwindle = {
        pseudotile = false;
        preserve_split = "yes";
        no_gaps_when_only = false;
      };
      bind = [
        "$MOD,tab,exec,foot"
        "$MOD,M,exec,hyprctl dispatch exit"
        "$MODSHIFT,Q,killactive"
        "$MOD, Space, togglefloating"
        "$MOD,Q,exec,rofi -show drun"
        "$MOD,F,fullscreen"
        "SHIFTALT,F,exec,thunar"
        ",XF86AudioMute, exec, pactl set-sink-mute @DEFAULT_SINK@ toggle "
        ",XF86AudioMicMute, exec, pactl set-source-mute @DEFAULT_SOURCE@ toggle"

        "$MOD, left, movefocus, l"
        "$MOD, right, movefocus, r"
        "$MOD, up, movefocus, u"
        "$MOD, down, movefocus, d"

        "$MODSHIFT, left, movewindow, l"
        "$MODSHIFT, right, movewindow, r"
        "$MODSHIFT, up, movewindow, u"
        "$MODSHIFT, down, movewindow, d"

        "$MOD,A,focusmonitor,DP-1"
        "$MOD,D,focusmonitor,eDP-1"
        "ALT,D,movewindow, mon:eDP-1"
        "ALT,A,movewindow, mon:DP-1"

        "$MOD, 1, workspace, 1"
        "$MOD, 2, workspace, 2"
        "$MOD, 3, workspace, 3"
        "$MOD, 4, workspace, 4"
        "$MOD, 5, workspace, 5"
        "$MOD, 6, workspace, 6"
        "$MOD, 7, workspace, 7"
        "$MOD, 8, workspace, 8"
        "$MOD, 9, workspace, 9"

        "$MODSHIFT, 1, movetoworkspace, 1"
        "$MODSHIFT, 2, movetoworkspace, 2"
        "$MODSHIFT, 3, movetoworkspace, 3"
        "$MODSHIFT, 4, movetoworkspace, 4"
        "$MODSHIFT, 5, movetoworkspace, 5"
        "$MODSHIFT, 6, movetoworkspace, 6"
        "$MODSHIFT, 7, movetoworkspace, 7"
        "$MODSHIFT, 8, movetoworkspace, 8"
        "$MODSHIFT, 9, movetoworkspace, 9"
      ];

      binde = [
        ",xf86monbrightnessup,exec,brightnessctl set +5%"
        ",xf86monbrightnessdown,exec,brightnessctl set 5%-"
        ",XF86AudioRaiseVolume, exec, pactl set-sink-volume @DEFAULT_SINK@ +5%"
        ",XF86AudioLowerVolume, exec, pactl set-sink-volume @DEFAULT_SINK@ -5%"
      ];

      bindm = [ "$MOD,mouse:272,movewindow" "$MOD,mouse:273,resizewindow" ];
    };
    extraConfig =
      "\n        monitor = eDP-1,1920x1080@60,0x0,1\n        monitor = DP-1,1920x1080@60,0x1920,1\n\n      ";

  };
}
