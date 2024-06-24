import QtQuick
import QtQuick.Controls
import "ctroller.js" as Ctroller
import "paintCtroller.js" as Paint

Window {
    width: 1600
    height: 1000
    //visible: false
    title: qsTr("chessmsGame")

    // Images {
    //     id: img
    // }

    Chessms {
        id: chessms
    }

    Flower {
        id: flower
    }

    Tree {
        id: tree
    }

    Grassland {
        id: grassland
    }


    Rectangle {
        id: rect
            width: parent.width
            height: parent.height

            Canvas {
                id: canvas
                anchors.fill: parent

                property var grasslandY: Array(28).fill(350)
                onPaint: {
                    timer.start();
                    var ctx = canvas.getContext("2d");
                    ctx.clearRect(0, 0, canvas.width, canvas.height);

                    grasslandY = Ctroller.buildGrasslandY(grasslandY);
                    for(var i = 0; i !== 28; i++) //绘制28张草地
                    {
                        console.log(grasslandY[i]);
                        ctx.drawImage(grassland, grassland.x, grasslandY[i], grassland.width, grassland.height);
                        grassland.x += 50; //x坐标
                    }
                    console.log(grassland.x);
                    grassland.x -= 1400;

                    flower.source = flower.images[flower.index];
                    ctx.drawImage(flower, flower.x, flower.y, flower.width, flower.height);

                    ctx.drawImage(chessms, chessms.x, chessms.y, chessms.width, chessms.height); //绘制chessms


                }
            }

            Timer {
                            id: timer
                            //property int num: 1
                            interval: 20
                            running: false
                            repeat: true
                            onTriggered: {
                                //imageIndex = (imageIndex + 1) % images.length;
                                if(flower.index == 3)
                                    flower.index = 0;
                                else
                                    flower.index++;

                                timer.stop();
                                canvas.requestPaint();
                            }
                        }

            focus: true
            Keys.onPressed: (event)=> {
                                if(event.key === Qt.Key_W) {
                                    console.log("Signal W key pressed emitted")
                                    if(chessms.y !== 275)
                                    chessms.y -= 145;
                                }

                                if(event.key === Qt.Key_S) {
                                    console.log("Signal S key pressed emitted")
                                    if(chessms.y !== 565)
                                    chessms.y += 145;
                                }

                                if(event.key === Qt.Key_A) {
                                    console.log("Signal S key pressed emitted")
                                    if(chessms.x !== 0)
                                    chessms.x -= 50;
                                }

                                if(event.key === Qt.Key_D) {
                                    console.log("Signal S key pressed emitted")
                                    if(chessms.x !== 1300)
                                    chessms.x += 50;
                                }
                            }
        }

    // //signal wKeyPressed()
    // onWPressed: {
    //         console.log("Signal W key pressed emitted")
    //     chessms.y += 145;
    //     }

    // //signal sKeyPressed()
    // onSPressed: {
    //         console.log("Signal Y key pressed emitted")
    //     chessms.y -= 145;
    //     }

    // Keys.onPressed: {
    //     if(event.key === Qt.Key_W) {
    //         console.log("Signal W key pressed emitted")
    //         chessms.y += 145;
    //     }

    //     if(event.key === Qt.Key_S) {
    //         console.log("Signal S key pressed emitted")
    //         chessms.y -= 145;
    //     }
    // }

    Button {
        id: stopGame
        text: "暂停/启动"
        width: 100
        height: 35
        x: 1500
        y: 700

        onClicked: {
            //canvas.visible = !canvas.visible;
            console.log(stopGame.checked);
            if(stopGame.checked === false)
            {
                stopGame.checked = true;
                timer.stop();
            }else {
                stopGame.checked = false;
                timer.start();
                rect.focus = true;
            }
        }
    }
}
