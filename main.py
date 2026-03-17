import sys

from PySide6.QtGui import QGuiApplication
from PySide6.QtQml import QQmlApplicationEngine
from PySide6.QtQuickControls2 import QQuickStyle

from backend import Backend
from bridge import Bridge

if __name__ == "__main__":
    app = QGuiApplication(sys.argv)
    QQuickStyle.setStyle("Fusion")
    engine = QQmlApplicationEngine()
    # Add the current directory to the import paths and load the main module.
    engine.addImportPath(sys.path[0])
    engine.loadFromModule("UI", "Main")

    backend = Backend()
    # Bridge acting as a [mediator](https://refactoring.guru/design-patterns/mediator)
    # between the front- and backend.
    bridge = Bridge(backend)  # type: ignore

    if not engine.rootObjects()[0].setProperty("bridge", bridge):
        print("ERROR: could not connect the backend to the frontend")
        sys.exit(-1)

    # This prevents the frontend from showing 00:00:00 for a split second.
    bridge.update_time()

    if not engine.rootObjects():
        sys.exit(-1)

    exit_code = app.exec()
    del engine
    sys.exit(exit_code)
