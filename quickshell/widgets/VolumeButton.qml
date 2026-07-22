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
   Process {
       id: volumeUp
       command: ["/run/current-system/sw/bin/wpctl", "set-volume", "@DEFAULT_AUDIO_SINK@", "5%+"]
   }

   Process {
       id: volumeDown
       command: ["/run/current-system/sw/bin/wpctl", "set-volume", "@DEFAULT_AUDIO_SINK@", "5%-"]
   }




    MouseArea {
        id: mouseArea

        anchors.fill: parent
        hoverEnabled: true
        cursorShape: Qt.PointingHandCursor

       onWheel: function(wheel) {
           if (wheel.angleDelta.y > 0) {
               volumeUp.running = true
           } else if (wheel.angleDelta.y < 0) {
               volumeDown.running = true
           }
       }

        onClicked: {
            toggleMute.running = true
        }

    }
}
