{ pkgs, ... }:

{
  home.packages = with pkgs; [

    walker

    # Terminal
    kitty

    # Browser
    brave

    # File Manager
    nemo

    # Wallpaper
    waypaper
    awww
    hyprpaper

    # Lock / Idle
    hyprlock
    hypridle

    # Shell
    quickshell

    # Clipboard
    wl-clipboard
    cliphist

    # Screenshots
    grim
    slurp
    swappy

    # Audio
    pavucontrol
    playerctl

    # Brightness
    brightnessctl

    # Monitoring
    btop
    htop
    fastfetch

    # Utilities
    unzip
    zip
    imv
    jq
    curl
    wget

    # Notifications
    swaynotificationcenter
  ];
}
