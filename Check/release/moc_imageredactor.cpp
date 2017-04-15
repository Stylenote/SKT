/****************************************************************************
** Meta object code from reading C++ file 'imageredactor.h'
**
** Created by: The Qt Meta Object Compiler version 67 (Qt 5.7.1)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include "../imageredactor.h"
#include <QtCore/qbytearray.h>
#include <QtCore/qmetatype.h>
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'imageredactor.h' doesn't include <QObject>."
#elif Q_MOC_OUTPUT_REVISION != 67
#error "This file was generated using the moc from 5.7.1. It"
#error "cannot be used with the include files from this version of Qt."
#error "(The moc has changed too much.)"
#endif

QT_BEGIN_MOC_NAMESPACE
struct qt_meta_stringdata_ImageEdit__imageRedactor_t {
    QByteArrayData data[13];
    char stringdata0[81];
};
#define QT_MOC_LITERAL(idx, ofs, len) \
    Q_STATIC_BYTE_ARRAY_DATA_HEADER_INITIALIZER_WITH_OFFSET(len, \
    qptrdiff(offsetof(qt_meta_stringdata_ImageEdit__imageRedactor_t, stringdata0) + ofs \
        - idx * sizeof(QByteArrayData)) \
    )
static const qt_meta_stringdata_ImageEdit__imageRedactor_t qt_meta_stringdata_ImageEdit__imageRedactor = {
    {
QT_MOC_LITERAL(0, 0, 24), // "ImageEdit::imageRedactor"
QT_MOC_LITERAL(1, 25, 6), // "rotate"
QT_MOC_LITERAL(2, 32, 0), // ""
QT_MOC_LITERAL(3, 33, 7), // "imgname"
QT_MOC_LITERAL(4, 41, 5), // "angle"
QT_MOC_LITERAL(5, 47, 3), // "cut"
QT_MOC_LITERAL(6, 51, 1), // "x"
QT_MOC_LITERAL(7, 53, 1), // "y"
QT_MOC_LITERAL(8, 55, 1), // "w"
QT_MOC_LITERAL(9, 57, 1), // "h"
QT_MOC_LITERAL(10, 59, 6), // "filter"
QT_MOC_LITERAL(11, 66, 8), // "tempSave"
QT_MOC_LITERAL(12, 75, 5) // "close"

    },
    "ImageEdit::imageRedactor\0rotate\0\0"
    "imgname\0angle\0cut\0x\0y\0w\0h\0filter\0"
    "tempSave\0close"
};
#undef QT_MOC_LITERAL

static const uint qt_meta_data_ImageEdit__imageRedactor[] = {

 // content:
       7,       // revision
       0,       // classname
       0,    0, // classinfo
       5,   14, // methods
       0,    0, // properties
       0,    0, // enums/sets
       0,    0, // constructors
       0,       // flags
       0,       // signalCount

 // methods: name, argc, parameters, tag, flags
       1,    2,   39,    2, 0x02 /* Public */,
       5,    5,   44,    2, 0x02 /* Public */,
      10,    1,   55,    2, 0x02 /* Public */,
      11,    1,   58,    2, 0x02 /* Public */,
      12,    0,   61,    2, 0x02 /* Public */,

 // methods: parameters
    QMetaType::QString, QMetaType::QString, QMetaType::Float,    3,    4,
    QMetaType::QString, QMetaType::QString, QMetaType::Float, QMetaType::Float, QMetaType::Float, QMetaType::Float,    3,    6,    7,    8,    9,
    QMetaType::QString, QMetaType::QString,    3,
    QMetaType::Void, QMetaType::QString,    3,
    QMetaType::Void,

       0        // eod
};

void ImageEdit::imageRedactor::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::InvokeMetaMethod) {
        imageRedactor *_t = static_cast<imageRedactor *>(_o);
        Q_UNUSED(_t)
        switch (_id) {
        case 0: { QString _r = _t->rotate((*reinterpret_cast< QString(*)>(_a[1])),(*reinterpret_cast< float(*)>(_a[2])));
            if (_a[0]) *reinterpret_cast< QString*>(_a[0]) = _r; }  break;
        case 1: { QString _r = _t->cut((*reinterpret_cast< QString(*)>(_a[1])),(*reinterpret_cast< float(*)>(_a[2])),(*reinterpret_cast< float(*)>(_a[3])),(*reinterpret_cast< float(*)>(_a[4])),(*reinterpret_cast< float(*)>(_a[5])));
            if (_a[0]) *reinterpret_cast< QString*>(_a[0]) = _r; }  break;
        case 2: { QString _r = _t->filter((*reinterpret_cast< QString(*)>(_a[1])));
            if (_a[0]) *reinterpret_cast< QString*>(_a[0]) = _r; }  break;
        case 3: _t->tempSave((*reinterpret_cast< QString(*)>(_a[1]))); break;
        case 4: _t->close(); break;
        default: ;
        }
    }
}

const QMetaObject ImageEdit::imageRedactor::staticMetaObject = {
    { &QObject::staticMetaObject, qt_meta_stringdata_ImageEdit__imageRedactor.data,
      qt_meta_data_ImageEdit__imageRedactor,  qt_static_metacall, Q_NULLPTR, Q_NULLPTR}
};


const QMetaObject *ImageEdit::imageRedactor::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->dynamicMetaObject() : &staticMetaObject;
}

void *ImageEdit::imageRedactor::qt_metacast(const char *_clname)
{
    if (!_clname) return Q_NULLPTR;
    if (!strcmp(_clname, qt_meta_stringdata_ImageEdit__imageRedactor.stringdata0))
        return static_cast<void*>(const_cast< imageRedactor*>(this));
    return QObject::qt_metacast(_clname);
}

int ImageEdit::imageRedactor::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = QObject::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    if (_c == QMetaObject::InvokeMetaMethod) {
        if (_id < 5)
            qt_static_metacall(this, _c, _id, _a);
        _id -= 5;
    } else if (_c == QMetaObject::RegisterMethodArgumentMetaType) {
        if (_id < 5)
            *reinterpret_cast<int*>(_a[0]) = -1;
        _id -= 5;
    }
    return _id;
}
QT_END_MOC_NAMESPACE
