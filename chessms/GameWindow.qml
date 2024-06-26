import QtQuick
import QtQuick.Controls
import "ctroller.js" as Ctroller

Window {
    width: 1400
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
        id: ctrollerRect
            width: parent.width
            height: parent.height

            property int chessmsW: 0
            property int chessmsS: 0
            property int chessmsA: 0
            property int chessmsD: 0
            property bool isCtroMoving: false
            property bool isOnland: true

            Canvas {
                id: canvas
                anchors.fill: parent

                property var grasslandY: Array(15).fill(350)
                onPaint: {
                    //console.log(grasslandY[3.2])
                    timer.start();
                    var ctx = canvas.getContext("2d");
                    ctx.clearRect(0, 0, canvas.width, canvas.height);


                    for(var i = 0; i !== 15; i++) //绘制 14张草地
                    {
                        //console.log(grasslandY[i]);
                        ctx.drawImage(grassland, grassland.x, grasslandY[i], grassland.width, grassland.height);
                        grassland.x += 100; //x坐标
                    }

                    grassland.x -= 1505;
                    if(grassland.x === -100)
                    {
                        grassland.x = 0;
                        grasslandY = Ctroller.buildGrasslandY(grasslandY);
                    }
                    //console.log(grassland.x);


                    if(flower.index == 27)
                        flower.index = 0;
                    else
                        flower.index++;
                    flower.source = flower.images[flower.index];
                    ctx.drawImage(flower, flower.x, flower.y, flower.width, flower.height);


                    if(chessms.y - grasslandY[chessms.x / 100] != 90 && chessms.y - grasslandY[chessms.x / 100 + 1] != 90)
                        ctrollerRect.isOnland = false;
                    else
                        ctrollerRect.isOnland = true;

                    if(ctrollerRect.isCtroMoving == false)
                    {
                        if(ctrollerRect.isOnland == false)
                        {
                                chessms.y += 30;
                        }
                    }
                    else
                    {
                        if(ctrollerRect.chessmsW !== 0)
                        {
                            chessms.y -= 30;
                            ctrollerRect.chessmsW--;
                        }

                        if(ctrollerRect.chessmsS !== 0)
                        {
                            chessms.y += 15;
                            ctrollerRect.chessmsS--;
                        }

                        if(ctrollerRect.chessmsA !== 0)
                        {
                            chessms.x -= 20;
                            ctrollerRect.chessmsA--;
                        }

                        if(ctrollerRect.chessmsD !== 0)
                        {
                            chessms.x += 20;
                            ctrollerRect.chessmsD--;
                        }

                        if(ctrollerRect.chessmsA === 0 && ctrollerRect.chessmsD === 0 && ctrollerRect.chessmsW === 0 && ctrollerRect.chessmsS === 0)
                            ctrollerRect.isCtroMoving = false;

                    }
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

                                timer.stop();
                                canvas.requestPaint();
                            }
                        }

            focus: true
            Keys.onPressed: (event)=> {
                                if(event.key === Qt.Key_W) {
                                    //console.log("Signal W key pressed emitted")
                                    console.log(chessms.x / 100)
                                    if(/*chessms.y !== 290 && */chessmsW === 0 && chessmsS === 0 && isOnland == true)
                                    {
                                        isCtroMoving = true;
                                        chessmsW = 7;
                                    }
                                }

                                if(event.key === Qt.Key_S) {
                                    //console.log("Signal S key pressed emitted")
                                    console.log(chessms.x / 100)
                                    if(chessms.y !== 590 && chessmsS === 0 && chessmsW === 0 && isOnland == true)
                                    {
                                        isCtroMoving = true;
                                        chessmsS = 10;
                                    }
                                }

                                if(event.key === Qt.Key_A) {
                                    //console.log("Signal S key pressed emitted")
                                    if(chessms.x !== 0 && chessmsA === 0 && chessmsD === 0 && isOnland == true)
                                    {
                                        isCtroMoving = true;
                                        chessmsA = 5;
                                    }
                                }

                                if(event.key === Qt.Key_D) {
                                    //console.log("Signal S key pressed emitted")
                                    if(chessms.x !== 1300 && chessmsD === 0 && chessmsA === 0 && isOnland == true)
                                    {
                                        isCtroMoving = true;
                                        chessmsD = 5;
                                    }
                                }
                            }
        }

    Button {
        id: stopGame
        text: "暂停/启动"
        width: 100
        height: 35
        x: 1300
        y: 700

        onClicked: {
            //canvas.visible = !canvas.visible;
            //console.log(stopGame.checked);
            if(stopGame.checked === false)
            {
                stopGame.checked = true;
                timer.stop();
            }else {
                stopGame.checked = false;
                timer.start();
                ctrollerRect.focus = true;
            }
        }
    }
}
