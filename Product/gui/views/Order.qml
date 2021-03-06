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
    Item {
        id: rightContent
        //red Rectangle at the right side
        anchors.right: parent.right
        width: Styling._RIGHT_CONTENT_WIDTH
        height: parent.height
        Rectangle {
            id: sideColor
            color: Styling._COLOR_RED
            anchors.fill: parent
        }
        //Bill content
        Item {
            //background
            width: parent.width * 0.8
            height: parent.height * 0.85
            anchors.centerIn: parent
            Rectangle {
                anchors.fill: parent
                color: Styling._COLOR_WHITE
                radius: width * 0.07
            }
            //Icon at header
            //TODO: update when have resources
            Rectangle {
                id: img
                anchors.left: parent.left
                anchors.top: parent.top
                anchors.margins: 10
                width: 36
                height: 36
                color: "blue"
                opacity: 0.5
            }
            //list of order food
            // dummy model, shoule be read from backend
            //TODO: remove when add backend
            ListModel {
                id: billModel
                ListElement {
                    name: "Gourment Burger"
                    imgPath: ""
                }
            }
            Component.onCompleted: {
                for(var i = 0; i < 30; i++) {
                    billModel.append({name: "Gourment Burger " + i, imgPath: ""})
                }
                orderList.model = billModel
            }

            ListView {
                id: orderList
                width: parent.width - 4
                height: parent.height - totalContent.height - img.height - 20
                clip: true
                anchors.horizontalCenter: parent.horizontalCenter
                spacing: 2
                anchors.topMargin: 10
                anchors.top: img.bottom
                model: billModel
                focus: false
                delegate: Card {
                    id: listItem
                    textContent: name
                    imgPath: imgPath
                    cardWidth: orderList.width
                    cardHeight: 36
                }
            }
            // total money
            Item {
                id: totalContent
                anchors.bottom: parent.bottom
                height: 70
                width: parent.width

                Text {
                    id: headline
                    text: "T???M T??NH"
                    font.pixelSize: Styling._SIZE_F1
                    anchors.left: parent.left
                    anchors.margins: 10
//                    anchors.top: parent.top
                }
                Text {
                    id: totalMoney
                    text: "100.000" + " VN??"
                    color: Styling._COLOR_RED
                    font.pixelSize: Styling._SIZE_F1
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.top: headline.bottom
                }
            }
        }
    }
    //left content (menu)
    Item {
        id: leftContent
        width: parent.width - rightContent.width
        height: parent.height

        Item {
            anchors.leftMargin: 40
            anchors.rightMargin: 40
            anchors.fill: parent
            Text {
                id: title
                text: "Th???c ????n"
                color: Styling._COLOR_BLACK
                font.pixelSize: Styling._SIZE_F4
                anchors.left : parent.left
                anchors.leftMargin: 20
            }
            //list of food
            // dummy model, shoule be read from backend
            //TODO: remove when add backend
            ListModel {
                id: foodModel
                ListElement {
                    name: "Gourment Burger"
                    imgPath: ""
                }
            }
            Component.onCompleted: {
                for(var i = 0; i < 30; i++) {
                    foodModel.append({name: "Gourment Burger " + i, imgPath: ""})
                }
                menu.model = foodModel
            }

            ListView {
                id: menu
                width: parent.width
                height: parent.height
                clip: true
                anchors.horizontalCenter: parent.horizontalCenter
                spacing: 10
                anchors.topMargin: 10
                anchors.top: title.bottom
                model: foodModel
                focus: false
                delegate: Card {
                    textContent: name
                    textContentSize: Styling._SIZE_F2
                    imgPath: imgPath
                    cardWidth: menu.width
                    cardHeight: 70
                    cardColor: Styling._COLOR_WHITE
                    subTextContent: "45.000 VN??"
                    subTextContentSize: Styling._SIZE_F2
                }
            }
        }
    }
}
