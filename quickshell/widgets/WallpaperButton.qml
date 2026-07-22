import QtQuick
import Quickshell
import Quickshell.Io

import "../theme"

Text {
    id: wallpaperButton

    text: "󰸉"

    color: mouseArea.containsMouse
        ? Theme.accent
        : Theme.text

    font.family: "JetBrainsMono Nerd Font"
    font.pixelSize: 20

    Behavior on color {
        ColorAnimation {
            duration: 120
        }
    }

    Process {
        id: wallpaperPicker

        command: [
            "/run/current-system/sw/bin/sh",
            "/home/highv/.config/home-manager/scripts/wallpaper-picker.sh"
        ]
    }

    MouseArea {
        id: mouseArea

        anchors.fill: parent
        hoverEnabled: true
        cursorShape: Qt.PointingHandCursor

        onClicked: {
            wallpaperPicker.startDetached()
        }
    }
}
