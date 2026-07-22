import QtQuick
import QtQuick.Layouts
import Quickshell

import "../theme"
import "../widgets"

PanelWindow {
    screen: Quickshell.screens[0]

    visible: PowerState.panelOpen

    anchors {
        top: true
        right: true
    }

    implicitWidth: 260
    implicitHeight: 320

    color: "transparent"

    Rectangle {
        id: panel

        anchors.fill: parent

        color: Theme.background
        radius: 12

        border.width: 1
        border.color: Theme.surfaceAlt

        opacity: PowerState.panelOpen ? 1.0 : 0.0

        Behavior on opacity {
            NumberAnimation {
                duration: 160
            }
        }

        ColumnLayout {
            anchors.fill: parent
            anchors.margins: 16

            spacing: 8

            Text {
                text: "POWER"

                color: Theme.text

                font.family: "JetBrainsMono Nerd Font"
                font.pixelSize: 18
                font.bold: true

                Layout.alignment: Qt.AlignHCenter
            }

            Rectangle {
                Layout.fillWidth: true

                height: 1

                color: Theme.surfaceAlt
            }

            PowerAction {
                icon: "󰌾"
                label: "Lock"

                command: [
                    "/home/highv/.nix-profile/bin/hyprlock"
                ]
            }

            PowerAction {
                icon: "󰍃"
                label: "Logout"

                command: [
                    "/run/current-system/sw/bin/hyprctl",
                    "dispatch",
                    "exit"
                ]
            }

            PowerAction {
                icon: "󰜉"
                label: "Restart"

                command: [
                    "/run/current-system/sw/bin/systemctl",
                    "reboot"
                ]
            }

            PowerAction {
                icon: "󰍹"
                label: "Reboot to UEFI"

                command: [
                    "/run/current-system/sw/bin/systemctl",
                    "reboot",
                    "--boot-loader-entry=auto-reboot-to-firmware-setup"
                ]
            }

            PowerAction {
                icon: "󰐥"
                label: "Shutdown"

                command: [
                    "/run/current-system/sw/bin/systemctl",
                    "poweroff"
                ]
            }
        }
    }
}
