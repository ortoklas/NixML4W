import QtQuick
import Quickshell
import Quickshell.Hyprland

import "../theme"

Row {
    spacing: 8

    Repeater {
        model: 5

        Rectangle {
            id: workspaceButton

            property int wsId: index + 1

            width: 28
            height: 28

            // Perfect circle
            radius: width / 2

            color: Hyprland.focusedWorkspace !== null &&
                   Hyprland.focusedWorkspace.id === wsId
                ? Theme.accent
                : Theme.surfaceAlt

            border.width: 1

            border.color: Hyprland.focusedWorkspace !== null &&
                          Hyprland.focusedWorkspace.id === wsId
                ? Theme.accent
                : Theme.backgroundAlt

            Behavior on color {
                ColorAnimation {
                    duration: 150
                }
            }

            Behavior on border.color {
                ColorAnimation {
                    duration: 150
                }
            }

            Text {
                anchors.centerIn: parent

                text: workspaceButton.wsId

                color: Theme.text

                font.family: "JetBrainsMono Nerd Font"
                font.pixelSize: 13

                font.bold: Hyprland.focusedWorkspace !== null &&
                            Hyprland.focusedWorkspace.id === workspaceButton.wsId
            }

            MouseArea {
                anchors.fill: parent

                cursorShape: Qt.PointingHandCursor

                onClicked: {
                    Hyprland.dispatch(
                        "workspace " + workspaceButton.wsId
                    )
                }
            }
        }
    }
}
