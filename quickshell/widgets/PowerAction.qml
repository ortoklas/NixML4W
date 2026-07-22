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
    Layout.preferredHeight: 48

    radius: 12

    color: mouseArea.containsMouse
        ? Theme.accentStrong
        : Theme.surface

    border.width: 1

    border.color: mouseArea.containsMouse
        ? Theme.accent
        : Theme.surfaceAlt

    Behavior on color {
        ColorAnimation {
            duration: 120
        }
    }

    Behavior on border.color {
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

        anchors.leftMargin: 14
        anchors.rightMargin: 14

        spacing: 14

        Text {
            text: action.icon

            color: mouseArea.containsMouse
                ? Theme.text
                : Theme.textMuted

            font.family: "JetBrainsMono Nerd Font"
            font.pixelSize: 20
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
