import QtQuick 2.9

Rectangle {

    id: root

    property alias text: label.text
    property alias textColor: label.color

    signal clicked

    width: 150; height: 70
    anchors.horizontalCenter: parent.horizontalCenter
    radius: 30
    color: "#cd853f"
    border.color: "#8b4513"

    MouseArea {
            id: mouseArea
            anchors.fill: parent
            onClicked: root.clicked();
    }

    Text {
        id: label
        font.pixelSize: 26;
        text: "";
        color: "#8b4513"
        anchors.verticalCenter: parent.verticalCenter
        anchors.horizontalCenter: parent.horizontalCenter
    }
}
