import QtQuick 2.15
import QtQuick.Controls 2.15
import "../Styling"
ApplicationWindow {
    id: window
    width: Styling._DISPLAY_WIDTH
    height: Styling._DISPLAY_HEIGHT
    visible: true
    title: qsTr("Nhà hàng KMT")   
    StackView {
        id: stackView
        anchors.fill: parent
        initialItem: "Home.qml"
    }
}
