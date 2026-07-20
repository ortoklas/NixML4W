import QtQuick
import QtQuick.Layouts
import Quickshell

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

        RowLayout {
            anchors.fill: parent
            anchors.leftMargin: 12
            anchors.rightMargin: 12

            spacing: 0

            //
            // LEFT
            //
            RowLayout {
                Layout.fillWidth: true
                Layout.alignment: Qt.AlignLeft

                spacing: 12

                Launcher { }

                Workspaces { }
            }

            //
            // CENTER
            //
            Item {
                Layout.preferredWidth: 260
                Layout.fillHeight: true

                Clock {
                    anchors.centerIn: parent
                }
            }

            //
            // RIGHT
            //
            RowLayout {
                Layout.fillWidth: true
                Layout.alignment: Qt.AlignRight

                spacing: 18

                Text {
                    text: "󰕾"
                    color: "white"
                    font.family: "JetBrainsMono Nerd Font"
                    font.pixelSize: 18
                }

                Text {
                    text: "󰤨"
                    color: "white"
                    font.family: "JetBrainsMono Nerd Font"
                    font.pixelSize: 18
                }

                Text {
                    text: "󰁹"
                    color: "white"
                    font.family: "JetBrainsMono Nerd Font"
                    font.pixelSize: 18
                }

                PowerButton { }
            }
        }
    }
}
