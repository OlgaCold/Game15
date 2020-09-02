import QtQuick 2.0

import "logic.js" as Game15

Rectangle{

    id: root

    property alias model: grid.model
    property alias delegate: grid.delegate
    property int margin

    color: "#faebd7"
    border.color: "#8b4513"

    GridView {

        id: grid

        anchors.fill: parent

        interactive: false
        cellHeight: parent.width/Game15.gridSize
        cellWidth: cellHeight

        displaced: Transition {
            NumberAnimation { properties: "x,y"; easing.type: Easing.OutQuad }
        }
        move: Transition {
            NumberAnimation { properties: "x,y"; easing.type: Easing.OutQuad }
        }
    }
}

