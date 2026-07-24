import QtQuick
import QtQuick.Layouts
import Quickshell

import "../theme"

PanelWindow {
    screen: Quickshell.screens[0]

    visible: KeybindState.panelOpen

    anchors {
        top: true
        right: true
    }

    margins.top: 70

    implicitWidth: 420
    implicitHeight: 560

    color: "transparent"

    Rectangle {
        anchors.fill: parent
        anchors.margins: 10

        radius: 24

        color: Theme.backgroundAlt

        border.width: 1
        border.color: Theme.accentStrong

        ColumnLayout {
            anchors.fill: parent
            anchors.margins: 20

            spacing: 10

            Text {
                text: "󰘳  KEYBINDINGS"

                color: Theme.text

                font.family: "JetBrainsMono Nerd Font"
                font.pixelSize: 18
                font.bold: true

                Layout.alignment: Qt.AlignHCenter
            }

            Rectangle {
                Layout.fillWidth: true
                Layout.preferredHeight: 1

                color: Theme.surfaceAlt
            }

            RowLayout {
                Layout.fillWidth: true

                Text {
                    text: "SUPER + SPACE"
                    color: Theme.accent
                    font.family: "JetBrainsMono Nerd Font"
                    font.pixelSize: 12
                    font.bold: true
                    Layout.preferredWidth: 180
                }

                Text {
                    text: "Open launcher"
                    color: Theme.text
                    font.family: "JetBrainsMono Nerd Font"
                    font.pixelSize: 13
                    Layout.fillWidth: true
                }
            }

            RowLayout {
                Layout.fillWidth: true

                Text {
                    text: "SUPER + ENTER"
                    color: Theme.accent
                    font.family: "JetBrainsMono Nerd Font"
                    font.pixelSize: 12
                    font.bold: true
                    Layout.preferredWidth: 180
                }

                Text {
                    text: "Open terminal"
                    color: Theme.text
                    font.family: "JetBrainsMono Nerd Font"
                    font.pixelSize: 13
                    Layout.fillWidth: true
                }
            }

            RowLayout {
                Layout.fillWidth: true

                Text {
                    text: "SUPER + B"
                    color: Theme.accent
                    font.family: "JetBrainsMono Nerd Font"
                    font.pixelSize: 12
                    font.bold: true
                    Layout.preferredWidth: 180
                }

                Text {
                    text: "Open browser"
                    color: Theme.text
                    font.family: "JetBrainsMono Nerd Font"
                    font.pixelSize: 13
                    Layout.fillWidth: true
                }
            }

            RowLayout {
                Layout.fillWidth: true

                Text {
                    text: "SUPER + E"
                    color: Theme.accent
                    font.family: "JetBrainsMono Nerd Font"
                    font.pixelSize: 12
                    font.bold: true
                    Layout.preferredWidth: 180
                }

                Text {
                    text: "Open file manager"
                    color: Theme.text
                    font.family: "JetBrainsMono Nerd Font"
                    font.pixelSize: 13
                    Layout.fillWidth: true
                }
            }

            RowLayout {
                Layout.fillWidth: true

                Text {
                    text: "SUPER + Q"
                    color: Theme.accent
                    font.family: "JetBrainsMono Nerd Font"
                    font.pixelSize: 12
                    font.bold: true
                    Layout.preferredWidth: 180
                }

                Text {
                    text: "Close window"
                    color: Theme.text
                    font.family: "JetBrainsMono Nerd Font"
                    font.pixelSize: 13
                    Layout.fillWidth: true
                }
            }

            RowLayout {
                Layout.fillWidth: true

                Text {
                    text: "SUPER + F"
                    color: Theme.accent
                    font.family: "JetBrainsMono Nerd Font"
                    font.pixelSize: 12
                    font.bold: true
                    Layout.preferredWidth: 180
                }

                Text {
                    text: "Fullscreen"
                    color: Theme.text
                    font.family: "JetBrainsMono Nerd Font"
                    font.pixelSize: 13
                    Layout.fillWidth: true
                }
            }

            RowLayout {
                Layout.fillWidth: true

                Text {
                    text: "SUPER + T"
                    color: Theme.accent
                    font.family: "JetBrainsMono Nerd Font"
                    font.pixelSize: 12
                    font.bold: true
                    Layout.preferredWidth: 180
                }

                Text {
                    text: "Toggle floating"
                    color: Theme.text
                    font.family: "JetBrainsMono Nerd Font"
                    font.pixelSize: 13
                    Layout.fillWidth: true
                }
            }

            RowLayout {
                Layout.fillWidth: true

                Text {
                    text: "SUPER + 1–5"
                    color: Theme.accent
                    font.family: "JetBrainsMono Nerd Font"
                    font.pixelSize: 12
                    font.bold: true
                    Layout.preferredWidth: 180
                }

                Text {
                    text: "Switch workspace"
                    color: Theme.text
                    font.family: "JetBrainsMono Nerd Font"
                    font.pixelSize: 13
                    Layout.fillWidth: true
                }
            }

            RowLayout {
                Layout.fillWidth: true

                Text {
                    text: "SUPER + SHIFT + 1–5"
                    color: Theme.accent
                    font.family: "JetBrainsMono Nerd Font"
                    font.pixelSize: 11
                    font.bold: true
                    Layout.preferredWidth: 180
                }

                Text {
                    text: "Move window to workspace"
                    color: Theme.text
                    font.family: "JetBrainsMono Nerd Font"
                    font.pixelSize: 13
                    Layout.fillWidth: true
                }
            }

            RowLayout {
                Layout.fillWidth: true

                Text {
                    text: "SUPER + ARROWS"
                    color: Theme.accent
                    font.family: "JetBrainsMono Nerd Font"
                    font.pixelSize: 12
                    font.bold: true
                    Layout.preferredWidth: 180
                }

                Text {
                    text: "Focus window"
                    color: Theme.text
                    font.family: "JetBrainsMono Nerd Font"
                    font.pixelSize: 13
                    Layout.fillWidth: true
                }
            }

            RowLayout {
                Layout.fillWidth: true

                Text {
                    text: "SUPER + SHIFT + ARROWS"
                    color: Theme.accent
                    font.family: "JetBrainsMono Nerd Font"
                    font.pixelSize: 11
                    font.bold: true
                    Layout.preferredWidth: 180
                }

                Text {
                    text: "Move window"
                    color: Theme.text
                    font.family: "JetBrainsMono Nerd Font"
                    font.pixelSize: 13
                    Layout.fillWidth: true
                }
            }
        }
    }
}
