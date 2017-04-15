import QtQuick 2.5
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4
import QtQuick.Window 2.0

Window {
    id: addForm
    x: Screen.width/2 - w/3
    y: Screen.height/2 - h/6
    maximumWidth: 2*w/3; maximumHeight: h/3
    minimumWidth: 2*w/3; minimumHeight: h/3
    modality: Qt.ApplicationModal

    Rectangle {
        id: mainRect
        anchors.fill: parent
        color: "#D2CCFF"
        Text {
            id: imputText1
            text: qsTr("Put the subject name: ")
            font.pixelSize: parent.height/15
            anchors.top: mainRect.top
            anchors.left: imputBorder1.left
            anchors.topMargin: parent.height/7
        }
        Text {
            id: imputText2
            text: qsTr("Put the theme name: ")
            font.pixelSize: imputText1.font.pixelSize
            anchors.top: imputBorder1.bottom
            anchors.left: imputBorder2.left
            anchors.topMargin: parent.height/10
        }
        Rectangle {
            id: imputBorder1
            height: parent.height/10
            width: parent.width - 50
            border.width: 2
            border.color: "#6666FF"
            anchors.top: imputText1.bottom
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.topMargin: parent.height/40
        }
        Rectangle {
            id: imputBorder2
            height: imputBorder1.height
            width: imputBorder1.width
            border.width: 2
            border.color: "#6666FF"
            antialiasing: true
            anchors.top: imputText2.bottom
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.topMargin: parent.height/40
        }
        TextInput {
            id: subjName
            height: imputBorder1.height - 8
            width: imputBorder1.width - 12
            font.pixelSize: height
            activeFocusOnPress : true
            clip: true
            autoScroll : true
            maximumLength : 60
            anchors.centerIn: imputBorder1
        }
        TextInput {
            id: themeName
            height: subjName.height
            width: subjName.width
            font.pixelSize: height
            activeFocusOnPress : true
            autoScroll : true
            clip: true
            maximumLength : 60
            anchors.centerIn: imputBorder2
        }
        //action buttons
        Button {
            id: okButton
            height: parent.height/7
            anchors.bottom: parent.bottom
            anchors.left: imputBorder1.left
            anchors.right: closeButton.left
            anchors.bottomMargin: parent.height/20
            text: qsTr("Ok")
            onClicked: {
                if (subjName.text != "" && themeName.text != "") {
                    tree.userAddEntry(themeName.text, subjName.text)
                    img_ind = 0
                    tree.getPictureList()
                    img.source = tree.getPicture(0)
                    choose_flag = true
                    mainWindow.show();
                    addForm.hide()
                    addForm.x = Screen.width/2 - w/3
                    addForm.y = Screen.height/2 - h/6
                    subjName.clear()
                    themeName.clear()
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
            width: imputBorder1.width/2
            height: okButton.height
            anchors.bottom: parent.bottom
            anchors.right: imputBorder1.right
            anchors.bottomMargin: parent.height/20
            text: qsTr("Cancel")
            onClicked: {
                mainWindow.show();
                addForm.hide()
                addForm.x = Screen.width/2 - w/3
                addForm.y = Screen.height/2 - h/6
                subjName.clear()
                themeName.clear()
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
