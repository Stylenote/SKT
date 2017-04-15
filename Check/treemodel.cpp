#include "treemodel.h"

#include <QFile>
#include <QDir>

#ifdef Q_OS_WIN32
    #define PREFIX "file:///"
#endif
#ifdef Q_OS_LINUX
  #define PREFIX "file://"
#endif

using namespace TreeViewModel;
//using namespace ImageEdit;

TreeModel::TreeModel(QObject *parent) :
    QStandardItemModel(parent)
{
    db.createConnection();
    m_roleNameMapping[TreeModel_Role_Name] = "name_role";

    QDir::setCurrent("./images");

    auto sublist=db.getSubjects();
    while (!sublist.empty())
        getSubj(sublist.takeFirst());
}

void TreeModel::addEntry( const QString& theme, const QString& subj)
{
    auto childEntry = new QStandardItem( theme );
    QStandardItem* entry = getSubj( subj );
    entry->appendRow( childEntry );
}

void TreeModel::userAddEntry(const QString &theme, const QString &subj)
{
    addEntry(theme, subj);
    db.addSubject(subj);
    db.addThemeToSubj(theme, subj);
    currentSubj = subj;
    currentTheme = theme;
}

bool TreeModel::userAddPicture(QString imgName, int flag)
{
    imgName.remove(PREFIX);
    bool ok = QFile::exists(imgName);
    QString ext = imgName.right(4);
    if (!ok || !(ext == ".jpg" || ext == ".png" || ext == ".bmp") || currentSubj.isEmpty()) {
        return false;
    }
    if (flag == -1) {
        db.addImageToThemeSubj(imgName, currentTheme, currentSubj);
    }
    else {
        QString nextImgPath = getPicture(flag);
        nextImgPath.remove(PREFIX);
        db.addImageToThemeSubjBefore(imgName, currentTheme, currentSubj, nextImgPath);
    }
    getPictureList();
    return true;
}

void TreeModel::clearSubj(QString subjName)
{
    if ( isSub( subjName ) )
    {
        QStandardItem* entry = getSubj( subjName );
        entry->removeRows(0,entry->rowCount());
    }
}

unsigned int TreeModel::clickAction(QString str)
{
    if (isSub(str))
    {
        currentSubj=str;
        QStandardItem* entry = getSubj( str );
        if(entry->rowCount() == 0)
            getThemeList();
        return entry->rowCount();
    }
    currentTheme=str;
    return 0;
}

void TreeModel::getPictureList()
{
     pictureList = db.getImageByThemeSubj(currentTheme, currentSubj);
}

QString TreeModel::getPicture(int ind)
{
  int count = pictureList.count();
  if (count == 0)
      return "";
  QString imgPath = PREFIX;
  QString name(pictureList.at((ind % count + count) % count));
  imgPath.append(QDir::current().absoluteFilePath(name));
  return imgPath;
}

void TreeModel::deleteCurrentTheme()
{
    auto Subj = getSubj(currentSubj);
    Subj->removeRow(findCurrentRow());
    db.removeThemeBySubj(currentTheme, currentSubj);
}

void TreeModel::deleteCurrentSubj()
{
    auto Subj = getSubj(currentSubj);
    int row = Subj->row();
    this->removeRow(row);
    db.removeSubject(currentSubj);
}

QStandardItem *TreeModel::getSubj(const QString &subjName)
{
    QStandardItem* entry;
    auto entries = this->findItems( subjName );
    if ( entries.count() > 0 )
    {
        entry = entries.at(0);
    }
    else
    {
        entry = new QStandardItem( subjName );
        this->appendRow( entry );
    }
    return entry;
}

void TreeModel::getThemeList()
{
    QStandardItem* curBr=getSubj(currentSubj);
    QStandardItem* themename;
    auto themelist=db.getThemesBySubj(currentSubj);
    while (!themelist.empty())
    {
        themename=new QStandardItem(themelist.takeFirst());
        curBr->appendRow(themename);
    }
}

QHash<int, QByteArray> TreeModel::roleNames() const
{
    return m_roleNameMapping;
}

int TreeModel::findCurrentRow()
{
    int i=0;
    auto subj=getSubj(currentSubj);
    int rc=subj->rowCount();
    while(i<=rc)
    {
       if(subj->child(i)->text()==currentTheme) return i;
       i++;
    }
    return -1;
}

bool TreeModel::isSub(QString str) // проверка, предмет ли данная строка
{
    auto entries = this->findItems( str );
    if ( entries.count() > 0 )
    {
        return 1;
    }
    else return 0;
}
