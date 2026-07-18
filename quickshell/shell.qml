import QtQuick
import Quickshell

ShellRoot {
    Variants {
        model: Quickshell.screens

        PanelWindow {
            required property var modelData

            screen: modelData

            anchors {
                top: true
                left: true
                right: true
            }

            implicitHeight: 40

            Rectangle {
                anchors.fill: parent
                color: "#2E3440"

                Text {
                    anchors.centerIn: parent
                    color: "white"
                    text: "NixML4W"
                }
            }
        }
    }
}
