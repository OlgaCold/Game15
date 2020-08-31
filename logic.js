.pragma library

var gridSize = 4
var gameState       // Local state of the game
// in our case it will be a play area - gameArea
function getGameState() { return gameState; }

var gameField;      // The playing field, the game grid

function newGameState(canvas, size)
{
    gameState = canvas;
    gameField = create2DArray(size,size);
    return gameState;
}
// Function get a random integer in the range of numbers inclusive
/*function getRandomRound(min, max)
{
    return Math.round(Math.random() * (max - min) + min);
}*/

function mix(array){


    var currentIndex = array.count-1, temporaryValue, randomIndex;
    var summ = 0;
    var e = 4;

    // While there remain elements to shuffle...
    while (0 !== currentIndex) {

        // Pick a remaining element...
        randomIndex = Math.floor(Math.random() * currentIndex);
        currentIndex -= 1;

        // And swap it with the current element.
        temporaryValue = array.get(currentIndex).gridId;
        array.setProperty(currentIndex, "gridId", array.get(randomIndex).gridId);
        array.get(randomIndex).gridId = temporaryValue;
    }

    for(var i = 0; i < array.count-1; i++){
        for(var j = i+1; j < array.count-1-i; j++){
            if(array.get(i).gridId > array.get(j).gridId){
                summ += 1+4;
            }
        }
    }
    if(summ%2 === 1){
        mix(array);
    }

    return array;
}

function checkWin(squares){

    var isSorted = true
    for(var i = 0; i < 15 - 1; i++){
        if(squares.get(i).gridId > squares.get(i+1).gridId){
            isSorted = false;
            break;
        }
    }
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

function create2DArray(rows, columns)
{
    var arr = [];

    for (var i = 0; i < rows; i++) {
        arr[i] = [];
    }

    return arr;
}
