import sys

from PySide6.QtCore import QObject, Slot
from PySide6.QtGui import QGuiApplication
from PySide6.QtQml import QmlElement, QQmlApplicationEngine
from PySide6.QtQuickControls2 import QQuickStyle

import bridge

# QML_IMPORT_NAME = "backend"
# QML_IMPORT_MAJOR_VERSION = 1


# @QmlElement
# class Bridge(QObject):
#     @Slot()
#     def fun(self):
#         print("hello from the frontend")


if __name__ == "__main__":
    app = QGuiApplication(sys.argv)
    # QQuickStyle.setStyle("Material")
    engine = QQmlApplicationEngine()
    # Add the current directory to the import paths and load the main module.
    engine.addImportPath(sys.path[0])
    engine.loadFromModule("UI", "Main")

    if not engine.rootObjects():
        sys.exit(-1)

    exit_code = app.exec()
    del engine
    sys.exit(exit_code)
