import QtQuick
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
            width: parent.width
            height: parent.height

            Canvas {
                id: canvas
                anchors.fill: parent

                onPaint: {
                    timer.start();
                    var ctx = canvas.getContext("2d");

                    for(var i = 0; i !== 14; i++)
                    {
                        ctx.drawImage(grassland, grassland.x, grassland.y, grassland.width, grassland.height);
                        grassland.x += 100;
                        // const build = Ctroller.buildGrassland(grassland.x, grassland.y);
                        // grassland.x = build[0];
                        // grassland.y = build[1];
                    }

                    flower.source = flower.images[flower.index];
                    ctx.drawImage(flower, flower.x, flower.y, flower.width, flower.height);



                }
            }

            Timer {
                            id: timer
                            //property int num: 1
                            interval: 200
                            running: false
                            repeat: true
                            onTriggered: {
                                //imageIndex = (imageIndex + 1) % images.length;
                                if(flower.index == 3)
                                    flower.index = 0;
                                else
                                    flower.index++;

                                console.log(grassland.x)
                                grassland.x -= 1400
                                //console.log(grassland.x)
                                // const grasslandChange = Paint.grasslandChange(grassland.x, grassland.y);
                                // grassland.x = grasslandChange[0];
                                // grassland.y = grasslandChange[1];

                                timer.stop();
                                canvas.requestPaint();
                            }
                        }
        }
}
