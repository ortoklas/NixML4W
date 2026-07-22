import QtQuick
import Quickshell
import Quickshell.Io

import "../theme"

Text {
    id: volumeButton

    text: "󰕾"

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
        id: toggleMute

        command: [
            "/run/current-system/sw/bin/wpctl",
            "set-mute",
            "@DEFAULT_AUDIO_SINK@",
            "toggle"
        ]
    }

    MouseArea {
        id: mouseArea

        anchors.fill: parent
        hoverEnabled: true
        cursorShape: Qt.PointingHandCursor

        onClicked: {
            toggleMute.running = true
        }

        onPressed: {
            if (mouse.button === Qt.LeftButton) {
                // Mute/unmute
                toggleMute.running = true
            }
        }
    }
}
