import QtQuick 2.9
import QtQuick.Window 2.3
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.3
import QtQml 2.2
import QtQml.Models 2.1
import QtQuick.Dialogs 1.2

import "logic.js" as Game15

ApplicationWindow {

    id: root

    title: qsTr("Game of 15")
    visible: true
    width: 530
    height: 600
    color:"#deb887"

    minimumWidth: 530
    minimumHeight: 600

    Board {

        id: board

        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
        anchors.verticalCenterOffset: -40

        margin: 30
        width: Math.min(parent.height - margin - button.height, parent.width - margin)
        height: width

        model: DataList{ id: items}
        delegate: BlockDelegate {

            id: blockDelegate
            width: parent.width/Game15.gridSize
            height: width

            onClicked: {

                var newPosition

                if(Game15.findVoidCellId(oldP, items) !== -1) {

                    newPosition = Game15.findVoidCellId(oldP, items);

                    var min = Math.min(oldP, newPosition);
                    var max = Math.max(oldP, newPosition);
                    items.move(min, max, 1)
                    items.move(max - 1, min, 1)
                    if(Game15.checkWin(items)){
                        messageDialog.open()
                    }
                }
            }
        }
    }

    MixButton {
        id: button

        anchors.margins: 10
        anchors.bottom: parent.bottom

        text: "<b>Mix</b>";
        textColor: "#8b4513"
        onClicked: Game15.mix(items)

    }

    MessageDialog {

        id: messageDialog
        text: "You WIN!!!"

        onAccepted: {
            messageDialog.close()
        }
    }

}
