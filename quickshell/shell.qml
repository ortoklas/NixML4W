import QtQuick
import Quickshell
import Quickshell.Hyprland

ShellRoot {

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

            Text {
                anchors.centerIn: parent
                text: "NixML4W"
                color: "white"
            }
        }
    }
}
