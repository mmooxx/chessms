import QtQuick
import QtQuick.Controls
import QtMultimedia
import "ctroller.js" as Ctroller

Window {
    id: gameWindow
    width: 1400
    height: 920
    //visible: false
    minimumWidth: 1400
    maximumWidth: 1400
    minimumHeight: 920
    maximumHeight: 920
    title: qsTr("chessmsGame")

    MediaPlayer {
        id: backAudio
        source: "audios/backAudio.mp3"
        autoPlay: true
        loops: MediaPlayer.Infinite
        audioOutput: AudioOutput {}
    }

    MediaPlayer {
        id: slashAudio
        source: "audios/slash.mp3"
        audioOutput: AudioOutput {}
    }

    MediaPlayer {
        id: bounceAudio
        source: "audios/bounce.wav"
        audioOutput: AudioOutput {}
    }

    MediaPlayer {
        id: attackedAudio
        source: "audios/attacked.wav"
        audioOutput: AudioOutput {}
    }

    Chessms {
        id: chessms
    }

    Chessms_slash {
        id: chessms_slash
    }

    Monster {
        id: monster
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

            //背景
            Image {
                source: "images/sun.jpg"
                anchors.fill: parent
            }

            property int chessmsW: 0
            property int chessmsS: 0
            property int chessmsA: 0
            property int chessmsD: 0
            property bool isCtroMoving: false
            property bool isOnland: true
            property bool isSlash: false

            Canvas {
                id: canvas
                anchors.fill: parent

                property var grasslandY: Array(15).fill(350)
                property var treeY: Array(3).fill(235)
                property var monsterY: Array(3).fill(920) //最多3个怪物在地图上，y坐标为920代表死亡
                property var monsterX: Array(3).fill(-100)
                property var monsterDown: Array(3).fill(false) //是否判断怪物下降
                onPaint: {
                    timer.start();
                    var ctx = canvas.getContext("2d");
                    ctx.clearRect(0, 0, canvas.width, canvas.height);


                    //绘制15张草地
                    for(let i = 0; i !== 15; i++)
                    {
                        //console.log(grasslandY[i]);
                        ctx.drawImage(grassland, grassland.x, grasslandY[i], grassland.width, grassland.height);
                        grassland.x += 100; //x坐标
                    }

                    //花瓣动态
                    flower.source = flower.images[flower.index];
                    if(flower.index == 27)
                        flower.index = 0;
                    else
                        flower.index++;
                    //绘制树木和花瓣
                    for(let o = 0; o !== 3; o++)
                    {
                        //console.log(tree.x);
                        ctx.drawImage(tree, tree.x, treeY[o], tree.width, tree.height);

                        ctx.drawImage(flower, tree.x - 20, treeY[o] + 100, flower.width, flower.height);
                        ctx.drawImage(flower, tree.x + 80, treeY[o] + 100, flower.width, flower.height);
                        tree.x += 600;
                    }
                    //ctx.drawImage(flower, flower.x, flower.y, flower.width, flower.height);


                    //移动和更新地形
                    grassland.x -= 1505;
                    if(grassland.x === -100)
                    {
                        grassland.x = 0;
                        grasslandY = Ctroller.buildGrasslandY(grasslandY);

                        //更新地形时产生怪物并判断怪物是否下降
                        var result = Ctroller.buildMonster(monsterX, monsterY, grasslandY);
                        monsterX = result[0];
                        monsterY = result[1];

                        monsterDown.fill(true);
                        //console.log(monsterDown[0])
                    }

                    //移动和更新树
                     tree.x -= 1805;
                    if(tree.x === -300)
                    {
                        tree.x = 300;
                        treeY = Ctroller.buildTreeY(treeY, grasslandY);
                    }


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
                    chessms.source = "images/chessms.png";

                    //关于怪物
                    for(let p = 0; p != 3; p++)
                    {
                        if(monsterY[p] !== 920) //怪物存在
                        {
                            //怪物移动逻辑
                            if(monsterDown[p] === true && monsterY[p] - grasslandY[Math.floor(monsterX[p] / 100)] != 90
                                    && monsterY[p] - grasslandY[Math.floor(monsterX[p] / 100 - 1)] != 90)
                            {
                                monsterY[p] += 30;
                            }
                            else
                            {
                                monsterDown[p] = false;
                            }

                            if(monsterX[p] === -100)
                            {
                                monsterY[p] = 920;
                            }
                            monsterX[p] -= 10;

                            //绘制怪物
                            ctx.drawImage(monster, monsterX[p], monsterY[p], monster.width, monster.height);
                        }
                    }
                    //动态怪物
                    monster.index++;
                    if(monster.index === 12)
                    {
                        monster.index = 0;
                    }
                    monster.source = monster.images[monster.index];

                    //判断chessms斩击是否击中怪物
                    if(ctrollerRect.isSlash == true)
                    {
                        for(let u = 0; u != 3; u++)
                        {
                            //console.log(monsterX[u], chessms.x)
                            if(monsterY[u] < chessms.y + 150 && monsterY[u] > chessms.y - 50
                                    && monsterX[u] > chessms.x + 50 && monsterX[u] < chessms.x + 250)
                            {
                                //console.log("kk")
                                chessms.kills++;
                                monsterY[u] = 920;
                            }
                        }
                    }

                    //判断怪物是否对chessms造成伤害
                    for(let a = 0; a != 3; a++)
                    {
                        if(monsterX[a] === chessms.x + 40 && monsterY[a] < chessms.y + 120 && monsterY[a] > chessms.y - 30)
                        {
                            chessms.health--;

                            chessms.source = "images/chessms2.png";
                            ctx.drawImage(chessms, chessms.x, chessms.y, chessms.width, chessms.height);
                            attackedAudio.stop();
                            attackedAudio.play();
                            //console.log(chessms.health)
                        }
                    }

                    //绘制chessms的斩击(间隔1帧才能再次进行斩击）
                    if(ctrollerRect.isSlash == true)
                    {
                        if(chessms_slash.index === 4)
                        {
                            chessms_slash.index = 0;
                            ctrollerRect.isSlash = false;
                        }
                        else
                        {
                            chessms_slash.source = chessms_slash.images[chessms_slash.index];
                            chessms_slash.index++;
                            ctx.drawImage(chessms_slash, chessms.x + 50, chessms.y - 20, chessms_slash.width, chessms_slash.height);
                        }
                    }

                    //chessms跌落生命值变为0
                    if(chessms.y === 920)
                    {
                        chessms.health = 0;

                        // chessms.source = "images/chessms2.png";
                        // ctx.drawImage(chessms, chessms.x, chessms.y, chessms.width, chessms.height);
                        //attackedAudio.stop();
                        attackedAudio.play();
                    }

                    //chessms生命值为0游戏结束
                    if(chessms.health == 0)
                    {
                        timer.stop();

                        ctx.font = "90px serif";
                        ctx.fillStyle = "red";

                        var text = "游 戏 结 束";
                        var textWidth = ctx.measureText(text).width;
                        var x = (width - textWidth) / 2;
                        var y = height / 2;

                        ctx.fillText(text, x, y);

                        backAudio.stop();
                    }

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

                                chessms.distance++;
                                chessms.tim += 20;
                            }
                        }

            focus: true
            Keys.onPressed: (event)=> {
                                if(event.key === Qt.Key_W) {
                                    //console.log("Signal W key pressed emitted")
                                    //console.log(chessms.x / 100)
                                    if(/*chessms.y !== 290 && */chessmsW === 0 && chessmsS === 0 && isOnland == true)
                                    {
                                        isCtroMoving = true;
                                        chessmsW = 7;
                                        bounceAudio.stop();
                                        bounceAudio.play();
                                    }
                                }

                                if(event.key === Qt.Key_S) {
                                    //console.log("Signal S key pressed emitted")
                                    //console.log(chessms.x / 100)
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

                                if(event.key === Qt.Key_Space) {
                                    if(isSlash == false)
                                    {
                                        isSlash = true;
                                        slashAudio.stop();
                                        slashAudio.play();
                                    }
                                }
                            }
        }

    Button {
        id: stopGame
        text: "暂停/启动"
        width: 100
        height: 40
        x: 1300
        y: 880

        onClicked: {
            //canvas.visible = !canvas.visible;
            //console.log(stopGame.checked);
            if(stopGame.checked === false)
            {
                stopGame.checked = true;
                timer.stop();

                backAudio.pause();
            }else {
                stopGame.checked = false;
                timer.start();
                ctrollerRect.focus = true;

                backAudio.play();
            }
        }
    }

    Button {
        id: close
        text: "退出"
        width: 100
        height: 40
        x: 0
        y: 880

        onClicked: {
            gameWindow.close();

            backAudio.stop();
        }
    }

    View {
        id: health
        x: 0
        y: 0
        v_Text.text:  "生命值：" + chessms.health
    }

    View {
        id: kills
        x: 200
        y: 0
        v_Text.text:  "击杀数：" + chessms.kills
    }

    View {
        id: score
        x: 400
        y: 0
        v_Text.text:  "得分：" + chessms.score
    }

    View {
        id: distance
        x: 1000
        y: 0
        v_Text.text:  "距离：" + chessms.distance + "m"
    }

    View {
        id: tim
        x: 1200
        y: 0
        v_Text.text:  "时间：" + (chessms.tim / 1000).toFixed(1) + "s"
    }
}
