import QtQuick 2.9
import QtQuick.Window 2.2
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.3
import QtQml 2.2

import "logic.js" as Game15

ApplicationWindow {

    id: root

    visible: true
    width: 500
    height: 600
    title: qsTr("Game of 15")

    Rectangle {
        id: background
        anchors.fill: parent
        color: "#deb887"

        Item {
            id: canvasWrapper
            width: parent.width
            anchors.top: parent.top
            anchors.bottom: buttonWrapper.top

            Rectangle {
                id: canvas

                property int margin: 30
                property int rows: 4
                property int cols: 4
                width: parent.width < parent.height ? parent.width - margin
                                                    : parent.height - margin
                property int blockSize: width*4/5
                height: width

                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
                color: "#faebd7"



            }
        }


        Item{
            id: buttonWrapper
            width: parent.width; height: 100
            anchors.bottom: parent.bottom

            MixButton {
                text: "<b>Mix</b>";
                textColor: "#8b4513"
                onClicked: Game15.createBlock(canvas,0,0)

            }
        }

    }

    Component.onCompleted: {
        Game15.newGameState(canvas)
    }

}
