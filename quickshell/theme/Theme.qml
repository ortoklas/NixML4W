pragma Singleton

import QtQuick
import Quickshell.Io

QtObject {
    id: theme

    property var palette: ({})

    property FileView themeFile: FileView {
        path: "/home/highv/.config/quickshell-theme.json"
        watchChanges: true

        onLoaded: {
            theme.palette = JSON.parse(text())
        }

        onFileChanged: {
            reload()
        }

        onTextChanged: {
            if (text.length > 0) {
                theme.palette = JSON.parse(text())
            }
        }
    }

    readonly property color background:
        palette.background || "#1b1b2b"

    readonly property color backgroundAlt:
        palette.backgroundAlt || "#23233a"

    readonly property color surface:
        palette.surface || "#2b2b44"

    readonly property color surfaceAlt:
        palette.surfaceAlt || "#3a3a55"

    readonly property color accent:
        palette.accent || "#88c0d0"

    readonly property color accentStrong:
        palette.accentStrong || "#5e81ac"

    readonly property color text:
        palette.text || "#F2F2F2"

    readonly property color textMuted:
        palette.textMuted || "#a0a0a0"

    readonly property int barHeight: 40
}
