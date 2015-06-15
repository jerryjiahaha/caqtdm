include(../caQtDM_Viewer/qtdefs.pri)

DEFINES += QT_NO_DEBUG_OUTPUT

contains(QT_VER_MAJ, 4) {
      CONFIG += qwt plugin thread uitools
      CONFIG += designer
}
contains(QT_VER_MAJ, 5) {
      QT += widgets concurrent uitools
      QT += designer
      CONFIG  += qwt plugin
      DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x000000
}

CONFIG += warn_on debug
CONFIG += console

TARGET = qtcontrols
TEMPLATE = lib
OBJECTS_DIR = obj
DESTDIR = $(CAQTDM_COLLECT)
MOC_DIR = moc
INCLUDEPATH += src
RESOURCES = qtcontrols.qrc

ios | android {
   CONFIG += staticlib
   INCLUDEPATH += $(QWTINCLUDE)
}

!ios {
!android {
  unix {
    INCLUDEPATH += $(QWTINCLUDE)
  }

  unix:!macx {
    LIBS += -L$(QWTLIB) -Wl,-rpath,$(QWTLIB) -lqwt
  }

  macx: {
    CONFIG += lib_bundle
    LIBS += -F$(QWTLIB) -framework qwt
  }
}
}

win32 {
    win32-g++ {
      INCLUDEPATH = $(QWTHOME)/src
      LIBS += $(QWTLIB)/libqwt.a
      Q
     }
     win32-msvc* {
        DEFINES += QTCON_MAKEDLL _CRT_SECURE_NO_WARNINGS
        DebugBuild {
                OBJECTS_DIR = debug/obj
                DESTDIR = $(CAQTDM_COLLECT)/debug
                INCLUDEPATH += $$(QWTINCLUDE)
                LIBS += $$(QWTHOME)/lib/qwtd.lib
        }

        ReleaseBuild {
                DESTDIR = $(CAQTDM_COLLECT)
                OBJECTS_DIR = release/obj
                INCLUDEPATH += $$(QWTINCLUDE)
                LIBS += $$(QWTHOME)/lib/qwt.lib
         }
     }
}
PRE_TARGETDEPS += \
     moc/moc_caslider.cpp \
     moc/moc_cacartesianplot.cpp \
     moc/moc_castripplot.cpp \
     moc/moc_cameter.cpp \
     moc/moc_caclock.cpp
contains(QT_VER_MAJ, 5) {
  PRE_TARGETDEPS += moc/moc_qwt_thermo_marker_61.cpp
}
SOURCES	+= \
    src/caframe.cpp \
    src/cainclude.cpp \
    src/caimage.cpp \
    src/cagraphics.cpp \
    src/capolyline.cpp \
    src/searchfile.cpp \
    src/elabel.cpp \
    src/esimplelabel.cpp \
    src/fontscalingwidget.cpp \
    src/calabel.cpp \
    src/imagepushbutton.cpp \
    src/epushbutton.cpp \
    src/enumeric.cpp \
    src/leftclick_with_modifiers_eater.cpp \
    src/number_delegate.cpp \
    src/dec_int_from_format.cpp \
    src/eapplybutton.cpp \
    src/camenu.cpp \
    src/camessagebutton.cpp \
    src/cashellcommand.cpp \
    src/carowcolmenu.cpp \
    src/carelateddisplay.cpp \
    src/caapplynumeric.cpp \
    src/canumeric.cpp \
    src/eapplynumeric.cpp \
    src/cachoice.cpp \
    src/catextentry.cpp \
    src/calineedit.cpp \
    src/caled.cpp \
    src/eled.cpp \
    src/cabitnames.cpp \
    src/eflag.cpp \
    src/catable.cpp \
    src/cabyte.cpp \
    src/rectangle.cpp \
    src/cagauge.cpp \
    src/egauge.cpp \
    src/eng_notation.cpp \
    src/cathermo.cpp \
    src/caslider.cpp \
    src/cacartesianplot.cpp \
    src/castripplot.cpp \
    src/cacamera.cpp \
    src/imagewidget.cpp \
    src/cacalc.cpp \
    src/parsepepfile.cpp \
    src/catogglebutton.cpp \
    src/cascriptbutton.cpp \
    src/cadoubletabwidget.cpp \
    src/cadoubletabwidgetextension.cpp \
    src/stripplotthread.cpp \
    src/cawaterfallplot.cpp \
    src/snumeric.cpp \
    src/caspinbox.cpp \
    src/qwtplotcurvenan.cpp \
    src/cawavetable.cpp \
    src/capolylinetaskmenu.cpp \
    src/capolylinedialog.cpp \
    src/cadoubletabwidgetextensionfactory.cpp \
    src/specialFunctions.cpp \
    src/caclock.cpp \
    src/cameter.cpp \
    src/colormaps.cpp \
    src/cascan2d.cpp \
    src/mdaReader.cpp \
    src/mda_loader.c

