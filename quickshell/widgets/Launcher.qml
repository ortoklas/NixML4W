import QtQuick
import Quickshell
import Quickshell.Io

import "../theme"

Text {
    id: launcherButton

    text: "󰀻"

    color: mouseArea.containsMouse
        ? Theme.accent
        : Theme.text

    font.family: "JetBrainsMono Nerd Font"
    font.pixelSize: 22

    Behavior on color {
        ColorAnimation {
            duration: 120
        }
    }

    Process {
        id: launcher

        command: [
            "/home/highv/.nix-profile/bin/walker"
        ]
    }

    MouseArea {
        id: mouseArea

        anchors.fill: parent
        hoverEnabled: true
        cursorShape: Qt.PointingHandCursor

        onClicked: {
            launcher.startDetached()
        }
    }
}
