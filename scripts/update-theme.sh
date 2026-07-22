#!/usr/bin/env bash

WALLPAPER="$1"

if [ -z "$WALLPAPER" ] || [ ! -f "$WALLPAPER" ]; then
    echo "Usage: update-theme.sh /path/to/wallpaper"
    exit 1
fi

PALETTE=$(
    magick "$WALLPAPER" \
        -resize 100x100 \
        -colors 8 \
        -unique-colors \
        txt:- \
        | grep -E '^([0-9]+),([0-9]+):' \
        | head -n 8 \
        | sed -E 's/.*#([0-9A-Fa-f]{6}).*/\1/'
)

COLORS=($PALETTE)

BACKGROUND="${COLORS[0]}"
BACKGROUND_ALT="${COLORS[1]}"
SURFACE="${COLORS[2]}"
SURFACE_ALT="${COLORS[3]}"
ACCENT="${COLORS[5]}"
ACCENT_STRONG="${COLORS[3]}"
TEXT="F2F2F2"
TEXT_MUTED="${COLORS[6]}"

cat > "$HOME/.config/home-manager/quickshell/theme/Theme.qml" <<THEME
pragma Singleton

import QtQuick

QtObject {
    readonly property color background: "#$BACKGROUND"
    readonly property color backgroundAlt: "#$BACKGROUND_ALT"

    readonly property color surface: "#$SURFACE"
    readonly property color surfaceAlt: "#$SURFACE_ALT"

    readonly property color accent: "#$ACCENT"
    readonly property color accentStrong: "#$ACCENT_STRONG"

    readonly property color text: "#$TEXT"
    readonly property color textMuted: "#$TEXT_MUTED"

    readonly property int barHeight: 40
}
THEME