XDR_HACK {
    SOURCES += src/xdr_hack.c
    HEADERS += src/xdr_hack.h
}

QT += network
HEADERS += \
    src/networkaccess.h \
    src/fileFunctions.h

SOURCES +=  \
    src/networkaccess.cpp \
    src/fileFunctions.cpp

# assume qwt6.0 was made with qt4
contains(QT_VER_MAJ, 4) {
    warning("Qt $$[QT_VERSION] was detected, so compile qwt_thermo_marker")
    SOURCES	+= src/qwt_thermo_marker.cpp
}
#assume qwt6.1 was made with qt5
contains(QT_VER_MAJ, 5) {
    warning("Qt $$[QT_VERSION] was detected, so compile qwt_thermo_marker_61")
    SOURCES	+= src/qwt_thermo_marker_61.cpp
}

HEADERS	+= \
    src/caframe.h \
    src/cainclude.h \
    src/caimage.h \
    src/cagraphics.h \
    src/capolyline.h \
    src/searchfile.h \
    src/elabel.h \
    src/esimplelabel.h \
    src/fontscalingwidget.h \
    src/calabel.h \
    src/imagepushbutton.h \
    src/epushbutton.h \
    src/enumeric.h \
    src/number_delegate.h \
    src/leftclick_with_modifiers_eater.h \
    src/eapplybutton.h \
    src/dec_int_from_format.h \
    src/camenu.h \
    src/camessagebutton.h \
    src/cashellcommand.h \
    src/carowcolmenu.h \
    src/carelateddisplay.h \
    src/canumeric.h \
    src/caapplynumeric.h \
    src/eapplynumeric.h \
    src/cachoice.h \
    src/catextentry.h \
    src/calineedit.h \
    src/caled.h \
    src/eled.h \
    src/cabitnames.h \
    src/eflag.h \
    src/catable.h \
    src/cabyte.h \
    src/rectangle.h \
    src/cagauge.h \
    src/egauge.h \
    src/eng_notation.h \
    src/cathermo.h \
    src/caslider.h \
    src/castripplot.h \
    src/cacartesianplot.h \
    src/cacamera.h \
    src/imagewidget.h \
    src/cacalc.h \
    src/qtcontrols_global.h \
    src/alarmdefs.h \
    src/parsepepfile.h \
    src/catogglebutton.h \
    src/cascriptbutton.h \
    src/cadoubletabwidget.h \
    src/cadoubletabwidgetextension.h \
    src/stripplotthread.h \
    src/cawaterfallplot.h \
    src/snumeric.h \
    src/caspinbox.h \
    src/qwtplotcurvenan.h \
    src/cawavetable.h \
    src/capolylinetaskmenu.h \
    src/capolylinedialog.h \
    src/cadoubletabwidgetextensionfactory.h \
    src/specialFunctions.h \
    src/caclock.h \
    src/cameter.h \
    src/colormaps.h \
    src/cascan2d.h \
    src/mdaReader.h \
    src/mda-load.h

# assume qwt6.0 was made with qt4
contains(QT_VER_MAJ, 4) {
    warning("Qt $$[QT_VERSION] was detected, so compile qwt_thermo_marker")
    HEADERS	+= src/qwt_thermo_marker.h
}
#assume qwt6.1 was made with qt5
contains(QT_VER_MAJ, 5) {
    warning("Qt $$[QT_VERSION] was detected, so compile qwt_thermo_marker_61")
    HEADERS	+= src/qwt_thermo_marker_61.h
}

OTHER_FILES += README
