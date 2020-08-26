import QtQuick 2.0

Rectangle {
    id: block
    visible: true
    property alias text: label.text
    signal clicked

    width: parent/4
    height: width

    color: "lightsteelblue"
    border.color: "slategrey"

    Text {
        id: label
        anchors.centerIn: parent
        color: "black"
        text: ""
    }
    MouseArea {
        anchors.fill: parent
        onClicked: {
            block.clicked()
        }
    }
}
