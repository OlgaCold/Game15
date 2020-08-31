import QtQuick 2.0

import "logic.js" as Game15

ListModel {

    Component.onCompleted: {

        var state = false
        for(var i = 0; i < Math.pow(Game15.gridSize, 2); i++){
            if(i == Math.pow(Game15.gridSize, 2)-1){
                state = true
            }
            append({ gridId: i+1, isVoid: state})
        }
    }
}
