import QtQuick 2.0

import "logic.js" as Game15

ListModel {

    id: root

    Component.onCompleted: {

        var numBlocks = Math.pow(Game15.gridSize, 2)
        for(var i = 0; i < numBlocks; i++){
            append({ gridId: i+1, isVoid: false})
        }
        items.setProperty(numBlocks - 1, "isVoid", true)

        Game15.mix(items)
    }
}
