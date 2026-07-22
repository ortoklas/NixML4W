import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Io

import "../theme"
import "../widgets"

PanelWindow {
    screen: Quickshell.screens[0]

    visible: PowerState.panelOpen

    anchors {
        top: true
        right: true
    }

    implicitWidth: 300
    implicitHeight: 390

    color: "transparent"

    Rectangle {
        id: panel

        anchors {
            top: parent.top
            right: parent.right
            bottom: parent.bottom
            left: parent.left

            topMargin: 10
            rightMargin: 10
            bottomMargin: 10
            leftMargin: 10
        }

        radius: 24

        color: Theme.background

        border.width: 1
        border.color: Theme.accentStrong

        ColumnLayout {
            anchors.fill: parent

            anchors.margins: 18

            spacing: 10

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

            Rectangle {
                Layout.fillWidth: true
                Layout.preferredHeight: 48

                radius: 24

                color: Theme.accentStrong

                border.width: 1
                border.color: Theme.accent

                Text {
                    anchors.centerIn: parent

                    text: "󰍹  Reboot to UEFI"

                    color: Theme.text

                    font.family: "JetBrainsMono Nerd Font"
                    font.pixelSize: 14
                    font.bold: true
                }

                MouseArea {
                    anchors.fill: parent

                    cursorShape: Qt.PointingHandCursor

                    onClicked: {
                        uefiReboot.running = true
                    }
                }
            }

            Process {
                id: uefiReboot

                command: [
                    "/run/current-system/sw/bin/systemctl",
                    "reboot",
                    "--firmware-setup"
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
