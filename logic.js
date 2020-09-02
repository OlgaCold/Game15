var gridSize = 4
var gridSqrdSize = Math.pow(gridSize, 2)

function mix(array){

    do{ shuffle(array) }
    while( !checkIsValid(array) )
}

function checkIsValid(array){

    var summ = 0
    var e = gridSize

    for(var i = 0; i < gridSqrdSize - 1; i++){
        for(var j = i + 1; j < gridSqrdSize - 1; j++){
            if(array.get(i).gridId > array.get(j).gridId){
                summ += 1
            }
        }
    }
    summ += e

    return !(summ % 2)
}

function shuffle(array){
    var temporaryValue1, temporaryValue2

    for(var ind = gridSqrdSize - 1; ind > 0; ind--){
        var obj = Math.floor(Math.random() * (ind + 1))
        temporaryValue1 = array.get(ind).gridId
        temporaryValue2 = array.get(ind).isVoid
        array.setProperty(ind, "gridId", array.get(obj).gridId)
        array.setProperty(ind, "isVoid", array.get(obj).isVoid)
        array.get(obj).gridId = temporaryValue1
        array.get(obj).isVoid = temporaryValue2
    }
}

function findVoidCellId(oldPos, array) {

    var newPos = -1
    var tempL = oldPos - 1
    var tempR = oldPos + 1
    var tempD = oldPos - gridSize
    var tempU = oldPos + gridSize

    if(tempL > -1 && tempL < gridSqrdSize && array.get(tempL).gridId === gridSqrdSize) {
        newPos = tempL
    }
    if(tempR > -1 && tempR < gridSqrdSize && array.get(tempR).gridId === gridSqrdSize) {
        newPos = tempR
    }
    if(tempD > -1 && tempD < gridSqrdSize && array.get(tempD).gridId === gridSqrdSize) {
        newPos = tempD
    }
    if(tempU > -1 && tempU < gridSqrdSize && array.get(tempU).gridId === gridSqrdSize) {
        newPos = tempU
    }

    return newPos;
}

function move(array, oldP){

    var newP

    if(Game15.findVoidCellId(oldP, array) !== -1) {

        newP = Game15.findVoidCellId(oldP, array)

        var min = Math.min(oldP, newP)
        var max = Math.max(oldP, newP)
        array.move(min, max, 1)
        array.move(max - 1, min, 1)
        if(checkWin(array)){
            messageDialog.open()
        }
    }
}

function checkWin(squares){

    for(var i = 0; i < gridSqrdSize; i++) {
        if(i !== squares.get(i).gridId - 1){
            return false
        }
    }
    return true
}
