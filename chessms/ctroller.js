
function buildGrasslandY(arr) {
    const values = [200, 350, 500];
    const randomIndex = Math.floor(Math.random() * values.length);

    for(let i = 0; i !== 14; i++)
    {
        arr[i] = arr[i + 1];
    }
    if(arr[11] === arr[12] && arr[12] === arr[13])
    {
        arr[14] = values[randomIndex];
    }else {
        arr[14] = arr[13];
    }

    return arr;
}

// function ctrollerChessms(num, p) {
//     if(num !== 0)
//     {
//         chessms.y += 30;
//         ctrollerRect.chessmsS--;
//     }
// }
