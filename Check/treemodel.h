#ifndef TREEMODEL_H
#define TREEMODEL_H

#include <QStandardItemModel>
#include <QString>
#include "mydatabase.h"

namespace TreeViewModel {

    class TreeModel : public QStandardItemModel
        {
            Q_OBJECT
        public:
            explicit TreeModel(QObject *parent = 0);
            virtual ~TreeModel() = default;
            Qt::ItemDataRole TreeModel_Role_Name = Qt::DisplayRole;

            QHash<int, QByteArray> roleNames() const override;

            Q_INVOKABLE bool isSub(QString str);
            Q_INVOKABLE unsigned int clickAction(QString str);
            Q_INVOKABLE QString getPicture(int ind);
            Q_INVOKABLE void getPictureList();
            Q_INVOKABLE void deleteCurrentTheme();
            Q_INVOKABLE void deleteCurrentSubj();
            Q_INVOKABLE bool userAddPicture(QString imgName, int flag);
            Q_INVOKABLE void userAddEntry(const QString& theme, const QString& subj);

        private:
            void clearSubj(QString subjName);
            void getThemeList();
            void addEntry( const QString& theme, const QString& subj);
            QStandardItem* getSubj( const QString& subjName );
            QHash<int, QByteArray> m_roleNameMapping;

            int findCurrentRow();

            QString currentSubj;
            QString currentTheme;
            myDataBase db;
            QList<QString> pictureList;



     };

}

#endif // TREEMODEL_H
