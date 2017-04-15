import QtQuick 2.5
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4
import QtQuick.Window 2.0
import ImageEdit 1.0

Window {
    id: editForm
    x: Screen.width / 2 - w / 2
    y: Screen.height / 2 - h / 2
    maximumWidth: w; maximumHeight: h
    minimumWidth: w; minimumHeight: h
    flags:  Qt.Dialog
    modality: Qt.ApplicationModal

    property string imgPath // для обновления отображаемой картинки
    property int x1; property int y1 //для cut
    property int x2; property int y2 //для cut
    property string img_addr //для отображения результатов в главном окне
    property int cut_flag: 0
    property real zoom_relay_w: imageToEdit.sourceSize.width / imageToEdit.paintedWidth
    property real zoom_relay_h: imageToEdit.sourceSize.height / imageToEdit.paintedHeight
    property int zoom_relay_X: (imgBound.width - imageToEdit.paintedWidth)/2
    property int zoom_relay_Y: (imgBound.height - imageToEdit.paintedHeight)/2

    Connections {
            target: edit
            onClicked: imageToEdit.source = img.source
        }

    Rectangle {
        id: mainRect
        anchors.fill: parent
        color: "#D2CCFF"
        //Edit buttons
        Rectangle {
            id: editButtons
            color: mainRect.color
            height: mainRect.height/20
            anchors.bottom: mainRect.bottom
            anchors.left: mainRect.left
            anchors.right: mainRect.right
            anchors.bottomMargin: mainRect.height/16
            anchors.rightMargin: (mainRect.width - imgRect1.width)/2
            anchors.leftMargin: (mainRect.width - imgRect1.width)/2
            Button {
                id: rotate
                width: editButtons.width/4
                anchors.top: editButtons.top
                anchors.bottom: editButtons.bottom
                anchors.left: editButtons.left
                anchors.leftMargin: (editButtons.width - imgRect1.width)/2
                text: qsTr("Rotate")
                onClicked: {
                    if (img.source != "") {
                        //editForm.showMinimized();
                        rotateWindow.show();
                        cut_flag = 0
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
                id: color
                width: editButtons.width/4
                anchors.top: editButtons.top
                anchors.bottom: editButtons.bottom
                anchors.left: editButtons.left
                anchors.leftMargin: width
                text: qsTr("B/W color")
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
                onClicked: {
                    if (img.source != "") {
                        imgPath = imageEdit.filter(imageToEdit.source)
                        imageToEdit.source = ""
                        imageToEdit.source = imgPath
                        cut_flag = 0
                    }
                }
            }
            Button {
                id: cut
                width: editButtons.width/4
                anchors.top: editButtons.top
                anchors.bottom: editButtons.bottom
                anchors.left: editButtons.left
                anchors.leftMargin: 2*width
                text: qsTr("Cut")
                style: ButtonStyle {
                    background: Rectangle {
                        id: rec
                        border.color: "#6666FF"
                        border.width: 2
                        gradient: Gradient {
                            GradientStop { position: 0 ; color: control.pressed ? "#CC99FF" : "#9999FF" }
                            GradientStop { position: 1 ; color: control.pressed ? "#6666FF" : "#B266FF" }
                        }
                    }
                }
                onClicked: {
                    if (img.source != "") {
                        if (cut_flag === 3)
                        {
                            imgPath = imageEdit.cut(imageToEdit.source, (cutRect.x - zoom_relay_X)*zoom_relay_w, (cutRect.y - zoom_relay_Y)*zoom_relay_h, cutRect.width*zoom_relay_w, cutRect.height*zoom_relay_h)
                            imageToEdit.source = ""
                            imageToEdit.source = imgPath
                            cut_flag = 0
                            cutRect.visible = false
                        }
                        else cut_flag = 1
                    }
                }
            }
            Button {
                id: save
                width: editButtons.width/5
                anchors.top: editButtons.top
                anchors.bottom: editButtons.bottom
                anchors.right: editButtons.right
                text: qsTr("Save")
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
                onClicked: {
                    if (img.source != "") {
                        imageEdit.tempSave(img.source);
                        img_addr = img.source
                        img.source = ""
                        img.source = img_addr
                        cut_flag = 0
                    }
                }
            }
        }
        //close button
        Button {
            id: close
            width: imgRect1.width
            height: editButtons.height
            anchors.top: editButtons.bottom
            anchors.right: imgRect1.right
            anchors.topMargin: editButtons.height/7
            text: qsTr("Close")
            onClicked: {
                mainWindow.show();
                editForm.hide();
                editForm.x = Screen.width / 2 - w / 2
                editForm.y = Screen.height / 2 - h / 2
                if (img.source != "") {
                    imageEdit.close()
                }
                cut_flag = 0
            }
            style: ButtonStyle {
                background: Rectangle {
                    border.color: "#FF6666"
                    border.width: 2
                    gradient: Gradient {
                        GradientStop { position: 0 ; color: control.pressed ? "#FF3333": "#FF6666" }
                        GradientStop { position: 1 ; color: control.pressed ? "#FF2222" : "#FF5555" }
                    }
                }
            }
        }
        //Image Border
        Rectangle {
            id: imgRect1
            width: 19*mainRect.width/20
            height: 6*mainRect.height/7
            //color: imgRect.color
            border.width: imgRect.border.width
            border.color: imgRect.border.color
            anchors.top: mainRect.top
            anchors.topMargin: mainRect.height/96
            anchors.horizontalCenter: mainRect.horizontalCenter
            Flickable {
                id: imgBound
                anchors.centerIn: parent
                width: imgRect1.width - 2*imgRect1.border.width
                height: imgRect1.height - 2*imgRect1.border.width
                contentWidth: imageToEdit.width
                contentHeight: imageToEdit.height
                interactive: true
                boundsBehavior: Flickable.StopAtBounds
                clip: true
                Image {
                    id: imageToEdit
                    width: imgBound.width
                    height: imgBound.height
                    fillMode : Image.PreserveAspectFit
                    cache : false

                    MouseArea {
                        id: cutArea
                        anchors.fill: parent
                        onClicked:
                            if (cut_flag) {
                                if (cut_flag === 2) {
                                    x2 = mouseX; y2 = mouseY
                                    cutRect.x = (x1 < x2 ? x1 : x2)
                                    cutRect.y = (y1 < y2 ? y1 : y2)
                                    cutRect.width = (x1 < x2 ? x2 - x1 : x1 - x2)
                                    cutRect.height = (y1 < y2 ? y2 - y1 : y1 - y2)
                                    cutRect.visible = true
                                    cut_flag = 3
                                }
                                else if (cut_flag === 1) {
                                    x1 = mouseX; y1 = mouseY
                                    cut_flag = 2
                                }
                                else if (cut_flag === 3) {
                                    cutRect.visible = false
                                    cut_flag = 0
                                }

                            }
                    }
                }
                Rectangle {
                    id: cutRect
                    border.width: 3
                    color: "transparent"
                }
            }
        }
    }

    ImageEdit {
        id: imgEdit
    }

    Edit_rotate {
        id: rotateWindow
        title: qsTr("Rotate image")
    }
}
