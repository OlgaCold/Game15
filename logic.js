.pragma library

var gameState       // Local state of the game
                    // in our case it will be a play area - gameArea
function getGameState() { return gameState; }

var gameField;      // The playing field, the game grid
// Create a template for the targets
var blockComponent = Qt.createComponent("Block.qml");

// Initialize a new state of the game
function newGameState(canvas)
{
    gameState = canvas;
    // The game grid will serve a two-dimensional array
    // that will store information about the presence of objects in the cells
    gameField = create2DArray(gameState.rows, gameState.cols);
    return gameState;
}
// Function get a random integer in the range of numbers inclusive
function getRandomRound(min, max)
{
    return Math.round(Math.random() * (max - min) + min);
}

// Create the target component from the template
function createBlock(parent, row, column)
{
    var block = blockComponent.createObject(parent, {"row": row, "col": column})
    gameField[row][column] = block;
}

function createCanvas(parent, rows, cols)
{
    var block
    for(var i = 0; i < rows; i++) {
        for(var j = 0; i < cols - 1; j++) {
            block = blockComponent.createObject(parent, {"row": i, "col": j})
            gameField[i][j] = block;
        }
    }
}

// The target is removed from the grid array
function destroyBlock(row, column)
{
    gameField[row][column] = null;
}

// The option to create a two-dimensional array of grid
function create2DArray(rows, columns)
{
  var arr = [];

  for (var i = 0; i < rows; i++) {
     arr[i] = [];
  }

  return arr;
}

// Checking for the presence of any object in the selected cell
/*function checkEmptyField(row, column)
{
    if (gameField[row][column] == null) {
        return true;
    } else {
        return false;
    }
}*/



//previous example
/*var blockSize = 100;
var maxColumn = 4;
var maxRow = 4;
var maxIndex = maxColumn * maxRow;
var board = new Array(maxIndex);
var component;

//Index function used instead of a 2D array
function index(column, row) {
    return column + (row * maxColumn);
}

function startNewGame() {
    //Delete blocks from previous game
    for (var i = 0; i < maxIndex; i++) {
        if (board[i] != null)
            board[i].destroy();
    }

    //Calculate board size
    maxColumn = Math.floor(canvas.width / blockSize);
    maxRow = Math.floor(canvas.height / blockSize);
    maxIndex = maxRow * maxColumn;

    //Initialize Board
    board = new Array(maxIndex);
    for (var column = 0; column < maxColumn; column++) {
        for (var row = 0; row < maxRow; row++) {
            board[index(column, row)] = null;
            createBlock(column, row);
        }
    }
}

function createBlock(column, row) {
    if (component == null)
        component = Qt.createComponent("Block.qml");

    // Note that if Block.qml was not a local file, component.status would be
    // Loading and we should wait for the component's statusChanged() signal to
    // know when the file is downloaded and ready before calling createObject().
    if (component.status == Component.Ready) {
        var dynamicObject = component.createObject(canvas);
        if (dynamicObject == null) {
            console.log("error creating block");
            console.log(component.errorString());
            return false;
        }

        dynamicObject.text = index(column, row)
        dynamicObject.x = column * blockSize;
        dynamicObject.y = row * blockSize;
        dynamicObject.width = blockSize;
        dynamicObject.height = blockSize;
        board[index(column, row)] = dynamicObject;
    } else {
        console.log("error loading block component");
        console.log(component.errorString());
        return false;
    }
    return true;
}*/
