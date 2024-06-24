// 导入QtQuick模块，这是Qt5 QML的基本模块
import QtQuick

// 导入外部JavaScript文件作为模块，这里导入了两个模块："ctroller.js" 和 "paintCtroller.js"
// 这些模块可能包含一些自定义的函数，用于控制游戏逻辑或绘制逻辑
import "ctroller.js" as Ctroller
import "paintCtroller.js" as Paint

// 定义一个窗口组件，设置窗口的尺寸、标题等属性
Window {
    id: window // 给窗口设置一个id，以便在代码中引用
    width: 1600 // 设置窗口的宽度
    height: 1000 // 设置窗口的高度
    //visible: false // 这行被注释掉了，意味着窗口默认是可见的
    title: qsTr("chessmsGame") // 设置窗口的标题，使用qsTr进行国际化支持

    // 下面是一些自定义组件的实例化，它们可能代表游戏中的不同元素
    Chessms { id: chessms }
    Flower { id: flower }
    Tree { id: tree }
    Grassland { id: grassland }

    // 定义一个Rectangle，用于作为Canvas的容器
    Rectangle {
        width: parent.width // 容器的宽度设置为父组件的宽度
        height: parent.height // 容器的高度设置为父组件的高度

        // 在Rectangle中定义一个Canvas，用于绘制图形
        Canvas {
            id: canvas
            anchors.fill: parent // 让Canvas填满其父组件
            // onPaint事件处理器，每当Canvas需要重绘时触发
            onPaint: {
                timer.start(); // 启动定时器
                var ctx = canvas.getContext("2d");
                for (var x = grassland.x; x < canvas.width; x += grassland.width) {
                                   ctx.drawImage(grassland, x, grassland.y, grassland.width, grassland.height);
                               }

                flower.source = flower.images[flower.index];
                ctx.drawImage(flower, flower.x, flower.y, flower.width, flower.height);

            }
        }

        // 定义一个Timer组件，用于定时触发事件
        Timer {
            id: timer
            interval: 50// 设置定时器的时间间隔为200毫秒
            running: true//定时器默认不运行
            repeat: true // 设置定时器重复触发

            // onTriggered事件处理器，每当定时器触发时执行
            onTriggered: {
                // 下面的代码用于更新flower的图片索引，实现动画效果
                if(flower.index == 3)
                    flower.index = 0;
                else
                    flower.index++;

                // 更新grassland的x坐标，可能是为了实现背景的滚动效果
                console.log(grassland.x)
                  grassland.x -= 10; // 背景滚动速度
                if(grassland.x==-2*(-width))
                    grassland.x=-width

                // 下面的代码被注释掉了，它们可能是用于调用某些自定义函数来更新grassland的位置
                timer.stop(); // 停止定时器
                canvas.requestPaint(); // 请求Canvas重绘
            }
        }
    }
}
