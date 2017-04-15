import QtQuick 2.5
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4
import QtQuick.Window 2.0
import TreeViewModel 1.0

Window {
    id: chooseForm
    x: Screen.width / 2 - w / 2
    y: Screen.height / 2 - h / 2
    maximumWidth: w; maximumHeight: h
    minimumWidth: w; minimumHeight: h
    modality: Qt.ApplicationModal

    property int row_height: h/20
    property int theme_count: 0
    property string row_text: ""
    property real mY: 10000
    MouseArea {
        id: treeArea
        anchors.fill: parent
        hoverEnabled : true

        Rectangle {
            id: mainRect
            anchors.fill: parent
            color: "#D2CCFF"
            TreeView {
                id: treeView
                anchors.left: mainRect.left
                anchors.right: mainRect.right
                anchors.bottom: buttons.top
                anchors.top: mainRect.top
                model: tree
                backgroundVisible: false
                itemDelegate: Rectangle {
                        id: itemRect
                        color: {
                            if (!styleData.selected || tree_flag) {
                                if ( styleData.row % 2 == 0 ) "#C2BFFF"; else "#D2CCFF"
                            }
                            else
                            {
                                row_text = (styleData.value === undefined) ? "" : styleData.value;
                                "#B0EC00";
                            }
                        }
                        Text {
                            anchors.verticalCenter: itemRect.verticalCenter
                            text: (styleData.value === undefined) ? "" : styleData.value
                        }
                    }
                rowDelegate: Rectangle {
                        id: rowRect
                        height: row_height
                        color: if (!styleData.selected || tree_flag) {
                                   if ( styleData.row % 2 == 0 ) "#C2BFFF"; else "#D2CCFF"
                               }
                               else "#B0EC00"
                    }
                onClicked: {
                    tree_flag = false; //чтобы строки подсвечивались при новом выборе
                    if (tree.isSub(row_text)) {
                        choose_flag = false //предмет выбирается только с темой
                        //сворачивание пред. предмета
                        if (indexAt(50, mY) !== currentIndex)
                        {
                            if (isExpanded(indexAt(50, mY)))
                                collapse(indexAt(50, mY))
                            if (treeArea.mouseY > mY)
                                mY = treeArea.mouseY - row_height*theme_count
                            else
                                mY = treeArea.mouseY
                            theme_count = tree.clickAction(row_text)
                            expand(indexAt(50, mY))
                        }
                    }
                    else {
                        tree.clickAction(row_text)
                        choose_flag = true
                    }
                }
                TableViewColumn {
                    role: "name_role"
                    title: "Name"
                    width: 19*mainRect.width/20
                    resizable: false
                }
            }
            //action buttons
            Rectangle {
                id: buttons
                color: "#D2CCFF"
                anchors.left: mainRect.left
                anchors.right: mainRect.right
                anchors.bottom: mainRect.bottom
                anchors.bottomMargin: mainRect.height/28
                height: mainRect.height/20
                Button {
                    id: remove
                    width: buttons.width/3 - buttons.height/28
                    height: buttons.height
                    anchors.bottom: buttons.bottom
                    anchors.right: view.left
                    text: qsTr("Remove")
                    onClicked: {
                        if (choose_flag) {
                            tree.deleteCurrentTheme()
                            --theme_count
                            choose_flag = false
                            tree_flag = true
                        }
                        else if (tree.isSub(row_text))
                        {
                            tree.deleteCurrentSubj()
                            row_text = ""
                        }
                    }
                    style: ButtonStyle {
                        background: Rectangle {
                            border.color: "#6666FF"
                            border.width: 2
                            gradient: Gradient {
                                GradientStop { position: 0 ; color: control.pressed ? "#CC99FF" : "#9999FF" }
                                GradientStop { position: 1 ; color: control.pressed ? "#6666FF" : "#B266FF" }
                            }
                        }
                    }
                }
                Button {
                    id: view
                    width: remove.width
                    height: remove.height
                    anchors.bottom: buttons.bottom
                    anchors.right: closeButton.left
                    text: qsTr("View")
                    onClicked: {
                        if (choose_flag) {
                            img_ind = 0
                            tree.getPictureList()
                            img.source = tree.getPicture(0)
                            mainWindow.show();
                            chooseForm.hide()
                            chooseForm.x = Screen.width / 2 - w / 2
                            chooseForm.y = Screen.height / 2 - h / 2
                            if (treeView.isExpanded(treeView.indexAt(50, mY)))
                                treeView.collapse(treeView.indexAt(50, mY))
                            mY = 10000
                            tree_flag = true
                            row_text = ""
                        }
                    }
                    style: ButtonStyle {
                        background: Rectangle {
                            border.color: "#6666FF"
                            border.width: 2
                            gradient: Gradient {
                                GradientStop { position: 0 ; color: control.pressed ? "#CC99FF" : "#9999FF" }
                                GradientStop { position: 1 ; color: control.pressed ? "#6666FF" : "#B266FF" }
                            }
                        }
                    }
                }
                Button {
                    id: closeButton
                    width: remove.width
                    height: remove.height
                    anchors.bottom: buttons.bottom
                    anchors.right: buttons.right
                    text: qsTr("Close")
                    onClicked: {
                        choose_flag = false;
                        mainWindow.show();
                        chooseForm.hide()
                        chooseForm.x = Screen.width / 2 - w / 2
                        chooseForm.y = Screen.height / 2 - h / 2
                        if (treeView.isExpanded(treeView.indexAt(50, mY)))
                            treeView.collapse(treeView.indexAt(50, mY))
                        mY = 10000
                        tree_flag = true
                        row_text = ""
                    }
                    style: ButtonStyle {
                        background: Rectangle {
                            border.color: "#6666FF"
                            border.width: 2
                            gradient: Gradient {
                                GradientStop { position: 0 ; color: control.pressed ? "#CC99FF" : "#9999FF" }
                                GradientStop { position: 1 ; color: control.pressed ? "#6666FF" : "#B266FF" }
                            }
                        }
                    }
                }
            }
        }
    }
}
