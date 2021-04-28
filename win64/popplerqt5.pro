TEMPLATE = lib
CONFIG += warn_on
CONFIG += exceptions_off
CONFIG += plugin plugin_bundle no_default_rpath
CONFIG -= android_install
CONFIG += release
QT += xml
TARGET = popplerqt5
INCLUDEPATH += .
INCLUDEPATH += ..
HEADERS = sipAPIpopplerqt5.h
SOURCES = sippopplerqt5cmodule.cpp sippopplerqt5QList0101PopplerFormField.cpp sippopplerqt5QSet0100PopplerAnnotationSubType.cpp sippopplerqt5QList0101PopplerLink.cpp sippopplerqt5QList0101PopplerTextBox.cpp sippopplerqt5QList0100QRectF.cpp sippopplerqt5QList0101PopplerEmbeddedFile.cpp sippopplerqt5QList0100PopplerFontInfo.cpp sippopplerqt5QList0101PopplerRichMediaAnnotationAsset.cpp sippopplerqt5QList0101PopplerRichMediaAnnotationConfiguration.cpp sippopplerqt5QList0101PopplerRichMediaAnnotationInstance.cpp sippopplerqt5QList0600QLinkedList0100QPointF.cpp sippopplerqt5QList0100PopplerHighlightAnnotationQuad.cpp sippopplerqt5QLinkedList0100QPointF.cpp sippopplerqt5QList0101PopplerAnnotation.cpp sippopplerqt5PopplerTextBox.cpp sippopplerqt5PopplerSoundObject.cpp sippopplerqt5PopplerPageTransition.cpp sippopplerqt5PopplerPageSearchFlags.cpp sippopplerqt5PopplerPagePainterFlags.cpp sippopplerqt5PopplerPage.cpp sippopplerqt5PopplerOptContentModel.cpp sippopplerqt5PopplerMovieObject.cpp sippopplerqt5PopplerMediaRendition.cpp sippopplerqt5PopplerLinkDestination.cpp sippopplerqt5PopplerLinkOCGState.cpp sippopplerqt5PopplerLinkMovie.cpp sippopplerqt5PopplerLinkJavaScript.cpp sippopplerqt5PopplerLinkRendition.cpp sippopplerqt5PopplerLinkSound.cpp sippopplerqt5PopplerLinkAction.cpp sippopplerqt5PopplerLinkBrowse.cpp sippopplerqt5PopplerLinkExecute.cpp sippopplerqt5PopplerLinkGoto.cpp sippopplerqt5PopplerLink.cpp sippopplerqt5PopplerFormFieldSignature.cpp sippopplerqt5PopplerSignatureValidationInfo.cpp sippopplerqt5PopplerFormFieldChoice.cpp sippopplerqt5PopplerFormFieldText.cpp sippopplerqt5PopplerFormFieldButton.cpp sippopplerqt5PopplerFormField.cpp sippopplerqt5PopplerFontIterator.cpp sippopplerqt5PopplerFontInfo.cpp sippopplerqt5PopplerEmbeddedFile.cpp sippopplerqt5PopplerDocumentRenderHints.cpp sippopplerqt5PopplerDocument.cpp sippopplerqt5PopplerPDFConverterPDFOptions.cpp sippopplerqt5PopplerPDFConverter.cpp sippopplerqt5PopplerPSConverterPSOptions.cpp sippopplerqt5PopplerPSConverter.cpp sippopplerqt5PopplerBaseConverter.cpp sippopplerqt5PopplerRichMediaAnnotationSettings.cpp sippopplerqt5PopplerRichMediaAnnotationDeactivation.cpp sippopplerqt5PopplerRichMediaAnnotationActivation.cpp sippopplerqt5PopplerRichMediaAnnotationContent.cpp sippopplerqt5PopplerRichMediaAnnotationAsset.cpp sippopplerqt5PopplerRichMediaAnnotationConfiguration.cpp sippopplerqt5PopplerRichMediaAnnotationInstance.cpp sippopplerqt5PopplerRichMediaAnnotationParams.cpp sippopplerqt5PopplerRichMediaAnnotation.cpp sippopplerqt5PopplerWidgetAnnotation.cpp sippopplerqt5PopplerScreenAnnotation.cpp sippopplerqt5PopplerMovieAnnotation.cpp sippopplerqt5PopplerSoundAnnotation.cpp sippopplerqt5PopplerFileAttachmentAnnotation.cpp sippopplerqt5PopplerCaretAnnotation.cpp sippopplerqt5PopplerLinkAnnotation.cpp sippopplerqt5PopplerInkAnnotation.cpp sippopplerqt5PopplerStampAnnotation.cpp sippopplerqt5PopplerHighlightAnnotationQuad.cpp sippopplerqt5PopplerHighlightAnnotation.cpp sippopplerqt5PopplerGeomAnnotation.cpp sippopplerqt5PopplerLineAnnotation.cpp sippopplerqt5PopplerTextAnnotation.cpp sippopplerqt5PopplerAnnotationPopup.cpp sippopplerqt5PopplerAnnotationStyle.cpp sippopplerqt5PopplerAnnotation.cpp sippopplerqt5PopplerAnnotationUtils.cpp sippopplerqt5Poppler.cpp sippopplerqt5QList3800.cpp sippopplerqt5time_t.cpp sippopplerqt5QSet0100PopplerDocumentRenderBackend.cpp

