import QtQuick

Rectangle {
    width: 200
    height: 35
    border.color: "black"
    border.width: 2
    property alias v_Text: _text

    Text {
        id: _text
        anchors.centerIn: parent
        font.pixelSize: 24
    }
}
