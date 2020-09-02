import QtQuick 2.9
import QtQuick.Layouts 1.3

import "logic.js" as Game15

Item {

    id: root

    //property alias pressed: mouseArea.pressed
    property alias oldP: mouseArea.oldPosition

    signal clicked

    Block {

        id: item;
        anchors.centerIn: parent

        width: root.width - 10
        height: root.height - 10
        text: model.gridId
        isVoid: model.isVoid       
    }

    MouseArea {

        id: mouseArea

        property int oldPosition
        property bool pressed

        anchors.fill: parent

        onPressed: {

            oldPosition = index
            root.clicked();
            //pressed = true

            /*if(Game15.findVoidCellId(oldPosition, items) !== -1) {

                newPosition = Game15.findVoidCellId(oldPosition, items);

                var min = Math.min(oldPosition, newPosition);
                var max = Math.max(oldPosition, newPosition);
                items.move(min, max, 1)
                items.move(max - 1, min, 1)
                if(Game15.checkWin(items)){
                    messageDialog.open()
                }
            }*/
        }

        onReleased: {
            pressed = false
            oldPosition = -1
        }
    }
}

