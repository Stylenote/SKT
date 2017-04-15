/****************************************************************************
** Meta object code from reading C++ file 'mydatabase.h'
**
** Created by: The Qt Meta Object Compiler version 67 (Qt 5.7.1)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include "../mydatabase.h"
#include <QtCore/qbytearray.h>
#include <QtCore/qmetatype.h>
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'mydatabase.h' doesn't include <QObject>."
#elif Q_MOC_OUTPUT_REVISION != 67
#error "This file was generated using the moc from 5.7.1. It"
#error "cannot be used with the include files from this version of Qt."
#error "(The moc has changed too much.)"
#endif

QT_BEGIN_MOC_NAMESPACE
struct qt_meta_stringdata_myDataBase_t {
    QByteArrayData data[18];
    char stringdata0[260];
};
#define QT_MOC_LITERAL(idx, ofs, len) \
    Q_STATIC_BYTE_ARRAY_DATA_HEADER_INITIALIZER_WITH_OFFSET(len, \
    qptrdiff(offsetof(qt_meta_stringdata_myDataBase_t, stringdata0) + ofs \
        - idx * sizeof(QByteArrayData)) \
    )
static const qt_meta_stringdata_myDataBase_t qt_meta_stringdata_myDataBase = {
    {
QT_MOC_LITERAL(0, 0, 10), // "myDataBase"
QT_MOC_LITERAL(1, 11, 11), // "getSubjects"
QT_MOC_LITERAL(2, 23, 0), // ""
QT_MOC_LITERAL(3, 24, 15), // "getThemesBySubj"
QT_MOC_LITERAL(4, 40, 4), // "subj"
QT_MOC_LITERAL(5, 45, 19), // "getImageByThemeSubj"
QT_MOC_LITERAL(6, 65, 5), // "theme"
QT_MOC_LITERAL(7, 71, 10), // "addSubject"
QT_MOC_LITERAL(8, 82, 14), // "addThemeToSubj"
QT_MOC_LITERAL(9, 97, 19), // "addImageToThemeSubj"
QT_MOC_LITERAL(10, 117, 5), // "image"
QT_MOC_LITERAL(11, 123, 13), // "removeSubject"
QT_MOC_LITERAL(12, 137, 17), // "removeThemeBySubj"
QT_MOC_LITERAL(13, 155, 24), // "removeImageFromThemeSubj"
QT_MOC_LITERAL(14, 180, 21), // "getImagesWithoutTheme"
QT_MOC_LITERAL(15, 202, 24), // "removeImagesWithoutTheme"
QT_MOC_LITERAL(16, 227, 25), // "addImageToThemeSubjBefore"
QT_MOC_LITERAL(17, 253, 6) // "before"

    },
    "myDataBase\0getSubjects\0\0getThemesBySubj\0"
    "subj\0getImageByThemeSubj\0theme\0"
    "addSubject\0addThemeToSubj\0addImageToThemeSubj\0"
    "image\0removeSubject\0removeThemeBySubj\0"
    "removeImageFromThemeSubj\0getImagesWithoutTheme\0"
    "removeImagesWithoutTheme\0"
    "addImageToThemeSubjBefore\0before"
};
#undef QT_MOC_LITERAL

static const uint qt_meta_data_myDataBase[] = {

 // content:
       7,       // revision
       0,       // classname
       0,    0, // classinfo
      12,   14, // methods
       0,    0, // properties
       0,    0, // enums/sets
       0,    0, // constructors
       0,       // flags
       0,       // signalCount

 // slots: name, argc, parameters, tag, flags
       1,    0,   74,    2, 0x0a /* Public */,
       3,    1,   75,    2, 0x0a /* Public */,
       5,    2,   78,    2, 0x0a /* Public */,
       7,    1,   83,    2, 0x0a /* Public */,
       8,    2,   86,    2, 0x0a /* Public */,
       9,    3,   91,    2, 0x0a /* Public */,
      11,    1,   98,    2, 0x0a /* Public */,
      12,    2,  101,    2, 0x0a /* Public */,
      13,    3,  106,    2, 0x0a /* Public */,
      14,    0,  113,    2, 0x0a /* Public */,
      15,    0,  114,    2, 0x0a /* Public */,
      16,    4,  115,    2, 0x0a /* Public */,

 // slots: parameters
    QMetaType::QStringList,
    QMetaType::QStringList, QMetaType::QString,    4,
    QMetaType::QStringList, QMetaType::QString, QMetaType::QString,    6,    4,
    QMetaType::Void, QMetaType::QString,    4,
    QMetaType::Void, QMetaType::QString, QMetaType::QString,    6,    4,
    QMetaType::Void, QMetaType::QString, QMetaType::QString, QMetaType::QString,   10,    6,    4,
    QMetaType::Void, QMetaType::QString,    4,
    QMetaType::Void, QMetaType::QString, QMetaType::QString,    6,    4,
    QMetaType::Void, QMetaType::QString, QMetaType::QString, QMetaType::QString,   10,    6,    4,
    QMetaType::QStringList,
    QMetaType::Void,
    QMetaType::Void, QMetaType::QString, QMetaType::QString, QMetaType::QString, QMetaType::QString,   10,    6,    4,   17,

       0        // eod
};

