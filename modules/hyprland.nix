{ config, pkgs, ... }:

{
  wayland.windowManager.hyprland = {
    enable = true;
    configType = "hyprlang";

    settings = {

      #########################
      ## AUTOSTART
      #########################

      exec-once = [
        "qs -p ~/.config/quickshell"
      ];

      #########################
      ## MONITORS
      #########################

      monitor = [
        "DP-3,3840x2160@60,0x0,1.5"
      ];

      #########################
      ## GENERAL
      #########################

      general = {
        gaps_in = 5;
        gaps_out = 15;

        border_size = 2;

        "col.active_border" = "rgba(5e81acff)";
        "col.inactive_border" = "rgba(444444aa)";

        resize_on_border = true;
        allow_tearing = false;

        layout = "dwindle";
      };

      #########################
      ## DECORATION
      #########################

      decoration = {
        rounding = 12;

        blur = {
          enabled = true;
          size = 8;
          passes = 2;
        };

        shadow = {
          enabled = true;
          range = 12;
          render_power = 3;
        };
      };

      #########################
      ## ANIMATIONS
      #########################

      animations = {
        enabled = true;
      };

      #########################
      ## INPUT
      #########################

      input = {
        kb_layout = "us";

        follow_mouse = 1;

        touchpad = {
          natural_scroll = false;
        };

        sensitivity = 0;
      };
    };
  };
}
