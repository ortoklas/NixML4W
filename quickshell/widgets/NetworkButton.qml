import QtQuick
import Quickshell
import Quickshell.Io

import "../theme"

Text {
    id: networkButton

    text: "󰤨"

    color: mouseArea.containsMouse
        ? Theme.accent
        : Theme.text

    font.family: "JetBrainsMono Nerd Font"
    font.pixelSize: 18

    Behavior on color {
        ColorAnimation {
            duration: 120
        }
    }

    Process {
        id: networkManager

        command: [
            "/home/highv/.nix-profile/bin/kitty",
            "-e",
            "/run/current-system/sw/bin/nmtui"
        ]
    }

    MouseArea {
        id: mouseArea

        anchors.fill: parent
        hoverEnabled: true
        cursorShape: Qt.PointingHandCursor

        onClicked: {
            networkManager.startDetached()
        }
    }
}
