{ lib, ... }:

{
  wayland.windowManager.hyprland.settings = {

    "$mod" = "SUPER";

    bind = [

      # Terminal
      "$mod, RETURN, exec, kitty"

      # Browser
      "$mod, B, exec, brave"

      # File Manager (temporary until Nemo)
      "$mod, E, exec, dolphin"

      # Close window
      "$mod, Q, killactive"

      # Fullscreen
      "$mod, F, fullscreen"

      # Toggle floating
      "$mod, T, togglefloating"

      # Exit Hyprland
      "$mod SHIFT, Q, exit"

      # Launcher (we'll replace later)
      "$mod, SPACE, exec, wofi"

      # Workspaces
      "$mod, 1, workspace, 1"
      "$mod, 2, workspace, 2"
      "$mod, 3, workspace, 3"
      "$mod, 4, workspace, 4"
      "$mod, 5, workspace, 5"

      # Move window
      "$mod SHIFT, 1, movetoworkspace, 1"
      "$mod SHIFT, 2, movetoworkspace, 2"
      "$mod SHIFT, 3, movetoworkspace, 3"
      "$mod SHIFT, 4, movetoworkspace, 4"
      "$mod SHIFT, 5, movetoworkspace, 5"
    ];

  };
}
