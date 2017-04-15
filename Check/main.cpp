#include <QApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include "treemodel.h"
#include "imageredactor.h"

int main(int argc, char *argv[])
{
    QApplication app(argc, argv);

    QApplication::addLibraryPath("./plugins");

    //регистрируем типы в QML
    qmlRegisterType<TreeViewModel::TreeModel>("TreeViewModel", 1, 0, "Tree");
    qmlRegisterType<ImageEdit::imageRedactor>("ImageEdit", 1, 0, "ImageEdit");

    // Создаём движок qml
    QQmlApplicationEngine engine;

    //загружаем в него исходники qml
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));

    return app.exec();
}
