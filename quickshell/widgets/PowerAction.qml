import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Io

import "../theme"

Rectangle {
    id: action

    property string icon
    property string label
    property var command

    Layout.fillWidth: true
    Layout.preferredHeight: 44

    radius: 8

    color: mouseArea.containsMouse
        ? Theme.surfaceAlt
        : Theme.surface

    Behavior on color {
        ColorAnimation {
            duration: 120
        }
    }

    Process {
        id: process

        command: action.command
    }

    RowLayout {
        anchors.fill: parent
        anchors.leftMargin: 12
        anchors.rightMargin: 12

        spacing: 12

        Text {
            text: action.icon

            color: Theme.text
            font.family: "JetBrainsMono Nerd Font"
            font.pixelSize: 18
        }

        Text {
            text: action.label

            color: Theme.text

            font.family: "JetBrainsMono Nerd Font"
            font.pixelSize: 14

            Layout.fillWidth: true
        }
    }

    MouseArea {
        id: mouseArea

        anchors.fill: parent

        hoverEnabled: true
        cursorShape: Qt.PointingHandCursor

        onClicked: {
            process.running = true
            PowerState.panelOpen = false
        }
    }
}
