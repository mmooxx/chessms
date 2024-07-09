import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

ApplicationWindow {
    width: 740
    height: 500
    visible: true
    title: qsTr("chessms")

    GameWindow {
        id: gameWindow
    }

    Image {
        source: "images/chessmsBack.jpg"
        anchors.fill: parent
    }

    Button {
        id: beginGame
        text: "开始游戏"
        width: 100
        height: 35
        x: parent.width / 2 - width / 2
        y: parent.height / 2

        onClicked: {
            gameWindow.show()
        }
    }

    Button {
        id: exit
        text: "退出游戏"
        width: 100
        height: 35
        x: parent.width / 2 - width / 2
        y: parent.height / 2 + 80


        onClicked: {
            Qt.quit()
        }
    }

    // Item {
    //     focus: true
    //     Keys.onPressed: (event)=> {
    //         if(event.key === Qt.Key_W) {
    //             console.log("Signal W key pressed emitted")
    //             chessms.y += 145;
    //         }

    //         if(event.key === Qt.Key_S) {
    //             console.log("Signal S key pressed emitted")
    //             chessms.y -= 145;
    //         }
    //     }
    // }

    // menuBar: MenuBar {
    //     Menu {
    //         title: qsTr("File")
    //         MenuItem { action:open }
    //         MenuItem { action:quit }
    //     }
    // }

    // header: ToolBar {
    //     RowLayout{
    //         ToolButton{ action: open }
    //         ToolButton{ action: quit }
    //     }
    // }

    // Action {
    //     id: open
    //     text: qsTr("&Open...")
    //     icon.name: "document-open"
    //     shortcut: "StandardKey.Open"
    //     onTriggered: console.log("Open action triggered");
    // }

    // Action {
    //     id: quit
    //     text: qsTr("&Quit")
    //     icon.name: "application-exit"
    //     onTriggered: Qt.quit();
    // }

    //Content Area
    // TextArea {
    //     text: qsTr("hello, world")
    //     anchors.horizontalCenter: parent.horizontalCenter
    //     anchors.verticalCenter: parent.verticalCenter
    // }
}
