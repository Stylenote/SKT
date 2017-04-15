#ifndef IMAGEREDACTOR_H
#define IMAGEREDACTOR_H
#include <QObject>
#include <QImage>
#include <QFile>
#include <QString>
#include <QDir>

#ifdef Q_OS_WIN32
    #define PREFIX "file:///"
#endif
#ifdef Q_OS_LINUX
  #define PREFIX "file://"
#endif

namespace ImageEdit {

const QString tempFileName = "temp.jpg";

    class imageRedactor : public QObject
    {
        Q_OBJECT
    public:
        explicit imageRedactor(QObject *parent = 0) {
        }

        Q_INVOKABLE QString rotate(QString imgname, float angle)
        {
            imgname.remove(PREFIX);
            QTransform trans;
            trans.rotate(angle);
            QImage img(imgname);
            //поворачиваем и сохраняем
            img=img.transformed(trans);
            bool f = img.save("temp.jpg", Q_NULLPTR, 85);
            if (f);
            //задаем путь к temp-картинке
            QString tmp_path = PREFIX;
            tmp_path.append(QDir::current().absoluteFilePath(tempFileName));
            //tmp_path.append(PRO_FILE_PWD);
            //tmp_path.append("/temp.jpg");
            return tmp_path;
        }

        Q_INVOKABLE QString cut(QString imgname, float x, float y, float w, float h)
        {
            imgname.remove(PREFIX);
            QImage img(imgname);
            img=img.copy(x, y, w, h);
            img.save("temp.jpg", Q_NULLPTR, 85);
            QString tmp_path = PREFIX;
            tmp_path.append(QDir::current().absoluteFilePath(tempFileName));
            //tmp_path.append(PRO_FILE_PWD);
            //tmp_path.append("/temp.jpg");
            return tmp_path;
        }

        Q_INVOKABLE QString filter(QString imgname)
        {
            QColor col;
            imgname.remove(PREFIX);
            QImage gray(imgname);
            float gg;
            for (int i=0; i<gray.rect().right(); i++)
                for (int j=0; j<gray.rect().bottom(); j++)
                {
                    col.setRgb(gray.pixel(i,j) );
                    gg=col.red()*0.3+col.green()*0.59+col.blue()*0.11;
                    col.setRgb(gg, gg, gg);
                    gray.setPixel(i, j, col.rgb());
                }
             float r, g, b;
             QImage lastimage=gray;
             for (int i=1; i<gray.rect().right()-1; i++)
                 for (int j=1; j<gray.rect().bottom()-1; j++)
                 {
                    r=(gray.pixelColor(i-1, j-1).red()+gray.pixelColor(i-1, j).red()+gray.pixelColor(i-1, j+1).red()+gray.pixelColor(i, j-1).red()+gray.pixelColor(i, j+1).red()+gray.pixelColor(i+1, j-1).red()+gray.pixelColor(i+1, j).red()+gray.pixelColor(i+1, j+1).red())/8;
                    g=(gray.pixelColor(i-1, j-1).green()+gray.pixelColor(i-1, j).green()+gray.pixelColor(i-1, j+1).green()+gray.pixelColor(i, j-1).green()+gray.pixelColor(i, j+1).green()+gray.pixelColor(i+1, j-1).green()+gray.pixelColor(i+1, j).green()+gray.pixelColor(i+1, j+1).green())/8;
                    b=(gray.pixelColor(i-1, j-1).blue()+gray.pixelColor(i-1, j).blue()+gray.pixelColor(i-1, j+1).blue()+gray.pixelColor(i, j-1).blue()+gray.pixelColor(i, j+1).blue()+gray.pixelColor(i+1, j-1).blue()+gray.pixelColor(i+1, j).blue()+gray.pixelColor(i+1, j+1).blue())/8;

                    col.setRgb(gray.pixel(i,j) );
                    r=col.red()/r*255;
                    if (r>255) r=255;
                    g=col.green()/g*255;
                    if (g>255) g=255;
                    b=col.blue()/b*255;
                    if (b>255) b=255;

                    if (r<205 && g<205 && b<205)
                        col.setRgb(0, 0, 0);
                    else
                        col.setRgb(r, g, b);
                    lastimage.setPixel(i, j, col.rgb());
                 }
             lastimage.save("temp.jpg", Q_NULLPTR, 85);
             QString tmp_path = PREFIX;
             tmp_path.append(QDir::current().absoluteFilePath(tempFileName));
//             tmp_path.append(PRO_FILE_PWD);
//             tmp_path.append("/temp.jpg");
             return tmp_path;
        }
        Q_INVOKABLE void tempSave(QString imgname)
        {
            imgname.remove(PREFIX);
            QImage temp("temp.jpg");
            temp.save(imgname, Q_NULLPTR, 85);
        }
        Q_INVOKABLE void close()
        {
            QFile("temp.jpg").remove();
        }

    };
}

#endif // IMAGEREDACTOR_H
