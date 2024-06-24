import QtQuick

Item {

    property alias chessms: _chessms
    property alias tree: _tree
    property alias grassland: _grassland

    Image {
           id: _chessms
            source: "images/chessms.png"
        }

    Image {
           id: _tree
            source: "images/tree.png"
        }

    Image {
           id: _grassland
            source: "images/grassland.png"
        }

    Image {
           id: _flower01
            source: "images/flower01.png"
        }

    Image {
           id: _flower02
            source: "images/flower02.png"
        }

    Image {
           id: _flower03
            source: "images/flower03.png"
        }

    Image {
           id: _flower04
            source: "images/flower04.png"
        }

}
