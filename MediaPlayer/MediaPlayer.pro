QT       += core gui

greaterThan(QT_MAJOR_VERSION, 4): QT += widgets

CONFIG += c++11

# The following define makes your compiler emit warnings if you use
# any Qt feature that has been marked deprecated (the exact warnings
# depend on your compiler). Please consult the documentation of the
# deprecated API in order to know how to port your code away from it.
DEFINES += QT_DEPRECATED_WARNINGS

# You can also make your code fail to compile if it uses deprecated APIs.
# In order to do so, uncomment the following line.
# You can also select to disable deprecated APIs only up to a certain version of Qt.
#DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x060000    # disables all the APIs deprecated before Qt 6.0.0

#msvc {
#    QMAKE_CFLAGS+=/utf-8
#    QMAKE_CXXFLAGS+=/utf-8
#}

INCLUDEPATH+=$$PWD/ffmpeg4.3/include \
             $$PWD/SDL2/include \
             src \
             src/AVPlayer

LIBS += $$PWD/ffmpeg4.3/bin/avutil.lib \
        $$PWD/ffmpeg4.3/bin/avcodec.lib \
        $$PWD/ffmpeg4.3/bin/avdevice.lib \
        $$PWD/ffmpeg4.3/bin/avfilter.lib \
        $$PWD/ffmpeg4.3/bin/avformat.lib \
        $$PWD/ffmpeg4.3/bin/postproc.lib \
        $$PWD/ffmpeg4.3/bin/swresample.lib \
        $$PWD/ffmpeg4.3/bin/swscale.lib \
        $$PWD/SDL2/lib/x64/SDL2.lib
VPATH += src

SOURCES += \
    main.cpp \
    src/AVPlayer/av_decoder.cpp \
    src/AVPlayer/av_player.cpp \
    src/AVPlayer/threadpool.cpp \
    src/opengl_widget.cpp \
    src/slider_pts.cpp \
    widget.cpp

HEADERS += \
    src/AVPlayer/av_clock.h \
    src/AVPlayer/av_decoder.h \
    src/AVPlayer/av_player.h \
    src/AVPlayer/threadpool.h \
    src/AVPlayer/vframe.h \
    src/opengl_widget.h \
    src/slider_pts.h \
    widget.h

FORMS += \
    widget.ui


# Default rules for deployment.
qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target

RESOURCES += \
    Resources/resources.qrc
