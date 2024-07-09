import QtQuick

Image {
    source: "images/chessms.png"
    x: 300
    y: 440
    property int health: 3 //生命值
    property int kills: 0 //击杀数
    property int score: kills * 50 + distance //得分等于击杀数*50 + 距离
    property int distance: 0 //移动距离
    property int tim: 0 //游戏时间
}
