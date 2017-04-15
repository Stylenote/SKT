#ifndef MYDATABASE_H
#define MYDATABASE_H

#include <QObject>
#include <QtSql/QSqlDatabase>
#include <QDebug>
#include <QSqlError>
#include <QStringList>
#include <QSqlQuery>
#include <QVariant>

class myDataBase : public QObject
{
    Q_OBJECT
public:
    explicit myDataBase(QObject *parent = 0) :
    QObject(parent)
    {

    }

    bool createConnection()
    {
        db = QSqlDatabase::addDatabase("QSQLITE");
        db.setDatabaseName("test.db");
        db.setHostName("local");
        if (!db.open()) {
            qDebug() << "Cannot open database:" << db.lastError();
            return false;
        }
        return true;
    }

    void closeConnection() {
        db.close();
    }

signals:

public slots:
    QStringList getSubjects(void) {
        QSqlQuery query("select name from subjects order by name asc");
        QStringList result;
        while (query.next()) {
            result.push_back(query.value(0).toString());
        }
        return result;
    }

    QStringList getThemesBySubj(QString subj) {
        QSqlQuery query;
        query.prepare("select theme from theme_catalog where subject = :subj order by theme asc");
        query.bindValue(":subj", subj);
        query.exec();
        QStringList result;
        while (query.next()) {
            result.push_back(query.value(0).toString());
        }
        return result;
    }

    QStringList getImageByThemeSubj(QString theme, QString subj) {
        QSqlQuery query;
        query.prepare("select address from image_catalog where subject = :subj and theme = :theme order by number asc");
        query.bindValue(":subj", subj);
        query.bindValue(":theme", theme);
        query.exec();
        QStringList result;
        while (query.next()) {
            result.push_back(query.value(0).toString());
        }
        return result;
    }

    void addSubject(QString subj){
        QSqlQuery query;
        query.prepare("insert into subjects (name) values(:subj)");
        query.bindValue(":subj", subj);
        query.exec();
    }

    void addThemeToSubj(QString theme, QString subj) {
        QSqlQuery query;
        query.prepare("insert into theme_catalog (theme, subject) values(:theme, :subj)");
        query.bindValue(":subj", subj);
        query.bindValue(":theme", theme);
        query.exec();
    }

    void addImageToThemeSubj(QString image, QString theme, QString subj) {
        QSqlQuery query;
        query.prepare("insert into image_catalog (address, theme, subject) values(:image, :theme, :subj)");
        query.bindValue(":subj", subj);
        query.bindValue(":theme", theme);
        query.bindValue(":image", image);
        query.exec();
    }

    void removeSubject(QString subj) {
        QSqlQuery query;
        query.prepare("delete from subjects where name = :subj");
        query.bindValue(":subj", subj);
        query.exec();
    }

    void removeThemeBySubj(QString theme, QString subj) {
        QSqlQuery query;
        query.prepare("delete from theme_catalog where theme = :theme and subject = :subj");
        query.bindValue(":subj", subj);
        query.bindValue(":theme", theme);
        query.exec();
    }

    void removeImageFromThemeSubj(QString image, QString theme, QString subj) {
        QSqlQuery query;
        query.prepare("delete from image_catalog where address = :image and theme = :theme and subject = :subj");
        query.bindValue(":subj", subj);
        query.bindValue(":theme", theme);
        query.bindValue(":image", image);
        query.exec();
    }

    QStringList getImagesWithoutTheme() {
        QSqlQuery query("select address from images where id not in (select id_image from img_thm)");
        QStringList result;
        while (query.next()) {
            result.push_back(query.value(0).toString());
        }
        return result;
    }

    void removeImagesWithoutTheme() {
        QSqlQuery query("delete from images where id not in (select id_image from img_thm)");
        query.exec();
    }

    void addImageToThemeSubjBefore(QString image, QString theme, QString subj, QString before) {
        addImageToThemeSubj(image, theme, subj);
        bool ok;
        QSqlQuery query;
        query.prepare("select number from image_catalog where address = :before and theme = :theme and subject = :subj");
        query.bindValue(":subj", subj);
        query.bindValue(":theme", theme);
        query.bindValue(":before", before);
        query.exec();

        query.first();
        int num = query.value(0).toInt(&ok);
        if (!ok) {
            qDebug() << "Oups!!";
        }

        query.prepare("update image_catalog set number = number + 1 where theme = :theme and subject = :subj and number >= :num");
        query.bindValue(":subj", subj);
        query.bindValue(":theme", theme);
        query.bindValue(":num", num);
        query.exec();

        query.prepare("update image_catalog set number = :num where theme = :theme and subject = :subj and address = :image");
        query.bindValue(":num", num);
        query.bindValue(":subj", subj);
        query.bindValue(":theme", theme);
        query.bindValue(":image", image);
        query.exec();
    }

private:
    QSqlDatabase db;

};

#endif // MYDATABASE_H
