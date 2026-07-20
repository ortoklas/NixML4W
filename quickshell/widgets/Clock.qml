import QtQuick
import Quickshell
import Quickshell.Io

Text {
    id: clock

    color: "white"

    font.family: "JetBrainsMono Nerd Font"
    font.pixelSize: 15
    font.bold: true

    Process {
        id: date

        command: [
            "date",
            "+%a %b %d  |  %H:%M"
        ]

        stdout: SplitParser {
            onRead: data => clock.text = data.trim()
        }

        running: true
    }

    Timer {
        interval: 1000
        repeat: true
        running: true

        onTriggered: date.running = true
    }
}
