import QtQuick 2.9
import QtQuick.Window 2.3
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.3
import QtQml 2.2
import QtQml.Models 2.1


import "logic.js" as Game15

ApplicationWindow {

    id: root

    visible: true
    width: 500
    height: 600
    color:"#deb887"

    title: qsTr("Game of 15")

    minimumWidth: 500
    minimumHeight: 600

    //Rectangle {
    //id: background

    //anchors.fill: parent
    //color: "#deb887"
    //border.color: "#8b4513"

    Item {
        id: canvasWrapper
        width: parent.width
        anchors.top: parent.top
        anchors.bottom: buttonWrapper.top

        Rectangle{
            id: frame
            color: "#faebd7"
            border.color: "#8b4513"
            property int margin: 30

            width: Math.min(parent.height - margin, parent.width - margin)
            /*parent.width < parent.height ? parent.width - margin
                                     : parent.height*/
            height: width

            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter


            GridView {

                id: grid
                anchors.fill: parent
                interactive: false

                //anchors.horizontalCenter: parent.horizontalCenter
                //anchors.verticalCenter: parent.verticalCenter
                Layout.fillWidth: parent
                Layout.fillHeight: parent
                //width: parent.height
                //height: parent.width
                cellHeight: parent.width/4
                cellWidth: cellHeight
                displaced: Transition {
                    NumberAnimation { properties: "x,y"; easing.type: Easing.OutQuad }//Animação anima a transicao dos tiles
                }


                model: DataList{ id: items}

                delegate: IconItem { }

            }

            MouseArea {//redo
                property int currentId: -1 // Original position in model
                property int newIndex // Current Position in model
                property int index: grid.indexAt(mouseX, mouseY) // Item underneath cursor

                id: loc
                anchors.fill: parent
                onPressAndHold: currentId = items.get(newIndex = index).gridId
                onReleased: currentId = -1
                onPositionChanged: {
                    if (loc !== currentId && index !== -1 && index !== newIndex)
                        items.move(newIndex, newIndex = index, 1)
                }
            }
        }
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

    //}
    Component.onCompleted: {
            Game15.newGameState(grid)
        }

}
