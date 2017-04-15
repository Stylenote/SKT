import QtQuick 2.5
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4
import QtQuick.Dialogs 1.2
import QtQuick.Window 2.0

Window {
    id: addImgForm
    x: Screen.width/2 - w/3
    y: Screen.height/2 - h/10
    maximumWidth: 2*w/3; maximumHeight: h/5
    minimumWidth: 2*w/3; minimumHeight: h/5
    modality: Qt.ApplicationModal

    property int order_flag: -1

    Rectangle {
        id: mainRect
        anchors.fill: parent
        color: "#D2CCFF"
        Text {
            id: imputText
            text: qsTr("Put the image path: ")
            font.pixelSize: parent.height/8
            anchors.top: mainRect.top
            anchors.left: imputBorder.left
            anchors.topMargin: parent.height/7
        }
        Rectangle {
            id: imputBorder
            height: parent.height/6
            width: 4*parent.width/5
            border.width: 2
            border.color: "#6666FF"
            anchors.top: imputText.bottom
            anchors.left: parent.left
            anchors.topMargin: parent.height/40
            anchors.leftMargin: parent.width/40
        }

        TextInput {
            id: imgPath
            height: imputBorder.height - 8
            width: imputBorder.width - 12
            font.pixelSize: height
            activeFocusOnPress : true
            autoScroll : true
            //readOnly: true
            clip: true
            anchors.centerIn: imputBorder
        }
        //Browse button
        Button {
            id: browse
            height: imputBorder.height
            anchors.verticalCenter: imputBorder.verticalCenter
            anchors.left: imputBorder.right
            anchors.leftMargin: parent.width/40
            text: qsTr("Browse...")
            onClicked: fileDialog.open()
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
        //action buttons
        Button {
            id: addImg
            width: imputBorder.width/2
            height: parent.height/5
            anchors.bottom: parent.bottom
            anchors.left: imputBorder.left
            anchors.bottomMargin: parent.height/10
            text: qsTr("Add to the end")
            onClicked: {
                order_flag = -1
                if (choose_flag && tree.userAddPicture(imgPath.text, order_flag)) {
                    img_ind = 0;
                    img.source = tree.getPicture(img_ind);
                }
                mainWindow.show();
                addImgForm.hide()
                addImgForm.x = Screen.width/2 - w/3
                addImgForm.y = Screen.height/2 - h/10
                imgPath.clear()
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
            id: addImgPos
            width: addImg.width
            height: addImg.height
            anchors.bottom: parent.bottom
            anchors.left: addImg.right
            anchors.bottomMargin: parent.height/10
            text: qsTr("Add before viewed")
            onClicked: {
                order_flag = img_ind
                if (choose_flag && tree.userAddPicture(imgPath.text, order_flag)) {
                    img_ind = 0;
                    img.source = tree.getPicture(img_ind);
                }
                mainWindow.show();
                addImgForm.hide()
                addImgForm.x = Screen.width/2 - w/3
                addImgForm.y = Screen.height/2 - h/10
                imgPath.clear()
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
            width: browse.width
            height: addImg.height
            anchors.bottom: parent.bottom
            anchors.right: browse.right
            anchors.bottomMargin: parent.height/10
            text: qsTr("Cancel")
            onClicked: {
                mainWindow.show();
                addImgForm.hide();
                addImgForm.x = Screen.width/2 - w/3
                addImgForm.y = Screen.height/2 - h/10
                imgPath.clear()
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
    //file choose dialog
    FileDialog {
        id: fileDialog
        title: "Please choose an image file"
        folder: shortcuts.home
        onAccepted: {
            imgPath.text = fileUrl.toString()
            close()
        }
        onRejected: close()
        nameFilters: [ "Image files (*.jpg *.png *.bmp)" ]
        Component.onCompleted: visible = false
    }
}
