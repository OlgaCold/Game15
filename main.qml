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

    Rectangle{

        id: frame

        property int margin: 30

        width: Math.min(parent.height - margin - button.height, parent.width - margin)
        height: width

        color: "#faebd7"
        border.color: "#8b4513"

        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
        anchors.verticalCenterOffset: -40


        GridView {

            id: grid


            interactive: false
            cellHeight: parent.width/Game15.gridSize
            cellWidth: cellHeight

            anchors.fill: parent

            displaced: Transition {
                NumberAnimation { properties: "x,y"; easing.type: Easing.OutQuad }
            }
            move: Transition {
                NumberAnimation { properties: "x,y"; easing.type: Easing.OutQuad }
            }

            model: DataList{ id: items}
            delegate: BlockDelegate {
                cwidth: parent.width/Game15.gridSize
                cheight: cwidth
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
