import QtQuick

Image {
    property int index: 0
    //property var images: ["images/grassland.png"] // 图片路径数组
    source: "images/grassland.png"
    width:80
    height:80
    x: -width
    y: 500
}
