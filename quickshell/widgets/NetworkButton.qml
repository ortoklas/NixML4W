import QtQuick
import Quickshell
import Quickshell.Io

import "../theme"

Rectangle {
    id: networkButton

    width: 64
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

    property string connectionType: "offline"
    property string connectionName: ""

    Text {
        id: networkText

        anchors.centerIn: parent

        text: {
            if (networkButton.connectionType === "ethernet")
                return "󰈀  LAN"
        
            if (networkButton.connectionType === "wifi")
                return "󰤨  WiFi"
        
            return "󰤭  OFF"
        }

        color: mouseArea.containsMouse
            ? Theme.text
            : Theme.textMuted

        font.family: "JetBrainsMono Nerd Font"
        font.pixelSize: 13
        font.bold: true
    }

    Process {
        id: networkStatus

        command: [
            "/run/current-system/sw/bin/nmcli",
            "-t",
            "-f",
            "DEVICE,TYPE,STATE,CONNECTION",
            "device"
        ]

        running: true

        stdout: StdioCollector {
            onStreamFinished: {
                var lines = this.text.trim().split("\n")

                networkButton.connectionType = "offline"
                networkButton.connectionName = ""

                for (var i = 0; i < lines.length; i++) {
                    var parts = lines[i].split(":")

                    if (parts.length < 4)
                        continue

                    var type = parts[1]
                    var state = parts[2]
                    var name = parts.slice(3).join(":")

                    if (state === "connected" &&
                        type === "ethernet") {

                        networkButton.connectionType = "ethernet"
                        networkButton.connectionName = name
                        break
                    }

                    if (state === "connected" &&
                        type === "wifi") {

                        networkButton.connectionType = "wifi"
                        networkButton.connectionName = name
                        break
                    }
                }
            }
        }
    }

    Timer {
        interval: 2000
        running: true
        repeat: true

        onTriggered: {
            networkStatus.running = true
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
