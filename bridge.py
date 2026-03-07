from PySide6.QtCore import QObject, Slot
from PySide6.QtQml import QmlElement

QML_IMPORT_NAME = "bridge"
QML_IMPORT_MAJOR_VERSION = 1


@QmlElement
class Bridge(QObject):
    @Slot(str)
    def fun(self, string: str):
        print(f'hello from the backend "{string}"')
