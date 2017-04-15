QT += qml quick gui sql
QT += opengl

CONFIG += c++11

SOURCES += main.cpp \
    treemodel.cpp

RESOURCES += qml.qrc

DEFINES += PRO_FILE_PWD=$$sprintf("\"\\\"%1\\\"\"", $$_PRO_FILE_PWD_)

# Additional import path used to resolve QML modules in Qt Creator's code model
#QML_IMPORT_PATH =

# Default rules for deployment.
qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target

DISTFILES +=

HEADERS += \
    treemodel.h \
    mydatabase.h \
    imageredactor.h
