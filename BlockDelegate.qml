import QtQuick 2.9
import QtQuick.Layouts 1.3

import "logic.js" as Game15

Item {

    id: root

    property alias oldP: mouseArea.oldPosition

    signal clicked

    Block {

        id: item;
        anchors.centerIn: parent

        width: root.width - 10
        height: root.height - 10
        text: model.gridId
        isVoid: model.isVoid       
    }

    MouseArea {

        id: mouseArea

        property int oldPosition
        property bool pressed

        anchors.fill: parent

        onPressed: {

            oldPosition = index
            root.clicked();
        }
    }
}

