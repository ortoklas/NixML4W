import QtQuick

Text {
    id: clock

    color: "white"
    font.pixelSize: 16

    function updateClock() {
        var d = new Date()
        text = Qt.formatDateTime(d, "ddd  MMM d   hh:mm AP")
    }

    Timer {
        interval: 1000
        repeat: true
        running: true

        onTriggered: clock.updateClock()
    }

    Component.onCompleted: updateClock()
}
