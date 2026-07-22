#!/usr/bin/env bash

WALLPAPER_DIR="$HOME/.config/home-manager/wallpapers"

WALLPAPER=$(
    printf '%s\n' "$WALLPAPER_DIR"/* \
    | /home/highv/.nix-profile/bin/walker --dmenu
)

if [ -n "$WALLPAPER" ]; then
    /run/current-system/sw/bin/awww img "$WALLPAPER"

    "$HOME/.config/home-manager/scripts/update-theme.sh" "$WALLPAPER"

    home-manager switch

    nohup bash -c '
        sleep 2
        pkill qs
        pkill quickshell
        qs --daemonize
    ' >/dev/null 2>&1 &
fi
