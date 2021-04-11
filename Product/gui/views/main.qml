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
        initialItem: homePage
        Home {
            id: homePage
            onRequestChangePage: {
                if (identify === Styling._ADMIN)
                    stackView.push(adminPage)
                else if (identify === Styling._ORDER_NOW)
                    stackView.push(orderPage)
            }
        }
    }
    Component  {
        Admin {

        }

        id: adminPage
    }
    Component  {
        Order {

        }

        id: orderPage
    }
}
