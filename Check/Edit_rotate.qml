import QtQuick 2.5
import QtQuick.Controls 1.4
import QtQuick.Window 2.0
import QtQuick.Controls.Styles 1.4
import ImageEdit 1.0

Window {
    property int wr: 6*w/10 //ширина окна
    property int hr: h/3 //высота окна
    property real angle: -90

    signal rot

    id: rotateForm
    x: Screen.width / 2 - wr/ 2
    y: Screen.height / 2 - hr / 2
    maximumWidth: wr; maximumHeight: hr
    minimumWidth: wr; minimumHeight: hr
    modality: Qt.ApplicationModal

    Rectangle {
        id: mainRect
        anchors.fill: parent
        color: "#D2CCFF"
        ExclusiveGroup {
            id: checkGroup
        }
            RadioButton {
                id: lRotate90
                text: qsTr("Rotate 90 degrees left")
                activeFocusOnPress: true
                checked: true
                exclusiveGroup: checkGroup
                anchors.left: mainRect.left
                anchors.top: mainRect.top
                anchors.leftMargin: mainRect.width/35
                anchors.topMargin: mainRect.height/4 - 30
                onClicked: angle = -90
            }
            RadioButton {
                id: rRotate90
                text: qsTr("Rotate 90 degrees right")
                activeFocusOnPress: true
                exclusiveGroup: checkGroup
                anchors.left: mainRect.left
                anchors.top: mainRect.top
                anchors.leftMargin: mainRect.width/35
                anchors.topMargin: mainRect.height/2 - 30
                onClicked: angle = 90
            }
            RadioButton {
                id: rotate180
                text: qsTr("Rotate 180 degrees")
                activeFocusOnPress: true
                exclusiveGroup: checkGroup
                anchors.left: mainRect.left
                anchors.top: mainRect.top
                anchors.leftMargin: mainRect.width/35
                anchors.topMargin: 3*mainRect.height/4 - 30
                onClicked: angle = 180
            }
        }
        //action buttons
        Button {
            id: cancel
            text: qsTr("Cancel")
            width: mainRect.width/3
            height: mainRect.height/8
            anchors.bottom: mainRect.bottom
            anchors.right: mainRect.right
            anchors.rightMargin: 20
            anchors.bottomMargin: 20
            onClicked: {
                editForm.show()
                rotateWindow.hide()
                rotateForm.x = Screen.width / 2 - wr/ 2
                rotateForm.y = Screen.height / 2 - hr / 2
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
            id: ok
            text: qsTr("Ok")
            width: mainRect.width/3
            height: mainRect.height/8
            anchors.bottom: mainRect.bottom
            anchors.right: cancel.left
            anchors.rightMargin: 20
            anchors.bottomMargin: 20
            onClicked: {
                imgPath = imageEdit.rotate(imageToEdit.source, angle)
                imageToEdit.source = ""
                imageToEdit.source = imgPath
                editForm.show()
                rotateWindow.hide()
                rotateForm.x = Screen.width / 2 - wr/ 2
                rotateForm.y = Screen.height / 2 - hr / 2
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
