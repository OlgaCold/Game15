var gridSize = 4

function mix(array){

    var temporaryValue1, temporaryValue2;
    var summ = 0;
    var e = gridSize;

    for(var ind = Math.pow(gridSize,2)-2; ind>0; ind--){
        var obj = Math.floor(Math.random() * (ind + 1));
        temporaryValue1 = array.get(ind).gridId;
        temporaryValue2 = array.get(ind).isVoid;
        array.setProperty(ind, "gridId", array.get(obj).gridId);
        array.setProperty(ind, "isVoid", array.get(obj).isVoid);
        array.get(obj).gridId = temporaryValue1;
        array.get(obj).isVoid = temporaryValue2;
    }

    for(var i = 0; i < Math.pow(gridSize,2)-1; i++){
        for(var j = i+1; j < Math.pow(gridSize,2)-1; j++){
            if(array.get(i).gridId > array.get(j).gridId){
                summ += 1;
            }
        }
    }
    summ+=e;
    if(summ%2 === 1){
        mix(array);
    }

    return array;
}

function checkWin(squares){

    var isSorted = true;
    for(var i = 0; i < Math.pow(gridSize, 2); i++){
        if(i !== squares.get(i).gridId-1){
            isSorted = isSorted&false;
            break;
        }
    }
    return isSorted
}

function checkWay(oldPos, newPos, size){
    var freeway = false;
    var row = Math.floor(oldPos/size);
    var col = oldPos%size;

    if(row === 0){
        if(newPos === oldPos + size || newPos === oldPos + 1 || newPos === oldPos - 1){
            freeway = true;
        }
    } else
    if(row === size - 1){
        if(newPos === oldPos - size || newPos === oldPos + 1 || newPos === oldPos - 1){
            freeway = true;
        }
    } else
    if(col === 0){
        if(newPos === oldPos + 1 || newPos === oldPos + size || newPos === oldPos - size){//
            freeway = true;
        }
    } else
    if(col === size - 1){
        if(newPos === oldPos - 1 || newPos === oldPos + size || newPos === oldPos - size){//
            freeway = true;
        }
    } else {
        if(newPos === oldPos + 1 || newPos === oldPos - 1 ||
                newPos === oldPos + size || newPos === oldPos - size){
            freeway = true;
        }
    }
    return freeway;
}

function create2DArray(size)
{
    var arr = [];
    for (var i = 0; i < size; i++) {
        arr[i] = [];
    }
    return arr;
}
