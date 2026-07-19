import QtQuick
import Quickshell
import Quickshell.Hyprland

import "../widgets"

PanelWindow {

    screen: Quickshell.primaryScreen

    anchors {
        top: true
        left: true
        right: true
    }

    implicitHeight: 40

    Rectangle {
        anchors.fill: parent
        color: "#2E3440"

        Row {
            anchors.centerIn: parent
            spacing: 20

            Text {
                text: "🚀"
                color: "white"
                font.pixelSize: 18
            }

            Clock {
            }
        }
    }
}
