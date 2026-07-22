import QtQuick
import QtQuick.Layouts
import Quickshell

import "../widgets"
import "../theme"

PanelWindow {
    screen: Quickshell.screens[0]

    anchors {
        top: true
        left: true
        right: true
    }

    implicitHeight: Theme.barHeight

    Rectangle {
        anchors.fill: parent

        color: Theme.background

        RowLayout {
            anchors.fill: parent

            anchors.leftMargin: 12
            anchors.rightMargin: 12

            spacing: 0

            RowLayout {
                Layout.fillWidth: true
                Layout.alignment: Qt.AlignLeft

                spacing: 12

                Launcher { }

                Workspaces { }
            }

            RowLayout {
                Layout.fillWidth: true
                Layout.alignment: Qt.AlignRight

                spacing: 18


                VolumeButton { }

                NetworkButton { }

                PowerButton { }
            }
        }

        Item {
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter

            width: 220
            height: parent.height

            Clock {
                anchors.centerIn: parent
            }
        }
    }
}
