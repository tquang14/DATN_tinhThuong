import QtQuick 2.15
import QtQuick.Controls 2.15
import "../Styling"
import "../components"
Page {
    width: Styling._DISPLAY_WIDTH
    height: Styling._DISPLAY_HEIGHT
    signal requestChangePage(var identify)
    background: Rectangle {
        color: Styling._BACKGOUND_COLOR
    }
    // headline
    Item {
        width: parent.width
        height: 70
        Rectangle {
            anchors.fill: parent
            color: Styling._COLOR_RED
        }
        Text {
            text: Styling._ADMIN
            color: Styling._COLOR_WHITE
            anchors.centerIn: parent
            font.pixelSize: Styling._SIZE_F4
        }
    }
}
