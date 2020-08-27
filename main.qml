import QtQuick 2.9
import QtQuick.Window 2.3
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

    minimumWidth: 500
    minimumHeight: 600

    Rectangle {
        id: background
        //anchors.left: parent.left
        //anchors.right: parent.right
        //anchors.top: parent.top
        //anchors.bottom: parent.bottom

        anchors.fill: parent
        //width: parent.width
        //height: parent.width
        color: "#deb887"
        border.color: "#8b4513"

        Item {
            id: canvasWrapper
            width: parent.width
            anchors.top: parent.top
            anchors.bottom: buttonWrapper.top
            //width: parent.width < parent.height ? parent.width - margin//
                                 //: parent.height - margin
            //height: width//


            Rectangle{
                id: frame
                color: "#faebd7"
                border.color: "#8b4513"
                //anchors.margins: 30
                property int margin: 30

                width: Math.min(parent.height - margin, parent.width - margin)
                    /*parent.width < parent.height ? parent.width - margin
                                     : parent.height*/
                height: width

                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter


                GridLayout{
                    id: canvas
                    Layout.fillWidth: parent
                    Layout.fillHeight: parent
                    property int blockSize: 100

                    rows: 4
                    columns: 4

                    anchors.verticalCenter: parent.verticalCenter
                    anchors.horizontalCenter: parent.horizontalCenter

                    Component.onCompleted: {
                        //Game15.newGameState(canvas)
                        Game15.createCanvas(canvas, blockSize)


                    }
                }
            }


            /*Rectangle {
                id: canvas
                property int blockSize: width/4
                property int margin: 30
                property int rows: 4
                property int cols: 4
                width: parent.width < parent.height ? parent.width - margin
                                     : parent.height - margin
                height: width

                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
                color: "#faebd7"


                Component.onCompleted: {
                    //Game15.newGameState(canvas)
                    Game15.createCanvas(canvas, blockSize)


                }


            }*/
        }


        Item{
            id: buttonWrapper
            width: parent.width; height: 100
            anchors.bottom: parent.bottom

            MixButton {
                text: "<b>Mix</b>";
                textColor: "#8b4513"
                //onClicked: Game15.createBlock(canvas,0,0)

            }
        }

    }

}