void myDataBase::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::InvokeMetaMethod) {
        myDataBase *_t = static_cast<myDataBase *>(_o);
        Q_UNUSED(_t)
        switch (_id) {
        case 0: { QStringList _r = _t->getSubjects();
            if (_a[0]) *reinterpret_cast< QStringList*>(_a[0]) = _r; }  break;
        case 1: { QStringList _r = _t->getThemesBySubj((*reinterpret_cast< QString(*)>(_a[1])));
            if (_a[0]) *reinterpret_cast< QStringList*>(_a[0]) = _r; }  break;
        case 2: { QStringList _r = _t->getImageByThemeSubj((*reinterpret_cast< QString(*)>(_a[1])),(*reinterpret_cast< QString(*)>(_a[2])));
            if (_a[0]) *reinterpret_cast< QStringList*>(_a[0]) = _r; }  break;
        case 3: _t->addSubject((*reinterpret_cast< QString(*)>(_a[1]))); break;
        case 4: _t->addThemeToSubj((*reinterpret_cast< QString(*)>(_a[1])),(*reinterpret_cast< QString(*)>(_a[2]))); break;
        case 5: _t->addImageToThemeSubj((*reinterpret_cast< QString(*)>(_a[1])),(*reinterpret_cast< QString(*)>(_a[2])),(*reinterpret_cast< QString(*)>(_a[3]))); break;
        case 6: _t->removeSubject((*reinterpret_cast< QString(*)>(_a[1]))); break;
        case 7: _t->removeThemeBySubj((*reinterpret_cast< QString(*)>(_a[1])),(*reinterpret_cast< QString(*)>(_a[2]))); break;
        case 8: _t->removeImageFromThemeSubj((*reinterpret_cast< QString(*)>(_a[1])),(*reinterpret_cast< QString(*)>(_a[2])),(*reinterpret_cast< QString(*)>(_a[3]))); break;
        case 9: { QStringList _r = _t->getImagesWithoutTheme();
            if (_a[0]) *reinterpret_cast< QStringList*>(_a[0]) = _r; }  break;
        case 10: _t->removeImagesWithoutTheme(); break;
        case 11: _t->addImageToThemeSubjBefore((*reinterpret_cast< QString(*)>(_a[1])),(*reinterpret_cast< QString(*)>(_a[2])),(*reinterpret_cast< QString(*)>(_a[3])),(*reinterpret_cast< QString(*)>(_a[4]))); break;
        default: ;
        }
    }
}

const QMetaObject myDataBase::staticMetaObject = {
    { &QObject::staticMetaObject, qt_meta_stringdata_myDataBase.data,
      qt_meta_data_myDataBase,  qt_static_metacall, Q_NULLPTR, Q_NULLPTR}
};


const QMetaObject *myDataBase::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->dynamicMetaObject() : &staticMetaObject;
}

void *myDataBase::qt_metacast(const char *_clname)
{
    if (!_clname) return Q_NULLPTR;
    if (!strcmp(_clname, qt_meta_stringdata_myDataBase.stringdata0))
        return static_cast<void*>(const_cast< myDataBase*>(this));
    return QObject::qt_metacast(_clname);
}

int myDataBase::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = QObject::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    if (_c == QMetaObject::InvokeMetaMethod) {
        if (_id < 12)
            qt_static_metacall(this, _c, _id, _a);
        _id -= 12;
    } else if (_c == QMetaObject::RegisterMethodArgumentMetaType) {
        if (_id < 12)
            *reinterpret_cast<int*>(_a[0]) = -1;
        _id -= 12;
    }
    return _id;
}
QT_END_MOC_NAMESPACE
