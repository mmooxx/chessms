function flowerCtroll(x, y, index) {
    if(index === 3)
        index = 0
    else
        index++

    return [x, y, index]
}

function treeCtroll(x, y, index) {

}

function grasslandChange(x, y) {
    return [x - 1525, y]
}

function chessmsCtroll(x, y, index) {

}
