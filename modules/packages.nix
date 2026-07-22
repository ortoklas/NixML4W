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
    feh
    jq
    curl
    wget

    # Notifications
    swaynotificationcenter
  ];
}