win32 {
    PY_MODULE_SRC = $(DESTDIR_TARGET)
} else {
    macx {
        PY_MODULE_SRC = $(TARGET).plugin/Contents/MacOS/$(TARGET)
        QMAKE_LFLAGS += "-undefined dynamic_lookup"
    } else {
        PY_MODULE_SRC = $(TARGET)
    }
}

QMAKE_POST_LINK = $(COPY_FILE) $$PY_MODULE_SRC popplerqt5.pyd

target.CONFIG = no_check_exist
target.files = popplerqt5.pyd

INCLUDEPATH += c:/users/luffy/miniconda3/include
INCLUDEPATH += "c:/Program Files/poppler/include/poppler"
win32 {
    LIBS += -Lc:/users/luffy/miniconda3/libs
    LIBS += -L"c:/Program Files/poppler/lib" -lpoppler -lpoppler-cpp -lpoppler-qt5
    LIBS += -L"C:/Program Files (x86)/Microsoft Visual Studio/2019/BuildTools/VC/Tools/MSVC/14.28.29910/lib/x64"
}
sip.path = c:/users/luffy/miniconda3/Lib/site-packages/PyQt5/bindings/popplerqt5
sip.files = C:/Users/luffy/python-poppler-qt5/poppler-qt5.sip C:/Users/luffy/python-poppler-qt5/timeline.sip C:/Users/luffy/python-poppler-qt5/version.sip C:/Users/luffy/python-poppler-qt5/types.sip C:/Users/luffy/python-poppler-qt5/poppler-annotation.sip C:/Users/luffy/python-poppler-qt5/poppler-convert.sip C:/Users/luffy/python-poppler-qt5/poppler-document.sip C:/Users/luffy/python-poppler-qt5/poppler-embedded-file.sip C:/Users/luffy/python-poppler-qt5/poppler-font-info.sip C:/Users/luffy/python-poppler-qt5/poppler-font-iterator.sip C:/Users/luffy/python-poppler-qt5/poppler-form.sip C:/Users/luffy/python-poppler-qt5/poppler-link.sip C:/Users/luffy/python-poppler-qt5/poppler-link-destination.sip C:/Users/luffy/python-poppler-qt5/poppler-media.sip C:/Users/luffy/python-poppler-qt5/poppler-movie-object.sip C:/Users/luffy/python-poppler-qt5/poppler-opt-content-model.sip C:/Users/luffy/python-poppler-qt5/poppler-page.sip C:/Users/luffy/python-poppler-qt5/poppler-page-transition.sip C:/Users/luffy/python-poppler-qt5/poppler-sound-object.sip C:/Users/luffy/python-poppler-qt5/poppler-text-box.sip
INSTALLS += sip
config.path = c:/users/luffy/miniconda3/Lib/site-packages/PyQt5/bindings/popplerqt5
config.files = C:/Users/luffy/python-poppler-qt5/build/bindings/popplerqt5/popplerqt5.toml
INSTALLS += config
target.path = c:/users/luffy/miniconda3/Lib/site-packages
INSTALLS += target
