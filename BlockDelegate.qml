import QtQuick 2.9

Component {
    Item {
        id: main
        width: grid.cellWidth;
        height: grid.cellHeight

        Block {
            id: item;
            parent: loc
            x: main.x + 5;
            y: main.y + 5
            width: main.width - 10;
            height: main.height - 10;
            text: model.gridId
            isVoid: model.isVoid
        }
    }
}
