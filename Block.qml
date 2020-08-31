import QtQuick 2.0

Rectangle {
    id: block
    visible: true
    property alias text: label.text
    property bool isVoid: false
    signal clicked


    color: if(isVoid) {"transparent"}
           else {"#cd853f"}
    border.color: if(isVoid) {"transparent"}
                  else {"#8b4513"}
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
