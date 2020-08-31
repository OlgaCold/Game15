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

            height: width

            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter


            GridView {

                id: grid
                anchors.fill: parent
                interactive: false
                property int gridSize: 4

                Layout.fillWidth: parent
                Layout.fillHeight: parent
                cellHeight: parent.width/Game15.gridSize
                cellWidth: cellHeight
                displaced: Transition {
                    NumberAnimation { properties: "x,y"; easing.type: Easing.OutQuad }//Animação anima a transicao dos tiles
                }
                move: Transition {
                    NumberAnimation { properties: "x,y"; easing.type: Easing.OutQuad }//Animação anima a transicao dos tiles
                }


                model: DataList{ id: items}

                delegate: BlockDelegate {}

            }

            MouseArea {

                id: loc
                anchors.fill: parent

                property int oldPosition
                property int newPosition
                property bool isFree
                property bool victory

                onPressed: {oldPosition = grid.indexAt(mouseX, mouseY)}
                onReleased: {
                    newPosition = grid.indexAt(mouseX, mouseY)
                    isFree = Game15.checkWay(oldPosition, newPosition, Game15.gridSize)
                    if(grid.itemAt(mouseX, mouseY) !== null && items.get(newPosition).gridId === Math.pow(Game15.gridSize, 2) && isFree===true){
                        var min = Math.min(oldPosition, newPosition);
                        var max = Math.max(oldPosition, newPosition);
                        items.move(min, max, 1)
                        items.move(max-1, min, 1)
                        victory = Game15.checkWin(items)
                        console.log(victory)
                    }
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
            onClicked: Game15.mix(items)

        }
    }

    Component.onCompleted: {
            Game15.newGameState(grid, Game15.gridSize)
    }

}
