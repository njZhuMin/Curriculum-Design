#-------------------------------------------------
#
# Project created by QtCreator 2015-09-02T16:29:03
#
#-------------------------------------------------

QT       += core gui

greaterThan(QT_MAJOR_VERSION, 4): QT += widgets printsupport

TARGET = test
TEMPLATE = app


SOURCES += main.cpp\
        mainwindow.cpp \
    qcustomplot.cpp \
    BasicSort.cpp \
    FileUtils.cpp

HEADERS  += mainwindow.h \
    qcustomplot.h \
    BasicSort.h \
    GlobalsDefine.h \
    FileUtils.h

FORMS    += mainwindow.ui
