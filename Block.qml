import QtQuick 2.0

Rectangle {
    id: block
    visible: true
    property alias text: label.text
    signal clicked

    //width: parent.width
    //height: parent.width

    color: "#cd853f"
    border.color: "#8b4513"

    Text {
        id: label
        anchors.centerIn: parent
        color: "black"
        font.pixelSize: 35
        text: ""
    }
    MouseArea {
        anchors.fill: parent
        onClicked: {
            block.clicked()
        }
    }
}
