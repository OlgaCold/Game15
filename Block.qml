import QtQuick 2.0

Rectangle {

    id: root
    property alias text: label.text
    property bool isVoid: false

    color: isVoid === true ? "transparent" : "#cd853f"
    border.color: isVoid === true ? "transparent" : "#8b4513"
    radius: 5

    Text {
        id: label
        anchors.centerIn: parent
        color: if(isVoid) {"transparent"}
               else {"black"}
        font.pixelSize: 35
        text: ""
    }
}
