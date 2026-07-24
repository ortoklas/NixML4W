import QtQuick
import Quickshell
import Quickshell.Io

import "../theme"

Rectangle {
    id: volumeButton

    width: 90
    height: 32

    radius: 16

    color: mouseArea.containsMouse
        ? Theme.accentStrong
        : "transparent"

    scale: mouseArea.containsMouse ? 1.05 : 1.0

    Behavior on color {
        ColorAnimation {
            duration: 120
        }
    }

    Behavior on scale {
        NumberAnimation {
            duration: 120
        }
    }

    property int volumePercent: 0
    property bool muted: false

    Text {
        id: volumeText

        anchors.centerIn: parent

        text: volumeButton.muted
            ? "󰝟  MUTE"
            : "󰕾  " + volumeButton.volumePercent + "%"

        color: mouseArea.containsMouse
            ? Theme.text
            : Theme.textMuted

        font.family: "JetBrainsMono Nerd Font"
        font.pixelSize: 13
        font.bold: true
    }

    Process {
        id: volumeStatus

        command: [
            "/run/current-system/sw/bin/wpctl",
            "get-volume",
            "@DEFAULT_AUDIO_SINK@"
        ]

        running: true

        stdout: StdioCollector {
            onStreamFinished: {
                var output = this.text.trim()

                volumeButton.muted =
                    output.indexOf("[MUTED]") !== -1

                var match =
                    output.match(/Volume:\s+([0-9.]+)/)

                if (match) {
                    volumeButton.volumePercent =
                        Math.round(
                            parseFloat(match[1]) * 100
                        )
                }
            }
        }
    }

    Timer {
        interval: 1000
        running: true
        repeat: true

        onTriggered: {
            volumeStatus.running = true
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

        onExited: {
            volumeStatus.running = true
        }
    }

    Process {
        id: volumeUp

        command: [
            "/run/current-system/sw/bin/wpctl",
            "set-volume",
            "@DEFAULT_AUDIO_SINK@",
            "5%+"
        ]

        onExited: {
            volumeStatus.running = true
        }
    }

    Process {
        id: volumeDown

        command: [
            "/run/current-system/sw/bin/wpctl",
            "set-volume",
            "@DEFAULT_AUDIO_SINK@",
            "5%-"
        ]

        onExited: {
            volumeStatus.running = true
        }
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
