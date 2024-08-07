function buildGrasslandY(arr) {
    const values = [200, 350, 500];
    const randomIndex = Math.floor(Math.random() * values.length);

    for(let i = 0; i !== 14; i++)
    {
        arr[i] = arr[i + 1];
    }
    if(arr[9] === arr[10] && arr[10] === arr[11] && arr[11] === arr[12] && arr[12] === arr[13])
    {
        if(arr[13] === 500 || arr[13] === 200)
            arr[14] = 350;
        else
            arr[14] = values[randomIndex];
    }else {
        arr[14] = arr[13];
    }

    return arr;
}

function buildTreeY(arrT, arrG) {
    for(let i = 0; i != 2; i++)
    {
        arrT[i] = arrT[i + 1];
    }
    arrT[2] = arrG[14] - 115;

    return arrT;
}

function buildMonster(arrMX, arrMY, arrG) {
    var add = 0;
    if(arrG[13] !== arrG[14])
    {
        for(let i = 0; i != 3; i++)
        {
            if(arrMY[i] === 920 && randomBooleanWithProbability(0.4) === true) //设定怪物出现概率
            {
                arrMY[i] =arrG[13] + 90;
                arrMX[i] = 1400 + add * 40; //相邻怪物间隔40
                add++;
            }
        }
    }

    return [arrMX, arrMY];
}

function randomBooleanWithProbability(probability) {
    return Math.random() < probability;
}
// function returnGrasslandY(chessmsX, arr) {
//     return arr[chessmsX / 100];
// }

// function ctrollerChessms(num, p) {
//     if(num !== 0)
//     {
//         chessms.y += 30;
//         ctrollerRect.chessmsS--;
//     }
// }
