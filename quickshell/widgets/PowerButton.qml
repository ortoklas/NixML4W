import QtQuick

import "../theme"

Text {
    id: power

    text: ""

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

    MouseArea {
        id: mouseArea

        anchors.fill: parent
        hoverEnabled: true
        cursorShape: Qt.PointingHandCursor

        onClicked: {
            PowerState.panelOpen = !PowerState.panelOpen
        }
    }
}
