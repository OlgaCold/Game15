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

                ListModel {
                        id: listModel
                        ListElement { text: "1" }
                        ListElement { text: "2" }
                        ListElement { text: "3" }
                        ListElement { text: "4" }
                        ListElement { text: "5" }
                        ListElement { text: "6" }
                        ListElement { text: "7" }
                        ListElement { text: "8" }
                        ListElement { text: "9" }
                        ListElement { text: "10" }
                        ListElement { text: "11" }
                        ListElement { text: "12" }
                        ListElement { text: "13" }
                        ListElement { text: "14" }
                        ListElement { text: "15" }
                        ListElement { text:"" }
                }

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

                    model: DelegateModel {
                        id: visualModel
                        model: listModel

                        delegate: MouseArea {
                            id: delegateMouse
                            property bool held: false
                            property int visualIndex: DelegateModel.itemsIndex

                            width: grid.cellWidth
                            height: grid.cellHeight
                            drag.target: held ? icon : undefined//
                            drag.axis: Drag.XAndYAxis
                            drag.minimumX: delegateMouse.x - 100//75
                            drag.minimumY: delegateMouse.y - 100//75
                            drag.maximumX: delegateMouse.x + 100//85
                            drag.maximumY: delegateMouse.y + 100//85

                            onPressed: {
                                held = true
                                icon.opacity = 0.5
                            }
                            onReleased: {
                                if (held === true) {
                                    held = false
                                    icon.opacity = 1
                                    icon.Drag.drop()
                                } else {
                                    //action on release
                                }
                            }

                            Block {
                                id: icon
                                text: model.text
                                width: parent.width
                                height: width


                                Drag.active: delegateMouse.drag.active
                                Drag.source: delegateMouse
                                //Drag.hotSpot.x: width/2//?
                                //Drag.hotSpot.y: Drag.hotSpot.x
                                anchors {
                                    horizontalCenter: parent.horizontalCenter;
                                    verticalCenter: parent.verticalCenter
                                }
                                states: [
                                    State {
                                        when: icon.Drag.active
                                        ParentChange {
                                            target: icon
                                            parent: grid
                                        }

                                        AnchorChanges {
                                            target: icon;
                                            anchors.horizontalCenter: undefined;
                                            anchors.verticalCenter: undefined
                                        }
                                    }
                                ]

                            }

                            /*DropArea {
                                anchors {
                                    fill: parent
                                    //margins: 15
                                }
                                onDropped: {
                                    var sourceNumber = listModel.get(drag.source.visualIndex).text;
                                    var targetNumber = listModel.get(delegateMouse.visualIndex).text;
                                    //var sourceColor = listModel.get(drag.source.visualIndex).color;
                                    //var targetColor = listModel.get(delegateMouse.visualIndex).color;
                                    listModel.setProperty(drag.source.visualIndex, "text", targetNumber);
                                    listModel.setProperty(delegateMouse.visualIndex, "text", sourceNumber);
                                    //listModel.setProperty(drag.source.visualIndex, "color", targetColor);
                                    //listModel.setProperty(delegateMouse.visualIndex, "color", sourceColor);
                                }
                            }*/
                            DropArea {
                                id: dropArea

                                anchors { fill: parent; /*margins: 15 */}
                                onEntered: {
                                    //  store as local variables
                                    var from = drag.source.visualIndex;
                                    var to = delegateMouse.visualIndex;

                                    console.log(from, "-->", to);

                                    //  `isAdjacent` is a function implemented below
                                    if (isAdjacent(from, to))
                                        console.warn("Yes, adjacent.");
                                    else {
                                        console.warn("No, not adjacent.");

                                        //  jump the gun, we don't care if they're not adjacent
                                        return;
                                    }

                                    //  normal move
                                    visualModel.items.move(from, to);
                                    // visualModel.items.move(drag.source.visualIndex, delegateRoot.visualIndex);   //  this is the same as the line above


                                    //  if `from`/`to` are horizontally adjacent (left/right)
                                    //  then the move is already valid

                                    if (from % 4 < 3 && from + 1 === to)    //  check `to` is right of `from`
                                        return;
                                    if (from % 4 > 0 && from - 1 === to)    //  check `to` is left of `from`
                                        return;


                                    //  move for vertically adjacent
                                    if (from < 12 && from + 4 === to)   //  check `to` is below `from`
                                        visualModel.items.move(to - 1, from);   // CRUCIAL MOVE

                                    if (from >= 4 && from - 4 === to)   //  check `to` is above `from`
                                        visualModel.items.move(to + 1, from);   // CRUCIAL MOVE

                                }

                                function isAdjacent(from, to) {
                                    if (from % 4 < 3 && from + 1 === to)    //  check `to` is right of `from`
                                        return true;
                                    if (from % 4 > 0 && from - 1 === to)    //  check `to` is left of `from`
                                        return true;
                                    if (from < 12 && from + 4 === to)   //  check `to` is below `from`
                                        return true;
                                    if (from >= 4 && from - 4 === to)   //  check `to` is above from
                                        return true;

                                    return false;
                                }
                            }
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
                //onClicked: Game15.createBlock(canvas,0,0)

            }
        }

    //}

}
