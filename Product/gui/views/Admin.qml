import QtQuick 2.15
import QtQuick.Controls 2.15
import Qt.labs.qmlmodels 1.0
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
        id: headLine
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
    //main view
    TabBar {
        id: bar
        width: parent.width - calendar.width
        height: 30
        anchors.top: headLine.bottom
        Repeater {
            model: ["Doanh thu", "Tồn kho"]
            TabButton {
                contentItem: Text {
                    text: modelData
                    font: Styling._DEFAULT_FONT
                    opacity: enabled ? 1.0 : 0.3
                    color: Styling._COLOR_BLACK
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                }
                background: Rectangle {
                    color: index === 0 ? Styling._COLOR_LIGHT_RED : Styling._COLOR_YELLOW
                    border.color: Styling._COLOR_BLACK
                    border.width: 3
                }
            }
        }
    }

    SwipeView {
        width: parent.width
        anchors.top: bar.bottom
        currentIndex: bar.currentIndex
        Item {
            id: incomeTab
            Item {
                width: parent.width
                height: Styling._DISPLAY_HEIGHT - bar.height - headLine.height
                Rectangle {
                    anchors.fill: parent
                    color: Styling._COLOR_LIGHT_RED
                }
                Table {
                    id: tableIncome
                    width: parent.width - 60
                    height: parent.height - 80
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.top: parent.top
                    anchors.topMargin: 15
                    headerModel: [ // widths must add to 1
                        {text: "STT"        ,   width: 0.1},
                        {text: "Món"        ,   width: 0.35},
                        {text: "Số lượng"   ,   width: 0.15},
                        {text: "Thời gian"  ,   width: 0.2},
                        {text: "Thành tiền" ,   width: 0.2},
                    ]

                    dataModel: [ // TODO: remove dummy data use cpp
                        ["1 ", " ", " ", " ", " "],
                        ["2 ", " ", " ", " ", " "],
                        ["3 ", " ", " ", " ", " "],
                        ["4 ", " ", " ", " ", " "],
                        ["5 ", " ", " ", " ", " "],
                        ["6 ", " ", " ", " ", " "],
                        ["7 ", " ", " ", " ", " "],
                        ["8 ", " ", " ", " ", " "],
                        ["9 ", " ", " ", " ", " "],
                        ["10 ", " ", " ", " ", " "],
                        ["11 ", " ", " ", " ", " "],
                        ["12 ", " ", " ", " ", " "],
                        ["13 ", " ", " ", " ", " "],
                    ]
                }
                //total income
                Item {
                    anchors.top: tableIncome.bottom
                    anchors.topMargin: 5
                    anchors.right: tableIncome.right
                    width: 500
                    height: 50
                    Rectangle {
                        anchors.fill: parent
                        color: Styling._COLOR_WHITE
                        border.color: Styling._COLOR_BLACK
                        border.width: 1
                    }
                    Text {
                        id: totalIncome
                        anchors.verticalCenter: parent.verticalCenter
                        text: "Tổng doanh thu (ngày): "
                        color: Styling._COLOR_RED
                        font.pixelSize: Styling._SIZE_F2
                        anchors.horizontalCenter: parent.horizontalCenter
                        anchors.top: headline.bottom
                    }
                }
            }
        }
        Item {
            id: warehouse
            Item {
                width: parent.width
                height: Styling._DISPLAY_HEIGHT - bar.height - headLine.height
                Rectangle {
                    anchors.fill: parent
                    color: Styling._COLOR_YELLOW
                }
                Table {
                    id: tableWarehouse
                    width: parent.width - 60
                    height: parent.height - 80
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.top: parent.top
                    anchors.topMargin: 15
                    headerModel: [ // widths must add to 1
                        {text: "STT"                ,   width: 0.1},
                        {text: "Món"                ,   width: 0.45},
                        {text: "Số lượng"           ,   width: 0.15},
                        {text: "Thời gian đến hạn"  ,   width: 0.3},
                    ]

                    dataModel: [ // TODO: remove dummy data use cpp
                        ["1 ", " ", " ", " ", " "],
                        ["2 ", " ", " ", " ", " "],
                        ["3 ", " ", " ", " ", " "],
                        ["4 ", " ", " ", " ", " "],
                        ["5 ", " ", " ", " ", " "],
                        ["6 ", " ", " ", " ", " "],
                        ["7 ", " ", " ", " ", " "],
                        ["8 ", " ", " ", " ", " "],
                        ["9 ", " ", " ", " ", " "],
                        ["10 ", " ", " ", " ", " "],
                        ["11 ", " ", " ", " ", " "],
                        ["12 ", " ", " ", " ", " "],
                        ["13 ", " ", " ", " ", " "],
                    ]
                }
            }
        }
    }
    MyButton {
        id: calendarButton
        anchors.top: headLine.bottom
        anchors.right: parent.right
        anchors.rightMargin: 5
        textContent: "V"
        btnWidth: bar.height
        btnHeight: bar.height
        btnColor: Styling._COLOR_ORANGE
        onBtnClicked: {
            calendarLoader.visible = !calendarLoader.visible
            calendarButton.textContent = calendarButton.textContent === "V" ? ">" : "V"
        }
    }

    Loader {
        id: calendarLoader
        visible: false
        width: 300
        height: 300
        anchors.top: calendarButton.bottom
        anchors.right: calendarButton.right
        anchors.topMargin: 5
        Rectangle {
            anchors.fill: parent
            color: Styling._BACKGOUND_COLOR
        }

        DatePicker {
            id: calendar
            anchors.centerIn: parent
            width: parent.width
            height: parent.height
            onClicked: {
                console.log('onClicked' + Qt.formatDate(date, 'dd/MM/yyyy'))
            }
            Component.onCompleted: set(new Date())
        }
    }
}
