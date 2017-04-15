import QtQuick 2.5
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4
import QtQuick.Window 2.0
import TreeViewModel 1.0
import ImageEdit 1.0

ApplicationWindow {
    property int w: 1200 //ширина основного окна
    property int h: 900 //высота основного окна
    property int img_w: imgRect.width //ширина отображаемой картинки
    property int img_h: imgRect.height //высота отображаемой картинки
    property int img_ind: 0 //позиция картинки в теме при пролистывании
    property bool choose_flag: false //флаг выбора предмета и темы
    property bool tree_flag: false  //флаг для исходного вида дерева

    id: mainWindow
    x: Screen.width / 2 - w / 2; y: Screen.height / 2 - h / 2
    visible: true
    minimumWidth: w; minimumHeight: h
    maximumHeight: h; maximumWidth: w
    title: qsTr("Lecture Viewer")

    Rectangle {
        id: mainRect
        anchors.fill: parent
        color: "#D2CCFF"
        //Control buttons
        Button {
            id: back
            width: imgRect.width/2
            anchors.top: imgRect.bottom
            anchors.bottom: mainRect.bottom
            anchors.left: imgRect.left
            anchors.bottomMargin: mainRect.height/48
            anchors.topMargin: mainRect.height/48
            text: qsTr("Back")
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
                if (choose_flag) {
                    img_ind -= 1;
                    img.source = tree.getPicture(img_ind);
                }
            }
        }
        Button {
            id: forth
            width: back.width
            height: back.height
            text: qsTr("Forth")
            anchors.top: imgRect.bottom
            anchors.right: imgRect.right
            anchors.topMargin: mainRect.height/48
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
                if (choose_flag) {
                    img_ind += 1;
                    img.source = tree.getPicture(img_ind);
                }
            }
        }
        Button {
            id: quit
            width: zoomBorder.width
            height: back.height
            text: qsTr("Exit")
            anchors.top: imgRect.bottom
            anchors.right: zoomBorder.right
            anchors.left: zoomBorder.left
            anchors.topMargin: mainRect.height/48
            onClicked: Qt.quit()
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
        //Functional buttons
        Button {
            id: choose
            width: (imgRect.width + zoomBorder.width + (mainRect.width - imgRect.width - 4*zoomBorder.width/3)/2)/4
            anchors.top: mainRect.top; anchors.bottom: imgRect.top
            anchors.left: imgRect.left
            anchors.bottomMargin: mainRect.height/96
            anchors.topMargin: mainRect.height/96
            text: qsTr("Choose/Remove")
            onClicked: { chooseWindow.show(); /*mainWindow.showMinimized();*/  }
            style: ButtonStyle {
                 background: Rectangle {
                     border.color: "#6666FF"
                     gradient: Gradient {
                        GradientStop { position: 0 ; color: control.pressed ? "#CC99FF" : "#9999FF" }
                        GradientStop { position: 1 ; color: control.pressed ? "#6666FF" : "#B266FF" }
                     }
                 }
            }
        }
        Button {
            id: add
            width: choose.width
            anchors.top: mainRect.top; anchors.bottom: imgRect.top
            anchors.left: choose.right
            anchors.bottomMargin: mainRect.height/96
            anchors.topMargin: mainRect.height/96
            text: qsTr("Add s/th...")
            onClicked: { addWindow.show(); /*mainWindow.showMinimized();*/  }
            style: ButtonStyle {
                background: Rectangle {
                    border.color: "#6666FF"
                    gradient: Gradient {
                         GradientStop { position: 0 ; color: control.pressed ? "#CC99FF" : "#9999FF" }
                         GradientStop { position: 1 ; color: control.pressed ? "#6666FF" : "#B266FF" }
                    }
                }
            }
        }
        Button {
            id: addImage
            width: choose.width
            anchors.top: mainRect.top; anchors.bottom: imgRect.top
            anchors.left: add.right
            anchors.bottomMargin: mainRect.height/96
            anchors.topMargin: mainRect.height/96
            text: qsTr("Add Image")
            onClicked: { addImgWindow.show(); /*mainWindow.showMinimized();*/ }
            style: ButtonStyle {
                background: Rectangle {
                    border.color: "#6666FF"
                    gradient: Gradient {
                        GradientStop { position: 0 ; color: control.pressed ? "#CC99FF" : "#9999FF" }
                        GradientStop { position: 1 ; color: control.pressed ? "#6666FF" : "#B266FF" }
                    }
                }
            }
        }
        Button {
            id: edit
            width: choose.width
            anchors.top: mainRect.top; anchors.bottom: imgRect.top
            anchors.left: addImage.right
            anchors.bottomMargin: mainRect.height/96
            anchors.topMargin: mainRect.height/96
            text: qsTr("Edit Image")
            onClicked: {
                editWindow.show();
                /*mainWindow.showMinimized();*/
            }
            style: ButtonStyle {
                background: Rectangle {
                    border.color: "#6666FF"
                    gradient: Gradient {
                        GradientStop { position: 0 ; color: control.pressed ? "#CC99FF" : "#9999FF" }
                        GradientStop { position: 1 ; color: control.pressed ? "#6666FF" : "#B266FF" }
                    }
                }
            }
        }
        //Image Border
        Rectangle {
            id: imgRect
            width: 17*mainRect.width/19
            height: 6*mainRect.height/7
            //color: "transparent"
            border.width: 3
            border.color: "#6666FF"
            anchors.top: mainRect.top
            anchors.right: zoomBorder.left
            anchors.topMargin: mainRect.height/20
            anchors.rightMargin: (mainRect.width - width - 4*zoomBorder.width/3)/2
            Flickable {
                id: imgBound
                anchors.centerIn: parent
                width: imgRect.width - 2*imgRect.border.width
                height: imgRect.height - 2*imgRect.border.width
                contentWidth: img.width
                contentHeight: img.height
                interactive: true
                boundsBehavior: Flickable.StopAtBounds
                clip: true
                Image  {
                    id: img
                    width: imgBound.width*(2*zoom.value + 1)
                    height: imgBound.height*(2*zoom.value + 1)
                    fillMode : Image.PreserveAspectFit
                    cache: false
                    source: ""
                }
            }
        }
        //Zoom
        Rectangle {
            id: zoomBorder
            color: "#C2BFFF"
            width: zoomLbl.font.pixelSize*4 - 6
            border.width: 2
            border.color: "#6666FF"
            anchors.right: mainRect.right
            anchors.top: imgRect.top
            anchors.bottom: imgRect.bottom
            anchors.rightMargin: (mainRect.width - 4*width/3 - imgRect.width)/2
        }
        Text {
            id: zoomLbl
            text: qsTr("Zoom")
            font.pixelSize: 20
            color: zoomBorder.border.color
            horizontalAlignment: Text.Center
            anchors.left: zoomBorder.left
            anchors.right: zoomBorder.right
            anchors.top: zoomBorder.top
            anchors.topMargin: zoomBorder.height/40
        }
        Slider {
            id: zoom
            width: zoomBorder.width
            orientation: Qt.Vertical
            anchors.horizontalCenter: zoomBorder.horizontalCenter
            anchors.top: zoomBorder.top
            anchors.bottom: zoomBorder.bottom
            anchors.topMargin: zoomLbl.height + zoomBorder.height/15
            anchors.bottomMargin: zoomBorder.height/15
            style: SliderStyle {
                groove: Rectangle {
                    id: grooveRect
                    implicitWidth: zoom.height
                    implicitHeight: zoomBorder.width/7
                    color: "#6666FF"
                    radius: 8
                    Rectangle {
                        //height: parent.height
                        width: styleData.handlePosition
                        implicitHeight: parent.implicitHeight
                        border.width: 2
                        border.color: "#6666FF"
                        radius: grooveRect.radius
                        color: "#D2CCFF"
                    }
                }
                handle: Rectangle {
                    anchors.centerIn: parent
                    color: control.pressed ? "#D2CCFF" : "#6666FF"
                    border.color: "#6666FF"
                    border.width: 2
                    implicitWidth: zoomBorder.width/2
                    implicitHeight: zoomBorder.width/3
                    radius: 12
                }
            }
        }
    }

    Tree { id: tree }

    ImageEdit {
        id: imageEdit
    }

    ChooseForm {
        id: chooseWindow
        title: qsTr("Choose/Remove subj/theme")
    }

    EditForm {
        id: editWindow
        title: qsTr("Edit image")
    }

    AddForm {
        id: addWindow
        title: qsTr("Add subj/theme")
    }

    AddImgForm {
        id: addImgWindow
        title: qsTr("Add image to the viewed theme")
    }
}
