
function buildGrasslandY(arr) {
    const values = [205, 350, 495];
    const randomIndex = Math.floor(Math.random() * values.length);

    for(let i = 0; i !== 27; i++)
    {
        arr[i] = arr[i + 1];
    }
    if(arr[24] === arr[25] && arr[25] === arr[26])
    {
        arr[27] = values[randomIndex];
    }else {
        arr[27] = arr[26];
    }

    return arr;
}
